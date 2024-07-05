using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class SolicitudTransferenciaDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblSolicitud.InnerText = "Detalle solicitud N°: " + Session["IdSolicitud"].ToString();

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Id_Solicitud"] = Session["IdSolicitud"];
            GvDatos.DataBind();
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ControlFilm/SolicitudTransferencia.aspx");
        }
        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            ControlFilmClass cfc = new ControlFilmClass();
            bool ret = true;
            int Estado = cfc.ObtieneEstadoSolicitudTransfer(Convert.ToInt32(Session["IdSolicitud"]));
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            LqsDetalleSolicitud.EnableInsert = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            LqsDetalleSolicitud.EnableUpdate = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            LqsDetalleSolicitud.EnableDelete = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);



        }
    }
}