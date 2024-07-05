using DBMermasRecepcion;
using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.SAP
{
    public partial class TipoCambio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            try
            {
                string username = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["UserBancoCentral"]);
                string userpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["PassBancoCentral"]);
                cl.bcentral.si3.SieteWS vWS = new cl.bcentral.si3.SieteWS();
                cl.bcentral.si3.Respuesta vResp = new cl.bcentral.si3.Respuesta();
                string[] series = new string[1];
                series[0] = cbo_TipoMoneda.Value.ToString().TrimEnd();
                string mesini = cbo_fecha_inicio.Date.Month < 10 ? "0" + cbo_fecha_inicio.Date.Month.ToString() : cbo_fecha_inicio.Date.Month.ToString();
                string diaini = cbo_fecha_inicio.Date.Day < 10 ? "0" + cbo_fecha_inicio.Date.Day.ToString() : cbo_fecha_inicio.Date.Day.ToString();
                string mester = cbo_fecha_termino.Date.Month < 10 ? "0" + cbo_fecha_termino.Date.Month.ToString() : cbo_fecha_termino.Date.Month.ToString();
                string diater = cbo_fecha_termino.Date.Day < 10 ? "0" + cbo_fecha_termino.Date.Day.ToString() : cbo_fecha_termino.Date.Day.ToString();
                string fechainicio = cbo_fecha_inicio.Date.Year + "-" + mesini + "-" + diaini;
                string fechatermino = cbo_fecha_termino.Date.Year + "-" + mester + "-" + diater;
                vResp = vWS.GetSeries(username, userpass, fechainicio, fechatermino, series);
                GvDatos.DataSource = null;
                GvDatos.DataBind();
                if (vResp.Codigo == 0)
                {
                    foreach (cl.bcentral.si3.fameSeries fameSeries in vResp.Series)
                    {
                        if (fameSeries.obs != null)
                        {
                            var listado = fameSeries.obs.Select(x => new { Fecha = x.indexDateString, Valor = x.value }).OrderByDescending(x => x.Fecha).ToList();
                            DataTable dt = Utilidades.LINQToDataTable(listado);
                            lbl_tipomoneda.Text = cbo_TipoMoneda.Text;
                            Session["_Dt"] = dt;
                            GvDatos.DataSource = listado;
                            GvDatos.DataBind();

                        }
                    }
                }
            }
            catch
            {
            }
        }

        protected void btn_sync_Click(object sender, EventArgs e)
        {
            SAPClass vSAP = new SAPClass();
            DataTable dt = new DataTable();
            dt = (DataTable)Session["_Dt"];
            vSAP.ActualizaTipoCambio(dt, lbl_tipomoneda.Text);
        }
    }
}