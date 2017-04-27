using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Data.Entity;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using PayrollManager.DataLayer;
using System.Data.Objects;
using EmailLogger;
using System.Data;

namespace PayrollManager
{
    public class BaseViewModel : DependencyObject, INotifyPropertyChanged
    {

        public static DataLayer.PayrollDB db = new DataLayer.PayrollDB(Properties.Settings.Default.PayrollDB);
        private static object syncRootbase = new Object();
       [MyExceptionHandlerAspect]
        public BaseViewModel()
       {
           CurrentYear = DateTime.Now.Year;

            staticPropertyChanged +=BaseViewModel_staticPropertyChanged;
          _currentBranch = db.Branches.Include(x => x.Employees).FirstOrDefault();
          db.Employees.Load();
          //if (allBranch.Employees.Any() == false)
          //{
          //    foreach (var emp in db.Employees)
          //      {
          //          allBranch.Employees.Add(emp);
          //      }              
          //}
          //if (allBranch.Employees.Any() == false)
          //{
          //    foreach (var emp in db.Employees)
          //    {
          //        allBranch.Employees.Add(emp);
          //    }
          //}

        }

    
static int instcount = 9999999;
        [MyExceptionHandlerAspect]
        private void CreateInstitutionEmployeeAccounts()
        {
            try
            {
                if (BaseViewModel.StaticPayrollJob == null ) return;

             
                
                //if (db.Accounts.Where(a => a.AccountType == "Summary Account").Count() == 0)
                //{
                using (var ctx = new PayrollDB())
                {
                    foreach (var ist in ctx.Accounts.OfType<EmployeeAccount>().Select(ea => ea.Institution).Distinct())
                    {
                        instcount += 1;
                        // create new institution account

                        var ia =
                            (InstitutionAccount)
                                ist.InstitutionAccounts.FirstOrDefault(i => i.Institution.Name == ist.Name);
                            //&& i.AccountType == "Summary Account"

                        if (ia == null)
                        {

                            ia = new InstitutionAccount();

                            ia.Institution = ist;
                            ia.PayeeInstitution = ist;
                            ia.AccountName = ist.Name;
                            ia.AccountNumber = "";
                            ia.AccountType = "Summary Account";
                            ia.AccountId = instcount; //new Random().Next();
                            HybridAccountsLst.Add(ia);
                        }

                        MergeEmployeAccountIntoInstitutionAccount(ia);


                    }
                } // db.AcceptAllChanges();
                //}
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        internal static void MergeEmployeAccountIntoInstitutionAccount(InstitutionAccount ia)
        {
            try
            {
                //var oldmergeopt = db.Accounts.MergeOption;
                //db.Accounts.MergeOption = MergeOption.NoTracking;
                var alst = ia.Institution.Accounts.OfType<EmployeeAccount>()
                                                  .Where(i => i.AccountType == "Salary Account").ToList();

                foreach (var acc in alst)
                    //Where(i => i.AccountType != "Summary Account"))
                {


                    instcount += 1;
                    if (acc.CurrentAccountEntries  == null || (acc.CurrentAccountEntries  != null && !acc.CurrentAccountEntries.Any()))
                        continue;

                    AccountEntry nae =
                        ia.AccountEntries.FirstOrDefault(
                            x =>
                            {
                                var firstOrDefault = acc.CurrentAccountEntries.FirstOrDefault();
                                return firstOrDefault != null && (x.PayrollItem == firstOrDefault.PayrollItem
                                                                       && x.Memo == "Net Entry");
                            });
                    AccountEntry rae =
                        acc.AccountEntries.FirstOrDefault(
                            x =>
                            {
                                var accountEntry = acc.CurrentAccountEntries.FirstOrDefault();
                                return accountEntry != null && x.PayrollItem == accountEntry.PayrollItem;
                            });
                    if (rae == null) continue;
                    if (nae == null)
                    {
                        nae = new AccountEntry();
                        ia.AccountEntries.Add(nae);
                        nae.AccountEntryId = instcount;
                        var firstOrDefault = acc.CurrentAccountEntries.FirstOrDefault();
                        if (firstOrDefault != null)
                            nae.PayrollItem = firstOrDefault.PayrollItem;
                        nae.Memo = "Net Entry";
                    }


                    if (acc.Total < 0)
                    {
                        nae.DebitAmount = rae.Total; //acc.Total;

                    }
                    else
                    {
                        nae.CreditAmount = rae.Total; ///acc.Total;

                    }



                    nae.TradeDate = DateTime.Now;

                    //db.ObjectStateManager.ChangeObjectState(nae, System.Data.EntityState.Unchanged);



                }

                //db.ObjectStateManager.ChangeObjectState(ia, System.Data.EntityState.Unchanged);
                //db.AcceptAllChanges();
                //db.Accounts.MergeOption = oldmergeopt;
            }
            catch (Exception)
            {

                throw;
            }
        }


        public static SliderPanel slider { get; set; }
        [MyExceptionHandlerAspect]
        private void PayrollEmployeeSetup_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            if (e.Action == System.Collections.Specialized.NotifyCollectionChangedAction.Add)
            {
                db.PayrollEmployeeSetup.AddObject(e.NewItems[0] as DataLayer.PayrollEmployeeSetup);
            }
        }
        [MyExceptionHandlerAspect]
        void PayrollSetupItems_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            if (e.Action == System.Collections.Specialized.NotifyCollectionChangedAction.Add)
            {
                db.PayrollSetupItems.AddObject(e.NewItems[0] as DataLayer.PayrollSetupItem);
                OnStaticPropertyChanged("PayrollSetupItemsRowAdded");
            }
        }


        [MyExceptionHandlerAspect]
        void AssociationChanged(object sender, CollectionChangeEventArgs e)
        {
            if (sender.ToString().Contains("Employee"))
            {
                OnStaticPropertyChanged("CurrentEmployee");
            }
            if (sender.ToString().Contains("Account"))
            {
                OnStaticPropertyChanged("CurrentAccount");
            }

            //            
        }
        [MyExceptionHandlerAspect]
        private void BaseViewModel_staticPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            
                OnPropertyChanged(e.PropertyName);
            
        }


