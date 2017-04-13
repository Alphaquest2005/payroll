using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Linq;
using System.Data.Entity;
using LinqLib.DynamicCodeGenerator;
using LinqLib.Sequence;
using System.Windows.Controls;
using System.Windows;
using System.Threading.Tasks;
using PayrollManager.DataLayer;

namespace PayrollManager
{
    public class BranchEmployeeInstitutionsModel : BaseViewModel
    {
        private static object syncRoot = new Object();
        public BranchEmployeeInstitutionsModel()
        {
            staticPropertyChanged += BranchEmployeeInstitutionsModel_staticPropertyChanged;
            ReportDate = DateTime.Now;
        }

        private static bool isDirty = false;
        private static List<EmployeeSummaryLine> _employeeDeductionsData = null;
        private static List<EmployeeAccountSummaryLine> _employeeSalaryData = null;
        private static dynamic _deductionsData = null;

        private void BranchEmployeeInstitutionsModel_staticPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            OnPropertyChanged(e.PropertyName);
            if (e.PropertyName == "CurrentPayrollJob" || e.PropertyName == "CurrentBranch")
            {
                isDirty = true;
                allbranch = false;
                OnPropertyChanged("DeductionsData");
                OnPropertyChanged("NetSalaryData");
            }
        }

        private DataGrid _deductionsGrid = new DataGrid();

        public DataGrid DeductionsGrid
        {
            get { return _deductionsGrid; }
            set
            {
                _deductionsGrid = value;
                OnPropertyChanged("DeductionsData");
            }

        }

        private DataGrid _netSalaryGrid = new DataGrid();

        public DataGrid NetSalaryGrid
        {
            get { return _netSalaryGrid; }
            set
            {
                _netSalaryGrid = value;
                OnPropertyChanged("NetSalaryData");
            }

        }

        private DateTime _reportDate = DateTime.Now;

        public DateTime ReportDate
        {
            get { return _reportDate; }
            set
            {
                _reportDate = value;
                allbranch = true;
                OnPropertyChanged("ReportDate");
                OnPropertyChanged("DeductionsData");
                OnPropertyChanged("NetSalaryData");
            }
        }

        private static bool allbranch = false;
        private List<object> _netSalaryData;

        public object DeductionsData
        {
            get
            {
                lock (syncRoot)
                {
                    if (isDirty)
                    {

                        _employeeDeductionsData = GetEmployeeDeductionsData().Result;
                        _deductionsData = CalculateDeductions();
                        SetDeductionTotals();
                    }
                }
                return _deductionsData;
            }
        }

        private dynamic CalculateDeductions()
        {
            try
            {
                if (_employeeDeductionsData == null) return null;
                var eb =
                    _employeeDeductionsData.Pivot(
                        X => X.PayrollItems.GroupBy(p => new { p.CreditAccount.Institution.ShortName, p.CreditAccount.Institution.Priority })
                            .Select(g => new InstitutionSummary {Institution = $"{g.Key.Priority??"99"}-{g.Key.ShortName}", Total = g.Sum(p => p.Amount), Priority = g.Key.Priority}).OrderBy(x => x.Priority),
                        X => X.Institution,
                        X => X.Total, true, null).ToList();
                return eb;
            }
            catch (Exception)
            {
                throw;
            }
        }

        private async Task<List<EmployeeSummaryLine>> GetEmployeeDeductionsData()
        {
            try
            {

                var t = Task.Run(() =>
                {
                    if (CurrentPayrollJob == null) return null;
                    using (var ctx = new PayrollDB())
                    {

                        var plist =
                            from p in ctx.PayrollItems.Where(x => x.PayrollJob.StartDate == CurrentPayrollJob.StartDate
                                                                  && x.PayrollJob.EndDate == CurrentPayrollJob.EndDate
                                                                  && x.PayrollJob.PayrollJobTypeId == CurrentPayrollJob.PayrollJobTypeId)
                                .Include(x => x.CreditAccount.Institution)
                                .AsEnumerable()
                                .Where(pi => //pi.PayrollJob.Name == CurrentPayrollJob.Name &&
                                    pi.DebitAccount is DataLayer.EmployeeAccount
                                    && pi.Name.Trim().ToUpper() == "Salary Deduction".ToUpper()
                                ) //.Where(z => z.PayrollJob.Branch.Name == "Main Branch")
                                .OrderBy(x => x.Employee.LastName)
                            group p by new {p.Employee.DisplayName}
                            into g //, p.IncomeDeduction, p.Priority, BranchName = p.PayrollJob.Branch.Name 
                            select new EmployeeSummaryLine
                            {
                                Employee = g.Key.DisplayName,
                                //BranchName = g.Key.BranchName,
                                //Priority = g.Key.Priority,
                                //IncomeDeduction = g.Key.IncomeDeduction,
                                Total = g.Sum(p => p.Amount),
                                PayrollItems = g.ToList()
                            };
                        if (!plist.Any()) return null;

                        return plist.ToList();
                    }
                });

                return await t;
            }
            catch (Exception)
            {
                throw;
            }
        }

