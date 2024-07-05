using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion
{
    public partial class CambioClave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Cambiar_Click(object sender, EventArgs e)
        {
            UsuarioClass user = new UsuarioClass();
            WMSClass wms = new WMSClass();
            LogClass lg = new LogClass();
            try
            {
                string clave = txt_clave.Text;
                string claveAntigua = lg.Encrypt(clave, true);

                string claveNueva = txt_claveNueva.Text;
                string claveEncrip = lg.Encrypt(claveNueva, true);

                string id = Session["CIDUsuario"].ToString();

                int idUser = user.obtenerId(id);
                int idUserwms = wms.obtenerIdUserWms(id);

                if (user.VerificaClaveEncrip(id, claveAntigua).Equals(claveAntigua))
                {
                    user.SP_actualizarContrasena(claveNueva, idUser);
                    user.SP_actualizarContrasenaEncriptada(claveEncrip, idUser);
                    wms.SP_actualizarContrasenaUserWms(claveEncrip, idUserwms);

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cambio Correcto');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Contraseña anterior No corresponde');", true);
                }

            }
            catch
            {
                lbl_error.Text = "Error: No se Actualizo Contraseña";
            }
        }
    }
}