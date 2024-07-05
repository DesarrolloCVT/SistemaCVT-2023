using DBMermasRecepcion;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Servicios
{
    public partial class Encuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int vArea = Convert.ToInt32(cbo_Area.Value);
            ServiciosClass vServicio = new ServiciosClass();
            List<CVT_PreguntaEncuesta> dt = vServicio.ObtienePreguntaArea(vArea);
            int cont = 0;

            foreach (var t in dt)
            {
                ASPxLabel id = new ASPxLabel();
                id.ID = "P" + t.Id_Pregunta.ToString();
                id.Text = t.Id_Pregunta.ToString();
                ASPxLabel Pregunta = new ASPxLabel();
                Pregunta.ID = "IP" + cont.ToString();
                Pregunta.Text = " " + t.Pregunta;

                ASPxComboBox Calificacion = new ASPxComboBox();
                Calificacion.ID = "C" + t.Id_Pregunta.ToString();
                Calificacion.Items.Add("1", 1);
                Calificacion.Items.Add("2", 2);
                Calificacion.Items.Add("3", 3);
                Calificacion.Items.Add("4", 4);
                Calificacion.ValidationSettings.RequiredField.IsRequired = true;

                ASPxMemo Comentario = new ASPxMemo();
                Comentario.ID = "CO" + t.Id_Pregunta.ToString();
                Comentario.NullText = "Ingrese su respuesta";
                Comentario.ValidationSettings.RequiredField.IsRequired = true;

                ASPxRadioButtonList Sino = new ASPxRadioButtonList();
                Sino.ID = "CB" + t.Id_Pregunta.ToString();
                Sino.Items.Add("Si", 1);
                Sino.Items.Add("No", 2);
                Sino.Border.BorderStyle = BorderStyle.None;
                Sino.ValidationSettings.RequiredField.IsRequired = true;

                hld1.Controls.Add(id);
                hld1.Controls.Add(Pregunta);
                if (t.TipoPregunta == 1) { hld1.Controls.Add(Calificacion); }
                if (t.TipoPregunta == 2) { hld1.Controls.Add(Sino); }
                if (t.TipoPregunta == 3) { hld1.Controls.Add(Comentario); }
                cont++;
                btn_grabar.Visible = true;

            }

        }

        protected void btn_Seleccion_Click(object sender, EventArgs e)
        {
            if (cbo_Area.Value != null)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ESTA ENCUESTA ES ANÓNIMA Y NINGÚN DATO PERSONAL SERA REGISTRADO');", true);
            }

        }
        protected void btn_grabar_Click(object sender, EventArgs e)
        {
            try
            {
                int vArea = Convert.ToInt32(cbo_Area.Value);
                ServiciosClass vServicio = new ServiciosClass();
                List<CVT_PreguntaEncuesta> dt = vServicio.ObtienePreguntaArea(vArea);
                int cont = 0;
                foreach (var t in dt)
                {
                    CVT_RespuestaEncuesta vNew = new CVT_RespuestaEncuesta();
                    ASPxLabel d = hld1.FindControl("P" + t.Id_Pregunta.ToString()) as ASPxLabel;
                    int IDPregunta = Convert.ToInt32(d.Text);
                    int calificacion = 0;
                    string Obs = "";

                    switch (t.TipoPregunta)
                    {
                        case 1:
                            ASPxComboBox Cal = hld1.FindControl("C" + t.Id_Pregunta.ToString()) as ASPxComboBox;
                            calificacion = Convert.ToInt32(Cal.Value);
                            break;
                        case 2:
                            ASPxRadioButtonList sn = hld1.FindControl("CB" + t.Id_Pregunta.ToString()) as ASPxRadioButtonList;
                            calificacion = Convert.ToInt32(sn.Value);
                            break;
                        case 3:
                            ASPxMemo Ob = hld1.FindControl("CO" + t.Id_Pregunta.ToString()) as ASPxMemo;
                            Obs = Ob.Text;
                            break;
                    }

                    vNew.Id_Pregunta = IDPregunta;
                    vNew.Calificacion = calificacion;
                    vNew.Comentario = Obs;
                    vNew.Fecha_Registro = DateTime.Now;
                    vServicio.InsertaRespuesta(vNew);
                    cont++;
                }

                hld1.Controls.Clear();
                cbo_Area.SelectedIndex = -1;
                btn_grabar.Visible = false;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Enviado Correctamente');", true);

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 125, "Crea Registro");

            }
            catch
            {
            }

        }
    }
}