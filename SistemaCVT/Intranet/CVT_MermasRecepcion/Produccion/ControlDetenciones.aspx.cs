using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class ControlDetenciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 55, "Boton");
        }

        protected void cbo_of_SelectedIndexChanged(object sender, EventArgs e)
        {
            SAPClass vSAP = new SAPClass();
            lbl_producto.Text = vSAP.ObtieneProductoOF(Convert.ToInt32(cbo_of.Value));
            GvDatos.DataBind();
        }

        protected void cbo_categoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbo_motivo.SelectedIndex = -1;
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            TimeSpan hter;
            if (txt_hrter.Text.Equals("") && txt_minter.Text.Equals(""))
            {
                hter = new TimeSpan(00, 00, 00);
            }
            else
            {
                hter = new TimeSpan(Convert.ToInt32(txt_hrter.Text), Convert.ToInt32(txt_minter.Text), 0);
            }

            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 55, "Crea Registro");
                int? salv = null;
                CVT_Detencion vNuevo = new CVT_Detencion();
                vNuevo.OF_Id = Convert.ToInt32(cbo_of.Value);
                vNuevo.Maquina = cbo_maquina.Text;
                vNuevo.Categoria_Id = Convert.ToInt32(cbo_categoria.Value);
                vNuevo.Motivo_Cod = cbo_motivo.Value.ToString();
                TimeSpan hr_ini = new TimeSpan(Convert.ToInt32(txt_hrini.Text), Convert.ToInt32(txt_minini.Text), 0);
                vNuevo.Hr_Inicio = hr_ini;
                TimeSpan hr_ter = hter; /*new TimeSpan(Convert.ToInt32(txt_hrter.Text), Convert.ToInt32(txt_minter.Text), 0);*/
                vNuevo.Hr_Termino = hr_ter;
                vNuevo.Comentario = txt_comentario.Text;
                vNuevo.Estado = 1;// 1 abierto , 2 cerrado
                vNuevo.Maq = cbo_Maq.Value == null ? salv: Convert.ToInt32(cbo_Maq.Value);
                vNuevo.Parte=cbo_parte.Value==null?salv:Convert.ToInt32(cbo_parte.Value);
                vNuevo.Componente= cbo_componente.Value==null?salv:Convert.ToInt32(cbo_componente.Value);
                ProduccionClass vProduccion = new ProduccionClass();
                vProduccion.InsertaDetencionOF(vNuevo);

                GvDatos.DataBind();
                limpiar();

            }
            catch
            {


            }
            GvDatos.DataBind();
        }

        protected void limpiar()
        {
            lbl_producto.Text = string.Empty;
            cbo_maquina.SelectedIndex = -1;
            cbo_categoria.SelectedIndex = -1;
            txt_hrini.Text = string.Empty;
            txt_minini.Text = string.Empty;
            txt_hrter.Text = string.Empty;
            txt_minter.Text = string.Empty;
            cbo_motivo.SelectedIndex = -1;
            txt_comentario.Text = string.Empty;
        }



        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            LogClass lg = new LogClass();
            //encriptar la clave que ingresa el usuario para ser comparada en la bd
            string pass = lg.Encrypt(txtContrasena.Text, true);

            UsuarioClass us = new UsuarioClass();
            int idUser = us.TraeIdUsuarioVerificador(txtUsuario.Text, pass);

            if (idUser == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Usuario no permitido para verificar');", true);
            }
            else
            {

                ProduccionClass Pro = new ProduccionClass();

                string[] param = new string[2];
                param[0] = "Detencion_Id";
                param[1] = "Comentario";

                bool res = false;
                var list = GvDatos.GetSelectedFieldValues(param);
                foreach (object[] a in list)
                {
                    res = Pro.ActualizaEstadoDetenciones(Convert.ToInt32(a[0]), 2, idUser);
                }


                if (res == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Verificado');", true);
                    txtContrasena.Text = string.Empty;
                    txtUsuario.Text = string.Empty;
                    popVerificar.ShowOnPageLoad = false;
                    cbo_of_SelectedIndexChanged(sender, EventArgs.Empty);
                    GvDatos.DataBind();

                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 55, "Valida Registro");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Verificar Contactar con Administrador');", true);
                    txtContrasena.Text = string.Empty;
                    txtUsuario.Text = string.Empty;
                    popVerificar.ShowOnPageLoad = true;
                }
            }
            GvDatos.DataBind();
        }

        protected void btnVeri_Click(object sender, EventArgs e)
        {
            popVerificar.ShowOnPageLoad = true;
        }

        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            bool ret = false;
            int Estado = (int)grid.GetRowValues(visibleindex, "Estado");
            if (Estado == 1)
            {
                ret = true;
            }
            return ret;
        }

        protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.SelectCheckbox)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }

        }

        //protected void GvDatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        //{
        //    string id = e.NewValues["Motivo_Cod"].ToString();
        //    string idc = e.NewValues["Categoria_Id"].ToString();
        //    string nn = id.Substring(0, 1);

        //    if(idc!=nn)
        //    {

        //    }
        //}

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string id = e.NewValues["Motivo_Cod"].ToString();
            string idc = e.NewValues["Categoria_Id"].ToString();
            string nn = id.Substring(0, 1);

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatos.SettingsPopup.EditForm.ShowFooter = true;
                GvDatos.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatos.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
            else 
            {
                //if (idc != nn)
                //{
                //    GvDatos.Settings.ShowTitlePanel = true;
                //    GvDatos.SettingsText.Title = "Error al actualizar motivo no pertenece a la categoria seleccionada";

                //    e.Cancel = true;
                //}
                //else
                //{
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 55, "Actualiza Registro");
                //}
            }

           

        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 55, "Elimina Registro");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

    }
}