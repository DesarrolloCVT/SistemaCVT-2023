using System;
using System.Data;

namespace CVT_MermasRecepcion.ControlCierreMensual.Transporte
{
    public partial class ResumenConsumoCombustible : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cb_Mes.Value = DateTime.Now.Month;
                txt_ano.Value = DateTime.Now.Year;


            }
            else
            {
                try
                {
                    LqsResumenMes.Where = Session["Parametros"].ToString();
                    GvDatosMes.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {

            int mes = Convert.ToInt32(cb_Mes.Value);
            int ano = Convert.ToInt32(txt_ano.Text);
            string Patt = txt_Patente.Text;
            string prop = txt_propietario.Text;



            if (txt_ano.Text != "" && cb_Mes.Value != "")
            {

                LqsResumenMes.WhereParameters.Clear();
                LqsResumenMes.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                LqsResumenMes.WhereParameters.Add("Año", DbType.Int32, ano.ToString());
                LqsResumenMes.Where = "Mes==@Mes && Año==@Año";

                LqsResumenPropietario.WhereParameters.Clear();
                LqsResumenPropietario.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                LqsResumenPropietario.WhereParameters.Add("Año", DbType.Int32, ano.ToString());
                LqsResumenPropietario.Where = "Mes==@Mes && Año==@Año";

            }

            if (txt_Patente.Text != "")
            {
                LqsResumenMes.WhereParameters.Clear();
                LqsResumenMes.WhereParameters.Add("Patente", DbType.String, Patt.ToString());
                LqsResumenMes.Where = "Patente==@Patente";
                if (txt_ano.Text != "" && cb_Mes.Value != "" && txt_Patente.Text != "")
                {
                    LqsResumenMes.WhereParameters.Clear();
                    LqsResumenMes.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                    LqsResumenMes.WhereParameters.Add("Año", DbType.Int32, ano.ToString());
                    LqsResumenMes.WhereParameters.Add("Patente", DbType.String, Patt.ToString());
                    LqsResumenMes.Where = "Mes==@Mes && Año==@Año && Patente==@Patente";

                }
            }

            if (txt_propietario.Text != "")
            {
                LqsResumenMes.WhereParameters.Clear();
                LqsResumenMes.WhereParameters.Add("Propietario", DbType.String, prop.ToString());
                LqsResumenMes.Where = "Propietario==@Propietario";

                LqsResumenPropietario.WhereParameters.Clear();
                LqsResumenPropietario.WhereParameters.Add("Propietario", DbType.String, prop.ToString());
                LqsResumenPropietario.Where = "Propietario==@Propietario";

                if (txt_ano.Text != "" && cb_Mes.Value != "" && txt_propietario.Text != "")
                {
                    LqsResumenMes.WhereParameters.Clear();
                    LqsResumenMes.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                    LqsResumenMes.WhereParameters.Add("Año", DbType.Int32, ano.ToString());
                    LqsResumenMes.WhereParameters.Add("Propietario", DbType.String, prop.ToString());
                    LqsResumenMes.Where = "Mes==@Mes && Año==@Año && Propietario==@Propietario";

                    LqsResumenPropietario.WhereParameters.Clear();
                    LqsResumenPropietario.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                    LqsResumenPropietario.WhereParameters.Add("Año", DbType.Int32, ano.ToString());
                    LqsResumenPropietario.WhereParameters.Add("Propietario", DbType.String, prop.ToString());
                    LqsResumenPropietario.Where = "Mes==@Mes && Año==@Año && Propietario==@Propietario";


                }

            }

            Session["Parametros"] = LqsResumenMes.Where.ToString();
            GvDatosMes.DataBind();
        }
        protected void btn_limpiar_Click(object sender, EventArgs e)
        {

            txt_Patente.Text = String.Empty;
            txt_propietario.Text = String.Empty;
            LqsResumenMes.WhereParameters.Clear();
            GvDatosMes.DataBind();
            GvDatosPropietario.DataBind();
        }

        protected void GvDatosMes_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosMes.SettingsExport.FileName = "Resumen Gastos por Mes";
            }
        }

        protected void GvDatosPropietario_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosPropietario.SettingsExport.FileName = "Resumen Gastos por Categoria";
            }
        }
    }
}
