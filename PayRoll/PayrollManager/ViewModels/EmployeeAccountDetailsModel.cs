using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using PayrollManager.DataLayer;

namespace PayrollManager
{
	public class EmployeeAccountDetailsModel : BaseViewModel
	{
        public EmployeeAccountDetailsModel()
		{
		    using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
		    {
		        _employeeAccountTypes = new ListCollectionView(ctx.AccountTypes.ToList());
		    }

		}

	    private readonly ListCollectionView _employeeAccountTypes;
        public ListCollectionView EmployeeAccountTypes => _employeeAccountTypes;


	    public void SaveEmployeeAccount()
        {



           // SaveDatabase(ctx);
            base.CurrentAccount = _newEmployeeAccount;
            _newEmployeeAccount = null;


            OnStaticPropertyChanged("CurrentEmployeeAccount");
            OnStaticPropertyChanged("EmployeeAccounts");

        }

    

      
        public void EditAccount(DataLayer.Account acc)
        {
            CurrentAccount = acc;
        }

     

        public void DeleteEmployeeAccount()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                if (CurrentEmployeeAccount == null) return;
                ctx.Accounts.DeleteObject(CurrentEmployeeAccount);
                // db.PayrollItems.Detach(CurrentPayrollItem);


                SaveDatabase(ctx);
                CurrentEmployeeAccount = null;
            }
        }


        public void NewEmployeeAccount()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                DataLayer.EmployeeAccount newemp = ctx.Accounts.CreateObject<DataLayer.EmployeeAccount>();
                ctx.Accounts.AddObject(newemp);
                _newEmployeeAccount = newemp;
                OnPropertyChanged("CurrentEmployeeAccount");
            }
        }

        

        DataLayer.EmployeeAccount  _newEmployeeAccount;
        public override DataLayer.EmployeeAccount CurrentEmployeeAccount
        {
            get
            {
                if (_newEmployeeAccount == null)
                {
                    return base.CurrentEmployeeAccount;
                }
                else
                {
                    return _newEmployeeAccount;
                }
            }
            set
            {
                base.CurrentEmployeeAccount = value;
                OnStaticPropertyChanged("EmployeeAccounts");
            }
        }

		#region INotifyPropertyChanged
		public event PropertyChangedEventHandler PropertyChanged;

		private void NotifyPropertyChanged(String info)
		{
			if (PropertyChanged != null)
			{
				PropertyChanged(this, new PropertyChangedEventArgs(info));
			}
		}
		#endregion
	}
}