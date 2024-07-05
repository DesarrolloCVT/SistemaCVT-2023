using DBMermasRecepcion;
using System;
using System.Linq;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class DiferenciasInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 65, "Ingreso");
            }
            else
            {


            }
        }

 

        protected void GvProducto_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdCorregir")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 65, "Boton");
                try
                {

                    WMSClass vWMS = new WMSClass();
                    DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
                    IQueryable<Package> iqueryable = from p in DBWMS.Package
                                                     where p.Package_SSCC.Equals(e.KeyValue.ToString())
                                                     select p;
                    foreach (Package pd in iqueryable)
                    {
                        pd.ArticleProvider_Id = vWMS.ObtieneIdProduct(GvProducto.GetRowValuesByKeyValue(e.KeyValue, "CodProducto").ToString());

                    }
                    DBWMS.SubmitChanges();
                }
                catch
                {
                }
                GvProducto.DataBind();
            }
        }

        protected void GvLote_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdCorregir")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 65, "Boton");
                try
                {
                    DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
                    IQueryable<Package> iqueryable = from p in DBWMS.Package
                                                     where p.Package_SSCC.Equals(e.KeyValue.ToString())
                                                     select p;
                    foreach (Package pd in iqueryable)
                    {
                        pd.Package_Lot = GvLote.GetRowValuesByKeyValue(e.KeyValue, "Lote").ToString();

                    }
                    DBWMS.SubmitChanges();
                }
                catch
                {
                }
                GvLote.DataBind();
            }
        }

        //protected void GvNoInventariados_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        //{
        //    if (e.CommandArgs.CommandName == "cmdCorregir")
        //    {
        //        LogClass vLog = new LogClass();
        //        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 65, "Boton");
        //        try
        //        {
        //            DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
        //            IQueryable<Package> iqueryable = from p in DBWMS.Package
        //                                             where p.Package_SSCC.Equals(e.KeyValue.ToString())
        //                                             select p;
        //            foreach (Package pd in iqueryable)
        //            {
        //                pd.Package_Quantity = 0;
        //                pd.Package_OutDate = DateTime.Now;
        //                pd.Package_Status = 7;
        //                pd.Package_Data2 = "Dado de Baja Por Inventario " + DateTime.Now.ToShortDateString();

        //            }
        //            DBWMS.SubmitChanges();
        //        }
        //        catch
        //        {
        //        }
        //        GvNoInventariados.DataBind();
        //    }
        //}

        protected void GvDadosBaja_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdCorregir")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 65, "Boton");
                try
                {
                    DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
                    IQueryable<Package> iqueryable = from p in DBWMS.Package
                                                     where p.Package_SSCC.Equals(e.KeyValue.ToString())
                                                     select p;
                    foreach (Package pd in iqueryable)
                    {
                        pd.Package_Status = 3;
                        pd.Package_OutDate = null;
                        pd.Package_Data2 = "Revivido por Inventario " + DateTime.Now.ToShortDateString();
                        pd.Package_Quantity = Convert.ToInt32(GvDadosBaja.GetRowValuesByKeyValue(e.KeyValue, "Cantidad"));
                        pd.Layout_Id = Convert.ToInt32(GvDadosBaja.GetRowValuesByKeyValue(e.KeyValue, "UbicacionPistoleo"));
                        pd.Package_ReserveQuantity = 0;
                    }
                    DBWMS.SubmitChanges();
                }
                catch
                {
                }
                GvDadosBaja.DataBind();
            }
        }
        protected void GvDuplicados_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDuplicados.SettingsExport.FileName = "Duplicados";
            }
        }

     
        protected void GvProducto_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvProducto.SettingsExport.FileName = "Diferencia por Producto";
            }
        }

        protected void GvLote_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvLote.SettingsExport.FileName = "Diferencia por lote";
            }
        }

        protected void ASPxGridView1_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                ASPxGridView1.SettingsExport.FileName = "Diferencia Bodega";
            }
        }

        protected void GvDadosBaja_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDadosBaja.SettingsExport.FileName = "Dados de baja";
            }
        }

        //protected void GvNoInventariados_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        //{
        //    if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
        //    {
        //        GvNoInventariados.SettingsExport.FileName = "Pallet no inventariados";
        //    }
        //}
    }
}