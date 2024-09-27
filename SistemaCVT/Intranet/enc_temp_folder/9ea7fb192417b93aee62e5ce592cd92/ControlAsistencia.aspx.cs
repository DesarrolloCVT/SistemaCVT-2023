using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class ControlAsistencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GvAsistencia.DataBind();
            }
            GvAsistencia.DataBind();
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            if (cb_area.Value != null && cb_fecha.Value != null && cb_persona.Value != null && cb_trabajo.Value != null && txt_HoraIngreso.Text != "" && txt_MinIngreso.Text != "")
            {
                try
                {
                    CVT_Asistencia vNuevo = new CVT_Asistencia();
                    AsistenciaClass vAsistencia = new AsistenciaClass();

                    vNuevo.Id_Area = Convert.ToInt32(cb_area.Value);
                    vNuevo.Id_Labores = Convert.ToInt32(cb_trabajo.Value);
                    vNuevo.Id_Personal = cb_persona.Value.ToString();
                    vNuevo.Fecha = cb_fecha.Date;
                    string horaEntrada = txt_HoraIngreso.Text + ":" + txt_MinIngreso.Text;
                    TimeSpan hrIn = TimeSpan.Parse(horaEntrada);
                    vNuevo.Hora_Entrada = hrIn;
                    vNuevo.Turno = Convert.ToInt32(cboTurno.Value);
                    if (txt_HoraSalida.Text != "" && txt_MinSalida.Text != "")
                    {
                        string horaSalida = txt_HoraSalida.Text + ":" + txt_MinSalida.Text;
                        TimeSpan hrOut = TimeSpan.Parse(horaSalida);
                        vNuevo.Hora_Salida = hrOut;
                    }
                    vNuevo.Id_Usuario = vAsistencia.obtenerIdUsuario(Session["CIDUsuario"].ToString());
                    DateTime fechaReg = DateTime.Now;
                    vNuevo.Fecha_Registro = fechaReg;
                    if (txt_Comentarioss.Text != "")
                    {
                        vNuevo.Comentario = txt_Comentarioss.Text;
                    }
                    vAsistencia.InsertaRegistroAsistencia(vNuevo);

                    GvAsistencia.DataBind();
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 109, "Crea Registro");

                    #region Limpiar Campos
                    //cb_area.SelectedIndex = -1;
                    //cb_trabajo.SelectedIndex = -1;
                    cb_persona.SelectedIndex = -1;
                    //cboTurno.SelectedIndex = -1;
                    //cb_fecha.Value = null;
                    //txt_Comentarioss.Text = "";
                    //txt_HoraIngreso.Text = "";
                    //txt_HoraSalida.Text = "";
                    //txt_MinIngreso.Text = "";
                    //txt_MinSalida.Text = "";
                    #endregion
                }
                catch (Exception)
                {

                }
            }

        }

        protected void GvDatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            GvAsistencia.DataBind();
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 112, "Elimina Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 112, "Actualiza Registro");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvAsistencia.DataBind();
        }
    }
}