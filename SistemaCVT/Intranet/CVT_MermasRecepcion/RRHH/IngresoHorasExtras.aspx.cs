using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class IngresoHorasExtras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Horas Extras";
            Options.SheetName = this.ASPxGridViewExporter1.FileName;
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            try
            {
                CVT_HorasExtras vNew = new CVT_HorasExtras();
                vNew.Empleado_Id = Convert.ToString(cbo_empleado.Value);
                vNew.Fecha = cb_fecha.Date;
                TimeSpan horas = new TimeSpan(Convert.ToInt32(txt_hora.Text), Convert.ToInt32(txt_min.Text), 0);
                vNew.Horas = horas;
                vNew.HE_100 = chk_100.Checked == true ? (short)1 : (short)0;
                ControlAccesoClass vAcceso = new ControlAccesoClass();
                vAcceso.IngresaHoraExtra(vNew);
                GvDatos.DataBind();

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 78, "Crea Registro");
            }
            catch { }

        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 78, "Elimina Registro");
        }
    }
}