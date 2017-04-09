using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PayrollManager.DataLayer
{
    public partial class Employee
    {
        public Employee()
        {
            this.EmploymentStartDate = DateTime.Now;
            BaseViewModel.staticPropertyChanged += BaseViewModel_staticPropertyChanged;

        }

        void BaseViewModel_staticPropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "PayrollItems")
            {
                OnPropertyChanged("TotalIncome");
                OnPropertyChanged("TotalDeductions");
                OnPropertyChanged("NetAmount");
            }

            if (e.PropertyName == "PayrollEmployeeSetups")
            {
               
                OnPropertyChanged("PreTotalIncome");
                OnPropertyChanged("PreTotalDeductions");
                OnPropertyChanged("PreNetAmount");
            }
            //if (e.PropertyName == "AddToBaseAmount")
            //{
            //    SetBaseAmounts();

            //    OnPropertyChanged("PreTotalIncome");
            //    OnPropertyChanged("PreTotalDeductions");
            //    OnPropertyChanged("PreNetAmount");

            //    OnPropertyChanged("TotalIncome");
            //    OnPropertyChanged("TotalDeductions");
            //    OnPropertyChanged("NetAmount");
            //}
        }

        public void SetBaseAmounts()
        {

            var plist = from p in this.PayrollEmployeeSetups.Where(p => (p.BaseAmount != (p.PayrollSetupItem.ApplyToTaxableBenefits == true ? Salary + TaxableBenefitsTotal : Salary) || p.BaseAmount == null))//
                        select p;

            if (plist.Count() > 0)
            {
                foreach (var item in plist)
                {
                    item.BaseAmount = (item.PayrollSetupItem.ApplyToTaxableBenefits == true ? Salary + TaxableBenefitsTotal : Salary);
                }
                BaseViewModel.OnStaticPropertyChanged("PayrollEmployeeSetups");
            }
        }

        public double Salary
        {
            get
            {
                return this.PayrollEmployeeSetups.Where(p => p.PayrollSetupItem != null && p.PayrollSetupItem.IncomeDeduction == true && p.PayrollSetupItem.Name == "Salary").Sum(p => p.CalcAmount);//&& p.PayrollJobType == BaseViewModel.StaticPayrollJobType
            }
        }

        public double TaxableBenefitsTotal
        {
            get
            {
                return this.PayrollEmployeeSetups.Where(p => p.PayrollSetupItem != null && p.PayrollSetupItem.IncomeDeduction == true && p.PayrollSetupItem.IsTaxableBenefit == true).Sum(p => p.CalcAmount);//&& p.PayrollJobType == BaseViewModel.StaticPayrollJobType
            }
        }


        public string DisplayName
        {
            get
            {
                return String.Format("{0} {1}", FirstName, LastName);
            }
        }
        public double TotalIncome
        {
            get
            {
                if (BaseViewModel.StaticPayrollJob == null) return 0;
                return  PayrollItems.Where(p => p.IncomeDeduction == true && p.ParentPayrollItem == null && p.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId).Sum(p => p.Amount);
            }
        }

        public double TotalDeductions
        {
            get
            {
                if (BaseViewModel.StaticPayrollJob == null) return 0;
                return PayrollItems.Where(p => p.IncomeDeduction == false && p.ParentPayrollItem == null && p.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId).Sum(p => p.Amount);
            }
        }

        public double NetAmount
        {
            get
            {
                return TotalIncome - TotalDeductions;
            }
        }


        public double? PreTotalIncome
        {
            get
            {
                
                if (BaseViewModel.StaticPayrollJobType == null) return 0;
                double amt =  this.PayrollEmployeeSetups.Where(p => p.PayrollSetupItem != null && p.PayrollSetupItem.IncomeDeduction == true && p.PayrollJobType != null && p.PayrollJobType == BaseViewModel.StaticPayrollJobType).Sum(p => p.CalcAmount);
                
                return amt ;
            }
        }

        public double? PreTotalDeductions
        {
            get
            {

                if (BaseViewModel.StaticPayrollJobType == null) return 0;
                var plist = PayrollEmployeeSetups.Where(p => p.PayrollSetupItem != null && p.PayrollSetupItem.IncomeDeduction == false &&  p.PayrollJobType == BaseViewModel.StaticPayrollJobType);
                return plist.Sum(p => p.CalcAmount) * -1;
            }
        }

        public double? PreNetAmount
        {
            get
            {
                return PreTotalIncome - PreTotalDeductions;
            }
        }
        
    }
}
