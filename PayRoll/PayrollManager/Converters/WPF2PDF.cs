using SUT.PrintEngine;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Packaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Xps;
using System.Windows.Xps.Packaging;

namespace PayrollManager
{
   public class WPF2PDF
    {
     public static string CreatePDF(ref Grid rpt, string reportName)
       {
          
         DrawingVisual v = PrintVisual.GetVisual(ref rpt);
     
        // create XPS file based on a WPF Visual, and store it in a memorystream
        MemoryStream lMemoryStream = new MemoryStream();
        Package package = Package.Open(lMemoryStream, FileMode.Create);
        XpsDocument doc = new XpsDocument(package);
        XpsDocumentWriter writer = XpsDocument.CreateXpsDocumentWriter(doc);
        writer.Write(v);
        doc.Close();
        package.Close();

        var pdfXpsDoc = PdfSharp.Xps.XpsModel.XpsDocument.Open(lMemoryStream);
          string file = Path.Combine(Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location), reportName + ".pdf"); 

        PdfSharp.Xps.XpsConverter.Convert(pdfXpsDoc,file, 0);

        return file;
       }
    }
}
