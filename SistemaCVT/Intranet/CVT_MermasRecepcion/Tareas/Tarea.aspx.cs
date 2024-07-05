using DBMermasRecepcion;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Tareas
{
    public partial class Tarea : System.Web.UI.Page
    {

        //int _idAsignado=0;
        //int _IdArea = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            TareasClass tr = new TareasClass();
            UsuarioClass us =new UsuarioClass();
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            int AreaUser = tr.AreaUser(idUsuario);
            int Jef = us.VerificaJefeArea(idUsuario);
            if (idPerfil == 1)
            {
                LqsTareas.WhereParameters.Clear();
                
            }
            else if (idPerfil == 13 || Jef==1)
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32,AreaUser.ToString());
                //LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
                LqsTareas.Where = "DptoID=@idArea";
            }
            else
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("IdAsignado", System.Data.DbType.Int32, idUsuario.ToString());
                //LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
                LqsTareas.Where = "IdAsignado=@IdAsignado";

            }


            //LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(2));
            //LqsTareas.Where = "Estado!=@Est";
            //crwDatos.DataBind();
        }

        protected void TaskSaveButton_Click(object sender, EventArgs e)
        {
            try
            {
                int est = Convert.ToInt32(cboEstadoEdit.Value);
                int Prc = Convert.ToInt32(tbPorcentaje.Value);

              
                int Estado = 0;             

                if (Prc == 100)
                {                  
                    Estado = 2;
                }
                else
                {

                  
                    Estado = Convert.ToInt32(cboEstado.Value);
                }

                int idArea =Convert.ToInt32(CboArea.Value);
                int IdAsignado = Convert.ToInt32(cboAsignado.Value);
                DateTime fini =Convert.ToDateTime(dteInicio.Value);
                DateTime fterm = Convert.ToDateTime(dteTermino.Value);
                int pri = Convert.ToInt32(cboPrioridad.Value);
                //int Estado = Convert.ToInt32(cboEstado.Value);
                string asunt = txtAsunto.Text;
                string det = txtDetalle.Text;
                int prc =Convert.ToInt32( tbPorcentaje.Value);

                CVT_Registro_Tareas rt = new CVT_Registro_Tareas();
                TareasClass tr = new TareasClass();

                rt.DptoID = idArea;
                rt.FechaInicio = fini;
                rt.FechaTermino = fterm;
                rt.Prioridad = pri;
                rt.Estado = Estado;
                rt.Asunto = asunt;
                rt.Detalle = det;
                rt.PrcCumpli = prc;
                rt.IdAsignado = IdAsignado;
                rt.Id_Creador =Convert.ToInt32(Session["IDCVTUsuario"]);
                rt.Resolucion = txtResolucion.Text;
                rt.TiempoEstimado =Convert.ToInt32(txtTiempoEstimado.Text);
                string rs= tr.InsertaTarea(rt);

                if (rs.Equals("0"))
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado!');", true);
                    CboArea.SelectedIndex =-1;
                    cboAsignado.SelectedIndex = -1;
                    dteInicio.Value = DateTime.Now;
                    dteTermino.Value = DateTime.Now;
                    cboPrioridad.SelectedIndex = -1;
                    cboEstado.SelectedIndex = -1;
                    txtAsunto.Text = string.Empty;
                    txtDetalle.Text = string.Empty;
                    tbPorcentaje.Value = 0;
                    txtResolucion.Text= string.Empty;
                    txtTiempoEstimado.Text = string.Empty;

                    TaskNewPopup.ShowOnPageLoad = false;
                    crwDatos.DataBind();
                }
                else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al registrar favor verificar!');", true); }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: " + ex.Message + " ');", true);

            }
        }
        protected void TaskCancelButton_Click(object sender, EventArgs e)
        {
            TaskNewPopup.ShowOnPageLoad = false;
            CboArea.SelectedIndex = -1;
            cboAsignado.SelectedIndex = -1;
            dteInicio.Value = DateTime.Now;
            dteTermino.Value = DateTime.Now;
            cboPrioridad.SelectedIndex = -1;
            cboEstado.SelectedIndex = -1;
            txtAsunto.Text = string.Empty;
            txtDetalle.Text = string.Empty;
            tbPorcentaje.Value = 0;
            txtResolucion.Text = string.Empty;
            txtTiempoEstimado.Text = string.Empty;
        }

        protected string GetPriorityImageUrl(CardViewDataItemTemplateContainer container)
        {
            var priority = (EmployeeTaskPriority)DataBinder.Eval(container.DataItem, "Prioridad");
            return GetPriorityImageUrl(priority);
        }

        public enum EmployeeTaskPriority
        {
            BAJA = 1,
            MEDIA = 2,
            ALTA = 3,
            URGENTE = 4
        }

        public string GetPriorityImageUrl(EmployeeTaskPriority priority)
        {
            return System.IO.Path.Combine("~/Images/", GetPriorityImageName(priority));
        }
        string GetPriorityImageName(EmployeeTaskPriority priority)
        
        {
            switch (priority)
            {
                case EmployeeTaskPriority.BAJA:
                    return "Priority1.png";
                case EmployeeTaskPriority.MEDIA:
                    return "Priority2.png";
                case EmployeeTaskPriority.ALTA:
                    return "Priority3.png";
                case EmployeeTaskPriority.URGENTE:
                    return "Priority4.png";
            }
            return string.Empty;
        }

        public bool GetCheckedState(CardViewDataItemTemplateContainer container)
        {
            var status = (EmployeeTaskStatus)DataBinder.Eval(container.DataItem, "Estado");
            return status.Equals(EmployeeTaskStatus.Completo);
        }
        public enum EmployeeTaskStatus
        {
            NoComenzado = 1,
            Completo = 2,
            EnProgreso = 3,
            NecesitaAsistencia = 4,
            Aplazado = 5                                            
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {

            TareasClass tr = new TareasClass();
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            int AreaUser = tr.AreaUser(idUsuario);

            if (idPerfil == 1)
            {
                Session["TareaID"] = Convert.ToInt32(LoadTaskID((ASPxButton)sender));
                popConfirm.ShowOnPageLoad = true;
            }else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No cuentas con los permisos para eliminar esta tarea!');", true);
            }
          
        }
        protected int LoadTaskID(ASPxButton button)
        {
            int IdTask;
            var container = (CardViewDataItemTemplateContainer)button.NamingContainer;
            return IdTask=Convert.ToInt32(DataBinder.Eval(container.DataItem, "NTarea"));
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            TareasClass tr = new TareasClass();

           string rsp= tr.EliminaTarea(Convert.ToInt32(Session["TareaID"]));
            if(rsp.Equals("0"))
            {
                crwDatos.DataBind();
                popConfirm.ShowOnPageLoad = false;
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al eliminar favor verificar!');", true);
                popConfirm.ShowOnPageLoad = false;
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            popConfirm.ShowOnPageLoad = false;
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            TareasClass tr = new TareasClass();
            int IDtarea= Convert.ToInt32(LoadTaskID((ASPxButton)sender));

            List<VW_RESUMEN_TAREAS> lt = tr.InfoTarea(IDtarea);
            TaskNewPopup.ShowOnPageLoad = true;
            TaskSaveButton.Visible = false;

            foreach (var t in lt)
            {
                CboArea.Text = t.Area;
                CboArea.ReadOnly = true;
                CboArea.ValidationSettings.RequiredField.IsRequired = false;
                TaskNewPopup.HeaderText = "Tarea Asignada a " + t.Asignado;
                cboAsignado.Text = t.Asignado;
                cboAsignado.ValidationSettings.RequiredField.IsRequired = false;
                cboAsignado.ReadOnly = true;
                dteInicio.Date =Convert.ToDateTime(t.FInicio);
                dteInicio.ReadOnly = true;
                dteTermino.Date = Convert.ToDateTime(t.FTermino);
                dteTermino.ReadOnly = true;
                cboPrioridad.SelectedIndex =Convert.ToInt32(t.Prioridad)-1;
                cboPrioridad.ReadOnly = true;
                cboEstado.SelectedIndex = Convert.ToInt32(t.Estado) - 1;
                cboEstado.ReadOnly = true;
                txtAsunto.Text = t.Asunto;
                txtAsunto.ReadOnly = true;
                txtAsunto.ValidationSettings.RequiredField.IsRequired = false;
                txtDetalle.Text = t.Detalle;
                txtDetalle.ReadOnly = true;
                tbPorcentaje.Value = t.PrcCumpli;
                tbPorcentaje.ReadOnly = true;
                txtResolucion.Text = t.Resolucion;
                txtResolucion.ReadOnly = true;
                txtTiempoEstimado.Text = t.TiempoEstimado.ToString();
                txtTiempoEstimado.ReadOnly = true;

            }
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            TareasClass tr = new TareasClass();
            Session["IDtareaEdit"] = Convert.ToInt32(LoadTaskID((ASPxButton)sender));

            List<VW_RESUMEN_TAREAS> lt = tr.InfoTarea(Convert.ToInt32(Session["IDtareaEdit"]));
            popEdit.ShowOnPageLoad = true;


         
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            int AreaUser = tr.AreaUser(idUsuario);

            if (idPerfil == 1)
            {
                LqsAreaTrabajo0.WhereParameters.Clear();

            }
            else
            {
                LqsAreaTrabajo0.WhereParameters.Clear();
                LqsAreaTrabajo0.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                //LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
                LqsAreaTrabajo0.Where = "Id_Area=@idArea";
                //LqsPersonal.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                //LqsPersonal.Where = "Id_Area=@idArea";
            }

            int stTask = tr.EstadoTarea(Convert.ToInt32(Session["IDtareaEdit"]));
            if (stTask == 2)
            {
                btnGuardarEdit.Enabled = false;
            }
            else { btnGuardarEdit.Enabled = true; }

            foreach (var t in lt)
            {
                Session["_idAsignado"] = Convert.ToInt32(t.IdAsignado);
                Session["_IdArea"] = t.IdTarea;

                if (t.IdAsignado == Convert.ToInt32(Session["IDCVTUsuario"]))
                {
                    cboAreaEdit.Text = t.Area;
                    cboAreaEdit.ReadOnly = true;
                    popEdit.HeaderText = "Tarea Asignada a " + t.Asignado;
                    cboAsignadoEdit.Text = t.Asignado;
                    cboAsignadoEdit.ReadOnly = true;
                    LqsPersonal0.WhereParameters.Clear();
                    LqsPersonal0.WhereParameters.Add("idArea", System.Data.DbType.Int32, cboAreaEdit.Value.ToString());
                    LqsPersonal0.Where = "Id_Area=@idArea";
                    dteFIniEdit.Date = Convert.ToDateTime(t.FInicio);
                    dteFIniEdit.ReadOnly = true;
                    dteFtermEdit.Date = Convert.ToDateTime(t.FTermino);
                    cboPrioridadEdit.SelectedIndex = Convert.ToInt32(t.Prioridad) - 1;
                    cboPrioridadEdit.ReadOnly = true;
                    cboEstadoEdit.SelectedIndex = Convert.ToInt32(t.Estado) - 1;
                    //cboEstadoEdit.ReadOnly = true;
                    txtasuntoEdit.Text = t.Asunto;
                    txtasuntoEdit.ReadOnly = true;
                    txtDetEdit.Text = t.Detalle;
                    txtDetEdit.ReadOnly = true;
                    tbComplEdit.Value = t.PrcCumpli;
                    txtResolucionEdit.Text = t.Resolucion;
                    txtTiempoEstimadoEdit.Text = t.TiempoEstimado.ToString();
                }
                else
                {

                    cboAreaEdit.Text = t.Area;
                    cboAreaEdit.ReadOnly = false;
                    popEdit.HeaderText = "Tarea Asignada a " + t.Asignado;
                    cboAsignadoEdit.Text = t.Asignado;
                    cboAsignadoEdit.ReadOnly = false;
                    LqsPersonal0.WhereParameters.Clear();
                    LqsPersonal0.WhereParameters.Add("idArea", System.Data.DbType.Int32, cboAreaEdit.Value.ToString());
                    LqsPersonal0.Where = "Id_Area=@idArea";
                    dteFIniEdit.Date = Convert.ToDateTime(t.FInicio);
                    dteFIniEdit.ReadOnly = false;
                    dteFtermEdit.Date = Convert.ToDateTime(t.FTermino);
                    cboPrioridadEdit.SelectedIndex = Convert.ToInt32(t.Prioridad) - 1;
                    cboPrioridadEdit.ReadOnly = false;
                    cboEstadoEdit.SelectedIndex = Convert.ToInt32(t.Estado) - 1;
                    cboEstadoEdit.ReadOnly = false;
                    txtasuntoEdit.Text = t.Asunto;
                    txtasuntoEdit.ReadOnly = false;
                    txtDetEdit.Text = t.Detalle;
                    txtDetEdit.ReadOnly = false;
                    tbComplEdit.Value = t.PrcCumpli;
                    txtResolucionEdit.Text = t.Resolucion;
                    txtTiempoEstimadoEdit.Text = t.TiempoEstimado.ToString();

                }

            }
        }

        protected void btnGuardarEdit_Click(object sender, EventArgs e)
        {
         

            try
            {
                CVT_Registro_Tareas rt = new CVT_Registro_Tareas();
                TareasClass tr = new TareasClass();

                int i = 0;
                int a = 0;
                bool result = int.TryParse(cboAreaEdit.Value.ToString(), out i);
                bool resultA = int.TryParse(cboAsignadoEdit.Value.ToString(), out a);
                int est = Convert.ToInt32(cboEstadoEdit.Value);
                int Prc= Convert.ToInt32(tbComplEdit.Value);

                int PrCompl = 0;
                int Estado = 0;

                int idArea = 0;
                int asig = 0;
                if (result==true)
                {
                    idArea = Convert.ToInt32(cboAreaEdit.Value);
                }
                else { idArea =Convert.ToInt32(Session["_IdArea"]) ; }

                if(resultA==true)
                {
                    asig= Convert.ToInt32(cboAsignadoEdit.Value);
                }
                else { asig =Convert.ToInt32(Session["_idAsignado"]) ; }

                ////////////////////////////////////////////////////////////////////////
                if (est == 2 || Prc==100 )
                {
                    PrCompl = 100;
                    Estado = 2;
                }
                else {

                    PrCompl=Convert.ToInt32(tbComplEdit.Value);
                    Estado = Convert.ToInt32(cboEstadoEdit.Value);
                }

                if(Convert.ToInt32(cboEstadoEdit.Value)==3 && Convert.ToInt32(tbComplEdit.Value) == 100)
                {
                    rt.FechaInicioReal = DateTime.Now;
                    rt.HoraInicioReal = DateTime.Now.TimeOfDay;
                    rt.FechaTerminoReal = DateTime.Now;
                    rt.HoraTeminoReal = DateTime.Now.TimeOfDay;
                }
                else if(Convert.ToInt32(cboEstadoEdit.Value) == 2 || Convert.ToInt32(tbComplEdit.Value)==100)
                {
                    rt.FechaTerminoReal = DateTime.Now;
                    rt.HoraTeminoReal = DateTime.Now.TimeOfDay;
                }else if (Convert.ToInt32(cboEstadoEdit.Value) == 3)
                {
                    rt.FechaInicioReal = DateTime.Now;
                    rt.HoraInicioReal = DateTime.Now.TimeOfDay;
                }


                    DateTime fini = Convert.ToDateTime(dteFIniEdit.Value);
                DateTime fterm = Convert.ToDateTime(dteFtermEdit.Value);
                int pri = Convert.ToInt32(cboPrioridadEdit.Value);
              
                string asunt = txtasuntoEdit.Text;
                string det = txtDetEdit.Text;        

                rt.DptoID = idArea;
                rt.FechaInicio = fini;
                rt.FechaTermino = fterm;
                rt.Prioridad = pri;
                rt.Estado = Estado;
                rt.Asunto = asunt;
                rt.Detalle = det;
                rt.PrcCumpli = PrCompl;
                rt.IdAsignado = asig;
                rt.Resolucion = txtResolucionEdit.Text;
                rt.TiempoEstimado =Convert.ToInt32(txtTiempoEstimadoEdit.Text);

                string rs = tr.ActualizaTarea(Convert.ToInt32(Session["IDtareaEdit"]),rt);

                if (rs.Equals("0"))
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado!');", true);
                    cboAreaEdit.SelectedIndex = -1;
                    cboAsignadoEdit.SelectedIndex = -1;
                    dteFIniEdit.Value = DateTime.Now;
                    dteFtermEdit.Value = DateTime.Now;
                    cboPrioridadEdit.SelectedIndex = -1;
                    cboEstadoEdit.SelectedIndex = -1;
                    txtasuntoEdit.Text = string.Empty;
                    txtDetEdit.Text = string.Empty;
                    tbComplEdit.Value = 0;

                    popEdit.ShowOnPageLoad = false;
                    crwDatos.DataBind();
                }
                else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al registrar favor verificar!');", true); }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: " + ex.Message + " ');", true);

            }
        }

        protected void btnCancelarEdit_Click(object sender, EventArgs e)
        {
            cboAreaEdit.SelectedIndex = -1;
            cboAsignadoEdit.SelectedIndex = -1;
            dteFIniEdit.Value = DateTime.Now;
            dteFtermEdit.Value = DateTime.Now;
            cboPrioridadEdit.SelectedIndex = -1;
            cboEstadoEdit.SelectedIndex = -1;
            txtasuntoEdit.Text = string.Empty;
            txtDetEdit.Text = string.Empty;
            tbComplEdit.Value = 0;

            popEdit.ShowOnPageLoad = false;
            crwDatos.DataBind();
        }

        protected void CboArea_SelectedIndexChanged(object sender, EventArgs e)
        {
            LqsPersonal.WhereParameters.Clear();
            LqsPersonal.WhereParameters.Add("idArea", System.Data.DbType.Int32, CboArea.Value.ToString());        
            LqsPersonal.Where = "Id_Area=@idArea";
        }

        protected void cboAreaEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            LqsPersonal0.WhereParameters.Clear();
            LqsPersonal0.WhereParameters.Add("idArea", System.Data.DbType.Int32, cboAreaEdit.Value.ToString());      
            LqsPersonal0.Where = "Id_Area=@idArea";
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            TaskNewPopup.ShowOnPageLoad = true;
            TaskSaveButton.Visible = true;
            CboArea.ReadOnly = false;
            cboAsignado.ReadOnly = false;
            dteInicio.ReadOnly = false;
            dteTermino.ReadOnly = false;
            cboPrioridad.ReadOnly = false;
            cboEstado.ReadOnly = true;
            cboEstado.SelectedIndex = 0;
            txtAsunto.ReadOnly = false;
            txtDetalle.ReadOnly = false;
            tbPorcentaje.ReadOnly = false;
          

            TareasClass tr = new TareasClass();
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            int AreaUser = tr.AreaUser(idUsuario);

            if (idPerfil == 1)
            {
                LqsAreaTrabajo.WhereParameters.Clear();

            }
            else
            {
                LqsAreaTrabajo.WhereParameters.Clear();
                LqsAreaTrabajo.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                //LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
                LqsAreaTrabajo.Where = "Id_Area=@idArea";
                //LqsPersonal.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                //LqsPersonal.Where = "Id_Area=@idArea";
            }
         
        }

        protected void btnTodos_Click(object sender, EventArgs e)
        {
            //LqsTareas.WhereParameters.Clear();
    
            TareasClass tr = new TareasClass();
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            int AreaUser = tr.AreaUser(idUsuario);
            UsuarioClass us = new UsuarioClass();
            int Jef = us.VerificaJefeArea(idUsuario);

            if (idPerfil == 1)
            {
                LqsTareas.WhereParameters.Clear();

            }
            else if (idPerfil == 13 || Jef==1)
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                //LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
                LqsTareas.Where = "DptoID=@idArea";
            }
            else
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("IdAsignado", System.Data.DbType.Int32, idUsuario.ToString());
                //LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
                LqsTareas.Where = "IdAsignado=@IdAsignado";

            }
            crwDatos.DataBind();

            //LqsPersonal.WhereParameters.Add("idArea", System.Data.DbType.Int32, CboArea.Value.ToString());
            //LqsPersonal.Where = "Id_Area=@idArea";
        }

        protected void btnCompletos_Click(object sender, EventArgs e)
        {
            
           
          
            TareasClass tr = new TareasClass();
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            int AreaUser = tr.AreaUser(idUsuario);
            UsuarioClass us = new UsuarioClass();
            int Jef = us.VerificaJefeArea(idUsuario);

            if (idPerfil == 1)
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(2));
                LqsTareas.Where = "Estado=@Est";
            }
            else if (idPerfil == 13 || Jef==1)
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(2));
                LqsTareas.Where = "DptoID=@idArea && Estado=@Est ";
            }
            else
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("IdAsignado", System.Data.DbType.Int32, idUsuario.ToString());
                LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(2));
                LqsTareas.Where = "IdAsignado=@IdAsignado && Estado=@Est";

            }


            crwDatos.DataBind();
        }

        protected void btnIncompletos_Click(object sender, EventArgs e)
        {

            TareasClass tr = new TareasClass();
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            int AreaUser = tr.AreaUser(idUsuario);
            UsuarioClass us = new UsuarioClass();
            int Jef = us.VerificaJefeArea(idUsuario);

            if (idPerfil == 1)
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(2));
                LqsTareas.Where = "Estado!=@Est";
            }
            else if (idPerfil == 13 || Jef==1)
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(2));
                LqsTareas.Where = "DptoID=@idArea && Estado!=@Est ";
            }
            else
            {
                LqsTareas.WhereParameters.Clear();
                LqsTareas.WhereParameters.Add("IdAsignado", System.Data.DbType.Int32, idUsuario.ToString());
                LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(2));
                LqsTareas.Where = "IdAsignado=@IdAsignado && Estado!=@Est";

            }


            crwDatos.DataBind();
        }

        protected void btnInforme_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Tareas/TareaInforme.aspx");
        }

        protected void btnEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            int st = Convert.ToInt32(btnEstados.Value);
      

                    TareasClass tr = new TareasClass();
                    int idPerfil = Convert.ToInt32(Session["PerfilId"]);
                    int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    int AreaUser = tr.AreaUser(idUsuario);
            UsuarioClass us = new UsuarioClass();
            int Jef = us.VerificaJefeArea(idUsuario);

            if (idPerfil == 1)
                    {
                        LqsTareas.WhereParameters.Clear();
                        LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(st));
                        LqsTareas.Where = "Estado=@Est";
                    }
                    else if (idPerfil == 13 || Jef == 1 )
                    {
                        LqsTareas.WhereParameters.Clear();
                        LqsTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                        LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(st));
                        LqsTareas.Where = "DptoID=@idArea && Estado=@Est ";
                    }
                    else
                    {
                        LqsTareas.WhereParameters.Clear();
                        LqsTareas.WhereParameters.Add("IdAsignado", System.Data.DbType.Int32, idUsuario.ToString());
                        LqsTareas.WhereParameters.Add("Est", System.Data.DbType.Int32, Convert.ToString(st));
                        LqsTareas.Where = "IdAsignado=@IdAsignado && Estado=@Est";

                    }
                    crwDatos.DataBind();              
            }
        }
    }
