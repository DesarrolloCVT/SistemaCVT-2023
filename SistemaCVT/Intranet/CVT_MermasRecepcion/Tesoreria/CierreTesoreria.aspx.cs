using DBMermasRecepcion;
using DevExpress.Web;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class CierreTesoreria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txt_Cuentas.Visible = false;
            Label2.Visible = false;
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Opcion"];

            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "cierre tesoreria  " +"-"+ lblInforme.Text ;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void cbo_Opcion_SelectedIndexChanged(object sender, EventArgs e)
        {
            TesoreriaClass Ts = new TesoreriaClass();
            DataTable dt = new DataTable();

            DateTime fini = Convert.ToDateTime(dte_Inicio.Value);
            DateTime fter = Convert.ToDateTime(dte_Termino.Value);
            string cuen = txt_Cuentas.Text;
            int opc = Convert.ToInt32(cbo_Opcion.Value);
            if (opc == 1)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreria(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "LISTADO DE PAGOS POR PERIODO";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;


                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "Mont_Pago";
                groupSummary.DisplayFormat = "Total Pagos: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "Mont_Pago";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);


                ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                groupSummary2.FieldName = "Monto_PagoME";
                groupSummary2.DisplayFormat = "Total Pagos Moneda Extranjera: {0:N2}";
                groupSummary2.ShowInGroupFooterColumn = "Monto_PagoME";
                groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary2);

                ASPxSummaryItem groupSummary3 = new ASPxSummaryItem();
                groupSummary3.FieldName = "Mont_Factura";
                groupSummary3.DisplayFormat = "Total Facturas: {0:N0}";
                groupSummary3.ShowInGroupFooterColumn = "Mont_Factura";
                groupSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary3);

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "Mont_Pago";
                totalSummary.ShowInColumn = "Mont_Pago";
                totalSummary.DisplayFormat = "Total Pagos: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

                ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                totalSummary2.FieldName = "Mont_Factura";
                totalSummary2.ShowInColumn = "Mont_Factura";
                totalSummary2.DisplayFormat = "Total Facturas: {0:N0}";
                totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary2);


                ASPxSummaryItem totalSummary3 = new ASPxSummaryItem();
                totalSummary3.FieldName = "Monto_PagoME";
                totalSummary3.ShowInColumn = "Monto_PagoME";
                totalSummary3.DisplayFormat = "Total Pagos ME: {0:N2}";
                totalSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary3);
            }
            if (opc == 2)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaProyeccionPagos(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();

                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "PROYECCION DE PAGOS";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;


                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "TotalDocumento";
                groupSummary.DisplayFormat = "Total documentos: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "TotalDocumento";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);


                ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                groupSummary2.FieldName = "Total_ME";
                groupSummary2.DisplayFormat = "Total Doc. Moneda Extranjera: {0:N2}";
                groupSummary2.ShowInGroupFooterColumn = "Total_ME";
                groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary2);

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "TotalDocumento";
                totalSummary.ShowInColumn = "TotalDocumento";
                totalSummary.DisplayFormat = "Total Documentos: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

                ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                totalSummary2.FieldName = "Total_ME";
                totalSummary2.ShowInColumn = "Total_ME";
                totalSummary2.DisplayFormat = "Total Doc.ME: {0:N0}";
                totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary2);

            }
            if (opc == 3)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesorerialistadoCobranzaPeriodo(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "FACTURAS PAGADAS POR PERIODO";
                cbo_Opcion.SelectedIndex = -1;


                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;


                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "Mont_Fact";
                groupSummary.DisplayFormat = "Total Facturas: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "Mont_Fact";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);


                ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                groupSummary2.FieldName = "Mont_Pago";
                groupSummary2.DisplayFormat = "Total Pagos: {0:N0}";
                groupSummary2.ShowInGroupFooterColumn = "Mont_Pago";
                groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary2);

                ASPxSummaryItem groupSummary3 = new ASPxSummaryItem();
                groupSummary3.FieldName = "Monto_ME";
                groupSummary3.DisplayFormat = "Total Moneda Extranjera: {0:N2}";
                groupSummary3.ShowInGroupFooterColumn = "Monto_ME";
                groupSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary3);

                ASPxSummaryItem groupSummary4 = new ASPxSummaryItem();
                groupSummary4.FieldName = "Monto_PagoME";
                groupSummary4.DisplayFormat = "Total PagosME: {0:N2}";
                groupSummary4.ShowInGroupFooterColumn = "Monto_PagoME";
                groupSummary4.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary4);

                ASPxSummaryItem groupSummary5 = new ASPxSummaryItem();
                groupSummary5.FieldName = "Monto_Cheque";
                groupSummary5.DisplayFormat = "Total Cheque: {0:N0}";
                groupSummary5.ShowInGroupFooterColumn = "Monto_Cheque";
                groupSummary5.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary5);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "Mont_Fact";
                totalSummary.ShowInColumn = "Mont_Fact";
                totalSummary.DisplayFormat = "Total Facturas: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

                ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                totalSummary2.FieldName = "Mont_Pago";
                totalSummary2.ShowInColumn = "Mont_Pago";
                totalSummary2.DisplayFormat = "Total Pagos: {0:N0}";
                totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary2);

                ASPxSummaryItem totalSummary3 = new ASPxSummaryItem();
                totalSummary3.FieldName = "Monto_ME";
                totalSummary3.ShowInColumn = "Monto_ME";
                totalSummary3.DisplayFormat = "Total Moneda Extranjera: {0:N2}";
                totalSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary3);

                ASPxSummaryItem totalSummary4 = new ASPxSummaryItem();
                totalSummary4.FieldName = "Monto_PagoME";
                totalSummary4.ShowInColumn = "Monto_PagoME";
                totalSummary4.DisplayFormat = "Total PagosME: {0:N2}";
                totalSummary4.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary4);

                ASPxSummaryItem totalSummary5 = new ASPxSummaryItem();
                totalSummary5.FieldName = "Monto_Cheque";
                totalSummary5.ShowInColumn = "Monto_Cheque";
                totalSummary5.DisplayFormat = "Total Cheques: {0:N0}";
                totalSummary5.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary5);
            }
            if (opc == 4)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaProyeccioncobranza(fini, fter);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "PROYECCION DE COBRANZA";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;



                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "TotalDoc";
                groupSummary.DisplayFormat = "Total Doc: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "TotalDoc";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);


                ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                groupSummary2.FieldName = "TotalDoc_ME";
                groupSummary2.DisplayFormat = "Total DocME: {0:N2}";
                groupSummary2.ShowInGroupFooterColumn = "TotalDoc_ME";
                groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary2);

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "TotalDoc";
                totalSummary.ShowInColumn = "TotalDoc";
                totalSummary.DisplayFormat = "Total Doc: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

                ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                totalSummary2.FieldName = "TotalDoc_ME";
                totalSummary2.ShowInColumn = "TotalDoc_ME";
                totalSummary2.DisplayFormat = "Total Doc_ME: {0:N2}";
                totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary2);
            }
            if (opc == 5)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaCondicionPagoCompra(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "COMPRAS CUMPLIMIENTO POR CONDICION DE PAGOS";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;

                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "Total_Doc";
                groupSummary.DisplayFormat = "Total Facturas: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "Total_Doc";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);

                ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                groupSummary2.FieldName = "Monto_Pago";
                groupSummary2.DisplayFormat = "Total Pagos: {0:N0}";
                groupSummary2.ShowInGroupFooterColumn = "Monto_Pago";
                groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary2);

                ASPxSummaryItem groupSummary3 = new ASPxSummaryItem();
                groupSummary3.FieldName = "TotalDoc_ME";
                groupSummary3.DisplayFormat = "Total Moneda Extranjera: {0:N2}";
                groupSummary3.ShowInGroupFooterColumn = "TotalDoc_ME";
                groupSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary3);

                ASPxSummaryItem groupSummary4 = new ASPxSummaryItem();
                groupSummary4.FieldName = "Monto_ME";
                groupSummary4.DisplayFormat = "Total PagosME: {0:N2}";
                groupSummary4.ShowInGroupFooterColumn = "Monto_ME";
                groupSummary4.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary4);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "Total_Doc";
                totalSummary.ShowInColumn = "Total_Doc";
                totalSummary.DisplayFormat = "Total Facturas: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

                ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                totalSummary2.FieldName = "Monto_Pago";
                totalSummary2.ShowInColumn = "Monto_Pago";
                totalSummary2.DisplayFormat = "Total Pagos: {0:N0}";
                totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary2);

                ASPxSummaryItem totalSummary3 = new ASPxSummaryItem();
                totalSummary3.FieldName = "TotalDoc_ME";
                totalSummary3.ShowInColumn = "TotalDoc_ME";
                totalSummary3.DisplayFormat = "Total Moneda Extranjera: {0:N2}";
                totalSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary3);

                ASPxSummaryItem totalSummary4 = new ASPxSummaryItem();
                totalSummary4.FieldName = "Monto_ME";
                totalSummary4.ShowInColumn = "Monto_ME";
                totalSummary4.DisplayFormat = "Total PagosME: {0:N2}";
                totalSummary4.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary4);

            }
            if (opc == 6)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaPendienteReconciliacion(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "PENDIENTES RECONCILIACION";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;

                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "Importe";
                groupSummary.DisplayFormat = "Total importe: {0:N2}";
                groupSummary.ShowInGroupFooterColumn = "Importe";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "Importe";
                totalSummary.ShowInColumn = "Importe";
                totalSummary.DisplayFormat = "Total Importe: {0:N2}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

            }
            if (opc == 7)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaFacturaCentroCostos(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "FACTURAS POR CENTRO DE COSTOS";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;

                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "Total_Div";
                groupSummary.DisplayFormat = "Total Divicion: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "Total_Div";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);

                ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                groupSummary2.FieldName = "Total_DivME";
                groupSummary2.DisplayFormat = "Total Div.MonExtranjera: {0:N2}";
                groupSummary2.ShowInGroupFooterColumn = "Total_DivME";
                groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary2);

                ASPxSummaryItem groupSummary3 = new ASPxSummaryItem();
                groupSummary3.FieldName = "Total_U_Admin";
                groupSummary3.DisplayFormat = "Total Unidad_Admin: {0:N0}";
                groupSummary3.ShowInGroupFooterColumn = "Total_U_Admin";
                groupSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary3);

                ASPxSummaryItem groupSummary4 = new ASPxSummaryItem();
                groupSummary4.FieldName = "Total_U_AdminME";
                groupSummary4.DisplayFormat = "Total Un.AdminME: {0:N2}";
                groupSummary4.ShowInGroupFooterColumn = "Total_U_AdminME";
                groupSummary4.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary4);

                ASPxSummaryItem groupSummary5 = new ASPxSummaryItem();
                groupSummary5.FieldName = "Total_CentCosto";
                groupSummary5.DisplayFormat = "Total Cen.Costos: {0:N0}";
                groupSummary5.ShowInGroupFooterColumn = "Total_CentCosto";
                groupSummary5.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary5);

                ASPxSummaryItem groupSummary6 = new ASPxSummaryItem();
                groupSummary6.FieldName = "Total_CentCostoME";
                groupSummary6.DisplayFormat = "Total Cen.CostosME: {0:N2}";
                groupSummary6.ShowInGroupFooterColumn = "Total_CentCostoME";
                groupSummary6.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary6);

                ASPxSummaryItem groupSummary7 = new ASPxSummaryItem();
                groupSummary7.FieldName = "Total_Item_Gasto";
                groupSummary7.DisplayFormat = "Total Item Gasto: {0:N0}";
                groupSummary7.ShowInGroupFooterColumn = "Total_Item_Gasto";
                groupSummary7.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary7);

                ASPxSummaryItem groupSummary8 = new ASPxSummaryItem();
                groupSummary8.FieldName = "Total_Item_GastoME";
                groupSummary8.DisplayFormat = "Total ItemGastoME: {0:N2}";
                groupSummary8.ShowInGroupFooterColumn = "Total_Item_GastoME";
                groupSummary8.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary7);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "Total_Div";
                totalSummary.ShowInColumn = "Total_Div";
                totalSummary.DisplayFormat = "Total Divicion: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

                ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                totalSummary2.FieldName = "Total_DivME";
                totalSummary2.ShowInColumn = "Total_DivME";
                totalSummary2.DisplayFormat = "Total DivicionME: {0:N2}";
                totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary2);

                ASPxSummaryItem totalSummary3 = new ASPxSummaryItem();
                totalSummary3.FieldName = "Total_U_Admin";
                totalSummary3.ShowInColumn = "Total_U_Admin";
                totalSummary3.DisplayFormat = "Total Un.Admin: {0:N0}";
                totalSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary3);

                ASPxSummaryItem totalSummary4 = new ASPxSummaryItem();
                totalSummary4.FieldName = "Total_U_AdminME";
                totalSummary4.ShowInColumn = "Monto_ME";
                totalSummary4.DisplayFormat = "Total un.AdminME: {0:N2}";
                totalSummary4.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary4);

                ASPxSummaryItem totalSummary5 = new ASPxSummaryItem();
                totalSummary5.FieldName = "Total_CentCosto";
                totalSummary5.ShowInColumn = "Total_CentCosto";
                totalSummary5.DisplayFormat = "Total Cent.Costos: {0:N0}";
                totalSummary5.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary5);

                ASPxSummaryItem totalSummary6 = new ASPxSummaryItem();
                totalSummary6.FieldName = "Total_CentCostoME";
                totalSummary6.ShowInColumn = "Total_CentCostoME";
                totalSummary6.DisplayFormat = "Total Cent.CostosME: {0:N2}";
                totalSummary6.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary6);

                ASPxSummaryItem totalSummary7 = new ASPxSummaryItem();
                totalSummary7.FieldName = "Total_Item_Gasto";
                totalSummary7.ShowInColumn = "Total_Item_Gasto";
                totalSummary7.DisplayFormat = "Total Item Gasto: {0:N0}";
                totalSummary7.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary7);

                ASPxSummaryItem totalSummary8 = new ASPxSummaryItem();
                totalSummary8.FieldName = "Total_Item_GastoME";
                totalSummary8.ShowInColumn = "Total_Item_GastoME";
                totalSummary8.DisplayFormat = "Total ItemGastoME: {0:N2}";
                totalSummary8.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary8);
            }

            if (opc == 8)
            {
                Label2.Visible = true;
                txt_Cuentas.Visible = true;
                Label2.Text = "Cuenta";
                txt_Cuentas.ValidationSettings.RequiredField.IsRequired = true;
                txt_Cuentas.ValidationSettings.Display = Display.Dynamic;
                txt_Cuentas.ValidationSettings.ErrorDisplayMode = ErrorDisplayMode.ImageWithTooltip;


            }
            if (opc == 9)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaCondicionPagoVentas(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "CUMPLIMIENTO POR CONDICION DE VENTAS";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;

                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "TotalDocumento";
                groupSummary.DisplayFormat = "Total Facturas: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "TotalDocumento";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);

                ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                groupSummary2.FieldName = "TotalDocumentoFC";
                groupSummary2.DisplayFormat = "Total Fac.MonExtrajera: {0:N2}";
                groupSummary2.ShowInGroupFooterColumn = "TotalDocumentoFC";
                groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary2);

                ASPxSummaryItem groupSummary3 = new ASPxSummaryItem();
                groupSummary3.FieldName = "Monto_Pago";
                groupSummary3.DisplayFormat = "Total Pagos: {0:N0}";
                groupSummary3.ShowInGroupFooterColumn = "Monto_Pago";
                groupSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary3);

                ASPxSummaryItem groupSummary4 = new ASPxSummaryItem();
                groupSummary4.FieldName = "Monto_PagoFC";
                groupSummary4.DisplayFormat = "Total PagosME: {0:N2}";
                groupSummary4.ShowInGroupFooterColumn = "Monto_PagoFC";
                groupSummary4.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary4);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "TotalDocumento";
                totalSummary.ShowInColumn = "TotalDocumento";
                totalSummary.DisplayFormat = "Total Facturas: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

                ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                totalSummary2.FieldName = "TotalDocumentoFC";
                totalSummary2.ShowInColumn = "TotalDocumentoFC";
                totalSummary2.DisplayFormat = "Total Fac.MonExtrajera: {0:N2}";
                totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary2);

                ASPxSummaryItem totalSummary3 = new ASPxSummaryItem();
                totalSummary3.FieldName = "Monto_Pago";
                totalSummary3.ShowInColumn = "Monto_Pago";
                totalSummary3.DisplayFormat = "Total Pagos: {0:N0}";
                totalSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary3);

                ASPxSummaryItem totalSummary4 = new ASPxSummaryItem();
                totalSummary4.FieldName = "Monto_PagoFC";
                totalSummary4.ShowInColumn = "Monto_PagoFC";
                totalSummary4.DisplayFormat = "Total PagosME: {0:N2}";
                totalSummary4.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary4);
            }
            if (opc == 10)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaDespachoComunaCamion(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "DESPACHOS";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;

                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "Total_Despachos";
                groupSummary.DisplayFormat = "Total Despachos: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "Total_Despachos";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);

                ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                groupSummary2.FieldName = "Total_DespachosME";
                groupSummary2.DisplayFormat = "Total Des.MonExtranjera: {0:N2}";
                groupSummary2.ShowInGroupFooterColumn = "Total_DespachosME";
                groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary2);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "Total_Despachos";
                totalSummary.ShowInColumn = "Total_Despachos";
                totalSummary.DisplayFormat = "Total Despachos: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

                ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                totalSummary2.FieldName = "Total_DespachosME";
                totalSummary2.ShowInColumn = "Total_DespachosME";
                totalSummary2.DisplayFormat = "Total DespachosME: {0:N2}";
                totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary2);
            }
            if (opc == 11)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaPorcCompraProveedor(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "PORCENTAJE COMPRAS POR PROVEEDOR";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;

                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "TotalCompras";
                groupSummary.DisplayFormat = "Total Compras: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "TotalCompras";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "TotalCompras";
                totalSummary.ShowInColumn = "TotalCompras";
                totalSummary.DisplayFormat = "Total Compras: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);

            }
            if (opc == 12)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaPorcVentasClientes(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "PORCENTAJE VENTAS POR CLIENTE";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;

                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "Total_Ventas";
                groupSummary.DisplayFormat = "Total Ventas: {0:N0}";
                groupSummary.ShowInGroupFooterColumn = "Total_Ventas";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "Total_Ventas";
                totalSummary.ShowInColumn = "Total_Ventas";
                totalSummary.DisplayFormat = "Total Ventas: {0:N0}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);
            }
            if (opc == 13)
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
                dt = Ts.SP_cierreTesoreriaItemGastos(fini, fter, cuen);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txt_Cuentas.Text = string.Empty;
                lblInforme.Text = "PEDIDOS POR AREA Y ITEM DE GASTO";
                cbo_Opcion.SelectedIndex = -1;

                GvDatos.GroupSummary.Clear();
                GvDatos.TotalSummary.Clear();
                GvDatos.Settings.ShowFooter = true;

                ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                groupSummary.FieldName = "Total";
                groupSummary.DisplayFormat = "Total : {0:N2}";
                groupSummary.ShowInGroupFooterColumn = "Total";
                groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.GroupSummary.Add(groupSummary);

                /////////////////////////////////////////////////////

                ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                totalSummary.FieldName = "Total";
                totalSummary.ShowInColumn = "Total";
                totalSummary.DisplayFormat = "Total : {0:N2}";
                totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                GvDatos.TotalSummary.Add(totalSummary);
            }
            if (opc == 14)
            {
                Label2.Visible = true;
                Label2.Text = "Ingrese Valor";
                txt_Cuentas.Visible = true;
                txt_Cuentas.ValidationSettings.RequiredField.IsRequired = true;
                txt_Cuentas.ValidationSettings.Display = Display.Dynamic;
                txt_Cuentas.ValidationSettings.ErrorDisplayMode = ErrorDisplayMode.ImageWithTooltip;

            }

        }

        protected void txt_Cuentas_TextChanged(object sender, EventArgs e)
        {
            TesoreriaClass Ts = new TesoreriaClass();
            DataTable dt = new DataTable();

            DateTime fini = Convert.ToDateTime(dte_Inicio.Value);
            DateTime fter = Convert.ToDateTime(dte_Termino.Value);
            string cuen = txt_Cuentas.Text;
            Label2.Visible = true;
            txt_Cuentas.Visible = true;

            int opc = Convert.ToInt32(cbo_Opcion.Value);
            if (opc == 8)
            {

                if (txt_Cuentas.Text.Equals(""))
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: Debe ingresar una cantidad');", true);
                    txt_Cuentas.Visible = true;
                }
                else


                {
                    dt = Ts.SP_cierreTesoreriaCartolaBancaria(fini, fter, cuen);
                    GvDatos.Columns.Clear();
                    GvDatos.AutoGenerateColumns = true;
                    GvDatos.DataSource = dt;
                    GvDatos.DataBind();
                    Session["opcion"] = dt;
                    txt_Cuentas.Text = string.Empty;
                    txt_Cuentas.Visible = true;
                    lblInforme.Text = "CARTOLA BANCARIA  " + cuen;


                    GvDatos.GroupSummary.Clear();
                    GvDatos.TotalSummary.Clear();
                    GvDatos.Settings.ShowFooter = true;

                    ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                    groupSummary.FieldName = "Debito";
                    groupSummary.DisplayFormat = "Total Debito.: {0:N2}";
                    groupSummary.ShowInGroupFooterColumn = "Debito";
                    groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.GroupSummary.Add(groupSummary);

                    ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                    groupSummary2.FieldName = "Credito";
                    groupSummary2.DisplayFormat = "Total Credito: {0:N2}";
                    groupSummary2.ShowInGroupFooterColumn = "Credito";
                    groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.GroupSummary.Add(groupSummary2);

                    ASPxSummaryItem groupSummary3 = new ASPxSummaryItem();
                    groupSummary3.FieldName = "Saldo";
                    groupSummary3.DisplayFormat = "Total Saldo: {0:N2}";
                    groupSummary3.ShowInGroupFooterColumn = "Saldo";
                    groupSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.GroupSummary.Add(groupSummary3);
                    /////////////////////////////////////////////////////

                    ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                    totalSummary.FieldName = "Debito";
                    totalSummary.ShowInColumn = "Debito";
                    totalSummary.DisplayFormat = "Total Debito. : {0:N2}";
                    totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.TotalSummary.Add(totalSummary);

                    ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                    totalSummary2.FieldName = "Credito";
                    totalSummary2.ShowInColumn = "Credito";
                    totalSummary2.DisplayFormat = "Total Credito : {0:N2}";
                    totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.TotalSummary.Add(totalSummary2);

                    ASPxSummaryItem totalSummary3 = new ASPxSummaryItem();
                    totalSummary3.FieldName = "Saldo";
                    totalSummary3.ShowInColumn = "Saldo";
                    totalSummary3.DisplayFormat = "Total Saldo : {0:N2}";
                    totalSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.TotalSummary.Add(totalSummary3);

                }
            }
            else if (opc == 14)
            {
                if (txt_Cuentas.Text.Equals(""))
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: Debe ingresar una cantidad');", true);
                    txt_Cuentas.Visible = true;
                }
                else
                {

                    dt = Ts.SP_cierreTesoreriaComprasMayorA(fini, fter, Convert.ToInt32(cuen));
                    GvDatos.Columns.Clear();
                    GvDatos.AutoGenerateColumns = true;
                    GvDatos.DataSource = dt;
                    GvDatos.DataBind();
                    Session["opcion"] = dt;
                    txt_Cuentas.Text = string.Empty;
                    txt_Cuentas.Visible = true;
                    lblInforme.Text = "COMPRAS MAYOR ";

                    GvDatos.GroupSummary.Clear();
                    GvDatos.TotalSummary.Clear();
                    GvDatos.Settings.ShowFooter = true;

                    ASPxSummaryItem groupSummary = new ASPxSummaryItem();
                    groupSummary.FieldName = "Total_Doc";
                    groupSummary.DisplayFormat = "Total Doc.: {0:N0}";
                    groupSummary.ShowInGroupFooterColumn = "Total_Doc";
                    groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.GroupSummary.Add(groupSummary);

                    ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
                    groupSummary2.FieldName = "Total_DocME";
                    groupSummary2.DisplayFormat = "Total DocME: {0:N2}";
                    groupSummary2.ShowInGroupFooterColumn = "Total_DocME";
                    groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.GroupSummary.Add(groupSummary2);
                    /////////////////////////////////////////////////////

                    ASPxSummaryItem totalSummary = new ASPxSummaryItem();
                    totalSummary.FieldName = "Total_Doc";
                    totalSummary.ShowInColumn = "Total_Doc";
                    totalSummary.DisplayFormat = "Total Doc. : {0:N0}";
                    totalSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.TotalSummary.Add(totalSummary);

                    ASPxSummaryItem totalSummary2 = new ASPxSummaryItem();
                    totalSummary2.FieldName = "Total_DocME";
                    totalSummary2.ShowInColumn = "Total_DocME";
                    totalSummary2.DisplayFormat = "Total Doc.ME : {0:N2}";
                    totalSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
                    GvDatos.TotalSummary.Add(totalSummary2);

                }
            }
            else
            {
                txt_Cuentas.Visible = false;
                Label2.Visible = false;
            }


        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "cierre tesoreria  " + "-" + lblInforme.Text;
            }

        }
    }

}