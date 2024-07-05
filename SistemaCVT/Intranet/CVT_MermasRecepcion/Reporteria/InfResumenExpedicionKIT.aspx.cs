using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InfResumenExpedicionKIT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Informe Maquinas";
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }

        protected void btn_generar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
            TransformacionesClass vTrans = new TransformacionesClass();
            int expip = vTrans.VerificaExpedicionTransformacion(Convert.ToInt32(txt_expedicion.Text));
            if (expip == 0)
            {
                btn_transformar.Enabled = true;
            }
            else
            {
                btn_transformar.Enabled = false;
            }
        }

        protected void btn_transformar_Click(object sender, EventArgs e)
        {
            SAPClass vSAP = new SAPClass();

            try
            {
                string resp = string.Empty;
                if (vSAP.ExisteSalidaExpedicionKIT(Convert.ToInt32(txt_expedicion.Text)) == 0)
                {
                    resp = vSAP.CreaSalidaTransformacionExpedicion(Convert.ToInt32(txt_expedicion.Text), Session["CIDUsuario"].ToString());

                    if (resp == "0")
                    {
                        resp = vSAP.CreaEntradaTransformacionExpedicion(Convert.ToInt32(txt_expedicion.Text), Session["CIDUsuario"].ToString());
                        if (resp == "0")
                        {
                            LogClass vLog = new LogClass();
                            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 67, "Transforma Registro");

                            CVT_ExpedicionesTransformadas vnuevo = new CVT_ExpedicionesTransformadas();
                            vnuevo.Expedicion_Id = Convert.ToInt32(txt_expedicion.Text);
                            vnuevo.Fecha = DateTime.Now;
                            TransformacionesClass vTrans = new TransformacionesClass();
                            vTrans.AgregaExpedicionTransformada(vnuevo);
                            btn_transformar.Enabled = false;
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Proceso Terminado Exitosamente');", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Entrada no pudo ser realizada" + resp + "');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Salida con problemas " + resp + "');", true);
                    }
                }
                else
                {
                    resp = vSAP.CreaEntradaTransformacionExpedicion(Convert.ToInt32(txt_expedicion.Text), Session["CIDUsuario"].ToString());
                    if (resp == "0")
                    {
                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 67, "Transforma Registro");

                        CVT_ExpedicionesTransformadas vnuevo = new CVT_ExpedicionesTransformadas();
                        vnuevo.Expedicion_Id = Convert.ToInt32(txt_expedicion.Text);
                        vnuevo.Fecha = DateTime.Now;
                        TransformacionesClass vTrans = new TransformacionesClass();
                        vTrans.AgregaExpedicionTransformada(vnuevo);
                        btn_transformar.Enabled = false;
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Proceso Terminado Exitosamente');", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Entrada no pudo ser realizada" + resp + "');", true);
                    }
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Salida con problemas ');", true);
            }

           
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Resumen Expedicion KIT N° " + txt_expedicion.Text;
            }
        }
    }
}