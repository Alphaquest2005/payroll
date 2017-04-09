using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace PayrollManager
{
   public class EmployeePayStubModel : BaseViewModel
    {

       public EmployeePayStubModel()
       {
           staticPropertyChanged +=EmployeePayStubModel_staticPropertyChanged;
       }

       private void EmployeePayStubModel_staticPropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
       {
           if (e.PropertyName == "CurrentEmployee")
           {
              OnStaticPropertyChanged("IncomePayrollLineItems");
              OnStaticPropertyChanged("DeductionPayrollLineItems");
           }
       }

       public double CurrentIncome
       {
           get
           {
               //return db.AccountEntries.Where(ae => ae.IncomeDeduction == true && ae.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId && ae.PayrollItem.Employee == CurrentEmployee).Sum(ae => ae.Total);
               return CurrentIncomeAccountEntries.Sum(ae => ae.Total);
           }
       }

       public ObservableCollection<DataLayer.AccountEntry> CurrentIncomeAccountEntries
       {
           get
           {
               return new ObservableCollection<DataLayer.AccountEntry>(db.AccountEntries.Where(ae => ae.IncomeDeduction == true && ae.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId && ae.PayrollItem.Employee == CurrentEmployee));
           }
       }

       public ObservableCollection<DataLayer.AccountEntry> YearsIncomeAccountEntries
       {
           get
           {
               return new ObservableCollection<DataLayer.AccountEntry>(db.AccountEntries.Where(ae => ae.IncomeDeduction == true && (ae.PayrollItem.PayrollJob.EndDate.Year == BaseViewModel.StaticPayrollJob.EndDate.Year && ae.PayrollItem.PayrollJob.EndDate <= BaseViewModel.StaticPayrollJob.EndDate.AddHours(23)) && ae.PayrollItem.Employee == CurrentEmployee));
           }
       }

       public ObservableCollection<DataLayer.AccountEntry> YearsDeductionAccountEntries
       {
           get
           {
               return new ObservableCollection<DataLayer.AccountEntry>(db.AccountEntries.Where(ae => ae.IncomeDeduction == false && (ae.PayrollItem.PayrollJob.EndDate.Year == BaseViewModel.StaticPayrollJob.EndDate.Year && ae.PayrollItem.PayrollJob.EndDate <= BaseViewModel.StaticPayrollJob.EndDate.AddHours(23)) && ae.PayrollItem.Employee == CurrentEmployee));
           }
       }

       public double YearsIncome
       {
           get
           {
               return YearsIncomeAccountEntries.Sum(ae => ae.Total);
           }
       }

       public class PayrollSummaryLineItem
       {
         public string LineItemDescription{get;set;}
         public  double CurrentAmount{get;set;}
         public  double YearAmount{get;set;}
       }
       
       public IEnumerable<PayrollSummaryLineItem> IncomePayrollLineItems
       {
           get
           {
               if (BaseViewModel.StaticPayrollJob == null) return null;
               var lst = from p in db.AccountEntries.AsEnumerable()
                         where p.IncomeDeduction == true && (p.PayrollItem.PayrollJob.EndDate.Year == BaseViewModel.StaticPayrollJob.EndDate.Year && p.PayrollItem.PayrollJob.EndDate <= BaseViewModel.StaticPayrollJob.EndDate.AddHours(23)) && p.PayrollItem.Employee == CurrentEmployee && p.PayrollItem.ParentPayrollItem == null
                         group p by p.PayrollItem.Name into pname
                         select new PayrollSummaryLineItem
                         {
                             LineItemDescription = pname.Key,
                             CurrentAmount = pname.Where(z => z.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId).Sum(z => z.CreditAmount),
                             YearAmount = pname.Sum(z => z.CreditAmount)
                         };
               List<PayrollSummaryLineItem> f = new List<PayrollSummaryLineItem>(lst.ToList());
               f.Add(new PayrollSummaryLineItem() { LineItemDescription = "Total", CurrentAmount = lst.Sum(p => p.CurrentAmount), YearAmount = lst.Sum(p => p.YearAmount) });

               return f;
           }
       }
       
       public IEnumerable<PayrollSummaryLineItem> DeductionPayrollLineItems
       {
           get
           {
               if (BaseViewModel.StaticPayrollJob == null) return null;
               var lst = from p in db.AccountEntries.AsEnumerable()
                         where p.IncomeDeduction == false && (p.PayrollItem.PayrollJob.EndDate.Year == BaseViewModel.StaticPayrollJob.EndDate.Year && p.PayrollItem.PayrollJob.EndDate <= BaseViewModel.StaticPayrollJob.EndDate.AddHours(23)) && p.PayrollItem.Employee == CurrentEmployee && p.PayrollItem.ParentPayrollItem == null
                         group p by p.PayrollItem.Name into pname
                         select new PayrollSummaryLineItem
                         {
                             LineItemDescription = pname.Key,
                             CurrentAmount = pname.Where(z => z.PayrollItem.PayrollJobId == BaseViewModel.StaticPayrollJob.PayrollJobId).Sum(z => z.DebitAmount),
                             YearAmount = pname.Sum(z =>  z.DebitAmount)
                         };
               List<PayrollSummaryLineItem> f = new List<PayrollSummaryLineItem>(lst.ToList());
               f.Add(new PayrollSummaryLineItem() { LineItemDescription = "Total", CurrentAmount = lst.Sum(p => p.CurrentAmount), YearAmount = lst.Sum(p => p.YearAmount) });
               return f;
           }
       }


       internal void EmailReport(ref Grid rpt)
       {
           DataLayer.EmailTemplate etmp = db.EmailTemplate.Where(et => et.Key == "EmployeePayStub").FirstOrDefault();
           if (CurrentEmployee.EmailAddress == null)
           {
               MessageBox.Show("Please add employee's email address before proceding");
               return;
           }
           if (etmp != null)
           {
               string pdffile = WPF2PDF.CreatePDF(ref rpt, StaticCurrentEmployee.DisplayName.Replace(" ","-") + "-" + "PayStub");

               MyOutlook.Mail.CreateDraft(etmp.FromEmailAddress, etmp.Subject, etmp.EmailBody, CurrentEmployee.EmailAddress, pdffile);
           }
           else
           {
               MessageBox.Show("No email template found");
                   return;
           }
           
       }


    }
}
