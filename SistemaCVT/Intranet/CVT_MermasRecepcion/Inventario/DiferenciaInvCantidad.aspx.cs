using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class DiferenciaInvCantidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvCantidad_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
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
                        pd.Package_Quantity = Convert.ToInt32(GvCantidad.GetRowValuesByKeyValue(e.KeyValue, "Cantidad"));

                    }
                    DBWMS.SubmitChanges();
                }
                catch
                {
                }
                GvCantidad.DataBind();
            }
        }

        protected void GvCantidad_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvCantidad.SettingsExport.FileName = "Diferencia por Cantidad";
            }
        }

    }
}