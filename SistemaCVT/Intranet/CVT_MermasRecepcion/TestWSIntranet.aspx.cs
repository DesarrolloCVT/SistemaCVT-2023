using System;

namespace CVT_MermasRecepcion
{
    public partial class TestWSIntranet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            WSCVTTs.ServiceClient client = new WSCVTTs.ServiceClient();
            lblres.Text = client.GetSuma(Convert.ToInt32(txtn1.Text), Convert.ToInt32(txtn2.Text)).ToString();
        }
    }
}