using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.ObjectModel;

namespace PayrollManager
{
	public class PaysubModel : BaseViewModel
	{
		public PaysubModel()
		{
            staticPropertyChanged += PaysubModel_staticPropertyChanged;
		}

        void PaysubModel_staticPropertyChanged(object sender, PropertyChangedEventArgs e)
        {
            //if (e.PropertyName == "CurrentInstitutionAccount" && CurrentInstitutionAccount != null)
            //{
            //    MergeEmployeAccountIntoInstitutionAccount(CurrentInstitutionAccount);
            //}
        }

       
	
	}
}