using DBMermasRecepcion;
using DevExpress.Web.ASPxScheduler;
using DevExpress.XtraPrinting;
using DevExpress.XtraScheduler;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mantencion
{
    public partial class AgendaMantencion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaAgenda();
            PrepareReportPreview(PreviewPanel);



        }

        protected void CargaAgenda()
        {
            AgendaMantencionClass vAgen = new AgendaMantencionClass();
            this.AspxAgenda.AppointmentDataSource = vAgen.ObtieneAgendamientos();
            this.AspxAgenda.Start = DateTime.Now;
            this.AspxAgenda.DataBind();
        }

        protected void AspxAgenda_PopupMenuShowing(object sender, DevExpress.Web.ASPxScheduler.PopupMenuShowingEventArgs e)
        {
            ASPxSchedulerPopupMenu menu = e.Menu;
            DevExpress.Web.MenuItemCollection items = menu.Items;
            if (menu.Id.Equals(SchedulerMenuItemId.DefaultMenu))
            {
                this.LimpiaMenuAgenda(menu);
                this.AgregaMenu(menu, "Agenda");
            }
        }
        protected void AgregaMenu(ASPxSchedulerPopupMenu menu, string caption)
        {
            menu.Items.Insert(0, new DevExpress.Web.MenuItem("Una Hora", "SwitchTimeScale!01:00:00"));
            menu.Items.Insert(1, new DevExpress.Web.MenuItem("30 Minutos", "SwitchTimeScale!00:30:00"));
            menu.Items.Insert(2, new DevExpress.Web.MenuItem("15 Minutos", "SwitchTimeScale!00:15:00"));
            menu.Items.Insert(3, new DevExpress.Web.MenuItem("10 Minutos", "SwitchTimeScale!00:10:00"));
        }
        protected void LimpiaMenuAgenda(ASPxSchedulerPopupMenu menu)
        {
            this.RemueveMenu(menu, "NewAppointment");
            this.RemueveMenu(menu, "NewAllDayEvent");
            this.RemueveMenu(menu, "NewRecurringAppointment");
            this.RemueveMenu(menu, "NewRecurringEvent");
            this.RemueveMenu(menu, "GotoToday");
            this.RemueveMenu(menu, "GotoDate");
            this.RemueveMenu(menu, "GotoThisDay");
            this.RemueveMenu(menu, "SwitchViewMenu");
            this.RemueveMenu(menu, "SwitchTimeScale!01:00:00");
            this.RemueveMenu(menu, "SwitchTimeScale!00:30:00");
            this.RemueveMenu(menu, "SwitchTimeScale!00:15:00");
            this.RemueveMenu(menu, "SwitchTimeScale!00:10:00");
            this.RemueveMenu(menu, "SwitchTimeScale!00:06:00");
            this.RemueveMenu(menu, "SwitchTimeScale!00:05:00");
        }

        protected void RemueveMenu(ASPxSchedulerPopupMenu menu, string menuItemName)
        {
            DevExpress.Web.MenuItem item = menu.Items.FindByName(menuItemName);
            if (item != null)
            {
                menu.Items.Remove(item);
            }
        }

        protected void AspxAgenda_AppointmentFormShowing(object sender, DevExpress.Web.ASPxScheduler.AppointmentFormEventArgs e)
        {
            e.Cancel = true;
        }

        protected void PopUp_VerDatos_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        {
            Session["IdAppoinment"] = e.Parameter;
            GvMaquina.DataBind();
            GvPartes.DataBind();
            GvPiezas.DataBind();
            GvHerramientas.DataBind();
            GvRepuestos.DataBind();
            GvRRHH.DataBind();
        }
        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            PreviewPanel.Visible = true;
        }
        void PrepareReportPreview(Control cp)
        {

            ReportPreview reportPreview = (ReportPreview)Page.LoadControl("ReportPreview.ascx");

            reportPreview.ControlAdapter = ASPxSchedulerControlPrintAdapter1;
            cp.Controls.Clear();
            cp.Controls.Add(reportPreview);

        }



    }
}