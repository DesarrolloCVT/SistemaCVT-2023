using DBMermasRecepcion;
using DevExpress.XtraPrinting;
using DevExpress.XtraPrintingLinks;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class Consolidado_Pedido_Grilla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Datos"];
                GvDatos1.DataSource = Session["Datos1"];
            }
        }

        protected void btnGrilla_Click(object sender, EventArgs e)
        {
            MMetroClass mm = new MMetroClass();

            DataTable td = mm.SP_ConsolidadoPedidoGrilla(dteFInicio.Date,cboDepto.Value.ToString());
            GvDatos.DataSource = td;
            Session["Datos"] = td;
            GvDatos.DataBind();

            DataTable td1 = mm.SP_ConsolidadoPedido_FacturaGrilla(dteFInicio.Date, cboDepto.Value.ToString());
            GvDatos1.DataSource = td1;
            Session["Datos1"] = td1;
            GvDatos1.DataBind();

            //PrintingSystemBase ps = new PrintingSystemBase();
            //PrintableComponentLinkBase link1 = new PrintableComponentLinkBase(ps);
            //link1.Component = GvPrint1;

            //PrintableComponentLinkBase link2 = new PrintableComponentLinkBase(ps);
            //link1.Component = GvPrint2;


            //CompositeLinkBase compositeLink = new CompositeLinkBase(ps);
            //compositeLink.Links.AddRange(new object[] { link1, link2 });
            //compositeLink.CreateDocument();
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            PrintingSystemBase ps = new PrintingSystemBase();
            PrintableComponentLinkBase link1 = new PrintableComponentLinkBase(ps);
            link1.Component = GvPrint1;
          

            PrintableComponentLinkBase link2 = new PrintableComponentLinkBase(ps);
            link2.Component = GvPrint2;


            CompositeLinkBase compositeLink = new CompositeLinkBase(ps);
            compositeLink.Links.AddRange(new object[] { link1, link2 });
            compositeLink.CreateDocument();
           
            using (MemoryStream stream = new MemoryStream())
            {
                compositeLink.ExportToXls(stream);
                //ExportSettings.
                WriteToResponse("Consolidado Pedidos", true, "xls", stream);
               
            }
            ps.Dispose();

        }

        void WriteToResponse(string fileName, bool saveAsFile, string fileFormat, MemoryStream stream)
        {
            if (Page == null || Page.Response == null)
                return;
            string disposition = saveAsFile ? "attachment" : "inline";
            Page.Response.Clear();
            Page.Response.Buffer = false;
            Page.Response.AppendHeader("Content-Type", string.Format("application/{0}", fileFormat));
            Page.Response.AppendHeader("Content-Transfer-Encoding", "binary");
            Page.Response.AppendHeader("Content-Disposition",
            string.Format("{0}; filename={1}.{2}", disposition, fileName, fileFormat));
            Page.Response.BinaryWrite(stream.GetBuffer());
            Page.Response.End();

        }
    }
}