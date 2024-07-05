using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CVT_MermasRecepcion;
using DBMermasRecepcion;
using System.IO;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace CVT_MermasRecepcion.WMS
{
    public partial class LaboresTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarLab_Click(object sender, EventArgs e)
        {
            try
            {
                CVT_LaboresTurnoDetalle vLabTurnoDet = new CVT_LaboresTurnoDetalle();
                vLabTurnoDet.ID_LaborTurno = Convert.ToInt32(Session["FolioLabor"]);
                vLabTurnoDet.Observacion = txtObservLab.Text;
                vLabTurnoDet.Tipo = Convert.ToInt32(cbTipoObserv.Value);
                LaboresClass cLabores = new LaboresClass();
                int resp = cLabores.CreaLabor(vLabTurnoDet);
            }
            catch (Exception)
            {

            }
            GvLabores.DataBind();
            cbTipoObserv.SelectedIndex = -1;
            txtObservLab.Text = string.Empty;
        }

        protected void btn_AgregarEnc_Click(object sender, EventArgs e)
        {
            if (cbTurno.SelectedIndex != -1 && dateFecha.Value != null)
            {
                LaboresClass cLabores = new LaboresClass();
                int Folio = cLabores.CreaEncabezadoLabor(dateFecha.Date, Convert.ToInt32(cbTurno.Value), Session["CIDUsuario"].ToString());
                Session["FolioLabor"] = Folio;
                lblFolio.Text = Folio.ToString();
            }

        }

        protected void btn_Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                LaboresClass cLabores = new LaboresClass();
                int resp = cLabores.CreaDetalleLabor
                    (
                    Convert.ToInt32(Session["FolioLabor"]),
                    Convert.ToInt32(txtLabVariasP.Text),
                    Convert.ToInt32(txtLabVarC.Text),
                    Convert.ToInt32(txtGruerosP.Text),
                    Convert.ToInt32(txtGruerosC.Text),
                    Convert.ToInt32(txtApoPickP.Text),
                    Convert.ToInt32(txtApoPickC.Text),
                    Convert.ToInt32(txtOtrosP.Text),
                    Convert.ToInt32(txtOtrosC.Text),
                    txtObservDotacion.Text,
                    Convert.ToInt32(txtInasistP.Text),
                    Convert.ToInt32(txtInasistC.Text),
                    Convert.ToInt32(txtAtrRetP.Text),
                    Convert.ToInt32(txtAtrRetC.Text),
                    Convert.ToInt32(txtCmnsTAnt.Text),
                    Convert.ToInt32(txtCmnsLlegT.Text),
                    Convert.ToInt32(txtCmnsDesc.Text),
                    Convert.ToInt32(txtCmnsPend.Text),
                    Convert.ToInt32(txtCantBajPed.Text),
                    Convert.ToInt32(txtAp.Text),
                    Convert.ToInt32(txtPick.Text),
                    Convert.ToInt32(txtOtros.Text),
                    Convert.ToInt32(txtPlanta.Text),
                    Convert.ToInt32(txtExt.Text),
                    txtObsPedidos.Text,
                    txtObsCargaCam.Text
                    );
                LimpiarCampos();
            }
            catch
            {

            }
        }
        private void LimpiarCampos()
        {
            Session.Remove("FolioLabor");
            lblFolio.Text = string.Empty;
            txtLabVariasP.Text = string.Empty;
            txtLabVarC.Text = string.Empty;
            txtGruerosP.Text = string.Empty;
            txtGruerosC.Text = string.Empty;
            txtApoPickP.Text = string.Empty;
            txtApoPickC.Text = string.Empty;
            txtOtrosP.Text = string.Empty;
            txtOtrosC.Text = string.Empty;
            txtObservDotacion.Text = string.Empty;
            txtInasistP.Text = string.Empty;
            txtInasistC.Text = string.Empty;
            txtAtrRetP.Text = string.Empty;
            txtAtrRetC.Text = string.Empty;
            txtCmnsTAnt.Text = string.Empty;
            txtCmnsLlegT.Text = string.Empty;
            txtCmnsDesc.Text = string.Empty;
            txtCmnsPend.Text = string.Empty;
            txtCantBajPed.Text = string.Empty;
            txtAp.Text = string.Empty;
            txtPick.Text = string.Empty;
            txtOtros.Text = string.Empty;
            txtPlanta.Text = string.Empty;
            txtExt.Text = string.Empty;
            GvDetRecep.DataBind();
            GvLabores.DataBind();
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            LaboresClass cLabores = new LaboresClass();
            cLabores.AgregaRecepcion(Convert.ToInt32(Session["FolioLabor"]), Convert.ToInt32(txtNRecep.Text), txtUbicacion.Text, txtObserv.Text);
            GvDetRecep.DataBind();

            txtNRecep.Text = string.Empty;
            txtUbicacion.Text = string.Empty;
            txtObserv.Text = string.Empty;
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            LaboresClass cLabores = new LaboresClass();
            List<CVT_LaboresTurno> dt = new List<CVT_LaboresTurno>();
            dt = cLabores.BuscaFolioLabor(Convert.ToInt32(cboBuscarTurno.Value), dateBuscarFecha.Date);
            if (dt.Count != 0)
            {
                foreach (var r in dt)
                {
                    Session["FolioLabor"] = r.ID_LaborTurno;
                    lblFolio.Text = r.ID_LaborTurno.ToString();
                    txtLabVariasP.Text = r.LaboresVariasP.ToString();
                    txtLabVarC.Text = r.LaboresVariasC.ToString();
                    txtGruerosP.Text = r.GruerosP.ToString();
                    txtGruerosC.Text = r.GruerosC.ToString();
                    txtApoPickP.Text = r.ApoyoPickingP.ToString();
                    txtApoPickC.Text = r.ApoyoPickingP.ToString();
                    txtOtrosP.Text = r.OtrosP.ToString();
                    txtOtrosC.Text = r.OtrosC.ToString();
                    txtObservDotacion.Text = r.ObservacionDotacion;
                    txtInasistP.Text = r.InasistenciasP.ToString();
                    txtInasistC.Text = r.InasistenciasC.ToString();
                    txtAtrRetP.Text = r.AtrasosRetiroP.ToString();
                    txtAtrRetC.Text = r.AtrasosRetiroC.ToString();
                    txtCmnsTAnt.Text = r.CamionesTurnoAnterior.ToString();
                    txtCmnsLlegT.Text = r.CamionesLlegadosTurno.ToString();
                    txtCmnsDesc.Text = r.CamionesDescargados.ToString();
                    txtCmnsPend.Text = r.CamionesPendientes.ToString();
                    txtCantBajPed.Text = r.BajadaPedidos.ToString();
                    txtAp.Text = r.PedidosPreparadosAP.ToString();
                    txtPick.Text = r.PedidosPreparadosPicking.ToString();
                    txtOtros.Text = r.PedidosPreparadosOtros.ToString();
                    txtPlanta.Text = r.CamionesCargadosPl.ToString();
                    txtExt.Text = r.CamionesCargadosExt.ToString();
                }
            }
            else
            {
                LimpiarCampos();
                Session["FolioLabor"] = 0;
            }
            GvDetRecep.DataBind();
            GvLabores.DataBind();
            GvDatosAdj.DataBind();
        }

        protected void FileUpload1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            LaboresClass lb = new LaboresClass();
            try
            {
                int id_RutaArchivoLabores = Convert.ToInt32(Session["Id_Ruta"]);

                CVT_LaboresArchivos lbu = new CVT_LaboresArchivos();
                lbu.FechaRegistro = DateTime.Now;
                int IdArchivo = lb.insertaLaborArchivo(lbu);

                string name = e.UploadedFile.FileName;
                e.UploadedFile.SaveAs(@"\\BIGEL\\intranet\\LaboresTurno\\" + id_RutaArchivoLabores.ToString() + "_" + IdArchivo.ToString() + "_" + name);
                string ruta = @"\\BIGEL\\intranet\\LaboresTurno\\" + id_RutaArchivoLabores.ToString() + "_" + IdArchivo.ToString() + "_" + name;

                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                lb.ActualizaArchivoLabores(IdArchivo, Convert.ToInt32(Session["FolioLabor"]), ruta, nombre1, Ext1);


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

                LaboresClass rc = new LaboresClass();

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
            LaboresClass rcc = new LaboresClass();
            int val = Convert.ToInt32(e.Values["Id_RutaArchivoLabores"]);
            string nom = rcc.BuscaNombreArchivo(val);
            string rutaEl = @"\\BIGEL\\intranet\\reclamos\\" + nom;
            File.Delete(rutaEl);
        }

        protected void btnInforme_Click(object sender, ImageClickEventArgs e)
        
        {
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/LaboresTurno.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, Session["FolioLabor"].ToString());
            // Info.SetParameterValue(0, id);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "LaboresTurno" + Session["FolioLabor"].ToString()+".pdf");
        }
    
    }
    
}