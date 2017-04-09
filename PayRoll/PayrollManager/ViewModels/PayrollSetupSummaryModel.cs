using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.ObjectModel;
using System.Linq;

namespace PayrollManager
{
	public class PayrollSetupSummaryModel : BaseViewModel
	{
		public PayrollSetupSummaryModel()
		{
            staticPropertyChanged += summaryModel_PropertyChanged;
                       // PropertyChanged += EmployeePayrollItemsListModel_PropertyChanged;
           UpdateDataSource();
           PayrollSetupItemsList.CollectionChanged += PayrollSetupItemsList_CollectionChanged;

		}

        void PayrollSetupItemsList_CollectionChanged(object sender, System.Collections.Specialized.NotifyCollectionChangedEventArgs e)
        {
            SaveDatabase();
           
            OnStaticPropertyChanged("PayrollSetupItems");
        //    UpdateDataSource();
        }

        Int32 _PayrollJobTypeId = -1;
        public  Int32 CurrentPayrollJobTypeId
        {
            get
            {
                return _PayrollJobTypeId;
            }
            set
            {
                _PayrollJobTypeId = value;
                OnStaticPropertyChanged("CurrentPayrollJobTypeId");
            }
        }


        public void summaryModel_PropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == "CurrentPayrollJobTypeId") //e.PropertyName == "CurrentPayrollSetupItem" && CurrentPayrollSetupItem != null ||
            {
                if (CurrentPayrollJobTypeId != -1)
                {
                   // PayrollSetupItemsList = new ObservableCollection<DataLayer.PayrollSetupItem>(PayrollSetupItems.Where(p => p.PayrollJobTypeId == CurrentPayrollJobTypeId));
                    PayrollSetupItemsList = new ObservableCollection<DataLayer.PayrollSetupItem>(PayrollSetupItems);
                    // UpdateDataSource();
                }
                else
                {
                    PayrollSetupItemsList = new ObservableCollection<DataLayer.PayrollSetupItem>(PayrollSetupItems);
                    //  UpdateDataSource();
                }

                PayrollSetupItemsList.CollectionChanged += PayrollSetupItemsList_CollectionChanged;
            }
            if (e.PropertyName == "PayrollSetupItemsCollection")
            {

                PayrollSetupItemsList = new ObservableCollection<DataLayer.PayrollSetupItem>(PayrollSetupItems);
                OnStaticPropertyChanged("PayrollSetupItemsList");
                UpdateDataSource();
                PayrollSetupItemsList.CollectionChanged += PayrollSetupItemsList_CollectionChanged;
            }


        }

       static ObservableCollection<DataLayer.PayrollSetupItem> _PayrollSetupItemsList = new ObservableCollection<DataLayer.PayrollSetupItem>(db.PayrollSetupItems);
        public ObservableCollection<DataLayer.PayrollSetupItem> PayrollSetupItemsList
        {
            get
            {
                return _PayrollSetupItemsList;
            }
            set
            {
                _PayrollSetupItemsList = value;
                OnPropertyChanged("PayrollSetupItemsList");
                
            }
        }

        public object DataSource{get;set;}

        Boolean _SortReorder = true;
        public bool SortReorder
        {
            get
            {
                return _SortReorder;
            }
            set
            {
                _SortReorder = value;
                UpdateDataSource();

            }
        }

        private void UpdateDataSource()
        {
            if (_SortReorder == true)
            {
                CollectionViewSource pcol = new CollectionViewSource();
                pcol.Source = PayrollSetupItemsList;

                pcol.SortDescriptions.Add(new SortDescription("Name", ListSortDirection.Descending));
                pcol.SortDescriptions.Add(new SortDescription("Amount", ListSortDirection.Descending));
                pcol.SortDescriptions.Add(new SortDescription("IncomeDeducton", ListSortDirection.Descending));

                pcol.GroupDescriptions.Add(new PropertyGroupDescription("IncomeDeduction"));

                DataSource = pcol.View;

            }
            else
            {
                DataSource = PayrollSetupItemsList;
            }
            OnStaticPropertyChanged("DataSource");
            OnStaticPropertyChanged("SortReorder");
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