       // ListCollectionView _AccountTypes = ;_AccountTypes
        [MyExceptionHandlerAspect]
        public ListCollectionView AccountTypes
        {
            get
            {

                return new ListCollectionView(db.AccountTypes.ToList());


            }
        }
        //static Branch allBranch = new AllBranch();
        //static ListCollectionView _Branches =;
        public ListCollectionView Branches
        {
            get
            {

                return  new ListCollectionView(db.Branches.ToList());
            }
        }
        [MyExceptionHandlerAspect]
        public System.Data.Objects.ObjectSet<DataLayer.PayrollSetupItem> PayrollSetupItems
        {
            get
            {
                return BaseViewModel.db.PayrollSetupItems;
            }
        }

        static ObservableCollection<PayrollSetupItem> _currentSelectedPayrollSetups = new ObservableCollection<PayrollSetupItem>();
        static public ObservableCollection<PayrollSetupItem> CurrentSelectedPayrollSetups
        {
            get
            {
                return _currentSelectedPayrollSetups;
            }
            set
            {
                _currentSelectedPayrollSetups = value;

            }
        }

        public System.Data.Objects.ObjectSet<DataLayer.PayrollEmployeeSetup> PayrollEmployeeSetup
        {
            get
            {
                return BaseViewModel.db.PayrollEmployeeSetup;
            }
        }
        //static ListCollectionView _PayrollEmployeeSetup = new ListCollectionView(db.PayrollEmployeeSetup.ToList<DataLayer.PayrollEmployeeSetup>());
        //public ListCollectionView PayrollEmployeeSetup
        //{
        //    get
        //    {
        //       _PayrollEmployeeSetup.CurrentChanged +=_PayrollEmployeeSetup_CurrentChanged;

        //        return _PayrollEmployeeSetup;
        //    }
        //}

        private void _PayrollEmployeeSetup_CurrentChanged(object sender, EventArgs e)
        {
          
        }
        //IF YOU PUT STATIC YOU WILL LINK ALL COMBOBOXES TOGETHER!!!!!!!!!!!!!!!
       //  ListCollectionView _PayrollJobTypes = ;
        public ListCollectionView PayrollJobTypes
        {
            get
            {
                return new ListCollectionView(db.PayrollJobTypes.ToList());
            }
        }
      
      ////  static ListCollectionView _Employees = ;
      //  public virtual ListCollectionView Employees
      //  {
      //      get
      //      {
      //          return new ListCollectionView(db.Employees.Where(e => e.BranchId == BaseViewModel._currentBranch.BranchId).ToList());
      //      }
      //  }
        [MyExceptionHandlerAspect]
        public ObservableCollection<Employee> Employees
        {
            get
            {
                if (BaseViewModel.StaticCurrentBranch == null) return null;
                return new ObservableCollection<Employee>(db.Employees.AsEnumerable().Where(e => e.BranchId == BaseViewModel.StaticCurrentBranch.BranchId && (e.EmploymentEndDate.HasValue == false || Convert.ToDateTime(e.EmploymentEndDate).Date >= DateTime.Now.Date)).OrderBy(x => x.LastName).ToList());
            }
        }
     

      //  ListCollectionView _Institutions;
        //public ListCollectionView Institutions
        //{
        //    get
        //    {
        //        return new ListCollectionView(db.Institutions.ToList());
        //    }
        //}

      //  static ListCollectionView _payrollJobs ;
        //public ListCollectionView PayrollJobs
        //{
        //    get
        //    {
        //        return new ListCollectionView(db.PayrollJobs.ToList());
        //    }
        //}
       // ObservableCollection<DataLayer.PayrollJob> _payrollJobs = new ObservableCollection<DataLayer.PayrollJob>();
        [MyExceptionHandlerAspect]
        public ObservableCollection<DataLayer.PayrollJob> PayrollJobs
        {
            get
            {
                if (CurrentBranch != null && CurrentBranch.PayrollJobs.Count > 0)
                    return new ObservableCollection<DataLayer.PayrollJob>(CurrentBranch.PayrollJobs.Where(x => x.StartDate.Year == CurrentYear));//(db.PayrollJobs.Where(pj => pj.BranchId == CurrentBranch.BranchId));
              //  return _payrollJobs;
                return null;
            }
            //set
            //{
            //    _payrollJobs = value;
            //    OnStaticPropertyChanged("PayrollJobs");
            //    OnPropertyChanged("PayrollJobs");
            //}
        }

        public class ComboBoxItemString
        {
            public string ValueString { get; set; }
        }

       // ListCollectionView _AccountTypes = ;
        //public ListCollectionView AccountTypes
        //{
        //    get
        //    {

        //        return   new ListCollectionView(db.AccountTypes.ToList());
           
               
        //    }
        //}


       // ListCollectionView _EmployeeAccounts ;
        [MyExceptionHandlerAspect]
        public ListCollectionView EmployeeAccounts
        {
            get
            {
                return new ListCollectionView(db.Accounts.OfType<DataLayer.EmployeeAccount>().ToList());
            }
        }

       // ListCollectionView _Accounts = ;
        public ListCollectionView Accounts
        {
            get
            {
                return new ListCollectionView(db.Accounts.ToList());
            }
        }

      //  ListCollectionView _InstitutionAccounts;
        internal ObservableCollection<Account> HybridAccountsLst = new ObservableCollection<Account>();


        
        internal static ObservableCollection<Account> _institutionAccounts = null;
        [MyExceptionHandlerAspect]
        public ObservableCollection<Account> InstitutionAccounts
        {
            get
            {
                lock (syncRootbase)
                {
                    if (_institutionAccounts == null)
                    {
                        _institutionAccounts = GetInstitutionAccountsData().Result;
                    }
                }
                return _institutionAccounts;
            }
        }
        internal static ObservableCollection<Institution> _institutions = null;
        [MyExceptionHandlerAspect]
        public ObservableCollection<Institution> Institutions
        {
            get
            {
                lock (syncRootbase)
                {
                    if (_institutions == null)
                    {
                        _institutions = new ObservableCollection<Institution>(db.Institutions);
                    }
                }
                return _institutions;
            }
        }


        private async Task<ObservableCollection<Account>> GetInstitutionAccountsData()
        {
            var t = Task.Run(() =>
            {
                GenerateHybridAccounts();
                OnStaticPropertyChanged("InstitutionAccountsData");
                var lst =
                    new ObservableCollection<Account>(
                        HybridAccountsLst.Where(
                            x => x.CurrentAccountEntries != null && x.CurrentAccountEntries.Count > 0).ToList());
                return lst;
            }).ConfigureAwait(false);
            return await t;
        }

