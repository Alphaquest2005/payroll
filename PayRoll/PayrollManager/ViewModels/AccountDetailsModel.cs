using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using PayrollManager.DataLayer;

namespace PayrollManager
{
	public class AccountDetailsModel : BaseViewModel
	{
		public AccountDetailsModel()
		{
           
		}

        public void SaveInstitutionAccount()
        {


            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.Accounts.Attach(_newInstitutionAccount);
                ctx.Accounts.ApplyCurrentValues(_newInstitutionAccount);
                SaveDatabase(ctx);
            }
            base.CurrentInstitutionAccount = _newInstitutionAccount;
           _newInstitutionAccount = null;
            
           
            OnStaticPropertyChanged("CurrentInstitutionAccount");
            CycleInstitutionAccounts();
            OnStaticPropertyChanged("InstitutionAccounts");

        }






        public void EditAccount(DataLayer.InstitutionAccount acc)
        {
            CurrentInstitutionAccount = acc;
        }

        public void DeleteInstitionAccount()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.Accounts.DeleteObject(CurrentInstitutionAccount);
                // db.PayrollItems.Detach(CurrentPayrollItem);


                SaveDatabase(ctx);
                CurrentInstitutionAccount = null;
            }
        }

        


       

        public void NewInstitutionAccount()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                DataLayer.InstitutionAccount newemp =
                    ctx.Accounts.CreateObject<DataLayer.InstitutionAccount>();
                ctx.Accounts.AddObject(newemp);

                _newInstitutionAccount = newemp;
                OnPropertyChanged("CurrentInstitutionAccount");
            }
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
                CycleInstitutionAccounts();
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