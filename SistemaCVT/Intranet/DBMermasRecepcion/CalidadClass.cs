using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
   public  class CalidadClass
    {
        public CalidadClass()
        { }

        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();

        public DataTable SP_Hallazgo(int mes, int ano)

        {
            DBDesaint.CommandTimeout = 60000;
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_LISTHALLASGOS(mes, ano));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool InsertaVerificacionBolsaDetalle(CVT_RegistroVerificacionBolsasDetalle nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_RegistroVerificacionBolsasDetalle.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaVerificacionAzucarDetalle(CVT_InspeccionPT_AzucarDetalle nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_InspeccionPT_AzucarDetalle.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaMonitoreoDectMetales1(CVT_MonitoreoDetectorMetalesUno nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_MonitoreoDetectorMetalesUno.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaMonitoreoDectMetales2(CVT_MonitoreoDetectorMetalesDos nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_MonitoreoDetectorMetalesDos.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaPatronTestigo(CVT_RegistroPatronTestigo nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_RegistroPatronTestigo.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaSaturacionPatron(CVT_RegistroSaturacionPatrones nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_RegistroSaturacionPatrones.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaSaturacionPatronAntiguo(CVT_RegistroSaturacionPatronesAntiguo nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_RegistroSaturacionPatronesAntiguo.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaInspeccionVisualSacos(CVT_Inspeccion_Visual_Sacos nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_Inspeccion_Visual_Sacos.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch(Exception ex)
            {
                string ms = ex.Message;
            }
            return ret;
        }

        public bool InsertaInspeccionArroz(CVT_InspeccionPT_Arroz nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_InspeccionPT_Arroz.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool ActualizaEstadoInspeccionArroz(int IdInsp, string Estado,int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_InspeccionPT_Arroz
                        where a.Id_InspeccionPT_Arroz.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.IdVerificador = verificador;
                    r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool ActualizaVerificacionContPesoPalletizado(int IdInsp,int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_ControlPeso_ProductoPalletizado
                        where a.Id_ContrPesoPallet.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Id_UsuarioVerificador = verificador;
                    r.Estado = "Verificado";
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaEstadoInspeccionArveja(int IdInsp, string Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_InspeccionPT_Arveja
                        where a.Id_InspeccionPT_Arveja.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.IdVerificador = verificador;
                    r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool ActualizaEstadoInspeccionAzucar(int IdInsp, string Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_InspeccionPT_Azucar
                        where a.Id_InspeccionPT_Azucar.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.IdVerificador = verificador;
                    r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool ActualizaEstadoInspeccionGarbanzo(int IdInsp, string Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_InspeccionPT_Garbanzo
                        where a.Id_InspeccionPT_Garbanzo.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.IdVerificador = verificador;
                    r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool ActualizaEstadoInspeccionLenteja(int IdInsp, string Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_InspeccionPT_Lenteja
                        where a.Id_InspeccionPT_Lenteja.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.IdVerificador = verificador;
                    r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaEstadoInspeccionPorotoNegro(int IdInsp, string Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_InspeccionPT_PorotoNegro
                        where a.Id_IspeccionPT_PorotoNegro.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.IdVerificador = verificador;
                    r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaEstadoInspeccionPoroto(int IdInsp, string Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_InspeccionPT_Porotos
                        where a.Id_IspeccionPT_Poroto.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.IdVerificador = verificador;
                    r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaVerificacionBolsa(int IdInsp, string Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_RegistroVerificacionBolsas
                        where a.Id_VerificacionBolsas.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.IdVerificador = verificador;
                    r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
    }
}
