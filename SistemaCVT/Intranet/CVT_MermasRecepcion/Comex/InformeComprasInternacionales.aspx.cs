using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Comex
{
    public partial class InformeComprasInternacionales : System.Web.UI.Page
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


        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Compras  Internacionales -"+lblInforme.Text;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void cboTipoInforme_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tipo = Convert.ToInt32(cboTipoInforme.Value);
            ComexClass cCom = new ComexClass();
            DataTable dt = new DataTable();


            if (tipo == 1)
            {
                dt = cCom.SP_ComprasinternacionalesProgramaSemanal(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteFtermino.Value));
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["Opcion"] = dt;

                lblInforme.Text = "INFORME PROGRAMA SEMANAL";
                cboTipoInforme.SelectedIndex = -1;
            }
            if (tipo == 2)
            {
                dt = cCom.SP_ComprasEmbarquesMaritimos(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteFtermino.Value));
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["Opcion"] = dt;

                lblInforme.Text = "EMBARQUES MARITIMOS ";
                cboTipoInforme.SelectedIndex = -1;
            }
            if (tipo == 3)
            {
                dt = cCom.SP_Informe40(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteFtermino.Value));
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["Opcion"] = dt;

                lblInforme.Text = "INFORME SEMANAL";
                cboTipoInforme.SelectedIndex = -1;
            }
            if (tipo == 4)
            {
                dt = cCom.SP_ComprasLlegados(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteFtermino.Value));
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["Opcion"] = dt;
                lblInforme.Text = "INFORME LLEGADOS";
                cboTipoInforme.SelectedIndex = -1;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Compras  Internacionales -" + lblInforme.Text;
            }
        }
    }
}