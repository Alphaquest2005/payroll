using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Windows;
using System.Linq;
using PayrollManager.DataLayer;

namespace PayrollManager
{
	public class PayrollJobModel : BaseViewModel
	{
        public PayrollJobModel()
        {

        }

        public void SavePayrollJob()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.PayrollJobs.ApplyCurrentValues(CurrentPayrollJob);
                BaseViewModel.SaveDatabase(ctx);
                OnStaticPropertyChanged("CurrentPayrollJob");
                OnStaticPropertyChanged("PayrollJobs");
            }
        }

        public void DeletePayrollJob()
        {
            var res = MessageBox.Show("Are you sure you want to Delete this payroll Job? Have you checked all 'One Off' Payroll items?", "Delete Payroll Job", MessageBoxButton.YesNo);
            if (res == MessageBoxResult.No) return;

            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.PayrollJobs.DeleteObject(CurrentPayrollJob);
                // db.PayrollItems.Detach(CurrentPayrollItem);


                SaveDatabase(ctx);
                CurrentPayrollJob = null;
                OnStaticPropertyChanged("CurrentPayrollJob");
                OnStaticPropertyChanged("PayrollJobs");
            }
        }

        public void NewPayrollJob()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                DataLayer.PayrollJob newemp = ctx.PayrollJobs.CreateObject<DataLayer.PayrollJob>();
                ctx.PayrollJobs.AddObject(newemp);
                
                newemp.Branch = CurrentBranch;
                newemp.PayrollJobType = ctx.PayrollJobTypes.FirstOrDefault();
                newemp.StartDate = DateTime.Now;
                newemp.EndDate = DateTime.Now;
                newemp.PaymentDate = DateTime.Now;
                newemp.PreparedBy =
                    System.Security.Principal.WindowsIdentity.GetCurrent()
                        .Name; //((App)App.Current).CurrentUser.EmployeeId;
                newemp.Status = "Open";
                CurrentPayrollJob = newemp;
                OnPropertyChanged("CurrentPayrollJob");
                SaveDatabase(ctx);
            }
        }

	
	}
}