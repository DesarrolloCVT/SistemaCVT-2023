using System;

namespace CVT_MermasRecepcion.WMS
{
    public partial class FacturaDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            GvResumen.DataBind();
        }

        //protected void GvResumen_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        //{
        //    if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
        //    WMSClass vWMS = new WMSClass();
        //    string[] ids = new string[3];
        //    ids = e.KeyValue.ToString().Split('|');
        //    e.Row.ToolTip = vWMS.ObtieneFechasDespachadas(Convert.ToInt32(ids[0]), ids[1], ids[2]);

        //}
    }
}