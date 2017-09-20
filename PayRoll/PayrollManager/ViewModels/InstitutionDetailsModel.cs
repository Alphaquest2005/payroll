using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using PayrollManager.DataLayer;

namespace PayrollManager
{
	public class InstitutionDetailsModel : BaseViewModel
	{
        public InstitutionDetailsModel()
		{
           
		}

        public void SaveInstitution()
        {

            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.Institutions.Attach(_newInstitution);
                ctx.Institutions.ApplyCurrentValues(_newInstitution);
                SaveDatabase(ctx);
            }
            base.CurrentInstitution = _newInstitution;
           _newInstitution = null;
            
           
            OnStaticPropertyChanged("CurrentInstitutionAccount");
            _institutionAccounts = null;
            OnStaticPropertyChanged("InstitutionAccounts");

        }






        public void EditAccount(DataLayer.Institution acc)
        {
            CurrentInstitution = acc;
        }

        public void DeleteInstition()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.Institutions.DeleteObject(CurrentInstitution);
                // db.PayrollItems.Detach(CurrentPayrollItem);
                SaveDatabase(ctx);
            }
            CurrentInstitution = null;

        }

        


       

        public void NewInstitution()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                DataLayer.Institution newemp = ctx.Institutions.CreateObject();
                ctx.Institutions.AddObject(newemp);

                _newInstitution = newemp;
            }
            OnPropertyChanged("CurrentInstitution");
        }


        DataLayer.Institution _newInstitution;
        public DataLayer.Institution CurrentInstitution
        {
            get
            {
                if (_newInstitution == null)
                {
                    return base.CurrentInstitution;
                }
                else
                {
                    return _newInstitution;
                }
            }
            set
            {
                base.CurrentInstitution = value;
                _institutions = null;
                OnStaticPropertyChanged("Institutions");
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