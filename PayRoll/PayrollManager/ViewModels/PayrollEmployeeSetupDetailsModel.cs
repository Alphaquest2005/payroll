using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using System.Collections.ObjectModel;
using System.Windows.Controls;

namespace PayrollManager
{
	public class PayrollEmployeeSetupDetailsModel : BaseViewModel
	{
      

		public PayrollEmployeeSetupDetailsModel()
		{
            staticPropertyChanged += PayrollEmployeeSetupDetailsModel_staticPropertyChanged;
		}

   
        void PayrollEmployeeSetupDetailsModel_staticPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            

            OnPropertyChanged(e.PropertyName);
            if (e.PropertyName == "PayrollSetupItems")
            {
                OnPropertyChanged("oPayrollSetupItems");
            }
            if (e.PropertyName == "CurrentEmployee" || e.PropertyName == "CurrentPayrollJobType")
            {
                OnPropertyChanged("PayrollEmployeeSetups");
                OnStaticPropertyChanged("PayrollEmployeeSetups");
               
            }
        }

        //DataLayer.PayrollEmployeeSetup _currentPayrollEmployeeSetup;
        //public DataLayer.PayrollEmployeeSetup CurrentPayrollEmployeeSetup
        //{
        //    get
        //    {
        //        return _currentPayrollEmployeeSetup;
        //    }
        //    set
        //    {
        //        _currentPayrollEmployeeSetup = value;
        //        OnPropertyChanged("CurrentPayrollEmployeeSetup");
        //    }
        //}

        public ObservableCollection<DataLayer.PayrollSetupItem> oPayrollSetupItems
        {
            get
            {
                return new ObservableCollection<DataLayer.PayrollSetupItem>(db.PayrollSetupItems.ToList());
            }
        }

        public ObservableCollection<DataLayer.PayrollEmployeeSetup> PayrollEmployeeSetups
        {
            get
            {
                if (CurrentEmployee == null) return null;
                return new ObservableCollection<DataLayer.PayrollEmployeeSetup>(CurrentEmployee.PayrollEmployeeSetups.Where( p => p.PayrollJobType == CurrentPayrollJobType));
            }
        }

        public void SaveItem()
        {
            
            BaseViewModel.SaveDatabase();

            OnStaticPropertyChanged("PayrollEmployeeSetup");
            OnStaticPropertyChanged("CurrentEmployee");
            //base.CurrentPayrollEmployeeSetup = _newItem;
            //_newItem = null;

        }


        public ListCollectionView ChargeTypes
        {
            get
            {
                return new ListCollectionView(db.ChargeTypes.ToList());
            }
        }
       
        //public void DeletePayrollItem()
        //{
        //    db.PayrollItems.DeleteObject(CurrentPayrollItem);
        //    // db.PayrollItems.Detach(CurrentPayrollItem);


        //    SaveDatabase();
        //    CurrentPayrollItem = null;

        //}

        public void NewItem()
        {
            DataLayer.PayrollEmployeeSetup newpi = BaseViewModel.db.PayrollEmployeeSetup.CreateObject();
            db.PayrollEmployeeSetup.AddObject(newpi);
           // PayrollEmployeeSetup.Add(newpi);
            _newItem = newpi;
            OnStaticPropertyChanged("PayrollEmployeeSetup");
        }

        public void UpdateItem(DataLayer.PayrollEmployeeSetup newpi )
        {
            if (db.PayrollEmployeeSetup.Where(a => a.PayrollEmployeeSetupId == newpi.PayrollEmployeeSetupId).Count() == 0)
            {
                db.PayrollEmployeeSetup.AddObject(newpi);
            }

            SaveDatabase();


            //PayrollEmployeeSetup.Add(newpi);
            _newItem = newpi;
            OnStaticPropertyChanged("PayrollEmployeeSetup");
        }





        DataLayer.Employee _currentEmployee;
        public override DataLayer.Employee CurrentEmployee
        {
            get
            {
                return _currentEmployee;
                // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
            }
            set
            {


                _currentEmployee = value;
                // NotifyPropertyChanged("CurrentEmployee");
                OnStaticPropertyChanged("CurrentEmployee");

                // SetValue(CurrentEmployeeProperty, value);
            }
        }


        DataLayer.PayrollEmployeeSetup _newItem;
        public override DataLayer.PayrollEmployeeSetup CurrentPayrollEmployeeSetup
        {
            get
            {
                if (_newItem == null)
                {
                    return base.CurrentPayrollEmployeeSetup;
                }
                else
                {
                    return _newItem;
                }
            }
            set
            {
                base.CurrentPayrollEmployeeSetup = value;

            }
        }
        private ObservableCollection<DataLayer.PayrollItem> _previewPayrollItems;
        public ObservableCollection<DataLayer.PayrollItem> PreviewPayrollItems
        {
            get
            {
                return _previewPayrollItems;
            }
        }

        public void PayrollPreview()
        {
            //regen items

            //calulate amts
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

        public object StaticPropertyHandler { get; set; }
    }
}