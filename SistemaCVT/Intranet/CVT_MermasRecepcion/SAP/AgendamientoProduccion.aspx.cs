using DBMermasRecepcion;
using System;
using System.Web.UI;



namespace CVT_MermasRecepcion.SAP
{
    public partial class AgendamientoProduccion : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void CargaPrevisionNuevo(string codigo, decimal cantidad)
        {
            SchedulerClass vAgen = new SchedulerClass();
            GvPrevision.DataSource = vAgen.ObtienePrevision(codigo, cantidad);
            GvPrevision.DataBind();
        }

        //protected void PopUp_Editar_WindowCallback(object source, DevExpress.Web.PopupWindowCallbackArgs e)
        //{
        //    Session["IdAppoinment"] = e.Parameter;
        //    SchedulerClass vAgenda=new SchedulerClass();
        //    List<CVT_Agendamiento> dt=new List<CVT_Agendamiento>();
        //    List<CVT_AgendamientoLinea> dtlineas = new List<CVT_AgendamientoLinea>();
        //    dt=vAgenda.ObtieneAgendamientoxId(Convert.ToInt32(e.Parameter));
        //    dtlineas = vAgenda.ObtieneLineasAgendamiento(Convert.ToInt32(e.Parameter));
        //    foreach (var d in dt)
        //    {

        //        txtcantplanificada.Text = d.CantidadPlanificada.ToString();
        //        txtcantproducida.Text = d.CantidadProducida.ToString();
        //        txtcomentario.Text = d.Descripcion;
        //        cboestado.Value = d.Estado.ToString();
        //        cboestadoof.Value = d.Estado_OF.ToString();
        //        cboflimite.Date = Convert.ToDateTime(d.FechaLimite);
        //        cboinicio.Date = d.Inicio;
        //        txtof.Text = d.OF_DocEntry.ToString();
        //        cboproducto.Value = d.ProductoCode;
        //        cboproducto.Text = d.Asunto;
        //        cborecurso.Value = d.RecursoId.ToString();
        //        txtsemana.Text = d.Semana.ToString();
        //        cbotermino.Date = d.Termino;
        //        cbotipoproduccion.Value = d.Tipo_Produccion.ToString();
        //        cboturno.Value = d.Turno.ToString();
        //    }
        //    chklineas.UnselectAll();
        //    foreach (var d in dtlineas)
        //    {
        //        int index=chklineas.Items.IndexOfValue(d.LineaId);
        //        chklineas.Items[index].Selected = true;
        //    }

        //}

        //protected void cmdNuevo_Click(object sender, ImageClickEventArgs e)
        //{
        //    PopUp_Nuevo.ShowOnPageLoad = true;
        //}

        protected void btn_cancelarA_Click(object sender, EventArgs e)
        {
            PopUp_Nuevo.ShowOnPageLoad = false;
        }

        //protected void btn_cancelarE_Click(object sender, EventArgs e)
        //{
        //    PopUp_Editar.ShowOnPageLoad = false;
        //}

        //protected void btn_actualizar_Click(object sender, EventArgs e)
        //{
        //    SchedulerClass vAgenda = new SchedulerClass();
        //    CVT_Agendamiento vNuevo = new CVT_Agendamiento();

