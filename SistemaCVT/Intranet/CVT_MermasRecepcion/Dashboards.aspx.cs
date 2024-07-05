using System;

namespace CVT_MermasRecepcion
{
    public partial class Dashboards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    cb_año.Value = DateTime.Now.Year;
            //    cb_mes.Value = DateTime.Now.Month;
            //}
        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {
            WebChartControl3.DataBind();
            WebChartControl2.DataBind();
        }
    }
}