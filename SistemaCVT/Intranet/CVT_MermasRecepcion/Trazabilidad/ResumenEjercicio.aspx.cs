using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Trazabilidad
{
    public partial class ResumenEjercicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["DT"];
                GvDatos.DataBind();
            }
        }



        protected void btn_generar_Click1(object sender, EventArgs e)
        {
            try
            {
                TrazabilidadClass vTraza = new TrazabilidadClass();
                int TipoProducto = Convert.ToInt32(Rb_TipoProducto.Value);

                DataTable dt = vTraza.ObtieneEjercicioTrazabilidad(TipoProducto, Txt_Lote.Text);
                Session["DT"] = dt;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();

            }
            catch
            {

            }
        }
        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Trazabilidad Lote " + Txt_Lote.Text;
            Options.SheetName = this.ASPxGridViewExporter1.FileName;
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }
    }
}