using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Linq;

namespace PayrollManager
{
	public class EmployeePayrollItemsListModel:  BaseViewModel
	{
		public EmployeePayrollItemsListModel()
		{
            staticPropertyChanged += EmployeePayrollItemsListModel_PropertyChanged;
           
        
		}

        private void EmployeePayrollItemsListModel_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if ((e.PropertyName == "CurrentEmployee" || e.PropertyName == "CurrentBranch" || e.PropertyName == "PayrollItems" || e.PropertyName == "CurrentPayrollJob") && CurrentEmployee != null && CurrentBranch != null && CurrentPayrollJob != null)
            {
                var lst = from p in db.PayrollItems.AsEnumerable()
                          where p.EmployeeId == CurrentEmployee.EmployeeId && p.PayrollJobId == CurrentPayrollJob.PayrollJobId && p.PayrollJob.Branch != null && p.PayrollJob.Branch.BranchId == BaseViewModel.StaticCurrentBranch.BranchId
                          select p;
                if (lst.Count() > 0)
                {
                    PayrollItemList = new ObservableCollection<DataLayer.PayrollItem>(lst);
                }
                else
                {
                    PayrollItemList = null;
                }
                OnPropertyChanged("PayrollItemList");
            }
            if (CurrentEmployee == null)
            {
                PayrollItemList = null;
            }

        }

        ObservableCollection<DataLayer.PayrollItem> _payrollItemList;
        public ObservableCollection<DataLayer.PayrollItem> PayrollItemList
        {
            get
            {
                return _payrollItemList;
            }
            set
            {
                _payrollItemList = value;
                OnPropertyChanged("PayrollItemList");
                
            }
        }
        
	}
}