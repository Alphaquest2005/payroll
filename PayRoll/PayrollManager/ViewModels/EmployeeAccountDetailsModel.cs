using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;

namespace PayrollManager
{
	public class EmployeeAccountDetailsModel : BaseViewModel
	{
        public EmployeeAccountDetailsModel()
		{
           
		}

        ListCollectionView _EmployeeAccountTypes = new ListCollectionView(db.AccountTypes.ToList());
        public ListCollectionView EmployeeAccountTypes
        {
            get
            {

                return _EmployeeAccountTypes;


            }
        }
       

        public void SaveEmployeeAccount()
        {



            SaveDatabase();
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
            if (CurrentEmployeeAccount == null) return;
            db.Accounts.DeleteObject(CurrentEmployeeAccount);
            // db.PayrollItems.Detach(CurrentPayrollItem);


            SaveDatabase();
            CurrentEmployeeAccount = null;

        }


        public void NewEmployeeAccount()
        {
            DataLayer.EmployeeAccount newemp = BaseViewModel.db.Accounts.CreateObject<DataLayer.EmployeeAccount>();
            db.Accounts.AddObject(newemp);
            _newEmployeeAccount = newemp;
            OnPropertyChanged("CurrentEmployeeAccount");
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