using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using System.Collections.ObjectModel;
using System.Diagnostics;

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
        }

        public void SavePayrollItem()
        {
            UpdatePayrollItemsBaseAmounts(CurrentEmployee.CurrentPayrollItems);
            BaseViewModel.SaveDatabase();

            base.CurrentPayrollItem = _newPayrollItem;
            _newPayrollItem = null;
            
            OnStaticPropertyChanged("CurrentPayrollJob");
            OnStaticPropertyChanged("PayrollItems");
            OnStaticPropertyChanged("Employees");
            OnStaticPropertyChanged("CurrentPayrollItem");
        }

        public void DeletePayrollItem()
        {

            if (CurrentPayrollItem != null && CurrentPayrollItem.EntityState != System.Data.EntityState.Detached)
            {
                foreach (var item in CurrentPayrollItem.AccountEntries.ToList())
                {
                    db.AccountEntries.DeleteObject(item);
                }
                db.PayrollItems.DeleteObject(CurrentPayrollItem);
                UpdatePayrollItemsBaseAmounts(CurrentEmployee.CurrentPayrollItems);
                SaveDatabase();
            }
            CurrentPayrollItem = null;
            OnStaticPropertyChanged("CurrentPayrollJob");
            OnStaticPropertyChanged("PayrollItems");
            OnStaticPropertyChanged("Employees");
            OnStaticPropertyChanged("CurrentPayrollItem");
        }

        public void NewPayrollItem()
        {
           DataLayer.PayrollItem newpi =  BaseViewModel.db.PayrollItems.CreateObject();
           db.PayrollItems.AddObject(newpi);
           newpi.Status = "Amounts Processed";
           _newPayrollItem = newpi;

           OnPropertyChanged("CurrentPayrollItem");
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