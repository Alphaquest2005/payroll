    using System;
using System.Collections.Generic;
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

namespace PayrollManager
{
	/// <summary>
	/// Interaction logic for EmployeeDetails.xaml
	/// </summary>
	public partial class EmployeeDetails : UserControl
	{
		public EmployeeDetails()
		{
			this.InitializeComponent();
            im = (EmployeeDetailsModel)this.FindResource("EmployeeDetailsModelDataSource");
			// Insert code required on object creation below this point.
		}

        EmployeeDetailsModel im; 
        private void NewBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            im.NewEmployee();
        }

        private void SaveBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            im.SaveEmployee();
        }

        private void DeleteBtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            im.DeleteEmployee();
        }

        private void delbtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            im.DeleteEmployeeAccount(((FrameworkElement)sender).DataContext as DataLayer.EmployeeAccount);
        }

        private void Editbtn_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            im.EditAccount((DataLayer.EmployeeAccount)((FrameworkElement)sender).DataContext);
        }

        private void NewAccount_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            BaseViewModel.slider.MoveTo("EmployeeAccountSummaryListEXP");
        }





        private void DataGrid_RowEditEnding_1(object sender, DataGridRowEditEndingEventArgs e)
        {
            if (e.Row.IsNewItem == true && im.CurrentEmployee != null )
            {
                im.UpdateEmployee();
                DataLayer.EmployeeAccount ne = (DataLayer.EmployeeAccount)e.Row.Item;
                if (im.CurrentEmployee == null) return;
                ne.AccountName = im.CurrentEmployee.FirstName + " " + BaseViewModel.db.Institutions.Where( i => i.InstitutionId != null && i.InstitutionId == ne.InstitutionId).FirstOrDefault().ShortName + " Salary Account";
                ne.AccountType = "Salary Account";
            }
            BaseViewModel.SaveDatabase();
        }

        private void DataGrid_BeginningEdit_1(object sender, DataGridBeginningEditEventArgs e)
        {
           
                  
        }

        private void GenerateItms_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            im.EmployeeAutoSetup();
        }

      
	}
}