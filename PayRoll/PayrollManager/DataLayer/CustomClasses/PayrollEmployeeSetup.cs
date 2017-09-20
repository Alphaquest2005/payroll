using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PayrollManager.DataLayer
{
    public partial class PayrollEmployeeSetup
    {
       
        public double CalcAmount
        {
            get
            {
                try
                {
                    using (var ctx = new PayrollDB(Properties.Settings.Default.PayrollDB))
                    {
                        if (this.PayrollSetupItem == null) return 0;
                        DataLayer.PayrollItem p = new PayrollItem() {PayrollSetupItem = this.PayrollSetupItem};
                        if (BaseViewModel.Instance.ConfigPayrollItem(p, this) == BaseViewModel.TriBoolState.Success)
                        {
                            double amt =
                                Convert.ToDouble(BaseViewModel.GetPayrollAmount(Convert.ToDouble(this.BaseAmount), p));
                            //p = null;
                            ctx.DeleteObject(p);
                            return amt;
                        }
                        else
                        {
                            //p = null;
                            ctx.DeleteObject(p);
                            return 0;
                        }
                    }
                }
                catch (Exception ex)
                {

                }
                 
                    return 0;
                
            }
        }
    }
}
