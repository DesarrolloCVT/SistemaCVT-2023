using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Dialogs;



namespace CVT_MermasRecepcion.Logistica
{
    public partial class InformeAsignacionRuta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack) 
               ScResumenRuta.GoToDate(DateTime.Today);
        }

        
    }
}