        [MyExceptionHandlerAspect]
        public ObservableCollection<DataLayer.Account> CurrentAccountsLst
        {
            get
            {
                ObservableCollection<DataLayer.Account> lst = new ObservableCollection<DataLayer.Account>();
                foreach (var item in db.Accounts.OfType<DataLayer.InstitutionAccount>())
                {
                    lst.Add(item);
                }
                if (CurrentEmployee != null)
                {
                    foreach (var item in CurrentEmployee.EmployeeAccounts)
                    {
                        lst.Add(item);
                    }
                }
                else
                {
                    foreach (var item in db.Accounts.OfType<DataLayer.EmployeeAccount>())
                    {
                        lst.Add(item);
                    }
                }
                return lst;
            }
        }
        [MyExceptionHandlerAspect]
        internal void GenerateHybridAccounts()
        {
            HybridAccountsLst.Clear();
            //
            using (var ctx = new PayrollDB())
            {
               foreach (var item in ctx.Accounts.OfType<InstitutionAccount>().Include(x => x.Institution))
                {
                    HybridAccountsLst.Add(item);
                }  
            }
               

            CreateInstitutionEmployeeAccounts();

        }

        public static string Date
        {
            get
            {
                return DateTime.Now.ToLongDateString();
            }
        }

        private int currentYear = DateTime.Now.Year;
        public int CurrentYear 
        {
            get { return currentYear; }
            set
            {
                currentYear = value;
                OnStaticPropertyChanged("CurrentYear");
                OnPropertyChanged("CurrentYear");
            } 
        }

        static DataLayer.Institution _currentInstitution = null;

        public virtual DataLayer.Institution CurrentInstitution
        {
            get
            {
                return _currentInstitution;

            }
            set
            {
                if (_currentInstitution != value)
                    _currentInstitution = value;
                OnStaticPropertyChanged("CurrentInstitution");
                OnPropertyChanged("CurrentInstitution");
            }
        }

        static DataLayer.InstitutionAccount _currentInstitutionAccount;
        public virtual DataLayer.InstitutionAccount CurrentInstitutionAccount
        {
            get
            {
                if (_currentInstitutionAccount != null) MergeEmployeAccountIntoInstitutionAccount(_currentInstitutionAccount);
                return _currentInstitutionAccount;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                if (_currentInstitutionAccount == null && value != null)
                {
                    _currentInstitutionAccount = value;
                    
                    CurrentInstitutionAccount.RealAccountEntries.AssociationChanged += AssociationChanged;
                }
                _currentInstitutionAccount = value;
                OnStaticPropertyChanged("CurrentInstitutionAccount");
                OnStaticPropertyChanged("Accounts");
                OnStaticPropertyChanged("AccountTypes");

                // SetValue(CurrentEmployeeProperty, value);
            }
        }

       

        static DataLayer.EmployeeAccount _currentEmployeeAccount;
        public virtual DataLayer.EmployeeAccount CurrentEmployeeAccount
        {
            get
            {
                return _currentEmployeeAccount;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                if (_currentEmployeeAccount == null && value != null)
                {
                    _currentEmployeeAccount = value;
                    CurrentEmployeeAccount.RealAccountEntries.AssociationChanged += AssociationChanged;
                }
                _currentEmployeeAccount = value;
                OnStaticPropertyChanged("CurrentEmployeeAccount");
                OnStaticPropertyChanged("Accounts");
                OnStaticPropertyChanged("AccountTypes");

                // SetValue(CurrentEmployeeProperty, value);
            }
        }

        static DataLayer.Account _currentAccount;
        public virtual DataLayer.Account CurrentAccount
        {
            get
            {
                return _currentAccount;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                if(_currentAccount == null && value != null)
                {
                    _currentAccount = value;
                    CurrentAccount.RealAccountEntries.AssociationChanged += AssociationChanged;
                }
                _currentAccount = value;
                OnStaticPropertyChanged("CurrentAccount");
                OnStaticPropertyChanged("Accounts");
                OnStaticPropertyChanged("AccountTypes");

                // SetValue(CurrentEmployeeProperty, value);
            }
        }

        static DataLayer.Employee _currentEmployee;
        public static DataLayer.Employee StaticCurrentEmployee
        {
            get
            {
                return _currentEmployee;
            }
        }
        public virtual DataLayer.Employee CurrentEmployee
        {
            get
            {
               return _currentEmployee;
              // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                if (_currentEmployee != value)
                {
                    _currentEmployee = value;
                    OnStaticPropertyChanged("CurrentEmployee");
                    OnStaticPropertyChanged("CurrentPayrollEmployeeSetup");
                }
                if (_currentEmployee == null & value != null )
                {
                   // _currentEmployee = value;
                    CurrentEmployee.BranchReference.AssociationChanged += AssociationChanged;
                    CurrentEmployee.EmployeeAccounts.AssociationChanged += AssociationChanged;
                    CurrentEmployee.Employees.AssociationChanged += AssociationChanged;
                    CurrentEmployee.PayrollEmployeeSetups.AssociationChanged += AssociationChanged;
                    CurrentEmployee.PayrollItems.AssociationChanged += AssociationChanged;
                    CurrentEmployee.SupervisorsReference.AssociationChanged += AssociationChanged;
                }
               
                //OnStaticPropertyChanged("IncomePayrollLineItems");
                //OnStaticPropertyChanged("DeductionPayrollLineItems");
               // SetValue(CurrentEmployeeProperty, value);
            }
        }



        static DataLayer.PayrollItem _currentPayrollItem;
        public virtual DataLayer.PayrollItem CurrentPayrollItem
        {
            get
            {
                return _currentPayrollItem;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                _currentPayrollItem = value;

                OnStaticPropertyChanged("CurrentPayrollItem");
                //OnStaticPropertyChanged("CurrentEmployee");
              //  OnStaticPropertyChanged("Employees");
               // OnStaticPropertyChanged("CurrentPayrollJob");
              //  OnStaticPropertyChanged("PayrollJobs");
                // SetValue(CurrentEmployeeProperty, value);
            }
        }

        static DataLayer.PayrollEmployeeSetup _currentPayrollEmployeeSetup;
        public virtual DataLayer.PayrollEmployeeSetup CurrentPayrollEmployeeSetup
        {
            get
            {
                return _currentPayrollEmployeeSetup;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                  _currentPayrollEmployeeSetup = value;
                OnStaticPropertyChanged("CurrentPayrollEmployeeSetup");

               
                // SetValue(CurrentEmployeeProperty, value);
            }
        }

