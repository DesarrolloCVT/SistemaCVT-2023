using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mantenedores
{
    public partial class LayoutSMM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatosLayout_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosLayout.SettingsExport.FileName = "Layout SMM";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;

            }
        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Mantenedores/BodegasSMM.aspx");
        }

        protected void GvDatosLayout_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            int pas = Convert.ToInt32(e.NewValues["Layout_Y_Pasillo"]);
            int fil = Convert.ToInt32(e.NewValues["Layout_X_Fila"]);
            //int col = Convert.ToInt32(e.NewValues["Layout_Z_Columna"]);
            string srtDesc = pas + "," + fil;

            e.NewValues["Layout_Description"] = srtDesc;
            e.NewValues["Site_Id"] = Session["Site_Id"];

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
            string ub = cboUbxDef.Value.ToString();
            string Udef  = vWMS.VerificaUbcacionxDef(Convert.ToInt32(Session["Site_Id"]));
            int ExUb = vWMS.VerificaUbcacionExiste(Convert.ToInt32(Session["Site_Id"]), Convert.ToInt32(txtFila.Text), Convert.ToInt32(txtPasillo.Text));
            int CantUbicaDef = txtCantUbicaciones.Text == "" ? 0:Convert.ToInt32(txtCantUbicaciones.Text);

            if (Udef.Equals(ub))
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Esta Bodega ya Tiene Ubicacion por defecto asignada Verificar');", true);
                limpiar();
                PopNuevo.ShowOnPageLoad = false;
            }
            else if (ExUb != 0) {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Ubicacion ya existe');", true);
                limpiar();
                PopNuevo.ShowOnPageLoad = false;

            }
            else
            {         

                SMM_Layout ly = new SMM_Layout();

                int pas = Convert.ToInt32(txtPasillo.Text);
                int fil = Convert.ToInt32(txtFila.Text);
                int col = Convert.ToInt32(txtColumna.Text);
                string srtDesc = pas + "," + fil + "," + col;

                ly.Site_Id = Convert.ToInt32(Session["Site_Id"]);
                ly.Layout_Description = srtDesc;
                //  ly.Rack_Id = Convert.ToInt32(cboTipoRack.Value);
                ly.Layout_Y_Pasillo = pas;
                ly.Layout_X_Fila = fil;
                ly.Layout_Z_Columna = col;
                ly.UbicacionxDefecto = cboUbxDef.Value.ToString();
                ly.CantidadUbicaciones = CantUbicaDef;

                bool rest = vWMS.InsertaNuevoLayout(ly);

                if (rest == true)
                {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Guardado');", true);
                    limpiar();
                    PopNuevo.ShowOnPageLoad = false;

                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 247, "Crea Registro Layout SMM");
                    GvDatosLayout.DataBind();

                }

            }
        }

        private void limpiar()
        {
            txtColumna.Text = string.Empty;
            txtFila.Text = string.Empty;
            txtPasillo.Text = string.Empty;
            //cboTipoRack.SelectedIndex = -1;
            cboUbxDef.SelectedIndex = -1;
            txtCantUbicaciones.Text = string.Empty;

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            limpiar();
            PopNuevo.ShowOnPageLoad = false;
        }

        protected void GvDatosLayout_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 247, "Elimina Registro Layout SMM");
        }

        protected void GvDatosLayout_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 247, "Actualiza Registro Layout SMM");
        }

        protected void cboUbxDef_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboUbxDef.Value.Equals("Y"))
            {
                txtCantUbicaciones.ValidationSettings.RequiredField.IsRequired = false;
            }
            else {
                txtCantUbicaciones.ValidationSettings.RequiredField.IsRequired = true;
            }
        }
    }
}