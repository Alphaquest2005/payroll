using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Windows;
using System.Linq;

namespace PayrollManager
{
	public class PayrollJobModel : BaseViewModel
	{
        public PayrollJobModel()
        {

        }

        public void SavePayrollJob()
        {
            BaseViewModel.SaveDatabase();
            base.CurrentPayrollJob = _newPayrollJob;
            _newPayrollJob = null;
            OnStaticPropertyChanged("CurrentPayrollJob");
            OnStaticPropertyChanged("PayrollJobs");
        }

        public void DeletePayrollJob()
        {
            var res = MessageBox.Show("Are you sure you want to Delete this payroll Job? Have you checked all 'One Off' Payroll items?", "Delete Payroll Job", MessageBoxButton.YesNo);
            if (res == MessageBoxResult.No) return;


            db.PayrollJobs.DeleteObject(CurrentPayrollJob);
            // db.PayrollItems.Detach(CurrentPayrollItem);


            SaveDatabase();
            CurrentPayrollJob = null;
            OnStaticPropertyChanged("CurrentPayrollJob");
            OnStaticPropertyChanged("PayrollJobs");
        }

        public void NewPayrollJob()
        {
            DataLayer.PayrollJob newemp = BaseViewModel.db.PayrollJobs.CreateObject<DataLayer.PayrollJob>();
            db.PayrollJobs.AddObject(newemp);
            _newPayrollJob = newemp;
            _newPayrollJob.Branch = CurrentBranch;
            _newPayrollJob.PayrollJobType = db.PayrollJobTypes.FirstOrDefault();
            _newPayrollJob.StartDate = DateTime.Now;
            _newPayrollJob.EndDate = DateTime.Now;
            _newPayrollJob.PaymentDate = DateTime.Now;
            _newPayrollJob.PreparedBy = System.Security.Principal.WindowsIdentity.GetCurrent().Name;//((App)App.Current).CurrentUser.EmployeeId;
            _newPayrollJob.Status = "Open";
            OnPropertyChanged("CurrentPayrollJob");
        }

        DataLayer.PayrollJob  _newPayrollJob;
        public override DataLayer.PayrollJob CurrentPayrollJob
        {
            get
            {
                if (_newPayrollJob == null)
                {
                    return base.CurrentPayrollJob;
                }
                else
                {
                    return _newPayrollJob;
                }
            }
            set
            {
                base.CurrentPayrollJob = value;
            }
        }



        //public void CreatePayrollJob()
        //{
        //    DataLayer.PayrollJob job = new DataLayer.PayrollJob();
        //    if (this.StartDate != null && this.EndDate != null)
        //    {

        //        job.StartDate = this.StartDate;
        //        job.EndDate = this.EndDate;
        //        job.PreparedBy = ((App)App.Current).CurrentUser.PayrollJobId;
                
        //        job.PayrollJobTypeId = PayrollJobTypeId;


        //        db.PayrollJobs.AddObject(job);
        //       // PayrollJobs.AddNewItem(job);
        //        OnStaticPropertyChanged("PayrollJobs");
        //        SaveDatabase();
        //    }
        //    else
        //    {
        //        MessageBox.Show("Please enter Start Date and EndDate");
        //    }

        //}



	
	}
}