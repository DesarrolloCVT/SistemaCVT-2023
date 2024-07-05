using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class MetodoPagoFacturasProveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cbo_fhasta.MaxDate = DateTime.Now;
                cbo_fdesde.Date = DateTime.Now.AddMonths(-1);
                cbo_fhasta.Date = DateTime.Now;
            }
            else
            {
                try
                {
                    LqDsFacturasProveedores.Where = Session["Parametros"].ToString();
                }
                catch
                {

                }
            }
        }

        protected void btn_Filtrar_Click(object sender, EventArgs e)
        {
            try
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
            catch
            {
            }
        }

        protected void cbo_grupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbo_pdesde.SelectedIndex = -1;
            cbo_phasta.SelectedIndex = -1;
        }

        protected void btn_Procesar_Click(object sender, EventArgs e)
        {
            foreach (var r in GvDatos.GetSelectedFieldValues("DocEntry"))
            {
                TesoreriaClass vTesoreria = new TesoreriaClass();
                vTesoreria.ModificaMetodoPagoFacturaProveedor((int)r, cbo_mpago.Value.ToString());
            }
            try
            {
                LqDsFacturasProveedores.Where = Session["Parametros"].ToString();
            }
            catch
            {

            }
            GvDatos.DataBind();

        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            cbo_pdesde.SelectedIndex = -1;
            cbo_phasta.SelectedIndex = -1;
            cbo_grupo.SelectedIndex = -1;
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Detalle Facturas Pendientes de Pago - "+DateTime.Now.ToShortDateString();
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Facturas Pendientes de Pago - " + DateTime.Now.ToShortDateString();
            }
        }
    }
}