using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Calidad.Mermas
{
    public partial class RegistroMermas : System.Web.UI.Page
    {
        DataTable _DTRecep = new DataTable();
        DataTable _DTDetRecep = new DataTable();
        private void CargaRecepciones()
        {
            try
            {

                MermasClass vMermas = new MermasClass();
                int var_bus_NumGuiaDesp = 0;
                int var_bus_NumOrdenC = 0;
                int var_bus_RecepWms = 0;
                string var_bus_Ref_Cliente = "";
                string var_bus_LoteInterno = "";
                DateTime varFechaRec = new DateTime(1900, 01, 01);

                if (txt_GDesp.Text != string.Empty)
                    var_bus_NumGuiaDesp = Convert.ToInt32(txt_GDesp.Text);
                if (txt_OCompra.Text != string.Empty)
                    var_bus_NumOrdenC = Convert.ToInt32(txt_OCompra.Text);
                if (txt_RecepWms.Text != string.Empty)
                    var_bus_RecepWms = Convert.ToInt32(txt_RecepWms.Text);
                if (txt_Factura.Text != string.Empty)
                    var_bus_Ref_Cliente = txt_Factura.Text;
                if (txt_Lote.Text != string.Empty)
                    var_bus_LoteInterno = txt_Lote.Text;
                if (txt_FRecep.Text != string.Empty)
                    varFechaRec = txt_FRecep.Date;

                if (var_bus_NumGuiaDesp == 0 && var_bus_NumOrdenC == 0 && var_bus_RecepWms == 0 && var_bus_Ref_Cliente == "" && var_bus_LoteInterno == "" && varFechaRec == Convert.ToDateTime("01-01-1900"))
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Debe Ingresar al Menos un Criterio de Busqueda');", true);
                else
                {

                    _DTRecep = vMermas.SP_ObtieneRecepciones(var_bus_NumGuiaDesp, var_bus_Ref_Cliente, var_bus_NumOrdenC, var_bus_RecepWms, var_bus_LoteInterno, varFechaRec);
                    GvRecepciones.DataSource = _DTRecep;
                    GvRecepciones.DataBind();


                }
                //_DTDetRecep = vMermas.SP_ObtieneDetRecep(Convert.ToInt32(Session["_DocEntry"]));
                //GvDetRecepcion.DataSource = _DTDetRecep;
                //GvDetRecepcion.DataBind();
            }
            catch
            {
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 1, "Ingreso");
            }
            GvRecepciones.DataSource = Session["DTRecep"];
            //GvDetRecepcion.KeyFieldName = "DocNum;LineNum;ItemCode";
            //GvDetRecepcion.DataBind();
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 1, "Boton");
                int var_bus_NumGuiaDesp = 0;
                int var_bus_NumOrdenC = 0;
                int var_bus_RecepWms = 0;
                string var_bus_Ref_Cliente = "";
                string var_bus_LoteInterno = "";
                DateTime varFechaRec = new DateTime(1900, 01, 01);

                if (txt_GDesp.Text != string.Empty)
                    var_bus_NumGuiaDesp = Convert.ToInt32(txt_GDesp.Text);
                if (txt_OCompra.Text != string.Empty)
                    var_bus_NumOrdenC = Convert.ToInt32(txt_OCompra.Text);
                if (txt_RecepWms.Text != string.Empty)
                    var_bus_RecepWms = Convert.ToInt32(txt_RecepWms.Text);
                if (txt_Factura.Text != string.Empty)
                    var_bus_Ref_Cliente = txt_Factura.Text;
                if (txt_Lote.Text != string.Empty)
                    var_bus_LoteInterno = txt_Lote.Text;
                if (txt_FRecep.Text != string.Empty)
                    varFechaRec = txt_FRecep.Date;

                if (var_bus_NumGuiaDesp == 0 && var_bus_NumOrdenC == 0 && var_bus_RecepWms == 0 && var_bus_Ref_Cliente == "" && var_bus_LoteInterno == "" && varFechaRec == Convert.ToDateTime("01-01-1900"))
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Debe Ingresar al Menos un Criterio de Busqueda');", true);
                else
                {
                    MermasClass vMermas = new MermasClass();
                    _DTRecep = vMermas.SP_ObtieneRecepciones(var_bus_NumGuiaDesp, var_bus_Ref_Cliente, var_bus_NumOrdenC, var_bus_RecepWms, var_bus_LoteInterno, varFechaRec);
                    Session["DTRecep"] = _DTRecep;
                    GvRecepciones.DataSource = Session["DTRecep"];
                    GvRecepciones.DataBind();
                    GvDetRecepcion.DataBind();
                }
            }
            catch
            { }
        }

        protected void GvRecepciones_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {

            if (e.CommandArgs.CommandName == "cmdDetRecep")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 1, "Boton");
                string[] ids = new string[4];
                ids = e.KeyValue.ToString().Split('|');
                MermasClass vMermas = new MermasClass();
                _DTDetRecep = vMermas.SP_ObtieneDetRecep(Convert.ToInt32(ids[0]));
                Session["_DocEntry"] = Convert.ToInt32(ids[0]);
                try
                {
                    Session["_RecWMS"] = Convert.ToInt32(ids[1]);
                }
                catch
                {
                    Session["_RecWMS"] = 0;
                }
                Session["_OC"] = Convert.ToInt32(ids[2]);
                try
                {
                    Session["_GuiaDesp"] = Convert.ToInt32(ids[3]);
                }
                catch
                {
                    Session["_GuiaDesp"] = 0;
                }
                GvDetRecepcion.DataSource = _DTDetRecep;
                GvDetRecepcion.KeyFieldName = "DocNum;LineNum;ItemCode;Manifiesto;Comentario;Ind_ReclamoSeguro;TipoMerma;Cant_Merma";//;Manifiesto;Comentario;Ind_ReclamoSeguro;TipoMerma;Cant_Merma
                GvDetRecepcion.DataBind();

            }
        }

        protected void GvDetRecepcion_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            string docnum = e.Keys[0].ToString();
            string linenum = e.Keys[1].ToString();
            string itemcode = e.Keys[2].ToString();
            string Manifiesto = string.Empty;
            string Comentario = string.Empty;
            string seguro = e.NewValues["Ind_ReclamoSeguro"].ToString();
            int MotMerma = Convert.ToInt32(e.NewValues["Cod_TipoMerma"]);
            int CantMerma = Convert.ToInt32(e.NewValues["Cant_Merma"]);
            try
            {
                Manifiesto = e.NewValues["Manifiesto"].ToString();
            }
            catch
            {
                Manifiesto = string.Empty;
            }
            try
            {
                Comentario = e.NewValues["Comentario"].ToString();
            }
            catch
            {
                Comentario = string.Empty;
            }
            MermasClass vMermas = new MermasClass();
            SAPClass vSap = new SAPClass();
            vSap.InsertaRegistroMerma(Session["_DocEntry"].ToString(), linenum, Convert.ToInt32(docnum), Convert.ToInt32(Session["_OC"]), itemcode, Convert.ToInt32(Session["_GuiaDesp"]), Convert.ToInt32(Session["_RecWMS"]), seguro, MotMerma, CantMerma, Manifiesto, Comentario);
            _DTDetRecep = vMermas.SP_ObtieneDetRecep(Convert.ToInt32(Session["_DocEntry"]));
            GvDetRecepcion.DataSource = _DTDetRecep;
            GvDetRecepcion.KeyFieldName = "DocNum;LineNum;ItemCode;Manifiesto;Comentario;Ind_ReclamoSeguro;TipoMerma;Cant_Merma";//;Manifiesto;Comentario;Ind_ReclamoSeguro;TipoMerma;Cant_Merma
            GvDetRecepcion.DataBind();
            GvDetRecepcion.CancelEdit();
            e.Cancel = true;


        }

        protected void btn_imprimir_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 1, "Boton");
                string var_bus_NumGuiaDesp = " ";
                int var_bus_NumOrdenC = 0;
                int var_bus_RecepWms = 0;
                string var_bus_Ref_Cliente = " ";
                string var_bus_LoteInterno = " ";
                DateTime varFechaRec = new DateTime(1900, 01, 01);

                if (txt_GDesp.Text != string.Empty)
                    var_bus_NumGuiaDesp = txt_GDesp.Text;
                if (txt_OCompra.Text != string.Empty)
                    var_bus_NumOrdenC = Convert.ToInt32(txt_OCompra.Text);
                if (txt_RecepWms.Text != string.Empty)
                    var_bus_RecepWms = Convert.ToInt32(txt_RecepWms.Text);
                if (txt_Factura.Text != string.Empty)
                    var_bus_Ref_Cliente = txt_Factura.Text;
                if (txt_Lote.Text != string.Empty)
                    var_bus_LoteInterno = txt_Lote.Text;
                if (txt_FRecep.Text != string.Empty)
                    varFechaRec = txt_FRecep.Date;

                if (var_bus_NumGuiaDesp == " " && var_bus_NumOrdenC == 0 && var_bus_RecepWms == 0 && var_bus_Ref_Cliente == " " && var_bus_LoteInterno == " " && varFechaRec == Convert.ToDateTime("01-01-1900"))
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Debe Ingresar al Menos un Criterio de Busqueda');", true);
                else
                {
                    try
                    {


                        ReportDocument Info = new ReportDocument();
                        Info.Load(Server.MapPath("~/CVT_RPT_MermasRecepcion.rpt"));
                        Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                        Info.SetParameterValue(0, var_bus_NumGuiaDesp);
                        Info.SetParameterValue(1, var_bus_Ref_Cliente);
                        Info.SetParameterValue(2, var_bus_NumOrdenC);
                        Info.SetParameterValue(3, var_bus_RecepWms);
                        Info.SetParameterValue(4, varFechaRec);
                        Info.SetParameterValue(5, var_bus_LoteInterno);
                        Response.Buffer = false;
                        Response.Clear();
                        Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");

                    }
                    catch (Exception ex)
                    {
                        string a = ex.Message.ToString();
                    }
                }
            }
            catch { }
        }



        protected void GvDetRecepcion_DataBinding(object sender, EventArgs e)
        {
            (sender as ASPxGridView).ForceDataRowType(typeof(DataTable));
        }

        protected void GvDetRecepcion_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {

            //if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            //try
            //{
            //    DataRow vCombo = GvDetRecepcion.GetDataRow(e.VisibleIndex);
            //    string vRecl = vCombo.ItemArray[3].ToString();
            //    ImageButton vImg = GvDetRecepcion.FindRowCellTemplateControl(e.VisibleIndex, null, "DetSeg") as ImageButton;
            //    if (vRecl == "N")
            //        vImg.Visible = false;
            //}
            //catch
            //{
            //}
            //GvDetRecepcion.KeyFieldName = "DocNum;LineNum;ItemCode";
        }

        protected void GvDetRecepcion_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {
            try
            {
                if (e.CommandArgs.CommandName == "cmdEditar")
                {
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 1, "Boton");
                    string[] ids = new string[8];
                    ids = e.KeyValue.ToString().Split('|');
                    string docnum = ids[0].ToString();
                    string linenum = ids[1].ToString();
                    string itemcode = ids[2].ToString();
                    string Manifiesto = ids[3].ToString();
                    string Comentario = ids[4].ToString();
                    string seguro = ids[5].ToString();
                    string MotMerma = ids[6].ToString();
                    int CantMerma = Convert.ToInt32(ids[7].ToString());
                    txt_cantmermaE.Text = CantMerma.ToString();
                    txt_comentE.Text = Comentario;
                    txt_manifiestoE.Text = Manifiesto;
                    cb_motmermaE.Text = MotMerma;
                    cb_reclsegE.Value = seguro;
                    PopUp_Editar.ShowOnPageLoad = true;
                    Session["Ids"] = ids;
                }
                if (e.CommandArgs.CommandName == "cmdDetSeg")
                {
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 1, "Boton");
                    string[] ids = new string[8];
                    ids = e.KeyValue.ToString().Split('|');
                    string docnum = ids[0].ToString();
                    string linenum = ids[1].ToString();
                    string itemcode = ids[2].ToString();
                    string Manifiesto = ids[3].ToString();
                    string Comentario = ids[4].ToString();
                    string seguro = ids[5].ToString();
                    string MotMerma = ids[6].ToString();
                    int CantMerma = Convert.ToInt32(ids[7].ToString());
                    PopUp_Seguro.ShowOnPageLoad = true;
                    Session["Ids"] = ids;
                    SAPClass vSAP = new SAPClass();
                    List<_MERMARECEPCION> dt = vSAP.ObtieneDatosMermas(Session["_DocEntry"].ToString(), linenum);
                    foreach (var i in dt)
                    {

                        try
                        {
                            cb_frecl.Date = (DateTime)i.U_FechaReclamo;
                        }
                        catch
                        { }
                        txt_npoliza.Text = i.U_NumPoliza;
                        txt_cantreclamo.Text = i.U_Cant_Reclamo.ToString();
                        txt_montosini.Text = i.U_MontoSiniestro.ToString();
                        txt_porcdeducible.Text = i.U_PorcDeducible.ToString();
                        txt_montodeducible.Text = i.U_MontoDeducible.ToString();
                        txt_montopagosini.Text = i.U_MontoPagoSin.ToString();
                        try
                        {
                            cb_fpagosini.Date = (DateTime)i.U_FechaReclamo;
                        }
                        catch
                        { }
                        txt_comentariosiniestro.Text = i.U_Comen_Siniestro;


                    }
                }
            }
            catch { }

        }

        protected void btn_ActualizarE_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 1, "Boton");
                string[] ids = new string[8];
                ids = ((string[])Session["Ids"]);
                string docnum = ids[0].ToString();
                string linenum = ids[1].ToString();
                string itemcode = ids[2].ToString();
                string Manifiesto = string.Empty;
                string Comentario = string.Empty;
                string seguro = cb_reclsegE.Value.ToString();
                int MotMerma = Convert.ToInt32(cb_motmermaE.Value);
                int CantMerma = Convert.ToInt32(txt_cantmermaE.Text);
                try
                {
                    Manifiesto = txt_manifiestoE.Text;
                }
                catch
                {
                    Manifiesto = string.Empty;
                }
                try
                {
                    Comentario = txt_comentE.Text;
                }
                catch
                {
                    Comentario = string.Empty;
                }
                MermasClass vMermas = new MermasClass();
                SAPClass vSap = new SAPClass();
                vSap.InsertaRegistroMerma(Session["_DocEntry"].ToString(), linenum, Convert.ToInt32(docnum), Convert.ToInt32(Session["_OC"]), itemcode, Convert.ToInt32(Session["_GuiaDesp"]), Convert.ToInt32(Session["_RecWMS"]), seguro, MotMerma, CantMerma, Manifiesto, Comentario);
                _DTDetRecep = vMermas.SP_ObtieneDetRecep(Convert.ToInt32(Session["_DocEntry"]));
                GvDetRecepcion.DataSource = _DTDetRecep;
                //GvDetRecepcion.KeyFieldName = "DocNum;LineNum;ItemCode";
                GvDetRecepcion.DataBind();
                PopUp_Editar.ShowOnPageLoad = false;
                //GvDetRecepcion.CancelEdit();
                //e.Cancel = true;

            }
            catch 
            { 
            
            }
        }

        protected void GvDetRecepcion_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            try
            {
                DataRow vCombo = GvDetRecepcion.GetDataRow(e.VisibleIndex);
                string vRecl = vCombo.ItemArray[3].ToString();
                ImageButton vImg = GvDetRecepcion.FindRowCellTemplateControl(e.VisibleIndex, null, "DetSeg") as ImageButton;
                if (vRecl == "N")
                    vImg.Visible = false;
            }
            catch
            {
            }
        }

        protected void btn_CancelarE_Click(object sender, EventArgs e)
        {
            PopUp_Editar.ShowOnPageLoad = false;
            GvDetRecepcion.DataBind();
        }

        protected void btn_ActualizarSiniestro_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 1, "Boton");
            string[] ids = new string[8];
            ids = ((string[])Session["Ids"]);
            string docnum = ids[0].ToString();
            string linenum = ids[1].ToString();
            MermasClass vMermas = new MermasClass();
            SAPClass vSap = new SAPClass();
            DateTime fecrecl = cb_frecl.Date.ToShortDateString() == "01/01/0001" ? new DateTime(1900, 1, 1) : cb_frecl.Date;
            string npoliza = txt_npoliza.Text;
            int cantrecl = txt_cantreclamo.Text == string.Empty ? 0 : Convert.ToInt32(txt_cantreclamo.Text);
            double montosiniestro = txt_montosini.Text == string.Empty ? 0 : Convert.ToDouble(txt_montosini.Text);
            int porcdeducible = txt_porcdeducible.Text == string.Empty ? 0 : Convert.ToInt32(txt_porcdeducible.Text);
            double montodeducible = txt_montodeducible.Text == string.Empty ? 0 : Convert.ToDouble(txt_montodeducible.Text);
            double montopagosini = txt_montopagosini.Text == string.Empty ? 0 : Convert.ToDouble(txt_montopagosini.Text);
            DateTime fechapago = cb_fpagosini.Date.ToShortDateString() == "01/01/0001" ? new DateTime(1900, 1, 1) : cb_fpagosini.Date;
            string comnetario = txt_comentariosiniestro.Text;
            vSap.InsertaRegistroSeguro(Session["_DocEntry"].ToString(), linenum, fecrecl, npoliza, cantrecl, montosiniestro, porcdeducible, montodeducible, montopagosini, fechapago, comnetario);
            _DTDetRecep = vMermas.SP_ObtieneDetRecep(Convert.ToInt32(Session["_DocEntry"]));
            GvDetRecepcion.DataSource = _DTDetRecep;
            //GvDetRecepcion.KeyFieldName = "DocNum;LineNum;ItemCode";
            GvDetRecepcion.DataBind();
            PopUp_Seguro.ShowOnPageLoad = false;
        }


    }
}