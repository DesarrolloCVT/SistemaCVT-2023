using DBMermasRecepcion;
using DevExpress.Web;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaProduccion
{
    public partial class SMMVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // txtDun.Focus();
            divPickear.Visible = false;

            if (!IsPostBack)
            {
                cboDireccionEnvio.SelectedIndex = 0;
                cboDireccionFacturacion.SelectedIndex = 0;

                LqsGrupoCliente.WhereParameters.Clear();
                LqsGrupoCliente.WhereParameters.Add("IdGrup", DbType.Int32, "112");
                LqsGrupoCliente.Where = "GroupCode=@IdGrup";
                cboGrupoCliente.SelectedIndex = 0;

                cboProductosinDun.SelectedIndex = -1;
            }

        }

        protected void txtDun_TextChanged(object sender, EventArgs e)
        {
            PreventaSMMClass mc = new PreventaSMMClass();

            SMM_Preventa_Detalle pr = new SMM_Preventa_Detalle();

            List<SMM_VW_DATO_BUSCAPROD_PREVENTA> lt = mc.ConsultaProductoPreventa(txtDun.Text);
            int nOrden = mc.TraeNOrdenPrev(Convert.ToInt32(Session["IdPreventa"]));


            if (lt.Count != 0)
            {
                foreach (var t in lt)
                {
                    int cod = mc.validaProdRegistradoPreVenta(t.ItemCode, Convert.ToInt32(Session["IdPreventa"]), t.UomCode);


                    if (cod == 0)
                    {
                        int cantProd = mc.CuentaLineaProducto(Convert.ToInt32(Session["IdPreventa"]));

                        if (rbTipoVenta.Value.Equals("F"))
                        {                         

                            if (cantProd <= 59)
                            {
                                pr.CodProducto = t.ItemCode;
                                pr.Producto = t.ItemName;
                                pr.Cantidad = 1;
                                pr.Precio = t.Price;
                                pr.CodBarra = t.BcdCode;
                                pr.UniMedida = t.UomCode;
                                pr.CodUniMedida = t.UomEntry;
                                pr.Preventa_ID = Convert.ToInt32(Session["IdPreventa"]);
                                pr.ByOrder = nOrden + 1;

                                mc.InsertaPreventaDetalle(pr);
                                divPickear.Visible = true;
                                txtDun.Text = string.Empty;
                                txtDun.Focus();                               
                            }
                            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Supera cantidad permitida en Factura!');", true);
                                divPickear.Visible = true;
                            }
                        }
                        else
                        {
                            pr.CodProducto = t.ItemCode;
                            pr.Producto = t.ItemName;
                            pr.Cantidad = 1;
                            pr.Precio = t.Price;
                            pr.CodBarra = t.BcdCode;
                            pr.UniMedida = t.UomCode;
                            pr.CodUniMedida = t.UomEntry;
                            pr.Preventa_ID = Convert.ToInt32(Session["IdPreventa"]);
                            pr.ByOrder = nOrden + 1;

                            mc.InsertaPreventaDetalle(pr);
                            divPickear.Visible = true;
                            txtDun.Text = string.Empty;
                            txtDun.Focus();
                        }

                        //int totProd = cantProd + 1;
                        //lblCantidadProd.Text = "Cantidad de Productos" + ": " + totProd;
                    }
                    else
                    {
                        mc.ActualizaCantidadPreventa(Convert.ToInt32(Session["IdPreventa"]), t.ItemCode, 1, t.UomCode);
                        divPickear.Visible = true;
                        txtDun.Text = string.Empty;
                        txtDun.Focus();


                    }
                }             

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de producto no existe!');", true);
                divPickear.Visible = true;
                txtDun.Text = string.Empty;
                txtDun.Focus();
            }
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            if (Convert.ToInt32(e.NewValues["Descuento"]) > 5)
            {
                e.Cancel = true;
            }
            GvDatos.DataBind();
        }

        protected void ASPxButtonEdit1_ButtonClick(object source, DevExpress.Web.ButtonEditClickEventArgs e)
        {
            switch (e.ButtonIndex)
            {
                case 0:
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Edito Cliente en Construccion ');", true);
                    break;
                default:
                    //PopNuevo.ShowOnPageLoad = true;
                    //citiesTabPage.ActiveTabIndex = 0;
                    //txtRutCliNew.Focus();
                    //btnCrearNewCli.Enabled = true;
                    Response.Redirect("SMMCreaCliente.aspx");
                    break;
            }
        }

        protected void rbTipoVenta_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbTipoVenta.Value.Equals("B"))
            {
                txtBusCliente.Focus();
            }
            else
            {

                txtBusCliente.Focus();
            }
        }

        protected void txtBusCliente_TextChanged(object sender, EventArgs e)
        {
            PreventaSMMClass mc = new PreventaSMMClass();

            if (txtBusCliente.Text.Equals("") || txtBusCliente.Text == null)
            {
                txtCodigoCliente.Text = "C66666666-6";
                txtIdentificador.Text = "66666666-6";
                txtTelefono.Text = "984321168";
                txtNombreCliente.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtBusCliente.Text = string.Empty;
                rbTipoVenta.SelectedIndex = -1;
                rbTipoVenta.Focus();
                if (IsPostBack)
                {
                    LqsGrupoCliente.WhereParameters.Clear();
                    LqsGrupoCliente.WhereParameters.Add("IdGrup", DbType.Int32, "112");
                    LqsGrupoCliente.Where = "GroupCode=@IdGrup";

                    cboDireccionEnvio.SelectedIndex = 0;
                    cboDireccionFacturacion.SelectedIndex = 0;
                    cboGrupoCliente.SelectedIndex = 0;



                }
            }
            else {
                List<SMM_VW_INFO_CLIENTE_PREVENTA> ls = mc.ConsultaClientePreventa(txtBusCliente.Text);

                if (ls.Count != 0)
                {
                    foreach (var t in ls)
                    {
                        LqsGrupoCliente.WhereParameters.Clear();
                        LqsGrupoCliente.WhereParameters.Add("IdGrup", DbType.Int32, t.CodGrupCliente.ToString());
                        LqsGrupoCliente.Where = "GroupCode=@IdGrup";

                        txtCodigoCliente.Text = t.CodCliente;
                        txtNombreCliente.Text = t.NombreCliente;
                        txtIdentificador.Text = t.RutCliente;
                        txtTelefono.Text = t.Telefono;
                        txtEmail.Text = t.E_Mail;
                        cboDireccionEnvio.SelectedIndex = 0;
                        cboDireccionFacturacion.SelectedIndex = 0;
                        cboGrupoCliente.SelectedIndex = 0;
                        Session["GrupoCli"] = t.CodGrupCliente;
                    }
                }
                else
                {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cliente no existe o no se puede encontrar , favor verificar o registrar');", true);
                }

            }

        }

        protected void btnPickear_Click(object sender, EventArgs e)
        {
            PreventaSMMClass mcc = new PreventaSMMClass();


            string codEnv = mcc.VerificaDireccionCliente(txtCodigoCliente.Text, "S");
            string codFac= mcc.VerificaDireccionCliente(txtCodigoCliente.Text, "B");

           string d1 = cboDireccionFacturacion.Value == null ? "0" : cboDireccionFacturacion.Value.ToString(); /*sp.ObtieneNombreDireccionCliente(txtCodigoCliente.Text, "S");*/
           string d2 = cboDireccionEnvio.Value == null ? "0" : cboDireccionEnvio.Value.ToString();

            if (codEnv.Equals(d2) && codFac.Equals(d1) )
            {
                try
                {

                    PreventaSMMClass mc = new PreventaSMMClass();
                    SMM_Preventa p = new SMM_Preventa();
                    SAPSMM sp = new SAPSMM();

                    p.CodigoCliente = txtCodigoCliente.Text;
                    p.DireccionFact = cboDireccionFacturacion.Value == null ? null : cboDireccionFacturacion.Value.ToString(); /*sp.ObtieneNombreDireccionCliente(txtCodigoCliente.Text, "S");*/
                    p.DireccionEnvio = cboDireccionEnvio.Value == null ? null : cboDireccionEnvio.Value.ToString(); /*sp.ObtieneNombreDireccionCliente(txtCodigoCliente.Text, "B");*/
                    p.RunCliente = txtIdentificador.Text;
                    p.Telefono = txtTelefono.Text;
                    p.Email = txtEmail.Text;
                    p.TipoVenta = rbTipoVenta.Value.ToString();
                    p.GrupoCliente = mc.TraeGrupoCliente(txtCodigoCliente.Text);
                    p.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    Session["IdPreventa"] = mc.InsertaPreventaCabecera(p);
                    // int s =Convert.ToInt32(Session["IdPreventa"]);
                    divPickear.Visible = true;
                    txtDun.Focus();
                    roundCliente.Collapsed = true;
                    roundCliente.HeaderText = "Cliente : " + txtNombreCliente.Text;
                    btnPickear.Enabled = false;

                }
                catch { }

                if (txtCodigoCliente.Text == "C66666666-6")
                {
                    GvDatos.Columns["Descuento"].Visible = false;
                }
                else { GvDatos.Columns["Desc"].Visible = false; }

                mcc.ActualizaEstadoPreventa(Convert.ToInt32(Session["IdPreventa"]), 1);
                divDatos_Client.Visible = true;
                lblCantidadProd.Text = string.Empty;
            }
            else {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Direccion Cliente No Encontrada, favor verificar o registrar');", true);
            }


          

        }

        protected void btnBuscarProducto_Click(object sender, EventArgs e)
        {
            divPickear.Visible = true;
        }

        protected void btnAgregaProdSinDun_Click(object sender, EventArgs e)
        {

            if (cboProductosinDun.Value != null)
            {
                divPickear.Visible = true;

                PreventaSMMClass mc = new PreventaSMMClass();
                SMM_Preventa_Detalle pr = new SMM_Preventa_Detalle();

                string[] co = new string[2];
                string cP = cboProductosinDun.Value.ToString();
                co = cP.Split(';');

                string coPro = co[0].ToString();
                string uMed = co[1].ToString().Trim();


                List<SMM_VW_DATO_BUSCAPROD_PREVENTA> lt = mc.BusquedaProductoSinDun(coPro, uMed);


                int cod = mc.validaProdRegistradoPreVenta(coPro, Convert.ToInt32(Session["IdPreventa"]), uMed);
                int nOrden = mc.TraeNOrdenPrev(Convert.ToInt32(Session["IdPreventa"]));
           

                if (cod == 0)
                {
                    int cantProd = mc.CuentaLineaProducto(Convert.ToInt32(Session["IdPreventa"]));

                    if (rbTipoVenta.Value.Equals("F"))
                    {
                     
                        if (cantProd <= 59)
                        {
                            foreach (var t in lt)
                            {
                                pr.CodProducto = t.ItemCode;
                                pr.Producto = t.ItemName;
                                pr.Cantidad = 1;
                                pr.Precio = t.Price;
                                pr.CodBarra = t.BcdCode;
                                pr.UniMedida = t.UomCode;
                                pr.CodUniMedida = t.UomEntry;
                                pr.Preventa_ID = Convert.ToInt32(Session["IdPreventa"]);
                                pr.ByOrder = nOrden + 1;

                                mc.InsertaPreventaDetalle(pr);
                                divPickear.Visible = true;
                                txtDun.Text = string.Empty;
                                cboProductosinDun.SelectedIndex = -1;
                                //cboProductosinDun.Text = string.Empty;
                                txtDun.Focus();

                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Supera cantidad permitida en Factura!');", true);
                            divPickear.Visible = true;
                        }
                    }
                    else
                    {
                        foreach (var t in lt)
                        {
                            pr.CodProducto = t.ItemCode;
                            pr.Producto = t.ItemName;
                            pr.Cantidad = 1;
                            pr.Precio = t.Price;
                            pr.CodBarra = t.BcdCode;
                            pr.UniMedida = t.UomCode;
                            pr.CodUniMedida = t.UomEntry;
                            pr.Preventa_ID = Convert.ToInt32(Session["IdPreventa"]);
                            pr.ByOrder = nOrden + 1;

                            mc.InsertaPreventaDetalle(pr);
                            divPickear.Visible = true;
                            txtDun.Text = string.Empty;
                            cboProductosinDun.SelectedIndex = -1;
                            //cboProductosinDun.Text = string.Empty;
                            txtDun.Focus();

                        }
                    }

                    //int totProd = cantProd + 1;
                    //lblCantidadProd.Text = "Cantidad de Productos" + ": " + totProd;
                }
                else
                {
                    foreach (var t in lt)
                    {

                        mc.ActualizaCantidadPreventa(Convert.ToInt32(Session["IdPreventa"]), t.ItemCode, 1, uMed);
                        divPickear.Visible = true;
                        txtDun.Text = string.Empty;
                        cboProductosinDun.SelectedIndex = -1;
                        //cboProductosinDun.Text = string.Empty;
                        txtDun.Focus();
                    }
                }

            

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Seleccione Producto!');", true);
                divPickear.Visible = true;

            }

        }

        protected void btnCrearNewCli_Click(object sender, EventArgs e)
        {
            PopConfirmaCreaCliente.ShowOnPageLoad = true;
        }

        protected void txtRutCliNew_TextChanged(object sender, EventArgs e)
        {
            PreventaSMMClass mc = new PreventaSMMClass();
            List<SMM_VW_INFO_CLIENTE_PREVENTA> ls = mc.ConsultaClientePreventaNuevo(txtRutCliNew.Text);


            bool vrut = ValidacionClass.ValidaRut(txtRutCliNew.Text);

            if (vrut == true)
            {
                if (ls.Count != 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cliente ya existe');", true);
                    txtRutCliNew.Text = string.Empty;
                    txtRutCliNew.Focus();

                }
                else
                {
                    txtCodCliNew.Text = txtRutCliNew.Text;
                    txtNombreCliNew.Focus();

                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Ingrese Rut Valido');", true);
                txtRutCliNew.Text = string.Empty;
                txtRutCliNew.Focus();
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            txtRutCliNew.Text = string.Empty;
            txtNombreCliNew.Text = string.Empty;
            txtCodCliNew.Text = string.Empty;
            txtRazonCliNew.Text = string.Empty;
            cboGrupoClienteNew.SelectedIndex = -1;
            txtGirocliNew.Text = string.Empty;
            txtTelefonoCliNew.Text = string.Empty;
            txtEmailCliNew.Text = string.Empty;

            PopNuevo.ShowOnPageLoad = false;
        }

        protected void CancelarDir_Click(object sender, EventArgs e)
        {
            txtRutCliNew.Text = string.Empty;
            txtNombreCliNew.Text = string.Empty;
            txtCodCliNew.Text = string.Empty;
            txtRazonCliNew.Text = string.Empty;
            cboGrupoClienteNew.SelectedIndex = -1;
            txtGirocliNew.Text = string.Empty;
            txtTelefonoCliNew.Text = string.Empty;
            txtEmailCliNew.Text = string.Empty;
            cboRegionNewCli.SelectedIndex = -1;
            txtCiudadCliNew.Text = string.Empty;
            txtComunaCliNew.Text = string.Empty;
            txtEmailCliNew.Text = string.Empty;
            cboTipoDireccionNew.SelectedIndex = -1;
            txtDireccionCliNew.Text = string.Empty;
            chkDatFacturacion.Checked = false;

            PopNuevo.ShowOnPageLoad = false;
        }

        protected void btnAgregarDir_Click(object sender, EventArgs e)
        {
            PreventaSMMClass mc = new PreventaSMMClass();

            SMM_Clientes_Direccion c = new SMM_Clientes_Direccion();

            c.CodCliente = Session["CodCliNew"].ToString();
            c.Direccion = txtDireccionCliNew.Text;
            c.Region = Convert.ToInt32(cboRegionNewCli.Value);
            c.Ciudad = txtCiudadCliNew.Text;
            c.Comuna = txtComunaCliNew.Text;
            c.TipoDir = cboTipoDireccionNew.Value.ToString();
            string rn = mc.InsertaDireccionCliente(c);

            if (chkDatFacturacion.Checked == true)
            {
                SMM_Clientes_Direccion cc = new SMM_Clientes_Direccion();

                cc.CodCliente = Session["CodCliNew"].ToString();
                cc.Direccion = txtDireccionCliNew.Text;
                cc.Region = Convert.ToInt32(cboRegionNewCli.Value);
                cc.Ciudad = txtCiudadCliNew.Text;
                cc.Comuna = txtComunaCliNew.Text;
                cc.TipoDir = "B";

                string rr = mc.InsertaDireccionCliente(cc);
                //if (rr != "")
                //{
                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Direccion Facturacion Registrada');", true);
                //}
            }

            if (rn != "")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Direccion Registrada');", true);
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al registrar direccion');", true); }

            GvDatosDireccion.DataBind();
            cboRegionNewCli.SelectedIndex = -1;
            txtCiudadCliNew.Text = string.Empty;
            txtComunaCliNew.Text = string.Empty;
            cboTipoDireccionNew.SelectedIndex = -1;
            txtDireccionCliNew.Text = string.Empty;
            chkDatFacturacion.Checked = false;


            //citiesTabPage.ActiveTabIndex = 1;
            //Session["CodCliNew"] = txtCodCliNew.Text;
            //btnCrearNewCli.Enabled = false;
        }

        protected void btnContinuarCli_Click(object sender, EventArgs e)
        {
            citiesTabPage.ActiveTabIndex = 1;
            Session["CodCliNew"] = cboSiglaCliente.Value.ToString() + txtCodCliNew.Text;

            string cod_ = Session["CodCliNew"].ToString();
        }

        protected void btnAnular_Click(object sender, EventArgs e)
        {

            popAnulaPreventa.ShowOnPageLoad = true;
            divPickear.Visible = true;


        }

        protected void GvDatos_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
           
            GvDatos.DataBind();
        
        }

        protected void btnSiAnula_Click(object sender, EventArgs e)
        {
            int idPrev = Convert.ToInt32(Session["IdPreventa"]);

            PreventaSMMClass pv = new PreventaSMMClass();

            int resB = pv.EliminaProductosPreventa(idPrev);
            if (resB != 0)
            {
                int resC = pv.EliminaPreventa(idPrev);

                if (resC != 0)
                {
                    txtCodigoCliente.Text = "C66666666-6";
                    txtIdentificador.Text = "66666666-6";
                    txtTelefono.Text = "984321168";
                    txtNombreCliente.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtBusCliente.Text = string.Empty;
                    rbTipoVenta.SelectedIndex = -1;
                    rbTipoVenta.Focus();
                    if (IsPostBack)
                    {
                        LqsGrupoCliente.WhereParameters.Clear();
                        LqsGrupoCliente.WhereParameters.Add("IdGrup", DbType.Int32, "112");
                        LqsGrupoCliente.Where = "GroupCode=@IdGrup";

                        cboDireccionEnvio.SelectedIndex = 0;
                        cboDireccionFacturacion.SelectedIndex = 0;
                        cboGrupoCliente.SelectedIndex = 0;



                    }

                    roundCliente.Collapsed = false;
                    roundCliente.HeaderText = string.Empty;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Anulado !');", true);
                    popAnulaPreventa.ShowOnPageLoad = false;
                    btnPickear.Enabled = true;


                }
            }
        }

        protected void btnNoAnula_Click(object sender, EventArgs e)
        {
            divPickear.Visible = true;
            popAnulaPreventa.ShowOnPageLoad = false;
            txtDun.Focus();
        }

        protected void btnConfirmaCreaClienteNo_Click(object sender, EventArgs e)
        {
            PreventaSMMClass mc = new PreventaSMMClass();

            SMM_Clientes c = new SMM_Clientes();
            c.Rut = txtRutCliNew.Text;
            c.Nombre = txtNombreCliNew.Text;
            c.Codigo = Session["CodCliNew"].ToString();
            c.RazonSocial = txtRazonCliNew.Text;
            c.GrupoCliente = Convert.ToInt32(cboGrupoClienteNew.Value);
            c.Giro = txtGirocliNew.Text;
            c.Telefono = txtTelefonoCliNew.Text;
            c.Email = txtEmailCliNew.Text;
            string rn = mc.InsertaNuevoCliente(c);

            PostVentasBMasClass ps = new PostVentasBMasClass();

            string rest = ps.CreaSocioNegocio(Session["CodCliNew"].ToString());


            if (rest.Equals("0"))
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cliente Registrado');", true);

                txtRutCliNew.Text = string.Empty;
                txtNombreCliNew.Text = string.Empty;
                txtCodCliNew.Text = string.Empty;
                txtRazonCliNew.Text = string.Empty;
                cboGrupoClienteNew.SelectedIndex = -1;
                cboSiglaCliente.SelectedIndex = 0;
                txtGirocliNew.Text = string.Empty;
                txtTelefonoCliNew.Text = string.Empty;
                txtEmailCliNew.Text = string.Empty;
                cboRegionNewCli.SelectedIndex = -1;
                txtCiudadCliNew.Text = string.Empty;
                txtComunaCliNew.Text = string.Empty;
                txtEmailCliNew.Text = string.Empty;
                cboTipoDireccionNew.SelectedIndex = -1;
                txtDireccionCliNew.Text = string.Empty;
                chkDatFacturacion.Checked = false;
                citiesTabPage.ActiveTabIndex = 0;
                PopConfirmaCreaCliente.ShowOnPageLoad = false;
                PopNuevo.ShowOnPageLoad = false;

            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Cliente'('" + rest + "'));", true); }
        }

        protected void btnConfirmaCreaClienteSi_Click(object sender, EventArgs e)
        {
            PopConfirmaCreaCliente.ShowOnPageLoad = false;
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {

            PreventaSMMClass pv = new PreventaSMMClass();
            pv.ActualizaEstadoPreventa(Convert.ToInt32(Session["IdPreventa"]), 1);

            string javaScript = "printReport()";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);

            txtCodigoCliente.Text = "C66666666-6";
            txtIdentificador.Text = "66666666-6";
            txtTelefono.Text = "984321168";
            txtNombreCliente.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtBusCliente.Text = string.Empty;
            rbTipoVenta.SelectedIndex = -1;
            if (IsPostBack)
            {
                cboDireccionEnvio.SelectedIndex = 0;
                cboDireccionFacturacion.SelectedIndex = 0;
                LqsGrupoCliente.WhereParameters.Clear();
                LqsGrupoCliente.WhereParameters.Add("IdGrup", DbType.Int32, "112");
                LqsGrupoCliente.Where = "GroupCode=@IdGrup";
                cboGrupoCliente.SelectedIndex = 0;


            }

            roundCliente.Collapsed = false;
            roundCliente.HeaderText = string.Empty;
            rbTipoVenta.Focus();
            btnPickear.Enabled = true;

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDescEspecial")
            {
                Session["KeyDesc"] = e.KeyValue.ToString();
                PopDesc.ShowOnPageLoad = true;
                // Response.Redirect("~/Calidad/Inspecciones/InspeccionArrozDetalle.aspx");
            }
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

                PreventaSMMClass pr = new PreventaSMMClass();
                //string verif = Convert.ToString(Session["NombreUsuario"]);

                string[] co = new string[2];
                string cP = Session["KeyDesc"].ToString();
                co = cP.Split('|');

                int PrevID = Convert.ToInt32(co[0].ToString());
                string CodPro = co[1].ToString().Trim();
                string UMed = co[2].ToString().Trim();

                if (Convert.ToInt32(txtDescuentoEsp.Text) > 100)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Descuento no puede superar el 100%');", true);
                }
                else
                {


                    bool res = pr.ActualizaDescuentoPrev(PrevID, CodPro, UMed, Convert.ToInt32(txtDescuentoEsp.Text));

                    if (res == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);
                        GvDatos.DataBind();
                        txtContrasena.Text = string.Empty;
                        txtUsuario.Text = string.Empty;
                        txtDescuentoEsp.Text = string.Empty;
                        PopDesc.ShowOnPageLoad = false;
                        divPickear.Visible = true;
                        txtDun.Focus();
                        roundCliente.Collapsed = true;
                        if (txtCodigoCliente.Text == "C66666666-6")
                        {
                            GvDatos.Columns["Descuento"].Visible = false;
                        }
                        else { GvDatos.Columns["Desc"].Visible = false; }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Verificar Contactar con Administrador');", true);
                        txtContrasena.Text = string.Empty;
                        txtUsuario.Text = string.Empty;
                        PopDesc.ShowOnPageLoad = true;
                        if (txtCodigoCliente.Text == "C66666666-6")
                        {
                            GvDatos.Columns["Descuento"].Visible = false;
                        }
                        else { GvDatos.Columns["Desc"].Visible = false; }
                    }
                }

            }
        }

        protected void btnCancela_Click(object sender, EventArgs e)
        {
            PopDesc.ShowOnPageLoad = false;
            divPickear.Visible = true;
            txtDun.Focus();
            roundCliente.Collapsed = true;
            if (txtCodigoCliente.Text == "C66666666-6")
            {
                GvDatos.Columns["Descuento"].Visible = false;
            }
            else { GvDatos.Columns["Desc"].Visible = false; }
        }

        protected void btnReimprimir_Click(object sender, EventArgs e)
        {
            string javaScript = "printReport()";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);
            Session["IdPreventa"] = txtNPreventaImp.Text;
        }
    }
}