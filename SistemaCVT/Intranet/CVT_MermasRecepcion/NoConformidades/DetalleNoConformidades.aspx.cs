using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;

namespace CVT_MermasRecepcion.NoConformidades
{
    public partial class DetalleNoConformidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            GvDatos.DataBind();

            if (!Page.IsPostBack)
            {
                CargaDatos();
                //dteFechaPlazoAcInmediata.Value = DateTime.Now;
                //dtFechaPlazoAcCorrectiva.Value = DateTime.Now;
                //dteSupervisionEjecucion.Value = DateTime.Now;
                //dtFechaEficacia.Value = DateTime.Now;
            }
        }

        protected void cmdGuardar_Click(object sender, ImageClickEventArgs e)
        {
            NoConformidadClass vNoCon = new NoConformidadClass();
            CVT_DetalleNoConformidad vNoC = new CVT_DetalleNoConformidad();
            int idNoConform = Convert.ToInt32(Session["Id_NoConformidad"]);
            int VidCon = vNoCon.ValidaIdConformidadEnDetalle(idNoConform);
            string Estado = vNoCon.BuscaEstado(Convert.ToInt32(Session["Id_NoConformidad"]));

            DateTime? fain = null;
            DateTime? faco = null;
            DateTime? fsej = null;
            DateTime? feac = null;
            if (dteFechaPlazoAcInmediata.Value == null) { fain = null; }
            if (dtFechaPlazoAcCorrectiva.Value == null) { faco = null; }
            if (dteSupervisionEjecucion.Value == null) { fsej = null; }
            if (dtFechaEficacia.Value == null) { feac = null; }


            if (idNoConform != VidCon && Estado.Equals("Creado"))
            {
                vNoC.Id_NoConformidad = Convert.ToInt32(Session["Id_NoConformidad"]);
                vNoC.Origen = Convert.ToString(cboOrigen.Value);
                vNoC.Usuario = Convert.ToString(cboResponsable.Text);
                vNoC.Descripcion = htmlDescripcion.Html;
                vNoC.CausaOrigen = htmlCausaOrigen.Html;
                vNoC.DescAccionInmediata = htmlAccioninmediata.Html;
                vNoC.FechPlazoAccionInmediata = dteFechaPlazoAcInmediata.Value == null ? fain : Convert.ToDateTime(dteFechaPlazoAcInmediata.Value);
                vNoC.CumpleAccioninmediata = ChkCumpleACIN.Checked;
                vNoC.DescAccionCorrectiva = htmlAccionCorrectiva.Html;
                vNoC.FechPlazoAccionCorrectiva = dtFechaPlazoAcCorrectiva.Value == null ? faco : Convert.ToDateTime(dtFechaPlazoAcCorrectiva.Value);
                vNoC.CumpleAccionCorrectiva = chkCumpleACCO.Checked;
                vNoC.DecSupervisionEjecucion = htmlEjecucion.Html;
                vNoC.FechSupervisionEjecucion = dteSupervisionEjecucion.Value == null ? fsej : Convert.ToDateTime(dteSupervisionEjecucion.Value);
                vNoC.DecEficaciaAccion = htmlEficaciaAccion.Html;
                vNoC.CumpleEficaciaAccion = chkCumpleEficaciaAccion.Checked;
                vNoC.FechEvaluacionEficaciaAccion = dtFechaEficacia.Value == null ? feac : Convert.ToDateTime(dtFechaEficacia.Value);
                vNoCon.InsertaRegistroDetalle(vNoC);

                string UsuarioultimaMod = Convert.ToString(Session["NombreUsuario"]);
                vNoCon.ActualizaEncNoconformidad(Convert.ToInt32(Session["Id_NoConformidad"]), UsuarioultimaMod);


                string Est = "En Proceso";
                vNoCon.ActualizaEstado(Convert.ToInt32(Session["Id_NoConformidad"]), Est);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('SE HAN REGISTRADO LOS DATOS');", true);

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 152, "Crea Registro Detalle NC");
            }
            else if (idNoConform == VidCon && Estado.Equals("En Proceso"))
            {

                vNoC.Origen = Convert.ToString(cboOrigen.Value);
                vNoC.Usuario = Convert.ToString(cboResponsable.Text);
                vNoC.Descripcion = htmlDescripcion.Html;
                vNoC.CausaOrigen = htmlCausaOrigen.Html;
                vNoC.DescAccionInmediata = htmlAccioninmediata.Html;
                vNoC.FechPlazoAccionInmediata = dteFechaPlazoAcInmediata.Value == null ? fain : Convert.ToDateTime(dteFechaPlazoAcInmediata.Value);
                vNoC.CumpleAccioninmediata = ChkCumpleACIN.Checked;
                vNoC.DescAccionCorrectiva = htmlAccionCorrectiva.Html;
                vNoC.FechPlazoAccionCorrectiva = dtFechaPlazoAcCorrectiva.Value == null ? faco : Convert.ToDateTime(dtFechaPlazoAcCorrectiva.Value);
                vNoC.CumpleAccionCorrectiva = chkCumpleACCO.Checked;
                vNoC.DecSupervisionEjecucion = htmlEjecucion.Html;
                vNoC.FechSupervisionEjecucion = dteSupervisionEjecucion.Value == null ? fsej : Convert.ToDateTime(dteSupervisionEjecucion.Value);
                vNoC.DecEficaciaAccion = htmlEficaciaAccion.Html;
                vNoC.CumpleEficaciaAccion = chkCumpleEficaciaAccion.Checked;
                vNoC.FechEvaluacionEficaciaAccion = dtFechaEficacia.Value == null ? feac : Convert.ToDateTime(dtFechaEficacia.Value);

                vNoCon.ActualizaDetalle(VidCon, vNoC);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Datos Actualizados');", true);

                string UsuarioultimaMod = Convert.ToString(Session["NombreUsuario"]);
                vNoCon.ActualizaEncNoconformidad(Convert.ToInt32(Session["Id_NoConformidad"]), UsuarioultimaMod);

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 152, "Actualiza Registro Detalle NC");

            }
            else
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('La No Conformidad se encuentra terminada no puede guardar más cambios');", true);
                CargaDatos();
            }

            //}
            //catch
            //{
            //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL REGISTRAR LOS DATOS');", true);
            //}

        }
        protected void btnSubir_Click(object sender, EventArgs e)
        {
            try
            {
                string name = FileUpload1.FileName;
                FileUpload1.SaveAs(@"\\BIGEL\\Intranet\\No Conformidades\\" + name);
                string ruta = @"\\BIGEL\\Intranet\\No Conformidades\\" + name;



                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                CVT_RutaArchivoNoConformidad vRuta = new CVT_RutaArchivoNoConformidad();
                NoConformidadClass vNoc = new NoConformidadClass();
                vRuta.Id_NoConformidad = Convert.ToInt32(Session["Id_NoConformidad"]);
                vRuta.Ruta = ruta;
                vRuta.Nombre = nombre1;
                vRuta.Extencion = Ext1;
                vRuta.Observacion = txtObservacion.Text;
                vNoc.InsertaRegistroRutaArchivo(vRuta);
                GvDatos.DataBind();
                txtObservacion.Text = string.Empty;


                NoConformidadClass vNoCon = new NoConformidadClass();
                string UsuarioultimaMod = Convert.ToString(Session["NombreUsuario"]);
                vNoCon.ActualizaNoconformidadUpArchivo(Convert.ToInt32(Session["Id_NoConformidad"]), UsuarioultimaMod);


                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 152, "Registro Adjunto Detalle NC");
            }

            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
            }
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/NoConformidades/NoConformidades.aspx");
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            NoConformidadClass vNoc = new NoConformidadClass();
            int val = Convert.ToInt32(e.Values["Id_RutaArchivoNoConformidad"]);
            string nom = vNoc.BuscaNombreArchivo(val);
            string rutaEl = @"\\BIGEL\\Intranet\\No Conformidades\\" + nom;
            File.Delete(rutaEl);

            NoConformidadClass vNoCon = new NoConformidadClass();
            string UsuarioultimaMod = Convert.ToString(Session["NombreUsuario"]);
            vNoCon.ActualizaNoconformidadUpArchivo(Convert.ToInt32(Session["Id_NoConformidad"]), UsuarioultimaMod);

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 152, "Elimina adjunto Registro Detalle NC");
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            NoConformidadClass vNoc = new NoConformidadClass();
            string Estado = "Terminado";
            vNoc.ActualizaEstadoYfecha(Convert.ToInt32(Session["Id_NoConformidad"]), Estado);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No conformidad Terminda no se podra actualizar');", true);

        }


        private void CargaDatos()
        {
            NoConformidadClass vNo = new NoConformidadClass();
            int idConf = Convert.ToInt32(Session["Id_NoConformidad"]);
            List<CVT_NoConformidades> dt = vNo.ObtieneDatos(idConf);
            foreach (var t in dt)
            {
                lblFecha.Text = Convert.ToString(Convert.ToDateTime(t.FechaCreacion).Day) + "/" + Convert.ToString(Convert.ToDateTime(t.FechaCreacion).Month) + "/" + Convert.ToString(Convert.ToDateTime(t.FechaCreacion).Year);
                lblTipo.Text = t.Tipo;
                lblArea.Text = vNo.obtieneArea(t.id_AreaNoConformidad);
                lblNumFolio.Text = Convert.ToString(t.Id_NoConformidad);
            }
            List<CVT_DetalleNoConformidad> dtno = vNo.DatosDetalleNoConformidad(idConf);
            foreach (var n in dtno)
            {
                cboOrigen.Value = n.Origen;
                cboResponsable.Value = n.Usuario;
                htmlDescripcion.Html = n.Descripcion;
                htmlCausaOrigen.Html = n.CausaOrigen;
                dteFechaPlazoAcInmediata.Value = n.FechPlazoAccionInmediata;
                ChkCumpleACIN.Checked = Convert.ToBoolean(n.CumpleAccioninmediata);
                htmlAccioninmediata.Html = n.DescAccionInmediata;
                dtFechaPlazoAcCorrectiva.Value = n.FechPlazoAccionCorrectiva;
                chkCumpleACCO.Checked = Convert.ToBoolean(n.CumpleAccionCorrectiva);
                htmlEjecucion.Html = n.DecSupervisionEjecucion;
                dteSupervisionEjecucion.Value = n.FechSupervisionEjecucion;
                htmlEficaciaAccion.Html = n.DecEficaciaAccion;
                chkCumpleEficaciaAccion.Checked = Convert.ToBoolean(n.CumpleEficaciaAccion);
                dtFechaEficacia.Value = n.FechEvaluacionEficaciaAccion;
                htmlAccionCorrectiva.Html = n.DescAccionCorrectiva;

            }

        }

        //private void CargarGridConArchivos(string rutaArc)
        //{
        //   //if()
        //    var archivos = Directory.GetFiles(rutaArc);
        //    //var folders = Directory.GetDirectories(ruta);           
        //    var listado = new List<object>();
        //    if (rutaArc == @"\\BIGEL\\Intranet\\No Conformidades\\")
        //    {

        //        foreach (var a in archivos)
        //        {
        //            var archivo = new
        //            {

        //                Nombre = Path.GetFileName(a).ToString(),
        //                Ruta = Path.GetFullPath(a).ToString(),
        //                Extension = Path.GetExtension(a).ToString()
        //            };
        //            listado.Add(archivo);
        //        }

        //    }           
        //    GvDatos.DataSource = listado;     
        //    GvDatos.DataBind();


        //}



    }
}

