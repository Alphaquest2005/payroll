using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using System.Collections.ObjectModel;
using System.Diagnostics;
using EmailLogger;
using PayrollManager.DataLayer;

namespace PayrollManager
{
    public class PayrollItemDetailsModel : BaseViewModel
    {
        public PayrollItemDetailsModel()
        {
            staticPropertyChanged += PayrollItemDetailsModel_staticPropertyChanged;


        }

        void PayrollItemDetailsModel_staticPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            OnPropertyChanged(e.PropertyName);
            Debug.WriteLine(e.PropertyName);
            if ((e.PropertyName.Contains("Account") && e.PropertyName != "CurrentAccountsLst") || (e.PropertyName == "CurrentEmployee") )
            {
                OnStaticPropertyChanged("CurrentAccountsLst");
            }
            if (e.PropertyName == nameof(CurrentEmployee))
            {
                using (var ctx = new PayrollDB())
                {
                    CurrentPayrollItems =  ctx.PayrollItems.Where(x => x.EmployeeId == CurrentEmployee.EmployeeId).ToList();
                }
            }
        }

        public void SavePayrollItem()
        {
            UpdatePayrollItemsBaseAmounts(CurrentPayrollItems, new PayrollDB());
           // BaseViewModel.SaveDatabase();

            base.CurrentPayrollItem = _newPayrollItem;
            _newPayrollItem = null;
            
            OnStaticPropertyChanged("CurrentPayrollJob");
            OnStaticPropertyChanged("PayrollItems");
            OnStaticPropertyChanged("Employees");
            OnStaticPropertyChanged("CurrentPayrollItem");
        }

        public List<PayrollItem> CurrentPayrollItems { get; set; }

        public void DeletePayrollItem()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                if (CurrentPayrollItem != null && CurrentPayrollItem.EntityState != System.Data.EntityState.Detached)
                {
                    foreach (var item in ctx.AccountEntries.Where(x => x.PayrollItemId == CurrentPayrollItem.PayrollItemId).ToList())
                    {
                        ctx.AccountEntries.DeleteObject(item);
                    }
                    ctx.PayrollItems.DeleteObject(CurrentPayrollItem);
                    CurrentPayrollItems = ctx.PayrollItems.Where(x => x.EmployeeId == CurrentEmployee.EmployeeId)
                        .ToList();
                    UpdatePayrollItemsBaseAmounts(CurrentPayrollItems, ctx);
                    SaveDatabase(ctx);
                }
                CurrentPayrollItem = null;
                OnStaticPropertyChanged("CurrentPayrollJob");
                OnStaticPropertyChanged("PayrollItems");
                OnStaticPropertyChanged("Employees");
                OnStaticPropertyChanged("CurrentPayrollItem");
            }
        }

        //[MyExceptionHandlerAspect]

        public static void UpdatePayrollItemsBaseAmounts(List<PayrollItem> payrollItems, PayrollDB ctx)
        {
           
                var truebase = payrollItems.Where(p => p.IncomeDeduction == true && p.ParentPayrollItem == null)
                    .Sum(p => p.Amount);
                foreach (var itm in payrollItems)
                {

                    itm.BaseAmount = truebase;
                    itm.Amount = Math.Abs(GetPayrollAmount(itm.BaseAmount, itm).GetValueOrDefault());
                    var dbItm = ctx.PayrollItems.First(x => x.PayrollItemId == itm.PayrollItemId);
                    dbItm.BaseAmount = itm.BaseAmount;
                    dbItm.Amount = itm.Amount;
                }
          
        }

        public void NewPayrollItem()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                DataLayer.PayrollItem newpi = ctx.PayrollItems.CreateObject();
                ctx.PayrollItems.AddObject(newpi);
                newpi.Status = "Amounts Processed";
                _newPayrollItem = newpi;

                OnPropertyChanged("CurrentPayrollItem");
                SaveDatabase(ctx);
            }
        }

        DataLayer.PayrollItem _newPayrollItem;
       public override  DataLayer.PayrollItem CurrentPayrollItem
        {
            get
            {
                if (_newPayrollItem == null)
                {
                    return base.CurrentPayrollItem;
                }
                else
                {
                    return _newPayrollItem;
                }
            }
            set
            {
                base.CurrentPayrollItem = value;
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