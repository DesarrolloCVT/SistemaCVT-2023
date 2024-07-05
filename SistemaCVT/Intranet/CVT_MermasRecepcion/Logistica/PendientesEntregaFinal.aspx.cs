using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

namespace CVT_MermasRecepcion.Logistica
{
    public partial class PendientesEntregaFinal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
                CargaPivot();
            l1a.BackColor = System.Drawing.Color.DarkRed;
            l2a.BackColor = System.Drawing.Color.Yellow;
            l3a.BackColor = System.Drawing.Color.LightBlue;
            l4a.BackColor = System.Drawing.Color.Green;
            l5a.BackColor = System.Drawing.Color.DarkOrange;
            l6a.BackColor = System.Drawing.Color.Gray;
            l1.BackColor = System.Drawing.Color.Red;
            l2.BackColor = System.Drawing.Color.LightYellow;
            l3.BackColor = System.Drawing.Color.AliceBlue;
            l4.BackColor = System.Drawing.Color.LightGreen;
            l5.BackColor = System.Drawing.Color.Orange;
            l6.BackColor = System.Drawing.Color.LightSlateGray;

        }
        private void CargaPivot()
        {


            SqlConnection con = new SqlConnection("Data Source=Alerce;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt.vdp22$");
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            //cmd.CommandTimeout = 60000;
            DataSet ds = new DataSet();
            cmd = new SqlCommand("SP_PendientesVentas", con);

            cmd.CommandType = CommandType.StoredProcedure;

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            DataTable a = new DataTable();
           

            a = ds.Tables[0];
           

            GvPendientesVenta.DataSource = a;
            GvPendientesVenta.DataBind();
            
            Session["opcionA"] = a;



        }

        protected void GvPendientesVenta_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            //if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            //int Estado = (int)e.GetValue("Asignado");
            //if (Estado != 0)
            //{
            //    e.Row.BackColor = System.Drawing.Color.GreenYellow;
            //    //System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
            //    //System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
            //    //imgAnula.Visible = false;
            //    //imgConfirma.Visible = false;
            //}
        }

        protected void GvPendientesVenta_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            {
                
                int Estado = (int)e.GetValue("Asignado");
                string DiaDespacho = e.GetValue("DIADESPACHO").ToString();
                if (Estado != 0 && DiaDespacho != "")
                {
                    if (DiaDespacho == "A")
                        e.Row.BackColor = System.Drawing.Color.DarkRed;
                    if (DiaDespacho == "B")
                        e.Row.BackColor = System.Drawing.Color.Yellow;
                    if (DiaDespacho == "C")
                        e.Row.BackColor = System.Drawing.Color.LightBlue;
                    if (DiaDespacho == "D")
                        e.Row.BackColor = System.Drawing.Color.Green;
                    if (DiaDespacho == "E")
                        e.Row.BackColor = System.Drawing.Color.DarkOrange;
                    if (DiaDespacho == "N")
                        e.Row.BackColor = System.Drawing.Color.Gray;
                }
                if (Estado == 0 && DiaDespacho != "")
                {
                    if (DiaDespacho == "A")
                        e.Row.BackColor = System.Drawing.Color.Red;
                    if (DiaDespacho == "B")
                        e.Row.BackColor = System.Drawing.Color.LightYellow;
                    if (DiaDespacho == "C")
                        e.Row.BackColor = System.Drawing.Color.AliceBlue;
                    if (DiaDespacho == "D")
                        e.Row.BackColor = System.Drawing.Color.LightGreen;
                    if (DiaDespacho == "E")
                        e.Row.BackColor = System.Drawing.Color.Orange;
                    if (DiaDespacho == "N")
                        e.Row.BackColor = System.Drawing.Color.LightSlateGray;
                }


            }
            
        }

        protected void GvPendientesVenta_DataBound(object sender, EventArgs e)
        {
            ASPxGridView grid = sender as ASPxGridView;
            if (grid.Columns.IndexOf(grid.Columns["CommandColumn"]) != -1)
                return;
            for (int i = 0; i < grid.Columns.Count; i++)
            {
                grid.Columns[i].VisibleIndex = i+1;
               
            }

            GridViewCommandColumn col = new GridViewCommandColumn();
            col.Name = "CommandColumn";
            col.ShowSelectCheckbox = true;
            col.VisibleIndex =0;
            grid.Columns.Add(col);
            
            
        }

        protected void Btn_Modificar_Click(object sender, EventArgs e)
        {
            PopUP_ModificaFecha.ShowOnPageLoad = true;
            
        }

        protected void btn_Actualizar_Click(object sender, EventArgs e)
        {
            SAPClass cSAP= new SAPClass();
            DateTime Fecha = cbo_fechaDesp.Date;
            string Hora=txt_hora.Text;
            string Agendamiento=txt_Agendamiento.Text;
            GvPendientesVenta.GetSelectedFieldValues();
            for (int i = 0; i < GvPendientesVenta.VisibleRowCount; i++)
            {
                if (GvPendientesVenta.Selection.IsRowSelected(i))
                {
                    int DocEntry = (int)GvPendientesVenta.GetRowValues(i, "DocEntry");
                    cSAP.ActualizaFechaDespachoOrdenVenta(DocEntry, Fecha, Hora, Agendamiento);
                }
            }
            txt_Agendamiento.Text=string.Empty;
            txt_hora.Text=string.Empty;
            CargaPivot();
            PopUP_ModificaFecha.ShowOnPageLoad = false;
        }
    }
}