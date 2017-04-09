using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace PayrollManager.Converters
{
    public class PayrollItemSubtotalConverter:IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (value != null && typeof(CollectionViewGroup).IsInstanceOfType(value))
            {
                return GetSubTotal(value as CollectionViewGroup);
            }
            if (value != null && typeof(DataLayer.Account).IsInstanceOfType(value))
            {
                if (parameter != null && typeof(DataLayer.PayrollJob).IsInstanceOfType(parameter))
                {
                    return GetAccountTotal(value,parameter);
                }
                else
                {
                    return GetAccountTotal(value);
                }
            }
            else
            {
                return null;
            }
        }

        private double GetAccountTotal(object value, object parameter)
        {
            DataLayer.Account ia = value as DataLayer.Account;
            DataLayer.PayrollJob pj = parameter as DataLayer.PayrollJob;

            return ia.AccountEntries.Where(ae => ae.PayrollItem.PayrollJobId == pj.PayrollJobId).Sum(ae => ae.Total);

        }

        private double GetAccountTotal(object value)
        {
            DataLayer.Account ia = value as DataLayer.Account;
            return ia.AccountEntries.Sum(ae => ae.Total);
        }

        private double GetSubTotal(CollectionViewGroup collectionViewGroup)
        {
            double tot = Double.MaxValue;
            if (typeof(DataLayer.PayrollItem).IsInstanceOfType(collectionViewGroup.Items[0]))
            {
                        return  (from i in collectionViewGroup.Items.AsEnumerable()
                          select ((DataLayer.PayrollItem)i).Amount).Sum();

            }
            if (typeof(DataLayer.PayrollEmployeeSetup).IsInstanceOfType(collectionViewGroup.Items[0]))
            {
                return (Double)(from i in collectionViewGroup.Items.AsEnumerable()
                                select ((DataLayer.PayrollEmployeeSetup)i).Amount).Sum();
            }
            if (typeof(DataLayer.AccountEntry).IsInstanceOfType(collectionViewGroup.Items[0]))
            {
                return (Double)(from i in collectionViewGroup.Items.AsEnumerable()
                                select ((DataLayer.AccountEntry)i).Total).Sum();
            }

            if (typeof(PayrollItemsReportModel.PayrollReportLine).IsInstanceOfType(collectionViewGroup.Items[0]))
            {
                return (Double)(from i in collectionViewGroup.Items.AsEnumerable()
                                select ((PayrollItemsReportModel.PayrollReportLine)i).Amount).Sum();
            }

            return tot;
        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }





    public class BooleanToIncomeDeduction : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (value != null)
            {
                if (System.Convert.ToBoolean(value) == true)
                {
                    return "Income";
                }
                else
                {
                    return "Deduction";
                }

            }
            return null;
        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
