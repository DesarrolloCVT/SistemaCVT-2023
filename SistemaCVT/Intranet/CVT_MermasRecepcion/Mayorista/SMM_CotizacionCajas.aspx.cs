using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMM_CotizacionCajas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;             

        }
        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["Id_Cotizacion"] = e.KeyValue;                
                Response.Redirect("~/Mayorista/SMM_CotizacionCajasDetalle.aspx");

            }
            if (e.CommandArgs.CommandName == "cmdAprovar")
            {
                int idCot=Convert.ToInt32(e.KeyValue);

                CVTWMSMetroClass mws = new CVTWMSMetroClass();
                mws.ActualizaEstadoCotizacion(idCot, 4);

                //Response.Redirect("~/MayoristaReportes/SMMConsolidadoKIT.aspx");
                GvDatos.DataBind();

            }
            if (e.CommandArgs.CommandName == "cmdRechazar")
            {
                int idCot = Convert.ToInt32(e.KeyValue);

                CVTWMSMetroClass mws = new CVTWMSMetroClass();
                mws.ActualizaEstadoCotizacion(idCot, 5);

                GvDatos.DataBind();

            }
            if (e.CommandArgs.CommandName == "cmdInforme")
            {
                int id = Convert.ToInt32(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/CotizacionCajasSMM.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, id);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Cotizacion Cajas.pdf");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mws = new CVTWMSMetroClass();
            SMM_Cotizacion_Cajas co = new SMM_Cotizacion_Cajas();

            co.Nombre_Cliente = txtNombreCliente.Text;
            //co.PrecioVenta = Convert.ToInt32(txtPrecioVenta.Text);
            //co.FormaDePago =Convert.ToInt32(txtFormaDePago.Text);
            co.Estado = 1;
            co.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            co.FechaCotizacion = DateTime.Now;
            int idCotizacion = mws.CreaNuevaCotizacion(co);

          
            //mws.ActualizaCotizacion(idCotizacion, co);
          

            //SMM_Cotizacion_Cajas_Detalle c = new SMM_Cotizacion_Cajas_Detalle();

            //c.Cotizacion_Id = idCotizacion;
            //c.CodProducto = "COSxCAJA-1";
            //c.Cantidad = 1;
            //c.CostoUnitario = 600;
            //c.Precio = 600;

            //mws.CreaNuevoDetalleCotizacion(c);

            //SMM_Cotizacion_Cajas_Detalle b = new SMM_Cotizacion_Cajas_Detalle();

            //b.Cotizacion_Id = idCotizacion;
            //b.CodProducto = "COSxCAJA-2";
            //b.Cantidad = 1;
            //b.CostoUnitario = 550;
            //b.Precio = 550;

            //mws.CreaNuevoDetalleCotizacion(b);

            GvDatos.DataBind();
            PopSitios.ShowOnPageLoad = false;
            //txtCantidad.Text = string.Empty;
            txtNombreCliente.Text = string.Empty;
            //txtPrecioVenta.Text = string.Empty;
            //txtdireccionFact.Text = string.Empty;
            //txtDirecEnvio.Text = string.Empty;
            //txtFormaDePago.Text = string.Empty;        


        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Cotizaciones";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopSitios.ShowOnPageLoad = true;              
              
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Estado");
            if (Estado == 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "aprovar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "rechazar") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = true;
                System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Informe") as System.Web.UI.WebControls.ImageButton;
                imgEnvia.Visible = true;

            }
            if (Estado == 2 ||Estado==3)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "aprovar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "rechazar") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = false;
                System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Informe") as System.Web.UI.WebControls.ImageButton;
                imgEnvia.Visible = true;

            }
            if (Estado == 4)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "aprovar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "rechazar") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = true;
                System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Informe") as System.Web.UI.WebControls.ImageButton;
                imgEnvia.Visible = true;

            }
            if (Estado == 5)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "aprovar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "rechazar") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = false;
                System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Informe") as System.Web.UI.WebControls.ImageButton;
                imgEnvia.Visible = false;
            }
        }
    }
}