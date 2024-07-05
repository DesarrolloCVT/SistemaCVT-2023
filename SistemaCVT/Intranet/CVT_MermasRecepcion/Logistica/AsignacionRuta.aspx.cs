using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;

namespace CVT_MermasRecepcion.Logistica
{
    public partial class AsignacionRuta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void cbo_camion_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                
        }

        protected void cbo_Carro_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

      

        protected void rb_TipoCamion_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(rb_TipoCamion.Value=="1")
            {
                cbo_Cvirtual.Visible = false;
                cbo_camion.Visible = true;
                cbo_Carro.Visible = true;
                lbl_carro.Visible = true;
            }
            if (rb_TipoCamion.Value == "2")
            {
                cbo_Cvirtual.Visible = true;
                cbo_camion.Visible = false;
                cbo_Carro.Visible = false;
                lbl_carro.Visible = false;
            }
        }

        protected void cbo_Cvirtual_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbl_CantPallet.Text = "28";
        }

        protected void btn_asignar_Click(object sender, EventArgs e)
        {
            try
            {
                LogisticaClass cLogistica = new LogisticaClass();
                CVT_AsignacionRuta vNew = new CVT_AsignacionRuta();
                vNew.FechaEntrega = cbo_fecha.Date;
                if (rb_TipoCamion.Value == "1")
                {
                    vNew.Camion_ID = cbo_camion.Value.ToString();
                }
                else
                {
                    vNew.Camion_ID = cbo_Cvirtual.Value.ToString();
                }
                string[] Pedido = new string[6];
                Pedido = cbo_pedido.Text.Split(';');
                string[] cpallet = new string[2];
                string[] peso = new string[2];
                cpallet = Pedido[4].Split(',');
                peso = Pedido[5].Split(',');
                vNew.Pedido = Convert.ToInt32(Pedido[0]);
                vNew.Cliente = Pedido[2];
                vNew.Direccion = Pedido[3];
                vNew.CantidadPallet = Convert.ToInt32(cpallet[0]);
                vNew.PesoPallet = Convert.ToInt32(peso[0]);
                vNew.PrioridadCarga = Convert.ToInt32(cbo_prioridad.Value);
                cLogistica.InsertaAsignacion(vNew);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ex.Message.ToString() + "');", true);
            }
            GVResumenCamion.DataBind();
            lqdspedido.DataBind();
            cbo_pedido.SelectedIndex = -1;
            cbo_pedido.DataBind();
        }

        protected void btn_AsignarPatente_Click(object sender, EventArgs e)
        {
            LogisticaClass cLogistica = new LogisticaClass();
            cLogistica.ActualizaCamionAsignacionMasivo(Session["Patente"].ToString(), Convert.ToDateTime(Session["FechaEntrega"]), Cbo_CamionEditar.Value.ToString(), cbo_Chofer.Value.ToString(),cbo_CarroAsig.Value.ToString(), txt_HoraSalida.Text, Convert.ToInt32(txt_cantPeonetas.Text), txt_Observacion.Text);
            GvRutasAsignadas.DataBind();
            GVResumenCamion.DataBind();

        }

        protected void GVResumenCamion_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                popup_editaasignacion.ShowOnPageLoad = true;
                string[] ID=new string[2];
                ID=e.KeyValue.ToString().Split('|');
                Session["Patente"] = ID[0];
                Session["FechaEntrega"] = ID[1];
            }
        }

        protected void GvRutasAsignadas_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {   
            LqDsResumen.DataBind();
            GVResumenCamion.DataBind();
            lqdspedido.DataBind();
            cbo_pedido.SelectedIndex = -1;
            cbo_pedido.DataBind();
        }

        protected void GvRutasAsignadas_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {
            LqDsResumen.DataBind();
            GVResumenCamion.DataBind();
            lqdspedido.DataBind();
            cbo_pedido.SelectedIndex = -1;
            cbo_pedido.DataBind();
        }

        protected void btn_refrescar_Click(object sender, EventArgs e)
        {
            LqDsResumen.DataBind();
            GVResumenCamion.DataBind();
            lqdspedido.DataBind();
            cbo_pedido.SelectedIndex = -1;
            cbo_pedido.DataBind();
        }
    }
}