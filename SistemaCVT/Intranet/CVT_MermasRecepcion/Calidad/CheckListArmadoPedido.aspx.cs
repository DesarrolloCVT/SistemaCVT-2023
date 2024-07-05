using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Calidad
{
    public partial class CheckListArmadoPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 51, "Ingreso");
                DateTime fecha = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                cbo_fecha.Date = fecha;

            }
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 51, "Boton");
            MermasClass vMermas = new MermasClass();
            GvDatos.DataSource = vMermas.ObtieneDatosPedido(cbo_fecha.Date, Convert.ToInt32(cbo_pedido.Value));
            GvDatos.DataBind();
        }

        protected void cbo_fecha_DateChanged(object sender, EventArgs e)
        {
            cbo_pedido.SelectedIndex = -1;
        }

        protected void btn_grabar_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 51, "Crea Registro");
            WMSClass vWMS = new WMSClass();
            MermasClass vMerma = new MermasClass();
            CVT_CheckList_ArmadoPedido vNuevo = new CVT_CheckList_ArmadoPedido();
            vNuevo.FechaEntrega = cbo_fecha.Date;
            vNuevo.Pedido_Id = Convert.ToInt32(cbo_pedido.Value);
            vNuevo.Staff_Id = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
            vNuevo.FechaRegistro = DateTime.Now;
            vNuevo.FEFO = CHK_FEFO.Checked;
            vNuevo.VidaUtil = CHK_VIDAUTIL.Checked;
            vNuevo.EstadoPallet = CHK_ESTADOPALLET.Checked;
            vNuevo.DUN14 = CHK_DUN14.Checked;
            vNuevo.BaseProducto = CHK_BASEPRODUCTO.Checked;
            vNuevo.Film = CHK_FILM.Checked;
            vNuevo.LugarArmado = CBO_LUGARARMADO.Value.ToString();
            vNuevo.Observasiones = txt_observasiones.Text;
            vMerma.AgregaCheckListArmadoPedido(vNuevo);

            CHK_BASEPRODUCTO.Checked = false;
            CHK_DUN14.Checked = false;
            CHK_ESTADOPALLET.Checked = false;
            CHK_ESTADOPRODUCTO.Checked = false;
            CHK_FEFO.Checked = false;
            CHK_FILM.Checked = false;
            CHK_VIDAUTIL.Checked = false;
            cbo_pedido.SelectedIndex = -1;
            CBO_LUGARARMADO.SelectedIndex = -1;
            txt_observasiones.Text = string.Empty;
        }
    }
}