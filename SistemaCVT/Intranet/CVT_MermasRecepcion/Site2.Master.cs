using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        private void CargaMenu()
        {
            DataTable menu = new DataTable();
            MenuClass vMenu = new MenuClass();
            menu = vMenu.ObtieneMenuUsuarioPorPerfil(Convert.ToInt32(Session["PerfilId"]));
            string MenuAnterior = string.Empty;
            int i = -1;
            mMain.Items.Add(new DevExpress.Web.MenuItem() { Index = 0, Text = Session["NombreUsuario"].ToString(), NavigateUrl="CambioClave.aspx", ToolTip="Cambio Clave" });
            foreach (DataRow rw in menu.Rows)
            {
                if (rw["Nombre_Menu"].ToString() != MenuAnterior)
                {

                    i++;
                    ASPxNavBar1.Groups.Add(new DevExpress.Web.NavBarGroup() { Index = i, Text = rw["Nombre_Menu"].ToString(), Expanded=false });
                    ASPxNavBar1.Groups[i].Items.Add(new DevExpress.Web.NavBarItem() { Text = rw["Nombre_SubMenu"].ToString(), NavigateUrl = rw["URL_SubMenu"].ToString() });
                   
                }
                else
                {
                    ASPxNavBar1.Groups[i].Items.Add(new DevExpress.Web.NavBarItem() { Text = rw["Nombre_SubMenu"].ToString(), NavigateUrl = rw["URL_SubMenu"].ToString() });
                }
                MenuAnterior = rw["Nombre_Menu"].ToString();
            }





        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //SucursalClass vSucursal = new SucursalClass();
            if (!IsPostBack)
            {
                if (Session["NombreUsuario"] != null)
                {
                    CargaMenu();
                }
            }
            if (Session["NombreUsuario"] != null)
            {
                
                try
                {
                   
                }
                catch
                {
                    
                }
                
            }
            else
            {
                Session.RemoveAll();
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void imgBtnCerrar_Click(object sender, ImageClickEventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Login.aspx");
        }

        protected void lblUser_Click(object sender, EventArgs e)
        {


            Response.Redirect("~/CambioClave.aspx");

            
        }

        protected void Contactar_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Contacto.aspx");
        }

        protected void BTN_CERRAR_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Login.aspx");
        }
    }
}