        private async void SetDeductionTotals()
        {


            // var eb = db.PayrollItems.AsEnumerable().GroupBy(b => new BranchSummary { BranchName = b.Name, PayrollItems = new ObservableCollection<DataLayer.PayrollItem>(( p => p.PayrollItems)), Total = b.Sum(p => p.NetAmount) }).AsEnumerable().Pivot(E => E.PayrollItems, E => E.PayrollJob.Branch.Name, E => E.Amount, true, TransformerClassGenerationEventHandler).ToList();
            try
            {

                if (_deductionsData != null)
                {
                    if (!(_deductionsData[0] is IDynamicPivotObject)) return;
                    var t = _deductionsData[0].GetType();
                    var tot =
                        (LinqLib.DynamicCodeGenerator.IDynamicPivotObject)
                            Activator.CreateInstance(t);
                    tot.GetType().GetProperty("Employee").SetValue(tot, "Total");
                    //    tot.GetType().GetProperty("Total").SetValue(tot, DBNull.Value);

                    foreach (var item in tot.PropertiesNames)
                    {
                        double val = 0;
                        foreach (var row in _deductionsData)
                        {
                            val += System.Convert.ToDouble(row.GetType().GetProperty(item).GetValue(row));
                        }
                        tot.GetType().GetProperty(item).SetValue(tot, val);
                    }
                    tot.GetType()
                        .GetProperty("Total")
                        .SetValue(tot, _employeeDeductionsData.Sum(x => x.PayrollItems.Sum(z => z.Amount)));

                    _deductionsData.Add(tot);
                }

              //  return _deductionsData;


            }
            catch (Exception)
            {

                throw;
            }

        }

        public void PopulateDeductionsGrid()
        {
            try
            {

                DeductionsGrid.Columns.Clear();
                if (_deductionsData != null)
                {
                    var sstyle = new Style(typeof (TextBlock));
                    sstyle.Setters.Add(new Setter(TextBlock.HorizontalAlignmentProperty, HorizontalAlignment.Right));
                    DeductionsGrid.Columns.Add(new System.Windows.Controls.DataGridTextColumn()
                    {
                        Header = "Employee",
                        Binding = new Binding("Employee")
                    });
                    foreach (var item in ((IDynamicPivotObject) _deductionsData[0]).PropertiesNames.OrderBy(x => x))
                    {
                        DeductionsGrid.Columns.Add(new DataGridTextColumn()
                        {
                            Header = item.Substring(item.IndexOf("_")+3).Replace("_", " "),
                            Binding = new Binding(item) {StringFormat = "c"},
                            ElementStyle = sstyle
                        });
                    }


                    DeductionsGrid.Columns.Add(new DataGridTextColumn()
                    {
                        Header = "Total",
                        Binding = new Binding("Total") {StringFormat = "c"},
                        FontWeight = FontWeights.Bold,
                        ElementStyle = sstyle
                    });
                }

            }
            catch (Exception)
            {

                throw;
            }
        }

        public object NetSalaryData
        {
            get
            {
                lock (syncRoot)
                {
                    if (isDirty)
                    {
                        _employeeSalaryData = GetNetSalaryData().Result;
                        _netSalaryData = CalculateNetSalaryData(_employeeSalaryData);
                        SetNetSalaryTotals();
                        isDirty = false;
                    }
                }
                return _netSalaryData;
            }

        }


        private async Task<List<EmployeeAccountSummaryLine>> GetNetSalaryData()
        {
            if (CurrentPayrollJob == null) return null;
            var t = Task.Run(() =>
            {
                using (var ctx = new PayrollDB())
                {
                    var employeeSalaryData =
                        (from p in ctx.PayrollItems.Where(x => x.PayrollJob.StartDate == CurrentPayrollJob.StartDate
                                                                  && x.PayrollJob.EndDate == CurrentPayrollJob.EndDate
                                                                  && x.PayrollJob.PayrollJobTypeId == CurrentPayrollJob.PayrollJobTypeId)
                            .Include(x => x.CreditAccount.Institution)
                            .AsEnumerable()
                            .Where(pi => (pi.PayrollJob.Name == CurrentPayrollJob.Name)
                                         && pi.CreditAccount is DataLayer.EmployeeAccount
                                         && pi.Name.Trim().ToUpper() == "Salary".ToUpper()
                            )
                            .OrderBy(x => x.Employee.LastName)
                            group p by new {p.Employee.DisplayName}
                            into g //, p.IncomeDeduction, p.Priority, BranchName = p.PayrollJob.Branch.Name 
                            select new EmployeeAccountSummaryLine
                            {
                                Employee = g.Key.DisplayName,
                                Account = g.FirstOrDefault().CreditAccount,
                                Total =
                                    g.FirstOrDefault()
                                        .CreditAccount.AccountEntries.Where(
                                            z => z.PayrollItem.PayrollJob.Name == CurrentPayrollJob.Name)
                                        .Sum(q => q.Total)
                            }).ToList();

                    if (!employeeSalaryData.Any()) return null;

                    return employeeSalaryData;
                }
            });
            return await t;
        }