        //    vNuevo.Asunto = cboproducto.Text;
        //    vNuevo.CantidadPlanificada=Convert.ToDecimal(txtcantplanificada.Text);
        //    vNuevo.CantidadProducida=txtcantproducida.Text==string.Empty?0:Convert.ToDecimal(txtcantproducida.Text);
        //    vNuevo.Descripcion=txtcomentario.Text;
        //    vNuevo.Estado = cboestado.Value==null?(short)0:Convert.ToInt16(cboestado.Value);
        //    vNuevo.Estado_OF = cboestadoof.Value == null ? (short)0 : Convert.ToInt16(cboestadoof.Value);
        //    vNuevo.FechaLimite=cboflimite.Date;
        //    vNuevo.Inicio=cboinicio.Date;
        //    vNuevo.OF_DocEntry = txtof.Text==string.Empty?0:Convert.ToInt32(txtof.Text);
        //    vNuevo.ProductoCode=cboproducto.Value.ToString();
        //    vNuevo.RecursoId=cborecurso.Value==null?0:Convert.ToInt32(cborecurso.Value);
        //    vNuevo.Semana = txtsemana.Text == string.Empty ? 0 : Convert.ToInt32(txtsemana.Text);
        //    vNuevo.Termino=cbotermino.Date;
        //    vNuevo.Tipo_Produccion = cbotipoproduccion.Value == null ? (short)0 : Convert.ToInt16(cbotipoproduccion.Value);
        //    vNuevo.Turno = cboturno.Value == null ? (short)0 : Convert.ToInt16(cboturno.Value);


        //    vAgenda.ActualizaAgendamiento(Convert.ToInt32(Session["IdAppoinment"]), vNuevo);
        //    vAgenda.EliminaLineasAgendamiento(Convert.ToInt32(Session["IdAppoinment"]));
        //    foreach (var r in chklineas.SelectedItems)
        //    {
        //        vAgenda.AgregaLineasAgendamiento(Convert.ToInt32(Session["IdAppoinment"]), (int)((DevExpress.Web.ListEditItem)(r)).Value);
        //    }
        //    CargaAgenda();
        //    PopUp_Editar.ShowOnPageLoad = false;
        //}

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {

            CVT_Agendamiento vNuevo = new CVT_Agendamiento
            {
                Asunto = cboproducto1.Text,
                CantidadPlanificada = Convert.ToInt32(txtcantplanificada1.Text),
                Descripcion = txtcomentario1.Text,
                Estado = Convert.ToInt16(cboestado1.Value),
                FechaLimite = cboflimite1.Date,
                Inicio = cboinicio1.Date,
                ProductoCode = cboproducto1.Value.ToString(),
                RecursoId = Convert.ToInt32(cborecurso1.Value),
                Semana = Convert.ToInt32(txtsemana1.Text),
                Termino = cbotermino1.Date,
                Tipo_Produccion = Convert.ToInt16(cbotipoproduccion1.Value),
                Turno = Convert.ToInt16(cboturno1.Value),
                OF_DocEntry = txtOf.Text == string.Empty ? 0 : Convert.ToInt32(txtOf.Text),
                Estado_OF = cboestadoof.Value == null ? (short)0 : Convert.ToInt16(cboestadoof.Value)
            };

            SchedulerClass vAgenda = new SchedulerClass();
            vAgenda.AgregaAgendamiento(vNuevo);
            //int idagenda = vAgenda.AgregaAgendamiento(vNuevo);
            //foreach (var r in chklineas1.SelectedItems)
            //{
            //    vAgenda.AgregaLineasAgendamiento(idagenda, (int)((DevExpress.Web.ListEditItem)(r)).Value);
            //}           
            PopUp_Nuevo.ShowOnPageLoad = false;
        }

        protected void cboproducto1_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargaPrevisionNuevo(cboproducto1.Value.ToString(), Convert.ToDecimal(txtcantplanificada1.Text));
        }

        protected void txtcantplanificada1_TextChanged(object sender, EventArgs e)
        {
            CargaPrevisionNuevo(cboproducto1.Value.ToString(), Convert.ToDecimal(txtcantplanificada1.Text));
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopUp_Nuevo.ShowOnPageLoad = true;
            }
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Agendamiento Produccion";
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                int idagen = Convert.ToInt32(e.KeyValue);

                SchedulerClass vAgenda = new SchedulerClass();
                bool res = vAgenda.CambiaEstadoAgenda(idagen, 1);
                if (res == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Produccion Terminada');", true);
                    GvDatos.DataBind();
                }



            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Estado");
            if (Estado == 1)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = false;

            }
            else
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = true;
            }
        }
    }
}