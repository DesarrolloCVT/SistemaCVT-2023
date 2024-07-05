using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class InformeAsistencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            if (!IsPostBack)
            {

                cb_fini.Value = DateTime.Now.AddDays(-7);
                cb_fter.Value = DateTime.Now;

            }
            else
            {
                try
                {
                    LqDsDetalle.Where = Session["Parametros"].ToString();
                    GvDatos.DataBind();

                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["Dt"];
                    GvDatos2.DataSource = dt;
                    GvDatos2.DataBind();

                    DataTable dt1 = new DataTable();
                    dt1 = (DataTable)Session["Dt1"];
                    GvDatosDiarios.DataSource = dt1;
                    GvDatosDiarios.DataBind();
                }
                catch
                {

                }
            }

        }


        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                DataTable dt1 = new DataTable();
                AsistenciaClass vAsistencia = new AsistenciaClass();
                DateTime fin = Convert.ToDateTime(cb_fini.Text);
                DateTime ter = Convert.ToDateTime(cb_fter.Text);
                int are = Convert.ToInt32(cb_area.Value);
                int lab = Convert.ToInt32(cb_labor.Value);


                if (cb_fini.Value != null && cb_fter.Value != null)
                {
                    LqDsDetalle.WhereParameters.Clear();
                    LqDsDetalle.WhereParameters.Add("FINI", DbType.DateTime, fin.ToString());
                    LqDsDetalle.WhereParameters.Add("FTER", DbType.DateTime, ter.ToString());
                    LqDsDetalle.Where = "Fecha>=@FINI && Fecha<=@FTER";
                }


                if (cb_area.Text != "")
                {
                    LqDsDetalle.WhereParameters.Clear();
                    LqDsDetalle.WhereParameters.Add("FINI", DbType.DateTime, fin.ToString());
                    LqDsDetalle.WhereParameters.Add("FTER", DbType.DateTime, ter.ToString());
                    LqDsDetalle.WhereParameters.Add("AREA", DbType.Int32, are.ToString());
                    LqDsDetalle.Where = "Fecha>=@FINI && Fecha<=@FTER && Id_Area=@AREA";

                }
                if (cb_labor.Text != "" && cb_area.Text != "")
                {
                    LqDsDetalle.WhereParameters.Clear();
                    LqDsDetalle.WhereParameters.Add("FINI", DbType.DateTime, fin.ToString());
                    LqDsDetalle.WhereParameters.Add("FTER", DbType.DateTime, ter.ToString());
                    LqDsDetalle.WhereParameters.Add("LABOR", DbType.Int32, lab.ToString());
                    LqDsDetalle.Where = "Fecha>=@FINI && Fecha<=@FTER && Id_Area=@AREA && Id_Labores=@LABOR";

                }


                if (cb_labor.Text != "")
                {
                    LqDsDetalle.WhereParameters.Clear();
                    LqDsDetalle.WhereParameters.Add("FINI", DbType.DateTime, fin.ToString());
                    LqDsDetalle.WhereParameters.Add("FTER", DbType.DateTime, ter.ToString());
                    LqDsDetalle.WhereParameters.Add("LABOR", DbType.Int32, lab.ToString());
                    LqDsDetalle.Where = "Fecha>=@FINI && Fecha<=@FTER && Id_Labores=@LABOR";

                }


                Session["Parametros"] = LqDsDetalle.Where.ToString();
                GvDatos.DataBind();

                dt = vAsistencia.SP_ListaAsistenciaFiltro(are, fin, ter, lab);
                Session["Dt"] = dt;
                GvDatos2.DataSource = dt;
                GvDatos2.DataBind();

                dt1 = vAsistencia.SP_ListaAsistenciaResumenDia(are, fin, ter, lab);
                Session["Dt1"] = dt1;
                GvDatosDiarios.DataSource = dt1;
                GvDatosDiarios.DataBind();
            }
            catch { }
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            try
            {
                cb_fini.Value = DateTime.Now.AddDays(-7);
                cb_fter.Value = DateTime.Now;
                cb_area.SelectedIndex = -1;
                cb_labor.SelectedIndex = -1;
                LqDsDetalle.WhereParameters.Clear();
                GvDatos.DataBind();
                GvDatos2.DataBind();
            }
            catch { }

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Total asistencia";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);

        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Total asistencia";
            }
        }
    }
}