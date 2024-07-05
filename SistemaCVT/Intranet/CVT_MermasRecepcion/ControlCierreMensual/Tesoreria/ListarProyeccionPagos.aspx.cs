using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class ListarProyeccionPagos : System.Web.UI.Page
    {
        DataTable _DTLista = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cb_mes.Date = DateTime.Today;
            }
            GvDatos.DataSource = Session["DTLista"];
        }


        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            TesoreriaClass vTesoreria = new TesoreriaClass();
            _DTLista = vTesoreria.SP_ListaProyeccionPagos(cb_mes.Date);
            Session["DTLista"] = _DTLista;
            GvDatos.DataSource = Session["DTLista"];
            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Proyeccion de Pagos";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Proyeccion de Pagos";
            }
        }
    }
}