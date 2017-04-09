using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.ObjectModel;

namespace PayrollManager
{
	public class PayrollSetupItemsModel : BaseViewModel
	{
		public PayrollSetupItemsModel()
		{
			staticPropertyChanged += PayrollSetupItemsModel_staticPropertyChanged;
		}

        private void PayrollSetupItemsModel_staticPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            OnPropertyChanged(e.PropertyName);
            if (e.PropertyName == "InstitutionAccounts")
            {
                OnPropertyChanged("InstitutionAccountsList");
            }
        }

        public ObservableCollection<DataLayer.InstitutionAccount> InstitutionAccountsList
        {
            get
            {
                return new ObservableCollection<DataLayer.InstitutionAccount>(db.Accounts.OfType<DataLayer.InstitutionAccount>());
            }
        }
        
        public void SavePayrollSetupItem()
        {
            BaseViewModel.SaveDatabase();
            
            base.CurrentPayrollSetupItem = _newPayrollSetupItem;
            _newPayrollSetupItem = null;
            OnStaticPropertyChanged("PayrollSetupItems");
            OnStaticPropertyChanged("CurrentPayrollSetupItem");
            OnStaticPropertyChanged("PayrollSetupItemsCollection");
        }

        public void DeletePayrollSetupItem()
        {
            if (CurrentPayrollSetupItem.EntityState !=  System.Data.EntityState.Detached)
            {
                db.PayrollSetupItems.DeleteObject(CurrentPayrollSetupItem);
                SaveDatabase();
            }
            CurrentPayrollSetupItem = null;
            OnStaticPropertyChanged("PayrollSetupItems");
            OnStaticPropertyChanged("PayrollSetupItemsCollection");
            OnStaticPropertyChanged("CurrentPayrollSetupItem");

        }

        public void NewPayrollSetupItem()
        {
            DataLayer.PayrollSetupItem newpi = BaseViewModel.db.PayrollSetupItems.CreateObject();
            db.PayrollSetupItems.AddObject(newpi);
            _newPayrollSetupItem = newpi;
            OnPropertyChanged("CurrentPayrollSetupItem");
            

        }

        DataLayer.PayrollSetupItem _newPayrollSetupItem;
        public override DataLayer.PayrollSetupItem CurrentPayrollSetupItem
        {
            get
            {
                if (_newPayrollSetupItem == null)
                {
                    return base.CurrentPayrollSetupItem;
                }
                else
                {
                    return _newPayrollSetupItem;
                }
            }
            set
            {
                base.CurrentPayrollSetupItem = value;
                OnStaticPropertyChanged("PayrollSetupItems");
                OnStaticPropertyChanged("PayrollSetupItemsCollection");
                OnStaticPropertyChanged("CurrentPayrollSetupItem");

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