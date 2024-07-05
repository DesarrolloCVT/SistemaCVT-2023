using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Transporte
{
    public partial class RegistroCargaUrea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteInicio.Value = DateTime.Now.AddDays(-14);
                dteTermino.Value = DateTime.Now;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Registro Carga Urea";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;

            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            TransporteClass tc = new TransporteClass();
            CVT_RegistroCargaUrea rc = new CVT_RegistroCargaUrea();

            int? t1 = null;
            int? t2 = null;


            rc.Patente = Convert.ToString(cboPatente.Value);
            rc.FechaCarga = dteFechaCarga.Date;
            rc.LitrosCargados =Convert.ToDecimal(txtLitros.Text);
            rc.NEstanque = Convert.ToInt32(cboNEstanque.Value);
            rc.Responsable =Convert.ToInt32(cboResponsable.Value);
            rc.CostoxCarga = tc.TraeCostoLitro();
            rc.Odometro = Convert.ToDecimal(txtOdometro.Text);

            int resp = tc.InsertaRegistoCargaUrea(rc);

            if (resp != 0)
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('REGISTRADO');", true);
                GvDatos.DataBind();
                limpiar();


                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Crea Registro");

                PopNuevo.ShowOnPageLoad = false;
            }
            else
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('NO SE PUEDE REGISTRAR');", true);
                limpiar();
            }
        }

        private void limpiar()
        {
            cboPatente.SelectedIndex = -1;
            txtLitros.Text = string.Empty;
            cboNEstanque.SelectedIndex = -1;
            cboResponsable.SelectedIndex = -1;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }
    }
}