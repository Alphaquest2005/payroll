using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;

namespace PayrollManager
{
	public class InstitutionDetailsModel : BaseViewModel
	{
        public InstitutionDetailsModel()
		{
           
		}

        public void SaveInstitution()
        {



            SaveDatabase();
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
            db.Institutions.DeleteObject(CurrentInstitution);
            // db.PayrollItems.Detach(CurrentPayrollItem);


            SaveDatabase();
            CurrentInstitution = null;

        }

        


       

        public void NewInstitution()
        {
            DataLayer.Institution newemp = db.Institutions.CreateObject();
           db.Institutions.AddObject(newemp);
            
            _newInstitution = newemp;
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