using DBMermasRecepcion;
using Microsoft.Office.Interop.Excel;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class TratoPorArea : System.Web.UI.Page
    {
        Microsoft.Office.Interop.Excel.Application exApp;
        Microsoft.Office.Interop.Excel.Workbook wbk;
        protected void Page_Load(object sender, EventArgs e)
        {
            //GvDatos.DataBind();
            ////if (IsPostBack)
            ////{
            ////    GvDatos.DataBind();
            ////}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                //Colocar el nombre del Archivo en una Variable String
                string name = FileUpload1.FileName;

                //Enviar el Archivo a un Directorio de forma Temporal
                FileUpload1.SaveAs(@"C:\\Asistencia\\" + name);
                exApp = new Microsoft.Office.Interop.Excel.Application();
                wbk = exApp.Workbooks.Open(@"C:\\Asistencia\\" + name);

                System.Data.DataTable dt = new System.Data.DataTable();

                DBMLCVTDESAINTDataContext db = new DBMLCVTDESAINTDataContext();
                CVT_AsistenciaRelojControl asi = new CVT_AsistenciaRelojControl();

                _Worksheet xlWorksheet = (_Worksheet)wbk.Sheets[1];

                Range xlRange = xlWorksheet.UsedRange;
                string cont = string.Empty;


                foreach (Range c in xlRange.Rows.Cells)
                {
                    try
                    {

                        if (c.Row >= 9)
                        {
                            if (c.Column == 1)
                                cont = c.Cells.Text.ToString();
                            if (cont != string.Empty)
                            {

                                if (c.Column == 2)
                                    asi.Rut = c.Cells.Text.ToString();
                                if (c.Column == 4)
                                {
                                    AsistenciaClass Vasis = new AsistenciaClass();
                                    asi.Id_Area = Vasis.ObtieneIdArea(c.Cells.Text.ToString());
                                }
                                if (c.Column == 5)
                                    asi.Fecha_Ingreso = Convert.ToDateTime(c.Cells.Text.ToString());
                                if (c.Column == 9)
                                    asi.Hora_Inicio = c.Cells.Text.ToString() == string.Empty ? new TimeSpan(0, 0, 0) : TimeSpan.Parse(c.Cells.Text.ToString());
                                if (c.Column == 10)
                                    asi.Hora_Termino = c.Cells.Text.ToString() == string.Empty ? new TimeSpan(0, 0, 0) : TimeSpan.Parse(c.Cells.Text.ToString());
                                if (c.Column == 16)
                                    asi.Asistencia = c.Cells.Text.ToString() == string.Empty ? new TimeSpan(0, 0, 0) : TimeSpan.Parse(c.Cells.Text.ToString());
                                if (c.Column == 22)
                                {
                                    asi.HE_Salida = c.Cells.Text.ToString() == string.Empty ? new TimeSpan(0, 0, 0) : TimeSpan.Parse(c.Cells.Text.ToString());
                                    db.CVT_AsistenciaRelojControl.InsertOnSubmit(asi);
                                    db.SubmitChanges();

                                    asi = new CVT_AsistenciaRelojControl();
                                    cont = string.Empty;
                                }

                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        string error = ex.Message.ToString();
                    }
                    wbk.Close();

                }

                wbk.Close();

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Archivo registrado con exito');", true);

            }
            catch
            {

            }
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Asistencia";
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }

        protected void bt_borrar_Click(object sender, EventArgs e)
        {

            DBMLCVTDESAINTDataContext ds = new DBMLCVTDESAINTDataContext();
            DateTime fe = Convert.ToDateTime(cb_fechaRegistro.Value);
            ds.CVT_LimpiarDocumento(fe);
            ds.SubmitChanges();
            GvDatos.DataBind();
        }

        protected void btn_ver_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }
    }
}