using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.ObjectModel;
using PayrollManager.DataLayer;

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
                using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
                {
                    return new ObservableCollection<DataLayer.InstitutionAccount>(ctx.Accounts
                        .OfType<DataLayer.InstitutionAccount>());
                }
            }
        }
        
        public void SavePayrollSetupItem()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                ctx.PayrollSetupItems.Attach(_newPayrollSetupItem);
                ctx.PayrollSetupItems.ApplyCurrentValues(_newPayrollSetupItem);
                SaveDatabase(ctx);

                base.CurrentPayrollSetupItem = _newPayrollSetupItem;
                _newPayrollSetupItem = null;
                OnStaticPropertyChanged("PayrollSetupItems");
                OnStaticPropertyChanged("CurrentPayrollSetupItem");
                OnStaticPropertyChanged("PayrollSetupItemsCollection");
            }
        }

        public void DeletePayrollSetupItem()
        {

            if (CurrentPayrollSetupItem.EntityState !=  System.Data.EntityState.Detached)
            {
                using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
                {
                    ctx.PayrollSetupItems.DeleteObject(CurrentPayrollSetupItem);
                    SaveDatabase(ctx);
                }
            }
            CurrentPayrollSetupItem = null;
            OnStaticPropertyChanged("PayrollSetupItems");
            OnStaticPropertyChanged("PayrollSetupItemsCollection");
            OnStaticPropertyChanged("CurrentPayrollSetupItem");

        }

        public void NewPayrollSetupItem()
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                PayrollSetupItem newpi = ctx.PayrollSetupItems.CreateObject();
                ctx.PayrollSetupItems.AddObject(newpi);
                _newPayrollSetupItem = newpi;
                OnPropertyChanged("CurrentPayrollSetupItem");
            }


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