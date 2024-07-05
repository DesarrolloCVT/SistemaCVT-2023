using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            DateTime f1 = dte1.Date;
            //DateTime f2 = dte1.Date;

            TimeSpan tsp = DateTime.Now-f1;

            int d = tsp.Days;

            lblTotal.Text = d.ToString();




        }
    }
}