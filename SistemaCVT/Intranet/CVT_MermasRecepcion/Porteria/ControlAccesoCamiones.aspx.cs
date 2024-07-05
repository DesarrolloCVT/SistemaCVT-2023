using DBMermasRecepcion;
using DevExpress.Web;
using System;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace CVT_MermasRecepcion.Porteria
{
    public partial class ControlAccesoCamiones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Ingreso");
            }
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Boton");
        //    popup_nuevo.ShowOnPageLoad = true;
        //    cbo_fechaentrega.Date = DateTime.Now;
        //    cbo_horaentrega.DateTime = DateTime.Now;
        //    ASPxRoundPanel3.Visible = true;
        //    ASPxRoundPanel1.Visible = false;
        //    ASPxRoundPanel2.Visible = false;
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Boton");
        //}

        protected void btn_GrabarCA_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Boton");
                int motivo = Convert.ToInt32(cbo_Motivo.Value);
                bool propio = chk_propio.Checked;
                string runchofer = txt_runchofer.Text;
                string nombrechofer = txt_nombrechofer.Text;
                string patentecamion = txt_patentecamion.Text;
                string patenterampla = txt_patenterampla.Text;
                string comentarioca = txt_comentariocontrol.Text;
                DateTime fechaentrega = new DateTime(cbo_fechaentrega.Date.Year, cbo_fechaentrega.Date.Month, cbo_fechaentrega.Date.Day, cbo_horaentrega.DateTime.Hour, cbo_horaentrega.DateTime.Minute, 0);
                ControlAccesoClass vControl = new ControlAccesoClass();
                int controlid = vControl.agregacontrolacceso(motivo, propio, runchofer, nombrechofer, patentecamion, patenterampla, comentarioca, fechaentrega);
                Session["ControlId"] = controlid;
            }
            catch (Exception)
            {


            }
            ASPxGridView1.DataBind();
            ASPxRoundPanel3.Visible = false;
            ASPxRoundPanel1.Visible = true;
            ASPxRoundPanel2.Visible = true;
        }

        protected void btn_agregarpeoneta_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Boton");
                string run = txt_runpeoneta.Text;
                string nombre = txt_nombrepeoneta.Text;
                string comentario = txt_comentariopeoneta.Text;
                int controlid = Convert.ToInt32(Session["ControlId"]);
                ControlAccesoClass vControl = new ControlAccesoClass();
                vControl.agregapeoneta(controlid, run, nombre, comentario);
            }
            catch
            {
                Gv_Peoneta.DataBind();
            }
            Gv_Peoneta.DataBind();
        }

        protected void btn_agregarDoc_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Boton");
            string tipo = cbo_tipodoc.Value.ToString();
            string numdoc = txt_numdoc.Text;
            string comentario = txt_comentariodoc.Text;
            int controlid = Convert.ToInt32(Session["ControlId"]);
            CVT_DocControlAcceso nuevo = new CVT_DocControlAcceso();
            nuevo.ControlAcceso_Id = controlid;
            nuevo.TipoDocumento = tipo;
            nuevo.NumDocumento = numdoc;
            nuevo.Comentario = comentario;
            nuevo.Fecha = DateTime.Now;
            try
            {
                string ruta = Session["NombreArchivo"].ToString();
                if (Session["NombreArchivo"].ToString() != null)
                {
                    FileStream input = new FileStream(ruta, FileMode.Open, FileAccess.Read);
                    BinaryReader reader = new BinaryReader(input);
                    byte[] buffer = reader.ReadBytes((int)input.Length);
                    reader.Close();
                    input.Close();
                    nuevo.Documento = new System.Data.Linq.Binary(buffer.ToArray());


                }
            }
            catch
            {
            }
            DBMLCVTDESAINTDataContext dbdatos = new DBMLCVTDESAINTDataContext();
            dbdatos.CVT_DocControlAcceso.InsertOnSubmit(nuevo);
            dbdatos.SubmitChanges();
            ASPxGridView2.DataBind();


        }
        public void AgregaDocumento(CVT_DocControlAcceso vDOC)
        {
            string ruta = Session["NombreArchivo"].ToString();
            Stream myStream = new FileStream(ruta, FileMode.Open, FileAccess.Read);
            if (myStream != null)
            {
                using (myStream)
                {
                    byte[] bytes = new byte[myStream.Length];
                    myStream.Read(bytes, 0, (int)myStream.Length);
                    vDOC.Documento = new System.Data.Linq.Binary(bytes);
                }
            }
            DBMLCVTDESAINTDataContext dbdatos = new DBMLCVTDESAINTDataContext();
            dbdatos.CVT_DocControlAcceso.InsertOnSubmit(vDOC);
            dbdatos.SubmitChanges();
            ASPxGridView2.DataBind();
        }

        protected void Upload_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {

            string path = Page.MapPath("~/") + "UploadFolders\\" + e.UploadedFile.FileName;
            Session["NombreArchivo"] = path;
            e.UploadedFile.SaveAs(path);
        }

        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdCerrar")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Boton");
                ControlAccesoClass vControl = new ControlAccesoClass();
                if (vControl.ObtieneEstadoControlAcceso(Convert.ToInt32(e.KeyValue)) == 2)
                {
                    Session["ControlId"] = e.KeyValue;
                    popup_nuevo.ShowOnPageLoad = true;
                    ASPxRoundPanel3.Visible = false;
                    ASPxRoundPanel1.Visible = true;
                    ASPxRoundPanel2.Visible = true;
                }
                else
                {
                    vControl.CierreControlAcceso(Convert.ToInt32(e.KeyValue));
                    Session["ControlId"] = e.KeyValue;
                    popup_nuevo.ShowOnPageLoad = true;
                    ASPxRoundPanel3.Visible = false;
                    ASPxRoundPanel1.Visible = true;
                    ASPxRoundPanel2.Visible = true;
                }
            }
        }

        protected void ASPxGridView2_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDoc")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Boton");
                ControlAccesoClass vControl = new ControlAccesoClass();
                byte[] doc = vControl.ObtieneImagen(Convert.ToInt32(e.KeyValue));
                this.ASPxBinaryImage1.Visible = true;
                ASPxBinaryImage cntFoto = this.ASPxBinaryImage1;
                cntFoto.Value = doc;
                cntFoto.DataBind();
            }
        }

        protected void btn_ocultar_Click(object sender, EventArgs e)
        {
            this.ASPxBinaryImage1.Visible = false;
        }

        protected void ASPxGridView1_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                ASPxGridView1.SettingsExport.FileName = "Control acceso Camiones";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 37, "Boton");
                popup_nuevo.ShowOnPageLoad = true;
                cbo_fechaentrega.Date = DateTime.Now;
                cbo_horaentrega.DateTime = DateTime.Now;
                ASPxRoundPanel3.Visible = true;
                ASPxRoundPanel1.Visible = false;
                ASPxRoundPanel2.Visible = false;
            }
        }

        protected void btn_agregarChofer_Click(object sender, EventArgs e)
        {

        }
    }
}