        static DataLayer.PayrollSetupItem _currentPayrollSetupItem;
        public virtual DataLayer.PayrollSetupItem CurrentPayrollSetupItem
        {
            get
            {
                return _currentPayrollSetupItem;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                _currentPayrollSetupItem = value;

                OnStaticPropertyChanged("CurrentPayrollSetupItem");
                
                // SetValue(CurrentEmployeeProperty, value);
            }
        }

        static DataLayer.Branch _currentBranch;
        public static DataLayer.Branch StaticCurrentBranch
        {
            get
            {
                return _currentBranch;
            }
        }

        public DataLayer.Branch CurrentBranch
        {
            get
            {
                return _currentBranch;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                _currentBranch = value;
                //if (_currentPayrollJob != null)
                //{
                //   // _currentPayrollJob.Branch = CurrentBranch;
                //    OnStaticPropertyChanged("CurrentPayrollJob");
                //}

                //if (CurrentBranch != null && CurrentBranch.PayrollJobs.Count > 0)
                //    PayrollJobs = new ObservableCollection<DataLayer.PayrollJob>(db.PayrollJobs.Where(pj => pj.BranchId == CurrentBranch.BranchId));

                OnStaticPropertyChanged("CurrentBranch");
                OnStaticPropertyChanged("StaticCurrentBranch");
                //OnStaticPropertyChanged("PayrollItems");

                OnStaticPropertyChanged("Employees");
                OnStaticPropertyChanged("CurrentEmployee");
                

                if (_currentBranch != null && _currentBranch.CurrentPayrollJob != null)
                {
                    if (CurrentPayrollJob != _currentBranch.CurrentPayrollJob)
                    {
                        CurrentPayrollJob = _currentBranch.CurrentPayrollJob;
                    }
                    else
                    {
                        _institutionAccounts = null;
                        OnStaticPropertyChanged("InstitutionAccounts");
                    }
                }
                else
                {
                    _institutionAccounts = null;
                        OnStaticPropertyChanged("InstitutionAccounts");
                }

            }
        }

        static DataLayer.PayrollJob _currentPayrollJob;

        public static DataLayer.PayrollJob StaticPayrollJob
        {
            get
            {
                return _currentPayrollJob;
            }
        }

        static DataLayer.PayrollJobType _currentPayrollJobType;
        public DataLayer.PayrollJobType CurrentPayrollJobType
        {
            get
            {
                return _currentPayrollJobType;
            }
            set
            {
                _currentPayrollJobType = value;
                OnStaticPropertyChanged("CurrentPayrollJobType");
            }
        }

