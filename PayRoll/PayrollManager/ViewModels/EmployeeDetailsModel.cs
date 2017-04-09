using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using System.Windows;

namespace PayrollManager
{
	public class EmployeeDetailsModel : BaseViewModel
	{
		public EmployeeDetailsModel()
		{
			
		}

        public void SaveEmployee()
        {
            BaseViewModel.SaveDatabase();
           // if(base.CurrentEmployee != null)base.CurrentEmployee.SetBaseAmounts();
            base.CurrentEmployee = _newEmployee;
            if (base.CurrentEmployee != null) base.CurrentEmployee.SetBaseAmounts();
            _newEmployee = null;
            OnStaticPropertyChanged("CurrentEmployee");
            OnStaticPropertyChanged("Employees");


        }

        public void UpdateEmployee()
        {
            BaseViewModel.SaveDatabase();
            if(base.CurrentEmployee != null)  base.CurrentEmployee.SetBaseAmounts();
            OnStaticPropertyChanged("CurrentEmployee");
            OnStaticPropertyChanged("Employees");


        }

        public void EmployeeAutoSetup()
        {
            UpdateEmployee();
            if (base.CurrentEmployee != null) AutoSetupEmployee(CurrentEmployee);
           
            MessageBox.Show("Setup Complete");
        }

        public void DeleteEmployee()
        {
            if (base.CurrentEmployee == null) MessageBox.Show("Please select an employee"); 
            if (CurrentEmployee.EntityState != System.Data.EntityState.Detached  && CurrentEmployee.EntityState != System.Data.EntityState.Deleted)
            {
                db.Employees.DeleteObject(CurrentEmployee);
                SaveDatabase();
            }
            CurrentEmployee = null;
            OnStaticPropertyChanged("CurrentEmployee");
            OnStaticPropertyChanged("Employees");
        }

        public void NewEmployee()
        {
            DataLayer.Employee newemp = BaseViewModel.db.Employees.CreateObject<DataLayer.Employee>();
            db.Employees.AddObject(newemp);
            _newEmployee = newemp;
            OnPropertyChanged("CurrentEmployee");
        }

        DataLayer.Employee  _newEmployee;
        public override DataLayer.Employee CurrentEmployee
        {
            get
            {
                if (_newEmployee == null)
                {
                    return base.CurrentEmployee;
                }
                else
                {
                    return _newEmployee;
                }
            }
            set
            {
                base.CurrentEmployee = value;
                OnStaticPropertyChanged("CurrentEmployee");
                OnStaticPropertyChanged("Employees");
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

        internal void DeleteEmployeeAccount(DataLayer.EmployeeAccount p)
        {
            db.Accounts.DeleteObject(p);
            OnStaticPropertyChanged("CurrentEmployee");
            OnStaticPropertyChanged("EmployeeAccounts");
        }

        internal void EditAccount(DataLayer.Account a)
        {
            CurrentAccount = a;
        }

      
    }
}