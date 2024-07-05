﻿using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        private void CargaMenu()
        {
            DataTable menu = new DataTable();
            MenuClass vMenu = new MenuClass();
            menu = vMenu.ObtieneMenuUsuarioPorPerfil(Convert.ToInt32(Session["PerfilId"]));
            string MenuAnterior = string.Empty;
            int i = -1;
            this.MenuInnvita1.Items = new MenuItemCollection();
            foreach (DataRow rw in menu.Rows)
            {
                if (rw["Nombre_Menu"].ToString() != MenuAnterior)
                {

                    i++;
                    this.MenuInnvita1.Items.Add(new MenuItem(rw["Nombre_Menu"].ToString(), ControlesInnvita.MenuInnvita.TipoMenu.acceso.ToString()));
                    this.MenuInnvita1.Items[i].ChildItems.Add(new MenuItem(rw["Nombre_SubMenu"].ToString(), rw["URL_SubMenu"].ToString()));
                }
                else
                {
                    this.MenuInnvita1.Items[i].ChildItems.Add(new MenuItem(rw["Nombre_SubMenu"].ToString(), rw["URL_SubMenu"].ToString()));
                }
                MenuAnterior = rw["Nombre_Menu"].ToString();
            }



        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //SucursalClass vSucursal = new SucursalClass();
            CargaMenu();
            if (Session["NombreUsuario"] != null)
            {
                lblUser.Text = Session["NombreUsuario"].ToString();
                try
                {
                    //XmlDocument xDoc = new XmlDocument();
                    //xDoc.Load("http://www.indicadoresdeldia.cl/webservice/indicadores.xml");
                    //XmlNodeList indicadores = xDoc.GetElementsByTagName("indicadores");
                    //XmlNodeList monedas = ((XmlElement)indicadores[0]).GetElementsByTagName("moneda");
                    //XmlNodeList indicador = ((XmlElement)indicadores[0]).GetElementsByTagName("indicador");
                    //XmlNodeList VDolar = ((XmlElement)monedas[0]).GetElementsByTagName("dolar");
                    //XmlNodeList Veuro = ((XmlElement)monedas[0]).GetElementsByTagName("euro");
                    //XmlNodeList Vuf = ((XmlElement)indicador[0]).GetElementsByTagName("uf");
                    //XmlNodeList Vutm = ((XmlElement)indicador[0]).GetElementsByTagName("utm");
                    //lblAmbiente.Text = "DOLAR:" + VDolar[0].InnerText + " UF:" + Vuf[0].InnerText + " UTM:" + Vutm[0].InnerText;
                }
                catch
                {
                    lblAmbiente.Text = "DOLAR:S/I UF:S/I UTM:S/I";
                }
                //+ " EURO:" + Veuro[0].InnerText 
                //lblSuc.Text = vSucursal.ObtieneNombreSucursalPorID(Convert.ToInt32(Session["Global_SucursalId"]));
                //lblAmbiente.Text = "DOLAR:"+
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

            //string maquina = Request.ServerVariables["REMOTE_ADDR"].ToString();
            //string mensaje = "alert('Maquina= " + maquina + "');";
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", mensaje, true);
        }

        protected void Contactar_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Contacto.aspx");
        }
    }
}