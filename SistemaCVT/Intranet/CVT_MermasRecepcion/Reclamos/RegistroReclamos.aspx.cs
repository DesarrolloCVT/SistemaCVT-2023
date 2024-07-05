using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Reclamos
{
    public partial class RegistroReclamos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //e.NewValues["EstadoReclamo"] = 1;
            //e.NewValues["EnviaReclamo"] = Session["IDCVTUsuario"];
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDestinatario")
            {
                Session["idReclamo"] = e.KeyValue;
                Response.Redirect("~/Reclamos/DestinatarioReclamos.aspx"); 
            }
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["idReclamo"] = e.KeyValue;
                Response.Redirect("~/Reclamos/DetalleReclamo.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDocumentos")
            {
                Session["idReclamo"] = e.KeyValue;
                //Response.Redirect("~/Reclamos/DetalleReclamo.aspx");
                popArchivos.ShowOnPageLoad = true;
            }
            if (e.CommandArgs.CommandName == "cmdEnviado")
            {
                int idReclamo =Convert.ToInt32(e.KeyValue);

                SAPClass spc = new SAPClass();
                ReclamosClass rc = new ReclamosClass();


                string resp = spc.CreaEntregaReclamos(idReclamo, Session["CIDUsuario"].ToString());

                if (resp.Equals("0"))
                {
                    WMSClass vWMS = new WMSClass();

                    int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());

                    int expid = rc.CreaExpedicionReclamo(85, idReclamo, staffid);
                    List<CVT_Reclamo_DetalleProd> dt = rc.ObtieneDetalleReclamo(idReclamo);
                    foreach (var t in dt)
                    {
                        List<Package> pk = vWMS.ObtieneInfoPallet(t.NPallet.ToString());
                        foreach (var p in pk)                        {
                          
                            //int tareaid = vWMS.AgregaTareaPedido(en.Site_Id, 7, p.ArticleProvider_Id, (int)p.Layout_Id, p.Layout_Id, t.Package_Id, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid, OrderId);
                            //vWMS.ActualizaReserve(reserveid, 3);
                            vWMS.AgregaDetalleExpedicion(expid, p.Package_Quantity, p.Package_Id, p.Package_SSCC, 85, staffid);

                            vWMS.AddMovement(85, 2, p.Package_Quantity, 8, staffid, 0, 0, 0, p.Package_Id);
                            #region Agrega PickingList
                            PickingList NPL = new PickingList();
                            NPL.Company_Id = p.Company_Id;
                            NPL.Site_Id = 85;
                            NPL.PickingList_Date = DateTime.Now;
                            NPL.Order_Type = 3;
                            NPL.Order_Id = idReclamo;
                            NPL.PickingList_ProductCode = vWMS.ObtieneCodProduct(p.ArticleProvider_Id);
                            NPL.ArticleProvider_Id = p.ArticleProvider_Id;
                            NPL.MeasurementUnit_Id = 1;
                            NPL.PickingList_Quantity = p.Package_Quantity;
                            NPL.Package_Id_Origin = p.Package_Id;
                            NPL.Package_SSCC_Origin = p.Package_SSCC;
                            NPL.Package_Id_Destiny = p.Package_Id;
                            NPL.Package_SSCC_Destiny = p.Package_SSCC;
                            NPL.PickingList_Level = 1;
                            NPL.Staff_Id = staffid;
                            #endregion
                            vWMS.ActualizaRestaCantidadPackage(p.Package_Id, p.Package_Quantity);
                            vWMS.CreaPickingListPedido(NPL);
                        }
                    }
                    bool sync = false;                
                    vWMS.ActualizaEstadoExpedicion(expid, 2, sync);          

                    rc.ActualizaEstadoReclamo(idReclamo, 2);
                    GvDatosReclamos.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' Reclamo Terminado ');", true);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + resp + " ');", true);
                }                         

            }
        }

        protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
        }
        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            bool ret = true;
            int Estado = Convert.ToInt32(grid.GetRowValues(visibleindex, "EstadoReclamo").ToString());
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            //if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            //int Estado = (int)e.GetValue("EstadoReclamo");
            //if (Estado != 1)
            //{
            //    //System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
            //    System.Web.UI.WebControls.ImageButton imgEnviado = GvDatosReclamos.FindRowCellTemplateControl(e.VisibleIndex, null, "enviado") as System.Web.UI.WebControls.ImageButton;
            //    //imgAnula.Visible = false;
            //    imgEnviado.Visible = false;
            //}
        }

        protected void GvDatosReclamos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;
            }
        }

        protected void cboReclamo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int motRecl =Convert.ToInt32(cboReclamo.Value);
                if(motRecl==1)
                {
                    lblFsolicitud.Visible = true;
                    dteFechSolicitud.Visible = true;
                    cboProducto.ValidationSettings.RequiredField.IsRequired = true;
                    dteFechaEnvasado.ValidationSettings.RequiredField.IsRequired = true;
                    txtLote.ValidationSettings.RequiredField.IsRequired = true;

                }
                else
                {
                    lblFsolicitud.Visible = false;
                    dteFechSolicitud.Visible = false;
                    cboProducto.ValidationSettings.RequiredField.IsRequired = false;
                    dteFechaEnvasado.ValidationSettings.RequiredField.IsRequired = false;
                    txtLote.ValidationSettings.RequiredField.IsRequired = false;
                }
            }
            catch (Exception ex)
            {

               string ms= ex.Message;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime? fenv;
                DateTime? fSoli;

                ReclamosClass rc = new ReclamosClass();

                if (dteFechaEnvasado.Value != null)
                {
                    fenv = dteFechaEnvasado.Date;
                }else
                {
                    fenv = null;
                }

                if(dteFechSolicitud.Value !=null)
                {
                    fSoli = dteFechSolicitud.Date;
                }else
                {
                    fSoli = null;
                }
                           
                //int tipoReclamo =Convert.ToInt32(cboReclamo.Value);
                CVT_Reclamo r = new CVT_Reclamo();
                r.FechaRegReclamo = DateTime.Now;
                r.EncargadoReclamo =Convert.ToInt32(cboEncargadoReclamo.Value);
                r.Producto = cboProducto.Value == null ? null : Convert.ToString(cboProducto.Value);
                r.FechaEnvasado = fenv;
                r.Lote =txtLote.Text;
                r.Comentarios = txtComentarios.Text;
                r.EstadoReclamo = 1;
                r.MotivoReclamo = Convert.ToInt32(cboReclamo.Value);
                r.FechaSolicitud = fSoli;
                r.ID_UserRegReclamo=Convert.ToInt32(Session["IDCVTUsuario"]);

                string resp = rc.insertaReclamo(r);

                if (resp.Equals("Creado"))
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + resp + " ');", true);
                    Limpiar();
                    PopNuevo.ShowOnPageLoad = false;
                    GvDatosReclamos.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + resp + " ');", true);
                }

            }
            catch { }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
            PopNuevo.ShowOnPageLoad = false;
        }
        private void Limpiar() 
        {
            cboReclamo.SelectedIndex = -1;
            cboEncargadoReclamo.SelectedIndex = -1;
            cboProducto.SelectedIndex = -1;
            dteFechaEnvasado.Text = string.Empty;
            txtLote.Text = string.Empty;
            txtComentarios.Text = string.Empty;
        }

        protected void FileUpload1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            ReclamosClass rcr = new ReclamosClass();     
            try
            {
                int idReclamo = Convert.ToInt32(Session["idReclamo"]);

                CVT_Reclamo_Archivos ar = new CVT_Reclamo_Archivos();
                ar.FechaRegistro = DateTime.Now;
                int IdArchivo = rcr.insertaReclamoArchivo(ar);

                string name = e.UploadedFile.FileName;
                e.UploadedFile.SaveAs(@"\\BIGEL\\intranet\\reclamos\\" +idReclamo.ToString()+"_"+IdArchivo.ToString() +"_"+ name);
                string ruta = @"\\BIGEL\\intranet\\reclamos\\" + idReclamo.ToString() + "_" + IdArchivo.ToString() + "_" + name;

                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                rcr.ActualizaArchivoReclamo(IdArchivo, idReclamo, ruta, nombre1, Ext1);


                GvDatosAdj.DataBind();              
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);               
            }

            catch (Exception ex)
            {
                string ms = ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
            }
            GvDatosAdj.DataBind();
   
        }

        protected void btnRecargaGrilla_Click(object sender, EventArgs e)
        {
            GvDatosAdj.DataBind();
        }

        protected void GvDatosAdj_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdArchivosHistorial")
            {

                ReclamosClass rc = new ReclamosClass();

                string ruta = rc.BuscaRutaArchivo(Convert.ToInt32(e.KeyValue));

                Response.Clear();
                Response.ContentType = @"application\octet-stream";
                System.IO.FileInfo file = new System.IO.FileInfo(ruta);
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());

                Response.WriteFile(file.FullName);
                Response.Flush();
                Response.Close();

            }
        }

        protected void GvDatosAdj_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            ReclamosClass rcc = new ReclamosClass();
            int val = Convert.ToInt32(e.Values["Id_RutaArchivoReclamo"]);
            string nom = rcc.BuscaNombreArchivo(val);
            string rutaEl = @"\\BIGEL\\intranet\\reclamos\\" + nom;
            File.Delete(rutaEl);
        }
    }
}