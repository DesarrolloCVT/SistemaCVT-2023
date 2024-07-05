using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class TransferenciasEfectuasdas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataSource = Session["Opcion"];
            if (!IsPostBack)
            {
                fdesde.Date = DateTime.Now.AddDays(-14);
                fhasta.Date = DateTime.Now;
                GvDatos.DataSource = Session["Opcion"];
            }

        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            DateTime fini = Convert.ToDateTime(fdesde.Value);
            DateTime fter = Convert.ToDateTime(fhasta.Value);
            string bOrig = Convert.ToString(cbo_bodegaOrigen.Value);
            string bDest = Convert.ToString(cbo_bodegaDestino.Value);

            ControlFilmClass Cal = new ControlFilmClass();
            DataTable dt = new DataTable();
            dt = Cal.SP_TransferenciasEfectuadasFilm(fini, fter, bOrig, bDest);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["Opcion"] = dt;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Transferencias Efectuadas:" + cbo_bodegaOrigen.Value.ToString() + '-' + cbo_bodegaDestino.Value.ToString();
            }
        }
    }
}