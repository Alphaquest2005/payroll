using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Linq;

namespace PayrollManager
{
	public class EmployeeSummaryListModel : BaseViewModel
	{
		public EmployeeSummaryListModel()
		{
            staticPropertyChanged +=EmployeeSummaryListModel_staticPropertyChanged;
		}

        private void EmployeeSummaryListModel_staticPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "CurrentBranch" && CurrentBranch!= null || e.PropertyName == "Employees" )
            {
                if (CurrentBranch == null)
                {
                    Employees = new ObservableCollection<DataLayer.Employee>(db.Employees.AsEnumerable().Where(x => x.EmploymentEndDate.HasValue == false || x.EmploymentEndDate.Value.Date >= DateTime.Now.Date).OrderBy(x => x.LastName));
                }
                else
                {
                    if (EmployeeFilter == null) EmployeeFilter = "";
                    Employees = new ObservableCollection<DataLayer.Employee>(db.Employees.AsEnumerable().Where(x => x.EmploymentEndDate.HasValue == false || x.EmploymentEndDate.Value.Date >= DateTime.Now.Date).AsEnumerable().Where(emp => emp.BranchId == CurrentBranch.BranchId && emp.DisplayName.ToUpper().Contains(EmployeeFilter.ToUpper()) == true).OrderBy(x => x.LastName));
                }
            }

            if (e.PropertyName == "CurrentPayrollJob")
            {
                OnStaticPropertyChanged("Employees");
            }
        }

        string _employeeFilter ;
        public string EmployeeFilter
        {
            get
            {
                return _employeeFilter;
            }
            set
            {
                _employeeFilter = value;
                OnStaticPropertyChanged("Employees");
            }
        }

        ObservableCollection<DataLayer.Employee> _employeelist = new ObservableCollection<DataLayer.Employee>(db.Employees.AsEnumerable().Where(x => x.EmploymentEndDate.HasValue == false || x.EmploymentEndDate.Value.Date >= DateTime.Now.Date));
        public new ObservableCollection<DataLayer.Employee> Employees
        {
            get
            {
                return _employeelist;
            }
            set
            {
                _employeelist = value;
                OnPropertyChanged("Employees");
            }
        }


	
	}
}