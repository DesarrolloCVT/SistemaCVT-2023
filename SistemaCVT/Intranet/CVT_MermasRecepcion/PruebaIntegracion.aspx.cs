using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion
{
    public partial class PruebaIntegracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            SyncClass vSync = new SyncClass();
            vSync.SyncPorCompras();
        }
    }
}