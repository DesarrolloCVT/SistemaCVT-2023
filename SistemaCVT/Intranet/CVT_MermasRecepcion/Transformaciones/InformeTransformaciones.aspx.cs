using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Transformaciones
{
    public partial class InformeTransformaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Opcion"];

            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            TransformacionesClass Ts = new TransformacionesClass();
            DataTable dt = new DataTable();

            int ntran = 0;
            if (txtNTransformacion.Text.Equals(""))
            {
                ntran = 0;
            }
            else { ntran = Convert.ToInt32(txtNTransformacion.Text); }


            dt = Ts.SP_InfTransformacionesFull(Convert.ToDateTime(dteDesde.Value), Convert.ToDateTime(dteHasta.Value), ntran);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["opcion"] = dt;

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.ExportXlsxToResponse("Informe Transformaciones", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Transformaciones";
            }
        }
    }
}