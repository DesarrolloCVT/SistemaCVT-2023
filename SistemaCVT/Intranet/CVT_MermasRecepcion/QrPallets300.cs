using System;
using System.Text;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

using System.Collections.Generic;
using System.Drawing.Printing;
using System.Windows.Forms;
using DevExpress.XtraPrinting.BarCode;

namespace CVT_MermasRecepcion
{
    public partial class QrPallets300 : DevExpress.XtraReports.UI.XtraReport
    {
        string SSCC = string.Empty;
        //string  Codpro = string.Empty;
        //string Lote = string.Empty;
        public QrPallets300(string _SSCC/*, string _CodPro,string _Lote*/)
        {
            SSCC = _SSCC;
            //Codpro = _CodPro;
            //Lote = _Lote;
            InitializeComponent();
        }
        public QrPallets300() { }
        public XRBarCode CreateQRCodeBarCode(string BarCodeText)
        {
            // Create a bar code control.
            XRBarCode barCode = new XRBarCode();

            // Set the bar code's type to QRCode.
            barCode.Symbology = new QRCodeGenerator();

            // Adjust the bar code's main properties.
            barCode.Text = BarCodeText;
            barCode.TextAlignment = DevExpress.XtraPrinting.TextAlignment.BottomCenter;
            barCode.Width = 380;
            barCode.Height = 395;

            //barCode.Height = 250;

            // If the AutoModule property is set to false, uncomment the next line.
            barCode.AutoModule = true;
            // barcode.Module = 3;

            // Adjust the properties specific to the bar code type.
            ((QRCodeGenerator)barCode.Symbology).CompactionMode = QRCodeCompactionMode.Byte;
            ((QRCodeGenerator)barCode.Symbology).ErrorCorrectionLevel = QRCodeErrorCorrectionLevel.H;
            ((QRCodeGenerator)barCode.Symbology).Version = QRCodeVersion.AutoVersion;
            barCode.ShowText = true;
            return barCode;
        }

        private void CodigoQRUsuario_BeforePrint(object sender, PrintEventArgs e)
        {

            //List<string> a = new List<string>();

            //a.Add("1234");
            //a.Add("12");
            //a.Add("112233");

            //foreach (var t in a)
            //{
                this.Detail.Controls.Add(CreateQRCodeBarCode(SSCC));
            //}
             
          
        }
    }
}
