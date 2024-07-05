using System;
using System.Data;
using System.Data.SqlClient;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class OperacionLotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            limpio();
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["OpcionA"];
                GvDetalle.DataSource = Session["OpcionB"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            int inf = Convert.ToInt32(cboInforme.Value);
            if (inf == 1)
            {
                string idpro = Cbo_Producto.Value.ToString();


                SqlConnection con = new SqlConnection("Data Source=roble;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();
                cmd.CommandTimeout = 60000;
                DataSet ds = new DataSet();
                cmd = new SqlCommand("CVT_LOTE_BUSCAXCODIGO", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CODIGO", idpro);
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();

                DataTable t = new DataTable();
                DataTable i = new DataTable();

                t = ds.Tables[0];
                i = ds.Tables[1];

                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;

                GvDetalle.Columns.Clear();
                GvDetalle.AutoGenerateColumns = true;

                GvDatos.DataSource = t;
                GvDatos.DataBind();
                Session["opcionA"] = t;

                GvDetalle.DataSource = i;
                GvDetalle.DataBind();
                Session["opcionB"] = i;

                lblcodPro.Visible = true;
                Cbo_Producto.Visible = true;
                Cbo_Producto.ValidationSettings.RequiredField.IsRequired = true;
                limpiarDat();

            }
            if (inf == 2)
            {
                string idpro = Cbo_Producto.Value.ToString();
                string lote = txtLote.Text;

                SqlConnection con = new SqlConnection("Data Source=roble;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();
                cmd.CommandTimeout = 60000;
                DataSet ds = new DataSet();
                cmd = new SqlCommand("CVT_LOTE_BUSCAXCODIGO_LOTE", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CODIGO", idpro);
                cmd.Parameters.AddWithValue("@LOTE", lote);
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();

                DataTable t = new DataTable();
                DataTable i = new DataTable();

                t = ds.Tables[0];
                i = ds.Tables[1];

                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;

                GvDetalle.Columns.Clear();
                GvDetalle.AutoGenerateColumns = true;

                GvDatos.DataSource = t;
                GvDatos.DataBind();
                Session["opcionA"] = t;

                GvDetalle.DataSource = i;
                GvDetalle.DataBind();
                Session["opcionB"] = i;

                lblcodPro.Visible = true;
                Cbo_Producto.Visible = true;
                lblLote.Visible = true;
                txtLote.Visible = true;
                Cbo_Producto.ValidationSettings.RequiredField.IsRequired = true;
                txtLote.ValidationSettings.RequiredField.IsRequired = true;
                limpiarDat();
            }
            if (inf == 3)
            {
                string idpro = Cbo_Producto.Value.ToString();
                string lote = txtLote.Text;
                string bod = Convert.ToString(cboBodega.Value);

                SqlConnection con = new SqlConnection("Data Source=roble;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();
                cmd.CommandTimeout = 60000;
                DataSet ds = new DataSet();
                cmd = new SqlCommand("CVT_LOTE_BUSCAXCODIGO_LOTE_BODEGA", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CODIGO", idpro);
                cmd.Parameters.AddWithValue("@LOTE", lote);
                cmd.Parameters.AddWithValue("@BODEGA", bod);
                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();

                DataTable t = new DataTable();
                DataTable i = new DataTable();

                t = ds.Tables[0];
                i = ds.Tables[1];

                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;

                GvDetalle.Columns.Clear();
                GvDetalle.AutoGenerateColumns = true;

                GvDatos.DataSource = t;
                GvDatos.DataBind();
                Session["opcionA"] = t;

                GvDetalle.DataSource = i;
                GvDetalle.DataBind();
                Session["opcionB"] = i;

                lblcodPro.Visible = true;
                Cbo_Producto.Visible = true;
                lblLote.Visible = true;
                txtLote.Visible = true;
                lblBodega.Visible = true;
                cboBodega.Visible = true;
                cboBodega.ValidationSettings.RequiredField.IsRequired = true;
                Cbo_Producto.ValidationSettings.RequiredField.IsRequired = true;
                txtLote.ValidationSettings.RequiredField.IsRequired = true;
                limpiarDat();
            }

            if (inf == 4)
            {
                //string idpro = txtCodPro.Text;
                //string lote = txtLote.Text;
                //string bod = Convert.ToString(cboBodega.Value);

                DateTime ini = Convert.ToDateTime(dteDesde.Value);
                DateTime ter = Convert.ToDateTime(dteHasta.Value);

                SqlConnection con = new SqlConnection("Data Source=roble;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt");
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter da = new SqlDataAdapter();
                cmd.CommandTimeout = 60000;
                DataSet ds = new DataSet();
                cmd = new SqlCommand("CVT_LOTE_BUSCA_GENERAL", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 60000;
                cmd.Parameters.AddWithValue("@DESDE", ini);
                cmd.Parameters.AddWithValue("@HASTA", ter);

                da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Close();

                DataTable t = new DataTable();
                DataTable i = new DataTable();

                t = ds.Tables[0];
                i = ds.Tables[1];

                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;

                GvDetalle.Columns.Clear();
                GvDetalle.AutoGenerateColumns = true;

                GvDatos.DataSource = t;
                GvDatos.DataBind();
                Session["opcionA"] = t;

                GvDetalle.DataSource = i;
                GvDetalle.DataBind();
                Session["opcionB"] = i;

                lblInicio.Visible = true;
                lblHasta.Visible = true;
                dteDesde.Visible = true;
                dteHasta.Visible = true;
                limpiarDat();
            }

        }

        protected void cboInforme_SelectedIndexChanged(object sender, EventArgs e)
        {
            int inf = Convert.ToInt32(cboInforme.Value);
            if (inf == 1)
            {
                lblcodPro.Visible = true;
                Cbo_Producto.Visible = true;
                Cbo_Producto.ValidationSettings.RequiredField.IsRequired = true;
            }
            if (inf == 2)
            {
                lblcodPro.Visible = true;
                Cbo_Producto.Visible = true;
                lblLote.Visible = true;
                txtLote.Visible = true;
                Cbo_Producto.ValidationSettings.RequiredField.IsRequired = true;
                txtLote.ValidationSettings.RequiredField.IsRequired = true;
            }
            if (inf == 3)
            {
                lblcodPro.Visible = true;
                Cbo_Producto.Visible = true;
                lblLote.Visible = true;
                txtLote.Visible = true;
                lblBodega.Visible = true;
                cboBodega.Visible = true;
                cboBodega.ValidationSettings.RequiredField.IsRequired = true;
                Cbo_Producto.ValidationSettings.RequiredField.IsRequired = true;
                txtLote.ValidationSettings.RequiredField.IsRequired = true;
            }
            if (inf == 4)
            {
                lblInicio.Visible = true;
                lblHasta.Visible = true;
                dteDesde.Visible = true;
                dteHasta.Visible = true;
                dteDesde.ValidationSettings.RequiredField.IsRequired = true;
                dteHasta.ValidationSettings.RequiredField.IsRequired = true;
            }
        }

        private void limpio()
        {
            lblcodPro.Visible = false;
            Cbo_Producto.Visible = false;
            lblLote.Visible = false;
            txtLote.Visible = false;
            lblBodega.Visible = false;
            cboBodega.Visible = false;
            lblInicio.Visible = false;
            dteDesde.Visible = false;
            lblHasta.Visible = false;
            dteHasta.Visible = false;
        }
        private void limpiardat()
        {
            Cbo_Producto.SelectedIndex = -1;
            txtLote.Text = string.Empty;
            cboBodega.SelectedIndex = -1;

        }

        private void limpiarDat()
        {
            Cbo_Producto.SelectedIndex = -1;
            txtLote.Text = string.Empty;
            cboBodega.SelectedIndex = -1;
        }
        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "informe Operacion Lote";
            }
        }

        protected void GvDetalle_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDetalle.SettingsExport.FileName = "informe Operacion Lote Detalle";
            }
        }
    }
}