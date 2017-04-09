﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Data.Entity;
using System.Text;
using System.Threading.Tasks;

namespace PayrollManager.DataLayer
{
    public partial class Account
    {
        private ObservableCollection<DataLayer.AccountEntry> _accountEntries = null;
        public ObservableCollection<DataLayer.AccountEntry> AccountEntries
        {
            get
            {
                if (_accountEntries == null)
                {
                    return new ObservableCollection<AccountEntry>(RealAccountEntries);
                }
                return _accountEntries;
            }
        }

        public double Total
        {
            get
            {
                if (CurrentAccountEntries == null || BaseViewModel.StaticPayrollJob == null) return 0;

                return CurrentAccountEntries.Sum(ae => ae.CreditAmount - ae.DebitAmount);
            }
        }

        public double NetTotal
        {
            get
            {
                if (CurrentEmpNetCreditEntries == null || BaseViewModel.StaticPayrollJob == null) return 0;

                return CurrentEmpNetCreditEntries.Sum(ae => ae.Total) - CurrentEmpNetDebitEntries.Sum(ae => ae.Total);
            }
        }

        public double TotalDebit
        {
            get
            {
                if (CurrentAccountEntries == null || BaseViewModel.StaticPayrollJob == null) return 0;

                return CurrentAccountEntries.Sum(ae => ae.DebitAmount);
            }
        }

        public double NetTotalDebit
        {
            get
            {
                if ( BaseViewModel.StaticPayrollJob == null) return 0;

                return CurrentEmpNetDebitEntries.Sum(ae => ae.Total);
            }
        }

        public double TotalCredit
        {
            get
            {
                if (CurrentAccountEntries == null || BaseViewModel.StaticPayrollJob == null) return 0;

                return CurrentAccountEntries.Sum(ae => ae.CreditAmount);
            }
        }

        public double NetTotalCredit
        {
            get
            {
                if ( BaseViewModel.StaticPayrollJob == null) return 0;

                return CurrentEmpNetCreditEntries.Sum(ae => ae.Total);
            }
        }

        ObservableCollection<AccountEntry> _currentAccountEntries = new ObservableCollection<AccountEntry>();

        public ObservableCollection<AccountEntry> CurrentAccountEntries
        {
            get
            {

                if (_currentAccountEntries == null || !_currentAccountEntries.Any() ||
                    (BaseViewModel.StaticPayrollJob != null && 
                        _currentAccountEntries.First().PayrollItem  != null &&
                        BaseViewModel.StaticPayrollJob.PayrollJobId != _currentAccountEntries.First().PayrollItem.PayrollJobId))
                {
                    if ( BaseViewModel.StaticPayrollJob == null ||
                        BaseViewModel.StaticCurrentBranch == null) return null;
                    //return new ObservableCollection<AccountEntry>(AccountEntries.Where(a => a.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId 
                    //                                                && a.PayrollItem.Employee.BranchId == BaseViewModel.StaticCurrentBranch.BranchId 
                    //                                                && a.PayrollItem.PayrollJob.Branch != null 
                    //                                                && a.PayrollItem.PayrollJob.Branch.BranchId == BaseViewModel.StaticCurrentBranch.BranchId)
                    //                                                .OrderByDescending(x => x.PayrollItem.IncomeDeduction).ThenBy(x => x.PayrollItem.Priority));
                    List<AccountEntry> alst;
                    using (var ctx = new PayrollDB())
                    {
                        alst =
                            ctx.AccountEntries
                                     .Where(a => a.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId
                                                 && a.AccountId == AccountId
                                                 && a.PayrollItem.Employee.BranchId == BaseViewModel.StaticCurrentBranch.BranchId)
                                     .Include(x => x.PayrollItem)
                                     .OrderByDescending(x => x.PayrollItem.IncomeDeduction)
                                     .ThenBy(x => x.PayrollItem.Priority).ToList();

                    }
                    _currentAccountEntries = new ObservableCollection<AccountEntry>(alst);
                }
                return _currentAccountEntries;
            }
        }

