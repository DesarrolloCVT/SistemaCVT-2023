using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.PRiesgo
{
    public partial class PermisoTrabajoSeguro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                dteFechaInicio.Value = DateTime.Now.AddDays(-14);
                dteTermino.Value = DateTime.Now;
               
            }
               
           
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                PRiesgosClass pr = new PRiesgosClass();
                popNPts.ShowOnPageLoad = true;

              

                //Session["IdPTS"] = pr.InsertaPreReg(p);

                ////dteFechReg.Date = DateTime.Now;
                ///
                FileUpload1.Visible = false;

            }
        }

        protected void FileUpload1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
          

            try
            {
                string name = e.UploadedFile.FileName;
                e.UploadedFile.SaveAs(@"\\BIGEL\\PERMISOS DE TRABAJO\\" + "PTS " + Session["IdPTS"].ToString() + "_" + name);
                string ruta = @"\\BIGEL\\PERMISOS DE TRABAJO\\" +"PTS "+ Session["IdPTS"].ToString() + "_" + name;

                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                CVT_PermisoTrabajoSeguro_PTS vRutaPts = new CVT_PermisoTrabajoSeguro_PTS();
                PRiesgosClass pr = new PRiesgosClass();
                vRutaPts.Id_Pts = Convert.ToInt32(Session["IdPTS"]);
                vRutaPts.Ruta = ruta;
                vRutaPts.NombreArchivo = nombre1;
                vRutaPts.Extencion = Ext1;
                pr.InsertaRegistroRutaArchivoPTS(vRutaPts);
                GvDatoPTS.DataBind();

              
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);
            }

            catch (Exception ex)
            {
                string ms = ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
            }

            GvDatoPTS.DataBind();
        }

        protected void btnRefrescar_Click(object sender, EventArgs e)
        {
            GvDatoPTS.DataBind();
            FileUpload1.Visible = false;
        }

        protected void GvDatoPTS_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            PRiesgosClass pr = new PRiesgosClass();
            int val = Convert.ToInt32(e.Values["ID_Archivo"]);
            string nom = pr.BuscaNombreArchivoPTS(val);
            string rutaEl = @"\\BIGEL\\PERMISOS DE TRABAJO\\" + nom;
            File.Delete(rutaEl);

            
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            int val = Convert.ToInt32(Session["IdPTS"]);     
            PRiesgosClass pr = new PRiesgosClass();
            pr.eliminaNuevoPermiso(val);
          
           
            
            int idArch = pr.BuscaIDPTArch(val);

            if (idArch != 0)
            {
                string nom = pr.BuscaNombreArchivoPTS(idArch);
                string rutaEl = @"\\BIGEL\\PERMISOS DE TRABAJO\\" + nom;
                File.Delete(rutaEl);
                pr.eliminaRegArchPTS(idArch);
                //cargaDatos();
                PopNuevo.ShowOnPageLoad = false;
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
                GvDatoPTS.DataBind();

                txtEmpresa.Text = string.Empty;
                txtAreaTrabajo.Text = string.Empty;
                txtTarea.Text = string.Empty;
                txtResponsable.Text = string.Empty;
                txtTipoTrabajo.Text = string.Empty;
                txtComentarios.Text = string.Empty;
                //txtNPts.Text = string.Empty;

            }
            else
            {
                PopNuevo.ShowOnPageLoad = false;
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
                GvDatoPTS.DataBind();

                txtEmpresa.Text = string.Empty;
                txtAreaTrabajo.Text = string.Empty;
                txtTarea.Text = string.Empty;
                txtResponsable.Text = string.Empty;
                txtTipoTrabajo.Text = string.Empty;
                txtComentarios.Text = string.Empty;
                //txtNPts.Text = string.Empty;
            }

            GvDatos.DataBind();
           

        }

        protected void btnVerSubir_Click(object sender, EventArgs e)
        {
            FileUpload1.Visible = true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            PRiesgosClass pr = new PRiesgosClass();

            bool rest = pr.RegistraDatosPTS(txtEmpresa.Text, txtAreaTrabajo.Text, txtTarea.Text, txtResponsable.Text, txtTipoTrabajo.Text,Convert.ToDateTime(FInicio.Value),Convert.ToDateTime(FTermino.Value), "Iniciado", txtComentarios.Text, Convert.ToInt32(Session["IdPTS"]));

            if(rest==true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);
                GvDatos.DataBind();

                txtEmpresa.Text = string.Empty;
                txtAreaTrabajo.Text = string.Empty;
                txtTarea.Text = string.Empty;
                txtResponsable.Text = string.Empty;
                txtTipoTrabajo.Text = string.Empty;
                txtComentarios.Text = string.Empty;

                PopNuevo.ShowOnPageLoad = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL REGISTRAR VAFOR VERIFICAR O CONTACTAR CON ADMINISTRADOR DEL SISTEMA');", true);
            }

            GvDatos.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdVerPTS")
            {
                Session["IdPTS"] = e.KeyValue;

                PRiesgosClass pr = new PRiesgosClass();

                string est = pr.BuscaEstadoPts(Convert.ToInt32(Session["IdPTS"]));

                if (est.Equals("Iniciado"))
                {
                    ASPxUploadControl2.Visible = true;

                }
                else { ASPxUploadControl2.Visible = false; }
                popListaPTS.ShowOnPageLoad = true;

                //PRiesgosClass pr = new PRiesgosClass();

                //string ruta = pr.BuscaRutaArchPTS(Convert.ToInt32(e.KeyValue));

                //Response.Clear();
                //Response.ContentType = @"application\octet-stream";
                //System.IO.FileInfo file = new System.IO.FileInfo(ruta);
                //Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                //Response.AddHeader("Content-Length", file.Length.ToString());

                //Response.WriteFile(file.FullName);
                //Response.Flush();


            }
            if (e.CommandArgs.CommandName == "cmdAddAST")
            {
                Session["IdPTS"] = e.KeyValue;
                Response.Redirect("~/PRiesgo/PermisoTrabajoSeguroAST.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdVerificado")
            {
                popVerificar.ShowOnPageLoad = true;
                Session["IdPTS"] = Convert.ToInt32(e.KeyValue);

            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            //CalidadClass Cal = new CalidadClass();
            PRiesgosClass pr = new PRiesgosClass();
            //string verif = Convert.ToString(Session["NombreUsuario"]);

            int idIsn = Convert.ToInt32(Session["IdPTS"]);
            bool res = pr.ActualizaEstadoPermiso(idIsn, "Terminado", Convert.ToInt32(Session["IDCVTUsuario"]));

            if (res == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Terminado');", true);
                GvDatos.DataBind();
                txtContrasena.Text = string.Empty;
                txtUsuario.Text = string.Empty;
                popVerificar.ShowOnPageLoad = false;

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Terminar Contactar con Administrador');", true);
                txtContrasena.Text = string.Empty;
                txtUsuario.Text = string.Empty;
                popVerificar.ShowOnPageLoad = true;
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                string Estado = (string)e.GetValue("Estado");
                //int idPerf = Convert.ToInt32(Session["PerfilId"]);

                if (Estado.Equals("Iniciado"))
                {
                    System.Web.UI.WebControls.ImageButton imgValidacion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Verificado") as System.Web.UI.WebControls.ImageButton;
                    //System.Web.UI.WebControls.ImageButton imgPdf = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detallePdf") as System.Web.UI.WebControls.ImageButton;
                    imgValidacion.Visible = true;
                    //imgPdf.Visible = true;

                }
                else if (Estado.Equals("Terminado"))
                {
                    System.Web.UI.WebControls.ImageButton imgValidacion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Verificado") as System.Web.UI.WebControls.ImageButton;
                    //System.Web.UI.WebControls.ImageButton imgPdf = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detallePdf") as System.Web.UI.WebControls.ImageButton;
                    imgValidacion.Visible = false;
                    //imgPdf.Visible = true;
                }
            }
        }

        protected void btnInicioRegistro_Click(object sender, EventArgs e)
        {
          

            CVT_PermisoTrabajoSeguro p = new CVT_PermisoTrabajoSeguro();
            PRiesgosClass pr = new PRiesgosClass();

            int idp = pr.BuscaIdPts(Convert.ToInt32(txtNumeroTrabajo.Text));

            if (idp == 0)
            {
                //Session["IdPTS"] = pr.CuentaCantRegPTS();
                //p.Id_Pts = Convert.ToInt32(Session["IdPTS"]);
                p.FechaRegistro = DateTime.Now;
                p.ID_UsuarioRegistra = Convert.ToInt32(Session["IDCVTUsuario"]);
                p.FechaInicio = DateTime.Now;
                p.FechaTermino = DateTime.Now;
                p.TotalAST = 0;
                p.Estado = "Iniciado";
                p.Id_Pts = Convert.ToInt32(txtNumeroTrabajo.Text);
                Session["IdPTS"] = Convert.ToInt32(txtNumeroTrabajo.Text);



                pr.InsertaPreReg(p);

                //Session["IdPTS"] = pr.InsertaPreReg(p);

                ////dteFechReg.Date = DateTime.Now;
                ///
                FileUpload1.Visible = false;
                popNPts.ShowOnPageLoad = false;
                PopNuevo.ShowOnPageLoad = true;
            }
            else {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('PTS ya se encuentra registrada favor verificar');", true);
            }

            
        }

        protected void ASPxUploadControl2_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            try
            {
                string name = e.UploadedFile.FileName;
                e.UploadedFile.SaveAs(@"\\BIGEL\\PERMISOS DE TRABAJO\\" + "PTS " + Session["IdPTS"].ToString() + "_" + name);
                string ruta = @"\\BIGEL\\PERMISOS DE TRABAJO\\" + "PTS " + Session["IdPTS"].ToString() + "_" + name;

                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                CVT_PermisoTrabajoSeguro_PTS vRutaPts = new CVT_PermisoTrabajoSeguro_PTS();
                PRiesgosClass pr = new PRiesgosClass();
                vRutaPts.Id_Pts = Convert.ToInt32(Session["IdPTS"]);
                vRutaPts.Ruta = ruta;
                vRutaPts.NombreArchivo = nombre1;
                vRutaPts.Extencion = Ext1;
                pr.InsertaRegistroRutaArchivoPTS(vRutaPts);
                GvDatoPTS.DataBind();


                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);
            }

            catch (Exception ex)
            {
                string ms = ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
            }

            GvDatoPTS.DataBind();
        }

        protected void btnRecargar_Click(object sender, EventArgs e)
        {
            GvDatoPTS0.DataBind();
        }

        protected void GvDatoPTS0_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            PRiesgosClass pr = new PRiesgosClass();
            int val = Convert.ToInt32(e.Values["ID_Archivo"]);
            string nom = pr.BuscaNombreArchivoPTS(val);
            string rutaEl = @"\\BIGEL\\PERMISOS DE TRABAJO\\" + nom;
            File.Delete(rutaEl);
        }

        protected void GvDatoPTS0_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdVerPermiso")
            {
                Session["IdPTS"] = e.KeyValue;

                //popListaPTS.ShowOnPageLoad = true;

                PRiesgosClass pr = new PRiesgosClass();

                string ruta = pr.BuscaRutaArchPTS(Convert.ToInt32(e.KeyValue));

                Response.Clear();
                Response.ContentType = @"application\octet-stream";
                System.IO.FileInfo file = new System.IO.FileInfo(ruta);
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());

                Response.WriteFile(file.FullName);
                Response.Flush();
            }
        }

        //protected void btnBuscar_Click(object sender, EventArgs e)
        //{
        //    //int vdr = Convert.ToInt32(txtNpermiso.Text);

        //}

        //protected void GvDatoPTS_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        //{
        //    if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Refresh"))
        //    {
        //        GvDatoPTS.DataBind();
        //    }
        //}
    }
}