using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mantencion
{
    public partial class DetalleMovimientos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 36, "Ingreso");
            }
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 36, "Boton");
            GvDatosDetmovimientosMant.AddNewRow();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 36, "Boton");
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Movimientos Detalle  " + Session["MovimientoMantencionId"].ToString();
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            int artid = Convert.ToInt32(e.NewValues["Articulo_Id"]);
            int cant = Convert.ToInt32(e.NewValues["Cantidad"]);
            int precio = Convert.ToInt32(e.NewValues["Precio"]);

            MantencionClass vMant = new MantencionClass();
            int tipo = vMant.ObtieneTipoMovimiento(Convert.ToInt32(Session["MovimientoMantencionId"]));
            if (tipo == 1)
            {
                int doc = vMant.ObtieneDocMovimiento(Convert.ToInt32(Session["MovimientoMantencionId"]));
                if (!vMant.AumentaStock(artid, cant))
                {
                    e.Cancel = true;
                }
            }
            if (tipo == 2)
            {
                if (!vMant.RebajaStock(artid, cant))
                {
                    e.Cancel = true;
                }
            }
            e.NewValues["Movimiento_Id"] = Convert.ToInt32(Session["MovimientoMantencionId"]);
            GvDatosDetmovimientosMant.DataBind();

        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int artid = Convert.ToInt32(e.Values["Articulo_Id"]);
            int cant = Convert.ToInt32(e.Values["Cantidad"]);

            MantencionClass vMant = new MantencionClass();
            int tipo = vMant.ObtieneTipoMovimiento(Convert.ToInt32(Session["MovimientoMantencionId"]));
            if (tipo == 2 || tipo == 4)
            {
                if (!vMant.AumentaStock(artid, cant))
                {
                    e.Cancel = true;
                }
            }
            if (tipo == 1 || tipo == 3)
            {
                if (!vMant.RebajaStock(artid, cant))
                {
                    e.Cancel = true;
                }
            }
            GvDatosDetmovimientosMant.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosDetmovimientosMant.SettingsExport.FileName = "Detalle Movimientos " + DateTime.Now.ToShortDateString();
            }
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Mantencion/Movimientos.aspx");
        }
    }
}