        public ObservableCollection<PayrollSummaryLine> PayrollSummary
        {
            get
            {
                var plst = from p in CurrentAccountEntries
                           group p by p.PayrollItem.Name into g
                           select new PayrollSummaryLine
                           {
                               PayrollItemName = g.Key,
                               DebitAmount = g.Sum(x => x.DebitAmount),
                               CreditAmount = g.Sum(x => x.CreditAmount)
                           }
                           ;
                return new ObservableCollection<PayrollSummaryLine>(plst);
            }

        }

        public class PayrollSummaryLine
        {
            public string PayrollItemName { get; set; }
            public double DebitAmount { get; set; }
            public double CreditAmount { get; set; }


        }

        public ObservableCollection<DataLayer.AccountEntry> DebitEntries
        {
            get
            {
                if (CurrentAccountEntries == null || BaseViewModel.StaticPayrollJob == null) return null;
                return new ObservableCollection<AccountEntry>(CurrentAccountEntries.Where(a => a.DebitAmount != 0));
            }
        }

        public ObservableCollection<DataLayer.AccountEntry> CreditEntries
        {
            get
            {
                if (CurrentAccountEntries == null || BaseViewModel.StaticPayrollJob == null) return null;
                return new ObservableCollection<AccountEntry>(CurrentAccountEntries.Where(a => a.CreditAmount != 0 ));
            }
        }

        public ObservableCollection<EmployeeAccountSummaryLine> CurrentEmpNetCreditEntries
        {
            get
            {
                var lst = from i in BaseViewModel.db.AccountEntries.Where(x => x.Accounts.Institution.InstitutionId == this.Institution.InstitutionId
                                                                            && x.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId)
                                                                            .OrderBy(x => x.PayrollItem.Employee.LastName)
                                                                            .ThenByDescending(x => x.PayrollItem.IncomeDeduction).ThenBy(x => x.PayrollItem.Priority)
                                                                            .AsEnumerable()//&& x.PayrollItem.CreditAccount.AccountId != this.AccountId 

                          group i by new { i.PayrollItem.Employee, i.Accounts } into g
                          select new EmployeeAccountSummaryLine
                          {
                              Employee = g.Key.Employee.DisplayName,
                              Account = g.Key.Accounts,
                              Total = g.Sum(z => z.CreditAmount - z.DebitAmount)//
                          };

                 if (lst.Any())
                {
                    return new ObservableCollection<EmployeeAccountSummaryLine>(lst.Where(x =>
                    {
                        return x != null && x.Account != null && (x.Total > 0 && x.Account.AccountNumber != "1350-75");
                    }));//
                }
                else
                {
                    return new ObservableCollection<EmployeeAccountSummaryLine>();//
                }
            }
        }

        public ObservableCollection<EmployeeAccountSummaryLine> CurrentEmpNetDebitEntries
        {
            get
            {
                var lst = from i in BaseViewModel.db.AccountEntries.Where(x => x.Accounts.Institution.InstitutionId == this.Institution.InstitutionId
                                                                            && x.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId)
                                                                            .OrderByDescending(x => x.PayrollItem.IncomeDeduction).ThenBy(x => x.PayrollItem.Priority)
                                                                            .AsEnumerable()

                          group i by new { i.PayrollItem.Employee, i.Accounts } into g
                          select new EmployeeAccountSummaryLine
                          {
                              Employee = g.Key.Employee.DisplayName,
                              Account = g.Key.Accounts,
                              Total = g.Sum(z => z.DebitAmount - z.CreditAmount)
                          };

                return new ObservableCollection<EmployeeAccountSummaryLine>(lst.Where(x => x.Total > 0));
            }
        }

      
        
        public class EmployeeAccountSummaryLine
        {
            public string Employee { get; set; }            
            public double Total { get; set; }            
            public DataLayer.Account Account { get; set; }
        }
    }
}