        public virtual DataLayer.PayrollJob CurrentPayrollJob
        {
            get
            {
                return _currentPayrollJob;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {
                if (_currentPayrollJob == value) return;
                _currentPayrollJob = value;
              //  if (CurrentBranch != null && _currentPayrollJob != null) _currentPayrollJob.Branch = CurrentBranch;
               // OnStaticPropertyChanged("CurrentPayrollJob");
                if (_currentPayrollJob != null && CurrentBranch.CurrentPayrollJob != CurrentPayrollJob)
                {
                    CurrentBranch.CurrentPayrollJobId = _currentPayrollJob.PayrollJobId;
                    SaveDatabase();
                }

                OnStaticPropertyChanged("CurrentPayrollJob");
                
                CycleCurrentEmployee();
                _institutionAccounts = null;
                CycleInstitutionAccounts();
               // OnStaticPropertyChanged("CurrentBranch");
                //CycleCurrentBranch();
                // SetValue(CurrentEmployeeProperty, value);
                
            }
        }
        [MyExceptionHandlerAspect]
        internal static void CycleCurrentBranch()
        {
            DataLayer.Branch b = _currentBranch;
            _currentBranch = db.Branches.Include(x => x.Employees).FirstOrDefault();
            OnStaticPropertyChanged("CurrentBranch");
            _currentBranch = b;
            OnStaticPropertyChanged("CurrentBranch");
           
        }
        [MyExceptionHandlerAspect]
        internal static void CycleCurrentPayrollJob()
        {
            DataLayer.PayrollJob b = _currentPayrollJob;
            _currentPayrollJob = db.PayrollJobs.FirstOrDefault();
            OnStaticPropertyChanged("CurrentPayrollJob");
            _currentPayrollJob = b;
            OnStaticPropertyChanged("CurrentPayrollJob");

        }
        [MyExceptionHandlerAspect]
        private void CycleInstitutionAccounts()
        {
            _currentInstitutionAccount = null;
            OnStaticPropertyChanged("CurrentInstitutionAccount");
            if (_currentInstitutionAccount == null) _currentInstitutionAccount = db.Accounts.OfType<DataLayer.InstitutionAccount>().FirstOrDefault();
            OnStaticPropertyChanged("CurrentInstitutionAccount");
            OnStaticPropertyChanged("InstitutionAccounts");
        }

        #region INotifyPropertyChanged
        public static event PropertyChangedEventHandler staticPropertyChanged;
        public static void OnStaticPropertyChanged(String info)
        {
            if (staticPropertyChanged != null )
            {
                staticPropertyChanged(null, new PropertyChangedEventArgs(info));
            }
        }


        public  event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged(String info)
        {
            try
            {
                if (PropertyChanged != null)
                {
                    PropertyChanged(this, new PropertyChangedEventArgs(info));
                    //OnStaticPropertyChanged(info);
                }
            }
            catch
            {
            }
        }
        #endregion

        [MyExceptionHandlerAspect]
        internal static void GeneratePayrollItems()
        {
           if (_currentPayrollJob == null)
            {
                MessageBox.Show("Please Select the Current Payroll Job you want to use, then Try again.");
                return;
            }

           if (_currentPayrollJob.Status == "Posted")
           {
               MessageBox.Show("Sorry Payroll Job already posted and no further changes can be made.");
               return;
           }
 

            var pitmlst = (from p in db.PayrollEmployeeSetup.Where(p => p.PayrollJobTypeId== StaticPayrollJob.PayrollJobTypeId && p.Employee.BranchId == BaseViewModel.StaticCurrentBranch.BranchId 
                             //  && p.EmployeeId == 69
                               ).AsEnumerable()
                          orderby p.PayrollSetupItem.Priority
                          select p);
            if (pitmlst == null)
            {
                MessageBox.Show("Please Select the Current Payroll Job you want to use, then Try again.");
                return;
            }

            if (pitmlst.FirstOrDefault().PayrollSetupItem.Name.Trim().ToUpper() != "Salary".ToUpper())
            {
                MessageBox.Show("Salary is not the First item. Please check Payroll Item order");
                return;
            }

            foreach (var item in pitmlst)
            {
                if (item.Employee.BranchId != StaticCurrentBranch.BranchId) continue;
                if (item.Employee.EmploymentEndDate.HasValue == true && item.Employee.EmploymentEndDate.Value.Date <= DateTime.Now.Date) continue;
                
                DataLayer.PayrollItem pi;

                if (_currentPayrollJob.StartDate >= item.StartDate )
                {
                    if (item.EndDate != null && _currentPayrollJob.EndDate > item.EndDate)
                    {
                        continue;
                    }

                }
                else
                {
                    MessageBox.Show(string.Format("{1} - Payroll Item-'{0}' was not created because payroll job was too early", item.PayrollSetupItem.Name, item.Employee.DisplayName));
                    continue;
                }

                pi = (from p in db.PayrollItems.AsEnumerable().Where(p => p.PayrollJobId == StaticPayrollJob.PayrollJobId 
                                                                        && p.PayrollJob != null && p.PayrollJob.Branch != null 
                                                                        && p.PayrollJob.Branch.BranchId == BaseViewModel.StaticCurrentBranch.BranchId 
                                                                        && p.Employee != null 
                                                                        && p.Employee.BranchId == BaseViewModel.StaticCurrentBranch.BranchId 
                                                                        && p.EmployeeId == item.EmployeeId 
                                                                        && p.PayrollSetupItemId == item.PayrollSetupItemId 
                                                                        && (p.CreditAccountId == item.CreditAccountId && p.DebitAccountId == item.DebitAccountId)
                                                                       // && ((p.Amount == item.Amount && item.ChargeType == "Amount") || (item.ChargeType == "Rate" && p.Rate == item.Rate))
                                                                       )
                     select p).FirstOrDefault();
                if (pi == null)
                {
                   
                    pi = db.PayrollItems.CreateObject();
                    db.PayrollItems.AddObject(pi);
                }


                TriBoolState triBool = ConfigPayrollItem(pi, item);
                switch (triBool)
                {
                    case TriBoolState.Fail:
                        return;
                        
                    case TriBoolState.Success:
                        break;
                    case TriBoolState.Continue:
                        continue;
                        
                    default:
                        break;
                }
                

                SaveDatabase(); // save to get itemid
                foreach (var ci in pi.ChildPayrollItems.ToList())
                {
                    db.PayrollItems.DeleteObject(ci);
                }
                

                if (item.PayrollSetupItem.CompanyLineItemDescription != null && item.PayrollSetupItem.CompanyLineItemDescription != "")
                {
                  DataLayer.PayrollItem  citem =  CreateCompanyPayrollItem(pi, item);
                  
                  db.PayrollItems.AddObject(citem);
                }
                
  

            }
            SaveDatabase();
            
            SetPayrollItemsAmounts();

            CycleCurrentEmployee();
            
            OnStaticPropertyChanged("CurrentPayrollJob");
            OnStaticPropertyChanged("PayrollItems");
            
           OnStaticPropertyChanged("Employees");
            OnStaticPropertyChanged("CurrentEmployee.EmployeeAccounts");
            OnStaticPropertyChanged("CurrentEmployee");
            OnStaticPropertyChanged("PayrollJobs");
            MessageBox.Show("Payroll Job Setup Complete");
        }
       public enum TriBoolState
        {
            Fail,
            Success,
            Continue
        }
        [MyExceptionHandlerAspect]
        public static TriBoolState ConfigPayrollItem(PayrollItem pi, DataLayer.PayrollEmployeeSetup item, bool AddToCurrentPayrollJob = true)
        {
            
            pi.IsTaxableBenefit = item.PayrollSetupItem.IsTaxableBenefit;
            pi.ApplyToTaxableBenefits = item.PayrollSetupItem.ApplyToTaxableBenefits;
            if(item.BaseAmount != null) pi.BaseAmount = (double)item.BaseAmount;
            pi.Amount = Convert.ToDouble(item.Amount);
            pi.Priority = item.PayrollSetupItem.Priority;
            if (AddToCurrentPayrollJob == true && _currentPayrollJob != null)  pi.PayrollJobId = _currentPayrollJob.PayrollJobId;
            pi.Name = item.PayrollSetupItem.Name;
            pi.PayrollSetupItemId = item.PayrollSetupItemId;
            pi.EmployeeId = item.EmployeeId;
            pi.IncomeDeduction = item.PayrollSetupItem.IncomeDeduction;
            pi.Rate = Convert.ToSingle(item.Rate);
            pi.RateRounding = item.RateRounding;
            
            pi.Status = "Generated";
            // do accounts
            if (pi.EmployeeId != item.EmployeeId) return TriBoolState.Continue;

          //  DataLayer.EmployeeAccount ea = item.EmployeeAccount; // GetEmployeeAccount(item.PayrollSetupItem.EmployeeAccountType, item.EmployeeId);
            if (item.DebitAccount == null)
            {
                MessageBox.Show(string.Format("{0} has no Debit Account setup for Account Type:{1}", item.Employee.DisplayName, item.PayrollSetupItem.EmployeeAccountType));
                ResetDatabase();
                return TriBoolState.Fail;
            }

            if (item.CreditAccount == null)
            {
                MessageBox.Show(string.Format("{0} has no Credit Account setup for Account Type:{1}", item.Employee.DisplayName, item.PayrollSetupItem.EmployeeAccountType));
                ResetDatabase();
                return TriBoolState.Fail;
            }

            //if (item.PayrollSetupItem.IncomeDeduction == true)
            //{
                pi.CreditAccountId = item.CreditAccountId; //ea.AccountId;
                pi.DebitAccountId = item.DebitAccountId; //item.PayrollSetupItem.PayrollItemAccountId;
            //}
            //else
            //{

            //    pi.CreditAccountId = item.PayrollSetupItem.PayrollItemAccountId;
            //    pi.DebitAccountId = ea.AccountId;
            //}
            return TriBoolState.Success;
        }
        [MyExceptionHandlerAspect]
        public static void PostToAccounts()
        {
            if (_currentPayrollJob.Status == "Posted")
            {
                MessageBox.Show("Sorry Payroll Job already Posted! Try creating a new Job.", "Payroll Job already posted");
                return;
            }

           // SetPayrollItemsAmounts();

            ClearExistingAccountEntries();

            foreach (var item in _currentPayrollJob.PayrollItems.Where(p=>p.Status == "Amounts Processed" && p.ParentPayrollItem == null))
            {
                
               // do debit account entry
                CreateAccountEntry(item,  true);

                
                // do credit account entry
                CreateAccountEntry(item, false);
                item.Status = "Posted";

                if (item.PayrollSetupItem != null && item.PayrollSetupItem.CompanyLineItemDescription != "")
                {
                    foreach (var citm in item.ChildPayrollItems)
                    {
                        // do debit account entry
                        CreateAccountEntry(citm, true);


                        // do credit account entry
                        CreateAccountEntry(citm, false);
                    }
                }
              
            }
            _currentPayrollJob.Status = "Posted";
            SaveDatabase();

            CycleCurrentEmployee();
            MessageBox.Show("Payroll Job Posted");
            OnStaticPropertyChanged("CurrentPayrollJob");
            OnStaticPropertyChanged("PayrollItems");
            OnStaticPropertyChanged("Employees");
            
            OnStaticPropertyChanged("CurrentEmployee.EmployeeAccounts");
            OnStaticPropertyChanged("EmployeeAccounts");
            OnStaticPropertyChanged("CurrentInstitutionAccount");
            _institutionAccounts = null;
            OnStaticPropertyChanged("InstitutionAccounts");
            OnStaticPropertyChanged("CurrentEmployeeAccount");

        }
        [MyExceptionHandlerAspect]
        private static DataLayer.PayrollItem CreateCompanyPayrollItem(DataLayer.PayrollItem item, DataLayer.PayrollEmployeeSetup empSetupItem)
        {
            try
            {


                DataLayer.PayrollItem citm = new DataLayer.PayrollItem();

                citm.ParentPayrollItemId = item.PayrollItemId;
                citm.Amount = Convert.ToDouble(empSetupItem.CompanyAmount);
                citm.Priority = item.PayrollSetupItem.Priority;
                citm.PayrollJobId = _currentPayrollJob.PayrollJobId;
                citm.Name = item.PayrollSetupItem.CompanyLineItemDescription;
                citm.PayrollSetupItemId = item.PayrollSetupItemId;
                citm.EmployeeId = item.EmployeeId;
                citm.IncomeDeduction = item.PayrollSetupItem.IncomeDeduction;
                citm.Rate = empSetupItem.CompanyRate == null?0:(float)empSetupItem.CompanyRate;
                citm.RateRounding = empSetupItem.RateRounding;
                citm.Status = "Generated";

                if (item.PayrollSetupItem.IncomeDeduction == true)
                {
                    citm.CreditAccountId = (int)item.PayrollSetupItem.CompanyAccountId;
                    citm.DebitAccountId = item.PayrollSetupItem.PayrollItemAccountId;
                }
                else
                {

                    citm.CreditAccountId = item.PayrollSetupItem.PayrollItemAccountId;
                    citm.DebitAccountId = (int)item.PayrollSetupItem.CompanyAccountId;
                }

                return citm;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        [MyExceptionHandlerAspect]
        private static void ClearExistingAccountEntries()
        {
            foreach (var item in db.AccountEntries.Where(ae => ae.PayrollItem.PayrollJobId == _currentPayrollJob.PayrollJobId).ToList())

            {
                db.AccountEntries.DeleteObject(item);
            }
        }
        [MyExceptionHandlerAspect]
        private static void CycleCurrentEmployee()
        {
            _currentEmployee = null;
            OnStaticPropertyChanged("CurrentEmployee");
            if (_currentEmployee == null) _currentEmployee = _currentBranch.Employees.FirstOrDefault();
            OnStaticPropertyChanged("CurrentEmployee");
        }
        [MyExceptionHandlerAspect]
        private static void CreateAccountEntry(DataLayer.PayrollItem item, bool debitCredit)
        {

            DataLayer.AccountEntry ea;


            DataLayer.AccountEntry ae = db.AccountEntries.CreateObject();

            if (debitCredit == true)
            {
             //  var ddd = db.AccountEntries.Where(a => a.PayrollItemId == item.PayrollItemId && a.AccountId == item.DebitAccountId);
                 ea = db.AccountEntries.Where(a =>a.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId && a.PayrollItemId == item.PayrollItemId && a.AccountId == item.DebitAccountId).FirstOrDefault();
                 if (ea != null) db.AccountEntries.DeleteObject(ea);

                ae.AccountId = item.DebitAccountId;
                ae.DebitAmount = item.Amount;
            }
            else
            {
                ea = db.AccountEntries.Where(a =>a.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId && a.PayrollItemId == item.PayrollItemId && a.AccountId == item.CreditAccountId).FirstOrDefault();
                if (ea != null) db.AccountEntries.DeleteObject(ea);

                ae.AccountId = item.CreditAccountId;
                ae.CreditAmount = item.Amount;
            }
           
            ae.PayrollItemId = item.PayrollItemId;
            ae.TradeDate = _currentPayrollJob.PaymentDate;
            ae.EntryTime = DateTime.Now;

            db.AccountEntries.AddObject(ae);
        }

        private static void ResetDatabase()
        {
            db = null;
            db = new DataLayer.PayrollDB();
        }
        [MyExceptionHandlerAspect]
        public static void SaveDatabase()
        {
            try
            {
                db.SaveChanges();
            }
            catch (System.Data.OptimisticConcurrencyException oce)
            {
                foreach (var item in oce.StateEntries)
                {
                    if (item.State == EntityState.Deleted)
                    {
                        db.Detach(item.Entity);
                    }
                    else
                    {
                        db.Refresh(RefreshMode.StoreWins, item);
                        //  SaveDatabase();
                    }
                }
                SaveDatabase();
            }
            catch (System.Data.UpdateException ue)
            {
                foreach (var item in ue.StateEntries)
                {
                    if (item.State == EntityState.Added || item.State == EntityState.Deleted)
                    {
                        db.Detach(item.Entity);
                    }
                    else
                    {
                       // db.DeleteObject(item.Entity);
                        throw ue;
                    }
                    
                        SaveDatabase();
                   
                }

            }
            catch (System.InvalidOperationException ie)
            {
                //throw ie;
                ResetDatabase();
            }
            catch (Exception e)
            {
                ResetDatabase();
            }
        }

        [MyExceptionHandlerAspect]
        private static DataLayer.EmployeeAccount GetEmployeeAccount(string accountType, int empid)
        {
            DataLayer.EmployeeAccount empacc = (from a in db.Accounts.OfType<DataLayer.EmployeeAccount>()
                                               where  a.EmployeeId == empid && a.AccountType == accountType
                                               select a).FirstOrDefault();
            return empacc;
        }
        [MyExceptionHandlerAspect]
        private static void SetPayrollItemsAmounts()
        {
            //
            
            var emppayitm = from p in db.PayrollItems.AsEnumerable().Where(pi => pi.PayrollJobId == _currentPayrollJob.PayrollJobId && pi.PayrollJob.Branch != null && pi.PayrollJob.Branch.BranchId == BaseViewModel.StaticCurrentBranch.BranchId)
                            orderby p.Priority ascending
                            group p by p.Employee into e
                            select new
                            {
                                emp = e.Key,
                                payitems = e.Select(p => p)
                            };

            
            foreach (var emp in emppayitm)
            {
                CalculatePayrollAmts(emp.payitems);
            }

            SaveDatabase();
        }
        [MyExceptionHandlerAspect]
        public static void CalculatePayrollAmts( IEnumerable<DataLayer.PayrollItem> payitems)
        {
            try
            {
                double truebase = 0;
                double baseamount = 0;
                double amt = 0;

                var payrollItems = payitems as IList<PayrollItem> ?? payitems.ToList();
                if (!payrollItems.Any()) return;
                var plst = payrollItems.Where(p => p.ParentPayrollItemId == null ).OrderBy(p => p.Priority).ToList();
                if (plst.First().Name.Trim().ToUpper() != "Salary".ToUpper())
                {
                    MessageBox.Show("Salary is not the First item Please check Payroll Item order");
                    return;
                }

               // UpdatePayrollItemsBaseAmounts(payrollItems.ToList());

                foreach (var item in plst)
                {

                    if (item.PayrollSetupItem == null) continue;

                    
                    if (item.Name.Trim().ToUpper() == "Salary".ToUpper())
                    {
                        if (item.BaseAmount == 0)
                        {
                            truebase += item.Amount;
                        }
                        else
                        {
                            truebase = item.BaseAmount;
                        }
                    }

                    if (item.ApplyToTaxableBenefits == true)
                    {
                        baseamount = item.BaseAmount;
                    }
                    else
                    {
                        baseamount = truebase;
                    }


                   
                    
                        if (baseamount < item.PayrollSetupItem.MiniumBaseAmount)
                        {
                            db.PayrollItems.DeleteObject(item);
                            continue;
                        }
                   

                    amt = Convert.ToDouble(GetPayrollAmount(baseamount, item));

                    //set the payroll amounts   

                    item.Amount = System.Math.Abs(amt);

                    item.Status = "Amounts Processed";

                    foreach (var citm in item.ChildPayrollItems)
                    {
                        double camt = Convert.ToDouble(GetPayrollAmount(baseamount, citm));
                        citm.Amount = System.Math.Abs(camt);
                        citm.Status = item.Status;
                    }
                    // update baseamount

                    //baseamount += amt;

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [MyExceptionHandlerAspect]

        public static void UpdatePayrollItemsBaseAmounts(List<PayrollItem> payrollItems)
        {
            var truebase = payrollItems.Where(p => p.IncomeDeduction == true && p.ParentPayrollItem == null).Sum(p => p.Amount);
            foreach (var itm in payrollItems)
            {
                itm.BaseAmount = truebase;
                itm.Amount = Math.Abs(GetPayrollAmount(itm.BaseAmount, itm).GetValueOrDefault());
            }
            
        }

        [MyExceptionHandlerAspect]
        public static double? GetPayrollAmount(double baseamount,  DataLayer.PayrollItem item)
        {
            double amt = 0;
            if (baseamount < item.PayrollSetupItem?.MiniumBaseAmount)
            {
                return null;
            }

            if (item.Amount != 0 && item.Rate == 0) //&& )
            {

                return DoAmountCalculation(amt, item);
            }
            else
            {

                return DoRateCalculation(baseamount, amt, item);
            }
           // return amt;
        }
        [MyExceptionHandlerAspect]
        private static double DoAmountCalculation(double amt, DataLayer.PayrollItem item)
        {
            if (item.IncomeDeduction == true)
            {
                amt += item.Amount;
            }
            else
            {
                amt -= item.Amount;
            }
            return amt;
        }
        [MyExceptionHandlerAspect]
        private static double? DoRateCalculation(double baseamount, double amt, DataLayer.PayrollItem item)
        {
            if (item.PayrollSetupItem.RateCeiling != null && baseamount > item.PayrollSetupItem.RateCeiling)
            {
                baseamount = (double)item.PayrollSetupItem.RateCeiling;
            }

            if (item.PayrollSetupItem.AmountFlooring != null)
            {
                baseamount -= (double)item.PayrollSetupItem.AmountFlooring;
            }

            

            if (baseamount <= 0) return null;

            item.BaseAmount = baseamount;


            if ((item.PayrollSetupItem.RateCeiling != null && item.PayrollSetupItem.RateCeilingAmount != 0) && baseamount > item.PayrollSetupItem.RateCeiling)
            {
                if (item.IncomeDeduction == true)
                {

                    amt += (double) (item.ParentPayrollItem == null?item.PayrollSetupItem.RateCeilingAmount:item.PayrollSetupItem.RateCeilingCompanyAmount);
                }
                else
                {
                    amt -= (double) (item.ParentPayrollItem == null?item.PayrollSetupItem.RateCeilingAmount : item.PayrollSetupItem.RateCeilingCompanyAmount);//item.PayrollSetupItem.RateCeilingAmount;
                }
            }
            else
            {
                if (item.Rate != 0)
                {
                    if (item.IncomeDeduction == true)
                    {
                        amt += baseamount * item.Rate;
                    }
                    else
                    {
                        amt -= baseamount * item.Rate;
                    }
                    if (item.RateRounding != null && item.RateRounding == "Up")
                    {
                        amt = Math.Round(amt, MidpointRounding.AwayFromZero);
                    }
                }
            }
            return amt;
        }

        [MyExceptionHandlerAspect]
        public static void SetupAllEmployees()
        {
            if (_currentPayrollJobType == null)
            {
                MessageBox.Show("Please Select the Payroll Job Type before processing");
                return;
            }
            foreach (var emp in db.Employees.ToList())
            {
               if( AutoSetupEmployee(emp) == false) break;
            }
            MessageBox.Show("Setup Complete");
        }

        public static bool AutoSetupEmployee(DataLayer.Employee cemp)
        {
            if (cemp == null)
            {
                MessageBox.Show("Please Select an Employee before processing");
                return false;
            }
            if (_currentPayrollJobType == null)
            {
                MessageBox.Show("Please Select the Payroll Job Type before processing");
                return false;
            }
            if (_currentSelectedPayrollSetups.Count == 0)
            {
                foreach (var item in db.PayrollSetupItems.Where(p => p.Name.Trim().ToUpper() != "Salary".ToUpper()))
                {
                    _currentSelectedPayrollSetups.Add(item);
                }
            }
            // generate salary item
            //generate NIS
            //   UpdateEmployee();

            //foreach (var item in cemp.PayrollEmployeeSetups.AsEnumerable().Where(es => es.PayrollJobType == _currentPayrollJobType).ToList())
            //{
            //    db.DeleteObject(item);
            //}

            foreach (var ea in cemp.EmployeeAccounts)
            {
                // get salary item
                var salitm = (from p in db.PayrollSetupItems
                              where p.Name.Trim().ToUpper() == "Salary".ToUpper()
                              select p).FirstOrDefault();

                if (salitm != null)
                {
                    DataLayer.PayrollEmployeeSetup nes = AutoSetupSalary(cemp, ea, salitm);
                    foreach (var ps in _currentSelectedPayrollSetups.Where(p => p.Name.Trim().ToUpper() != "Salary".ToUpper()))
                    {
                        if (AutoSetupPayrollItem(cemp, ea, nes, ps) == false) return false;
                    }

                }
                else
                {
                    System.Windows.MessageBox.Show("Please Create a 'Salary' Payroll Item");
                    return false;
                }



            }
            cemp.SetBaseAmounts();
            BaseViewModel.SaveDatabase();
            return true;
        }

      


        private static bool AutoSetupPayrollItem(DataLayer.Employee cemp, EmployeeAccount ea, DataLayer.PayrollEmployeeSetup nes, PayrollSetupItem ps)
        {
            // get NIS item
           
                
                if ((ps.Amount != null && ps.Amount != 0) && (ps.Rate != null && ps.Rate != 0))
                {
                    MessageBox.Show(string.Format("For '{0}' both Rate and Amount cannot contain Values, please delete the unused value",ps.Name));
                    return false;
                }

                DataLayer.PayrollEmployeeSetup nis = db.PayrollEmployeeSetup.FirstOrDefault(x => x.PayrollSetupItemId == ps.PayrollSetupItemId && x.EmployeeId == nes.EmployeeId && x.PayrollJobTypeId == nes.PayrollJobTypeId);

                if (nis == null)
                {
                    nis = db.PayrollEmployeeSetup.CreateObject();
                    db.PayrollEmployeeSetup.AddObject(nis);
                }

                nis.Employee = cemp;

                if (ps.Amount != null)
                {
                    nis.ChargeType = "Amount";
                    nis.Amount = ps.Amount;
                    nis.CompanyAmount = ps.CompanyAmount;
                }

                

                if (nes.Amount > ps.RateCeiling)
                {
                    nis.ChargeType = "Amount";
                    nis.Amount = ps.RateCeilingAmount;
                    nis.CompanyAmount = ps.RateCeilingCompanyAmount;
                }
                else
                {
                    nis.ChargeType = "Rate";
                    nis.Rate = Convert.ToSingle(ps.Rate);
                    nis.CompanyRate = Convert.ToSingle(ps.CompanyRate);
                }
                //nis.EmployeeAccount = ea;
                //nis.EmployeeAccountId = ea.AccountId;

                //nis.IsTaxableBenefit = ps.IsTaxableBenefit;
                //nis.ApplyToTaxableBenefits = ps.ApplyToTaxableBenefits;

               SetEmployeePayrollSetupAccounts(ea, ps, nis);

                nis.PayrollSetupItem = ps;
                nis.PayrollSetupItemId = ps.PayrollSetupItemId;
                nis.PayrollJobTypeId = _currentPayrollJobType.PayrollJobTypeId;//db.PayrollJobTypes.Where(pj => pj.Name == ps.Jobtype).FirstOrDefault().PayrollJobTypeId;

                nis.RateRounding = ps.RateRounding;

                nis.BaseAmount = nes.Amount * _currentPayrollJobType.PayPeriods;
                
                nis.StartDate = cemp.EmploymentStartDate;

                
                        
            return true;
        }
        [MyExceptionHandlerAspect]
        private static void SetEmployeePayrollSetupAccounts(EmployeeAccount ea, PayrollSetupItem ps, PayrollEmployeeSetup nis)
        {
            if (ps.IncomeDeduction == true)
            {
                nis.CreditAccount = ea;
                nis.CreditAccountId = ea.AccountId;
                nis.DebitAccount = ps.PayrollItemAccount;
                nis.DebitAccountId = ps.PayrollItemAccountId;
            }
            else
            {
                nis.CreditAccount = ps.PayrollItemAccount;
                nis.CreditAccountId = ps.PayrollItemAccountId;
                nis.DebitAccount = ea;
                nis.DebitAccountId = ea.AccountId;
            }
        }
        [MyExceptionHandlerAspect]
        private static DataLayer.PayrollEmployeeSetup AutoSetupSalary(DataLayer.Employee cemp, EmployeeAccount ea, PayrollSetupItem salitm)
        {

            DataLayer.PayrollEmployeeSetup nes = db.PayrollEmployeeSetup.FirstOrDefault(x => x.PayrollSetupItemId == salitm.PayrollSetupItemId && x.EmployeeId == cemp.EmployeeId && x.PayrollJobTypeId == _currentPayrollJobType.PayrollJobTypeId && x.CreditAccountId == ea.AccountId);
            if (nes != null)
            {
                return nes;
            }
            nes = db.PayrollEmployeeSetup.CreateObject();
            nes.Employee = cemp;
            if (ea.SalaryAssignment != null) nes.Amount = ea.SalaryAssignment;
            nes.PayrollSetupItem = salitm;
            nes.PayrollSetupItemId = salitm.PayrollSetupItemId;
            nes.ChargeType = "Amount";
            nes.StartDate = cemp.EmploymentStartDate;
            nes.PayrollEmployeeSetupId = 0;
            nes.PayrollJobTypeId = _currentPayrollJobType.PayrollJobTypeId; // db.PayrollJobTypes.Where(pj => pj.Name == "Salary").FirstOrDefault().PayrollJobTypeId;
           
            SetEmployeePayrollSetupAccounts(ea,salitm,nes);

            db.PayrollEmployeeSetup.AddObject(nes);
            return nes;
        }


        public static PayrollJobType StaticPayrollJobType
        {
            get
            {
                return _currentPayrollJobType;
            }
        }
    }

}
