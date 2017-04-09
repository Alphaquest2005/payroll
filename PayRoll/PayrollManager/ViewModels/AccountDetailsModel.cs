using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;

namespace PayrollManager
{
	public class AccountDetailsModel : BaseViewModel
	{
		public AccountDetailsModel()
		{
           
		}

        public void SaveInstitutionAccount()
        {



            SaveDatabase();
            base.CurrentInstitutionAccount = _newInstitutionAccount;
           _newInstitutionAccount = null;
            
           
            OnStaticPropertyChanged("CurrentInstitutionAccount");
            _institutionAccounts = null;
            OnStaticPropertyChanged("InstitutionAccounts");

        }






        public void EditAccount(DataLayer.InstitutionAccount acc)
        {
            CurrentInstitutionAccount = acc;
        }

        public void DeleteInstitionAccount()
        {
            db.Accounts.DeleteObject(CurrentInstitutionAccount);
            // db.PayrollItems.Detach(CurrentPayrollItem);


            SaveDatabase();
            CurrentInstitutionAccount = null;

        }

        


       

        public void NewInstitutionAccount()
        {
            DataLayer.InstitutionAccount newemp = BaseViewModel.db.Accounts.CreateObject<DataLayer.InstitutionAccount>();
            db.Accounts.AddObject(newemp);
            
            _newInstitutionAccount = newemp;
            OnPropertyChanged("CurrentInstitutionAccount");
        }


        DataLayer.InstitutionAccount _newInstitutionAccount;
        public override DataLayer.InstitutionAccount CurrentInstitutionAccount
        {
            get
            {
                if (_newInstitutionAccount == null)
                {
                    return base.CurrentInstitutionAccount;
                }
                else
                {
                    return _newInstitutionAccount;
                }
            }
            set
            {
                base.CurrentInstitutionAccount = value;
                _institutionAccounts = null;
                OnStaticPropertyChanged("InstitutionAccounts");
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