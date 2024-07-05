using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class InforDetalleMantencion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataBind();
            }
            InformaticaClass inf = new InformaticaClass();
            string codActivo = inf.TraeCodAF(Convert.ToInt32(Session["ID_MantInfEnc"]));

            List<CVT_VW_INF_Mantencion_DatosEquipo> dt = inf.ObtieneDatosEquipos(codActivo);

            foreach (var t in dt)
            {

                if (t.TIPO.Equals("SERV"))
                {
                    //    lUsuarioEq.Visible = false;
                    //    lblUsuarioEq.Visible = false;

                    ltipEq.Text = "Tipo Equipo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    lNomEq.Text = "Nombre equipo:";
                    lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    lRam.Text = "Ram:";
                    lblRam.Text = t.RAM;
                    lproce.Text = "Procesador:";
                    lblProcesa.Text = t.Procesador;
                    lSo.Text = "Sistema Operativo:";
                    lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("COMP"))
                {
                    lUsuarioEq.Text = "Usuario Equipo:";
                    lblUsuarioEq.Text = t.UsuarioEquipo;
                    ltipEq.Text = "Tipo Equipo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    lNomEq.Text = "Nombre equipo:";
                    lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    lRam.Text = "Ram:";
                    lblRam.Text = t.RAM;
                    lproce.Text = "Procesador:";
                    lblProcesa.Text = t.Procesador;
                    lSo.Text = "Sistema Operativo:";
                    lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("IMP"))
                {
                    lUsuarioEq.Text = "Ubicacion/Usuario";
                    lblUsuarioEq.Text = t.UsuarioEquipo;
                    ltipEq.Text = "Tipo Equipo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    //lNomEq.Text = "Monitoreo:";
                    //lblNombreEq.Text = t.Nombre_Equipo;
                    //lMarca.Text = "Marca:";
                    //lblMarca.Text = t.MARCA;
                    //lModelo.Text = "Modelo:";
                    //lblModelo.Text = t.Modelo;
                    //lRam.Text = "Almacenamiento:";
                    //lblRam.Text = t.RAM;
                    //lproce.Text = "Procesador:";
                    //lblProcesa.Text = t.Procesador;
                    //lSo.Text = "Sistema Operativo:";
                    //lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("RF"))
                {
                    lUsuarioEq.Text = "Usuario Equipo:";
                    lblUsuarioEq.Text = t.UsuarioEquipo;
                    ltipEq.Text = "Tipo Equipo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    lNomEq.Text = "Area:";
                    lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    lRam.Text = "Ram:";
                    lblRam.Text = t.RAM;
                    lproce.Text = "Procesador:";
                    lblProcesa.Text = t.Procesador;
                    lSo.Text = "Sistema Operativo:";
                    lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("RED"))
                {
                    //lUsuarioEq.Text = "Usuario Equipo:";
                    //lblUsuarioEq.Text = t.UsuarioEquipo;
                    ltipEq.Text = "Dispositivo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    lNomEq.Text = "Ubicacion:";
                    lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    //lRam.Text = "Ram:";
                    //lblRam.Text = t.RAM;
                    lproce.Text = "Puertos:";
                    lblProcesa.Text = t.Procesador;
                    //lSo.Text = "Sistema Operativo:";
                    //lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("WF"))
                {
                    //lUsuarioEq.Text = "Usuario Equipo:";
                    //lblUsuarioEq.Text = t.UsuarioEquipo;
                    ltipEq.Text = "Dispositivo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    lNomEq.Text = "Ubicacion:";
                    lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    //lRam.Text = "Ram:";
                    //lblRam.Text = t.RAM;
                    //lproce.Text = "Puertos:";
                    //lblProcesa.Text = t.Procesador;
                    //lSo.Text = "Sistema Operativo:";
                    //lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("OTR"))
                {
                    //lUsuarioEq.Text = "Usuario Equipo:";
                    //lblUsuarioEq.Text = t.UsuarioEquipo;
                    ltipEq.Text = "Dispositivo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    //lNomEq.Text = "Ubicacion:";
                    //lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    //lRam.Text = "Ram:";
                    //lblRam.Text = t.RAM;
                    //lproce.Text = "Puertos:";
                    //lblProcesa.Text = t.Procesador;
                    //lSo.Text = "Sistema Operativo:";
                    //lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("VG"))
                {
                    lUsuarioEq.Text = "Conectado a:";
                    lblUsuarioEq.Text = t.UsuarioEquipo;
                    ltipEq.Text = "Tipo Equipo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    lNomEq.Text = "Monitoreo:";
                    lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    lRam.Text = "Almacenamiento:";
                    lblRam.Text = t.RAM;
                    //lproce.Text = "Procesador:";
                    //lblProcesa.Text = t.Procesador;
                    //lSo.Text = "Sistema Operativo:";
                    //lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("UPS"))
                {
                    lUsuarioEq.Text = "Rack de Comunicaciones:";
                    lblUsuarioEq.Text = t.UsuarioEquipo;
                    ltipEq.Text = "Tipo Equipo:";
                    lblTipoEquipo.Text = t.Dispositivo;
                    //lNomEq.Text = "Monitoreo:";
                    //lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    lRam.Text = "Potencia:";
                    lblRam.Text = t.RAM;
                    lproce.Text = "Capacidad:";
                    lblProcesa.Text = t.Procesador;
                    lSo.Text = "Tiempo de Respaldo:";
                    lblSO.Text = t.SistemaOperativo;

                }
                if (t.TIPO.Equals("EMV"))
                {
                    //lUsuarioEq.Text = "Rack de Comunicaciones:";
                    //lblUsuarioEq.Text = t.UsuarioEquipo;
                    //ltipEq.Text = "Tipo Equipo:";
                    //lblTipoEquipo.Text = t.Dispositivo;
                    //lNomEq.Text = "Monitoreo:";
                    //lblNombreEq.Text = t.Nombre_Equipo;
                    lMarca.Text = "Marca:";
                    lblMarca.Text = t.MARCA;
                    lModelo.Text = "Modelo:";
                    lblModelo.Text = t.Modelo;
                    lRam.Text = "Ram:";
                    lblRam.Text = t.RAM;
                    lproce.Text = "Procesador:";
                    lblProcesa.Text = t.Procesador;
                    lSo.Text = "Sistema Operativo:";
                    lblSO.Text = t.SistemaOperativo;

                }

            }
        }


        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.AddNewRow();
        //}

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 201, "Crea Registro DetMantInf");

            e.NewValues["ID_MantInfEnc"] = Session["ID_MantInfEnc"];
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("MantencionInformatica.aspx");
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle mantencion";
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 201, "Elimina Registro DetMantInf");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 201, "Actualiza Registro DetMantInf");
        }
    }
}