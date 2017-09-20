using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Linq;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Windows.Controls;
using PayrollManager.DataLayer;

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
                GetPayrollEmployeeSetups();
                // OnStaticPropertyChanged("PayrollEmployeeSetups");

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

        //public ObservableCollection<DataLayer.PayrollSetupItem> oPayrollSetupItems
        //{
        //    get
        //    {
        //        using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
        //        {
        //            return new ObservableCollection<DataLayer.PayrollSetupItem>(ctx.PayrollSetupItems.ToList());
        //        }
        //    }
        //}
	    private static ObservableCollection<DataLayer.PayrollEmployeeSetup> _payrollEmployeeSetups = null;
        public ObservableCollection<DataLayer.PayrollEmployeeSetup> PayrollEmployeeSetups
        {
            get
            {
                if(_payrollEmployeeSetups == null) GetPayrollEmployeeSetups();
                return _payrollEmployeeSetups;
            }
        }

	    private ObservableCollection<PayrollEmployeeSetup> GetPayrollEmployeeSetups()
	    {
	        if (CurrentEmployee == null || CurrentPayrollJobType == null) return null;
	        using (var ctx = new PayrollDB())
	        {
	            _payrollEmployeeSetups = new ObservableCollection<DataLayer.PayrollEmployeeSetup>(ctx.PayrollEmployeeSetup
                    .Include(x => x.PayrollSetupItem)
                    .Where(p => p.PayrollJobTypeId == CurrentPayrollJobType.PayrollJobTypeId &&
	                     p.EmployeeId == CurrentEmployee.EmployeeId));
	            OnPropertyChanged("PayrollEmployeeSetups");
                return _payrollEmployeeSetups;
	        }
	    }

	    public void UpdateProperties()
        {
            
           
            OnStaticPropertyChanged("PayrollEmployeeSetup");
            OnStaticPropertyChanged("CurrentEmployee");
           

        }


        public ListCollectionView ChargeTypes
        {
            get
            {
                using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
                {
                    return new ListCollectionView(ctx.ChargeTypes.ToList());
                }
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
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                DataLayer.PayrollEmployeeSetup newpi = ctx.PayrollEmployeeSetup.CreateObject();
                ctx.PayrollEmployeeSetup.AddObject(newpi);
                // PayrollEmployeeSetup.Add(newpi);
                _newItem = newpi;
                OnStaticPropertyChanged("PayrollEmployeeSetup");
            }
        }

        public void UpdateItem(DataLayer.PayrollEmployeeSetup newpi )
        {
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                if (!ctx.PayrollEmployeeSetup.Where(a => a.PayrollEmployeeSetupId == newpi.PayrollEmployeeSetupId).Any())
                {
                    ctx.PayrollEmployeeSetup.AddObject(newpi);
                }

                SaveDatabase(ctx);


                //PayrollEmployeeSetup.Add(newpi);
                _newItem = newpi;
                OnStaticPropertyChanged("PayrollEmployeeSetup");
            }
        }





        //DataLayer.Employee _currentEmployee;
        //public override DataLayer.Employee CurrentEmployee
        //{
        //    get
        //    {
        //        return _currentEmployee;
        //        // return (DataLayer.Employee)GetValue(CurrentEmployeeProperty);
        //    }
        //    set
        //    {


        //        _currentEmployee = value;
        //        // NotifyPropertyChanged("CurrentEmployee");
        //        OnStaticPropertyChanged("CurrentEmployee");

        //        // SetValue(CurrentEmployeeProperty, value);
        //    }
        //}


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