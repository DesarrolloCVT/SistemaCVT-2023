using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class CartolaVsCuentaSAP : System.Web.UI.Page
    {
        DataTable _DTDatos = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargar_datos();
            }
        }

        protected void cargar_datos()
        {
            DateTime diaInicio = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
            DateTime diaFinalAux = diaInicio.AddMonths(1).AddDays(-1);
            DateTime diaFinal = new DateTime(DateTime.Now.Year, DateTime.Now.Month, diaFinalAux.Day);


            cb_fini.Date = diaInicio;
            cb_fter.Date = diaFinal;

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            TesoreriaClass vTesoreria = new TesoreriaClass();
            dt = vTesoreria.SP_ListarCartolaVsSAP(cb_fini.Date, cb_fter.Date);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }
    }
}