        private void SetNetSalaryTotals()
        {
            try
            {

                if (_netSalaryData != null)
                {
                    if (!(_netSalaryData[0] is IDynamicPivotObject)) return;
                    var tot =
                        (LinqLib.DynamicCodeGenerator.IDynamicPivotObject)
                            Activator.CreateInstance(_netSalaryData[0].GetType());
                    tot.GetType().GetProperty("Employee").SetValue(tot, "Total");
                    //    tot.GetType().GetProperty("Total").SetValue(tot, DBNull.Value);

                    foreach (var item in tot.PropertiesNames)
                    {
                        double val =
                            _netSalaryData.Sum(
                                row => System.Convert.ToDouble(row.GetType().GetProperty(item).GetValue(row)));
                        tot.GetType().GetProperty(item).SetValue(tot, val);
                    }
                    tot.GetType().GetProperty("Total").SetValue(tot, _employeeSalaryData.Sum(x => x.Total));

                    _netSalaryData.Add(tot);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private static List<object> CalculateNetSalaryData(IEnumerable<EmployeeAccountSummaryLine> plist)
        {
            try
            {
                if (plist == null) return null;
                var eb =
                    plist.Pivot(
                        X =>
                            plist.Select(
                                x =>
                                    new InstitutionSummary
                                    {
                                        Institution = $"{X.Account.Institution.Priority ?? "99"}-{X.Account.Institution.ShortName}",
                                        Total = X.Total,
                                        Priority = x.Account.Institution.Priority
                                    }).OrderBy(x => x.Priority),
                        X => X.Institution, X => X.Total, true, null).ToList();
                return eb;
            }
            catch (Exception)
            {

                throw;
            }
        }


        public void PopulateNetSalaryGrid()
        {
            try
            {

                NetSalaryGrid.Columns.Clear();
                if (_netSalaryData != null)
                {
                    var sstyle = new Style(typeof (TextBlock));
                    sstyle.Setters.Add(new Setter(TextBlock.HorizontalAlignmentProperty, HorizontalAlignment.Right));
                    NetSalaryGrid.Columns.Add(new System.Windows.Controls.DataGridTextColumn()
                    {
                        Header = "Employee",
                        Binding = new Binding("Employee")
                    });
                    foreach (
                        var item in
                            ((LinqLib.DynamicCodeGenerator.IDynamicPivotObject) _netSalaryData[0]).PropertiesNames.OrderBy(x => x))
                    {
                        NetSalaryGrid.Columns.Add(new System.Windows.Controls.DataGridTextColumn()
                        {
                            Header = item.Substring(item.IndexOf("_") + 3).Replace("_", " "),
                            Binding = new Binding(item) {StringFormat = "c"},
                            ElementStyle = sstyle
                        });
                    }
                    NetSalaryGrid.Columns.Add(new System.Windows.Controls.DataGridTextColumn()
                    {
                        Header = "Total",
                        Binding = new Binding("Total") {StringFormat = "c"},
                        FontWeight = FontWeights.Bold,
                        ElementStyle = sstyle
                    });
                }
            }
            catch (Exception)
            {

                throw;
            }
        }


        private void TransformerClassGenerationEventHandler(object sender, ClassGenerationEventArgs e)
        {
            //	throw new NotImplementedException();
        }



        public class InstitutionSummary
        {
            public string Institution { get; set; }
            public ObservableCollection<DataLayer.PayrollItem> PayrollItems { get; set; }
            public double Total { get; set; }
            public string Priority { get; set; }
        }

        public class InstitutionAccountSummary
        {
            public string Institution { get; set; }
            public ObservableCollection<DataLayer.AccountEntry> AccountEntries { get; set; }
            public double Total { get; set; }
        }

        public class EmployeeSummaryLine
        {
            public string Employee { get; set; }
            public double Total { get; set; }
            public List<DataLayer.PayrollItem> PayrollItems { get; set; }
        }

        public class EmployeeAccountSummaryLine
        {
            public string Employee { get; set; }
            public double Total { get; set; }
            public DataLayer.Account Account { get; set; }
        }

    }

}
