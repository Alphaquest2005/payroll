using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using System.Windows;
using PayrollManager.DataLayer;

namespace PayrollManager
{
	public class EmployeeDetailsModel : BaseViewModel
	{
		public EmployeeDetailsModel()
		{
			
		}

        public void SaveEmployee()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.Employees.ApplyCurrentValues(_newEmployee);
                SaveDatabase(ctx);
            }
            // if(base.CurrentEmployee != null)base.CurrentEmployee.SetBaseAmounts();
            base.CurrentEmployee = _newEmployee;
            if (base.CurrentEmployee != null) base.CurrentEmployee.SetBaseAmounts();
            _newEmployee = null;
            OnStaticPropertyChanged("CurrentEmployee");
            OnStaticPropertyChanged("Employees");


        }

        public void UpdateEmployee()
        {
            if (base.CurrentEmployee != null)  
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.Employees.ApplyCurrentValues(CurrentEmployee);
                base.CurrentEmployee.SetBaseAmounts();
                BaseViewModel.SaveDatabase(ctx);
            }
           
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
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                if (base.CurrentEmployee == null) MessageBox.Show("Please select an employee");
                if (CurrentEmployee.EntityState != System.Data.EntityState.Detached &&
                    CurrentEmployee.EntityState != System.Data.EntityState.Deleted)
                {
                    ctx.Employees.DeleteObject(CurrentEmployee);
                    SaveDatabase(ctx);
                }
                CurrentEmployee = null;
                OnStaticPropertyChanged("CurrentEmployee");
                OnStaticPropertyChanged("Employees");
            }
        }

        public void NewEmployee()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                DataLayer.Employee newemp = ctx.Employees.CreateObject<DataLayer.Employee>();
               ctx.Employees.AddObject(newemp);
                _newEmployee = newemp;
                OnPropertyChanged("CurrentEmployee");
            }
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
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.Accounts.DeleteObject(p);
                OnStaticPropertyChanged("CurrentEmployee");
                OnStaticPropertyChanged("EmployeeAccounts");
            }
        }

        internal void EditAccount(DataLayer.Account a)
        {
            CurrentAccount = a;
        }

      
    }
}