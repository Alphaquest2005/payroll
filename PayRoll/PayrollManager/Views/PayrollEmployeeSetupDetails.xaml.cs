
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Linq;
using PayrollManager.DataLayer;

namespace PayrollManager
{
	/// <summary>
	/// Interaction logic for PayrollEmployeeSetupDetails.xaml
	/// </summary>
	public partial class PayrollEmployeeSetupDetails : UserControl
	{
		public PayrollEmployeeSetupDetails()
		{
			this.InitializeComponent();

            im = (PayrollEmployeeSetupDetailsModel)this.FindResource("PayrollEmployeeSetupDetailsModelDataSource");
   
         
            // Insert code required on object creation below this point.
        }

       


        PayrollEmployeeSetupDetailsModel im;

        //private void NewBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        //{
        //    im.NewItem();
        //}

        //private void SaveBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        //{
        //    im.SaveItem();
        //}

        private void PayrollEmpDG_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
        {

            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                DataLayer.PayrollEmployeeSetup r = (DataLayer.PayrollEmployeeSetup) e.Row.Item;

                if (r.EntityState == EntityState.Detached && r.EntityKey == null)
                {
                    ctx.PayrollEmployeeSetup.AddObject(r);
                }
                r.EmployeeId = ((DataLayer.Employee) EmployeeCmb.SelectedItem).EmployeeId;

                BaseViewModel.SaveDatabase(ctx);

                
            }

            im.CurrentEmployee.SetBaseAmounts();
            // BaseViewModel.OnStaticPropertyChanged("PayrollEmployeeSetups");
            //if (e.EditAction == DataGridEditAction.Commit)
            //{
            //    im.UpdateItem(e.Row.Item as DataLayer.PayrollEmployeeSetup);

            //}
        }

        private void PayrollEmpDG_MouseLeave(object sender, MouseEventArgs e)
        {
          // im.SaveItem();
        }

        //private void PayrollEmpDG_RowEditEnding(object sender, ExtendedGrid.Microsoft.Windows.Controls.DataGridRowEditEndingEventArgs e)
        //{
           
        //   im.SaveItem();
        //}

      
        private void xgrid_InitializingNewItem(object sender, InitializingNewItemEventArgs e)
        {
            ((DataLayer.PayrollEmployeeSetup)(e.NewItem)).EmployeeId = ((DataLayer.Employee)EmployeeCmb.SelectedItem).EmployeeId;
            ((DataLayer.PayrollEmployeeSetup)(e.NewItem)).StartDate = DateTime.Now;
        }

        private void xgrid_CellEditEnding(object sender, DataGridCellEditEndingEventArgs e)
        {
            DataLayer.PayrollEmployeeSetup r = (DataLayer.PayrollEmployeeSetup)e.Row.Item;

            // if (r.EntityState == EntityState.Detached || r.EntityState == EntityState.Deleted) return;
            using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
            {
                if (r.EntityState == EntityState.Detached && r.EntityKey == null)
                {
                    ctx.PayrollEmployeeSetup.AddObject(r);
                }

                if (e.Column.Header.ToString() == "Payroll Item")
                {
                    ComboBox cb = (ComboBox) e.EditingElement;
                    DataLayer.PayrollSetupItem ps = (DataLayer.PayrollSetupItem) cb.SelectedItem;
                    if (ps == null)
                    {
                        e.Cancel = true;
                        return;
                    }
                    if (ps.Amount == null || ps.Amount == 0)
                    {
                        r.ChargeType = "Rate";
                        r.Rate = Convert.ToSingle(ps.Rate);
                        r.RateRounding = ps.RateRounding;
                        if (ps.CompanyLineItemDescription != null || ps.CompanyLineItemDescription == "")
                        {
                            r.CompanyRate = Convert.ToSingle(ps.CompanyRate);
                        }
                    }
                    else
                    {
                        r.ChargeType = "Amount";
                        r.Amount = ps.Amount;
                        if (ps.CompanyLineItemDescription != null || ps.CompanyLineItemDescription == "")
                        {
                            r.CompanyAmount = ps.CompanyAmount;

                        }
                    }


                }

                if (e.Column.Header.ToString() == "Amount")
                {
                    TextBox t = (TextBox) (e.EditingElement);
                    if (t.Text != "$0.00") r.ChargeType = "Amount";
                }
                if (e.Column.Header.ToString() == "Rate")
                {
                    TextBox t = (TextBox) (e.EditingElement);
                    if (t.Text != "$0.00") r.ChargeType = "Rate";
                }
                BaseViewModel.SaveDatabase(ctx);
            }
        }

        private void xgrid_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            //if (e.Key == Key.Delete )
            //{
            //    var res = MessageBox.Show("Are you sure you want to delete?", "Delete Row", MessageBoxButton.YesNo);
            //    if (res == MessageBoxResult.Yes)
            //    {
            //        foreach (var item in xgrid.SelectedItems.OfType<DataLayer.PayrollEmployeeSetup>().ToList())
            //        {

            //            if (item.EntityState != EntityState.Detached && item.EntityKey == null)
            //            {
            //                BaseViewModel.db.PayrollEmployeeSetup.AddObject(item);
            //            }

            //            BaseViewModel.db.PayrollEmployeeSetup.DeleteObject(item);
            //            im.SaveItem();
            //        }
            //    }
            //    else
            //    {

            //    }
            //}
        }

        private void GrdSourceUpdated(object sender, DataTransferEventArgs e)
        {

        }

        private void DeleteBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var res = MessageBox.Show("Are you sure you want to delete this item?", "Delete Item", MessageBoxButton.YesNo);

            if (res == MessageBoxResult.Yes)
            {
                foreach (var item in xgrid.SelectedItems.OfType<DataLayer.PayrollEmployeeSetup>().ToList())
                {
                    using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
                    {
                        if (item.EntityState != EntityState.Detached)
                        {
                            if (item.EntityKey == null) ctx.PayrollEmployeeSetup.AddObject(item);
                            ctx.PayrollEmployeeSetup.DeleteObject(item);
                        }

                        else
                        {

                            ctx.PayrollEmployeeSetup.Attach(item);
                            ctx.PayrollEmployeeSetup.DeleteObject(item);

                        }
                        BaseViewModel.SaveDatabase(ctx);
                    }

                    im.SaveItem();
                }
            }
        }

        private void CheckBox_Checked(object sender, RoutedEventArgs e)
        {
          
        }

        private void CheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
         
        }

        private void CheckBox_Click(object sender, RoutedEventArgs e)
        {
            im.SaveItem();

            im.CurrentEmployee.SetBaseAmounts();
        }

      

       

  

      

   
       

       
	}
}