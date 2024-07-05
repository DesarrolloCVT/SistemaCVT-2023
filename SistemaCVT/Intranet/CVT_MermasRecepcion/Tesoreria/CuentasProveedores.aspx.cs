using System;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class CuentasProveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cbo_fdesde.Date = DateTime.Now.AddMonths(-1);
                cbo_fhasta.Date = DateTime.Now;
                //string fi = cbo_fdesde.Date.Year.ToString() + "/" + cbo_fdesde.Date.Month.ToString() + "/" + cbo_fdesde.Date.Day.ToString() + " 00:00:00";
                //string ft = cbo_fhasta.Date.Year.ToString() + "/" + cbo_fhasta.Date.Month.ToString() + "/" + cbo_fhasta.Date.Day.ToString() + " 23:59:59";
                //LqDsFacturasProveedores.WhereParameters.Clear();
                //LqDsFacturasProveedores.WhereParameters.Add("Inicio", System.Data.DbType.DateTime, fi);
                //LqDsFacturasProveedores.WhereParameters.Add("Termino", System.Data.DbType.DateTime, ft);
                //LqDsFacturasProveedores.Where = "FechaVenc>@Inicio && FechaVenc<@Termino";
                //Session["Parametros"] = LqDsFacturasProveedores.Where.ToString();
                //GvDatos.DataBind();
            }
            else
            {
                try
                {
                    LqDsFacturasProveedores.Where = Session["Parametros"].ToString();
                    GvDatos.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void btn_Filtrar_Click(object sender, EventArgs e)
        {
            string fi = cbo_fdesde.Date.Year.ToString() + "/" + cbo_fdesde.Date.Month.ToString() + "/" + cbo_fdesde.Date.Day.ToString() + " 00:00:00";
            string ft = cbo_fhasta.Date.Year.ToString() + "/" + cbo_fhasta.Date.Month.ToString() + "/" + cbo_fhasta.Date.Day.ToString() + " 23:59:59";
            LqDsFacturasProveedores.WhereParameters.Clear();
            LqDsFacturasProveedores.WhereParameters.Add("Inicio", System.Data.DbType.DateTime, fi);
            LqDsFacturasProveedores.WhereParameters.Add("Termino", System.Data.DbType.DateTime, ft);

            LqDsFacturasProveedores.Where = "FechaVenc>@Inicio && FechaVenc<@Termino";
            if (cbo_grupo.Value != null)
            {
                LqDsFacturasProveedores.WhereParameters.Add("Grupo", System.Data.DbType.Int32, cbo_grupo.Value.ToString());
                LqDsFacturasProveedores.Where = LqDsFacturasProveedores.Where.ToString() + " && CodGrupProveedor=@Grupo";
            }
            if (cbo_pdesde.Value != null && cbo_phasta.Value != null)
            {
                LqDsFacturasProveedores.WhereParameters.Add("pdesde", cbo_pdesde.Value.ToString());
                LqDsFacturasProveedores.WhereParameters.Add("phasta", cbo_phasta.Value.ToString());
                LqDsFacturasProveedores.Where = LqDsFacturasProveedores.Where.ToString() + " && CodProveedor>=@pdesde && CodProveedor<=@phasta";
            }
            Session["Parametros"] = LqDsFacturasProveedores.Where.ToString();
            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LqDsFacturasProveedores.Where = Session["Parametros"].ToString();
        //    GvDatos.DataBind();
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Cuenta Proveedores - " + DateTime.Now.ToShortDateString();
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void cbo_grupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbo_pdesde.SelectedIndex = -1;
            cbo_phasta.SelectedIndex = -1;
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            cbo_pdesde.SelectedIndex = -1;
            cbo_phasta.SelectedIndex = -1;
            cbo_grupo.SelectedIndex = -1;
        }

        protected void GvDatos_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Cuenta Proveedores -" + DateTime.Now.ToShortDateString();
            }
        }
    }
}