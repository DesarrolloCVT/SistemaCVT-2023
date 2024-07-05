using DBMermasRecepcion;
using DevExpress.Web.ASPxScheduler.Reporting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.UtilidadCVT
{
    public partial class QrPreview : System.Web.UI.UserControl
    {
        ASPxSchedulerControlPrintAdapter controlAdapter;
        public ASPxSchedulerControlPrintAdapter ControlAdapter { get { return controlAdapter; } set { controlAdapter = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            string nPallet = Session["NSSCC"].ToString();
            //ProduccionClass pr = new ProduccionClass();
            //DataTable dt = pr.SP_RptEtiquetado(nPallet, 0, 1);

            //string CodP = "";
            //string LotP = "";

            //foreach (DataRow t in dt.Rows)
            //{
            //   CodP=t["Codigo_Producto"].ToString();
            //    LotP= t["Lote"].ToString();
            //}


            //QrPallets rpt = new QrPallets(nPallet,CodP,LotP);

            //List<string> a = new List<string>();
            //a.Add("123");
            //a.Add("1234");
            //a.Add("12345")
            QrPallets rpt = new QrPallets(nPallet);
            DocumentViewer.Report = rpt;
        }
    }
}