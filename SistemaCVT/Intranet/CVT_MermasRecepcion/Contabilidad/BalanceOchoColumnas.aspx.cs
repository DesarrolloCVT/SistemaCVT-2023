using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Contabilidad
{
    public partial class BalanceOchoColumnas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["datos"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            int Ano = dteano.Date.Year;
            int mes = Convert.ToInt32(cboMes.Value);
            string tipo = Convert.ToString(cboTipo.Value);

            ContabilidadClass cCl = new ContabilidadClass();
            DataTable dt = new DataTable();
            dt = cCl.SP_Balance(Ano, mes, tipo);
            GvDatos.DataSource = dt;

            if (tipo == "SII")
            {        
                GvDatos.Columns["CodCuentaSII"].Visible = true;
                GvDatos.DataBind();
                Session["datos"] = dt;
            }
            else {
            //    ContabilidadClass cCl = new ContabilidadClass();
            //    DataTable dt = new DataTable();
            //    dt = cCl.SP_Balance(Ano, mes, tipo);
            //    GvDatos.DataSource = dt;
                GvDatos.Columns["CodCuentaSII"].Visible = false;
                GvDatos.DataBind();
                Session["datos"] = dt;
            }       

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Balance - "+ dteano.Date.Year.ToString() +" - "+cboMes.Text.ToString()+" - "+cboTipo.Value.ToString();
                
         

            }
        }
    }
}