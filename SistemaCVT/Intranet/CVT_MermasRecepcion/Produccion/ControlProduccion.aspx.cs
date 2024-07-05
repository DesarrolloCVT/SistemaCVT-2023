using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class ControlProduccion : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                //cbo_año.Value = DateTime.Now.Year;
                //LogClass vLog = new LogClass();
                //vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 54, "Ingreso");
                GvDatos.DataSource= Session["datos"];
                //GvDatos.DataBind();
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 54, "Boton");
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Control Produccion";
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            //LogClass vLog = new LogClass();
            //vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 54, "Boton");
            //LqDsControlProduccion.WhereParameters.Add("AÑO", System.Data.DbType.Int32, cbo_año.Value.ToString());

            //if (Convert.ToInt32(cbo_mes.Value) != 0)
            //{
            //    LqDsControlProduccion.WhereParameters.Add("MES", System.Data.DbType.Int32, cbo_mes.Value.ToString());
            //    LqDsControlProduccion.Where = LqDsControlProduccion.Where + " && MES=@MES";

            //}
            //if (cbo_semana.Value != null)
            //{
            //    LqDsControlProduccion.WhereParameters.Add("SEMANA", System.Data.DbType.Int32, cbo_semana.Value.ToString());
            //    LqDsControlProduccion.Where = LqDsControlProduccion.Where + " && SEMANA=@SEMANA";
            //}
            //if (cbo_dia.Value != null)
            //{
            //    LqDsControlProduccion.WhereParameters.Add("DIA", System.Data.DbType.Int32, cbo_dia.Value.ToString());
            //    LqDsControlProduccion.Where = LqDsControlProduccion.Where + " && DIA=@DIA";
            //}

            int ano =Convert.ToInt32(cbo_año.Value);
            int mes =Convert.ToInt32(cbo_mes.Value);
            int semana = cbo_semana.Value==null ? 0 : Convert.ToInt32(cbo_semana.Value);
            int dia = cbo_dia.Value==null ? 0 : Convert.ToInt32(cbo_dia.Value);

            ProduccionClass Pr = new ProduccionClass();
            DataTable dt = new DataTable();
            dt = Pr.SP_ControlProduccionCompleta(ano, mes, semana,dia);
            GvDatos.DataSource = dt;          
            Session["datos"] = dt;
            GvDatos.DataBind();
        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            cbo_semana.SelectedIndex = -1;
        }

        protected void ASPxButton3_Click(object sender, EventArgs e)
        {
            cbo_dia.SelectedIndex = -1;
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                try
                {
                    //LogClass vLog = new LogClass();
                    //vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 54, "Boton");
                    Session["OF"] = e.KeyValue;
                    ASPxGridView1.DataBind();
                    ASPxPopupControl1.ShowOnPageLoad = true;
                }
                catch
                {
                }
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Control Produccion";
                GvDatos.SettingsExport.ExcelExportMode = default;
            }
        }
    }
}