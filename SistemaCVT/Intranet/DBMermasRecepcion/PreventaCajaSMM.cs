using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class PreventaCajaSMM
    {

        public PreventaCajaSMM() { }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTWMSMETRODataContext DBWMSMetro = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext Mmtro = new DBMLCVTMMETRODataContext();


        public string TraeTipoVenta(int IdPreventa)
        {
            string ret = "0";
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Preventa
                            where s.Preventa_ID.Equals(IdPreventa)
                            select new { s.TipoVenta }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.TipoVenta;
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public string TraeMontoVenta(int IdPreventa)
        {
            string ret = "0";
            try
            {
                var temp = (from s in DBWMSMetro.VW_MONTO_VENTA_SMM
                            where s.Preventa_ID.Equals(IdPreventa)
                            select new { s.MontoVenta }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.MontoVenta.ToString();
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public string TraeMontoVentaSinRedondeo(int IdPreventa)
        {
            string ret = "0";
            try
            {
                var temp = (from s in DBWMSMetro.VW_MONTO_VENTA_SIN_REDONDEO_SMM
                            where s.Preventa_ID.Equals(IdPreventa)
                            select new { s.MontoVenta }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.MontoVenta.ToString();
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int TraeEstadoPreventa(int IdPreventa)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Preventa
                            where s.Preventa_ID.Equals(IdPreventa)
                            select new { s.Estado }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Estado);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public string TraeMontoActualizado(int IdPreventa)
        {
            string ret = "0";
            try
            {
                var temp = (from s in DBWMSMetro.VW_Calculo_monto_venta
                            where s.Preventa_ID.Equals(IdPreventa)
                            select new { s.Monto }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Monto.ToString();
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public string TraeMontoActualizadoSinRedondeo(int IdPreventa)
        {
            string ret = "0";
            try
            {
                var temp = (from s in DBWMSMetro.VW_Calculo_monto_venta_sin_Redondeo
                            where s.Preventa_ID.Equals(IdPreventa)
                            select new { s.Monto }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Monto.ToString();
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool InsertaDatoPago(SMM_Preventa_DatoPago nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Preventa_DatoPago.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;

        }

        public int sumaMontosIngresados(int idPrev)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Preventa_DatoPago
                            where s.Preventa_ID.Equals(idPrev)
                            select s.Monto).Sum();

                ret = Convert.ToInt32(temp);

            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int TraeMontoEliminar(int idMon)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Preventa_DatoPago
                            where s.ID_TipoPago.Equals(idMon)
                            select new { s.Monto }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Monto);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool EliminaMonto(int idMonto)
        {
            bool ret = false;
            try
            {
                var t = from td in DBWMSMetro.SMM_Preventa_DatoPago
                        where td.ID_TipoPago.Equals(idMonto)
                        select td;
                foreach (var detail in t)
                {
                    DBWMSMetro.SMM_Preventa_DatoPago.DeleteOnSubmit(detail);
                }
                DBWMSMetro.SubmitChanges();


                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int EliminaDatoPago(int PreventaId)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_Preventa_DatoPago
                           where p.Preventa_ID == PreventaId
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_Preventa_DatoPago.DeleteOnSubmit(detail);
                }
                DBWMSMetro.SubmitChanges();
                ret = 1;
            }
            catch
            {
                return ret;
            }
            return ret;
        }

        public DataTable SP_ResumenArqueoCaja(DateTime FArqueo)

        {

            DataTable ret = new DataTable();
            try
            {

                Mmtro.CommandTimeout = 60000;
                //Fini = Convert.ToDateTime(Fini.ToShortDateString());
                //Fterm = Convert.ToDateTime(Fterm.ToShortDateString());
                ret = Utilidades.LINQToDataTable(Mmtro.ResumenArqueoCaja(FArqueo));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int InsertaHistorialArqueo(SMM_Historial_Arqueo nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_Historial_Arqueo.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = 1;

            }
            catch
            {


            }
            return ret;

        }
        public int InsertaTotalArqueo(SMM_TotalArqueoReal nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_TotalArqueoReal.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = 1;

            }
            catch
            {


            }
            return ret;

        }
        public int InsertaAperturaCaja(SMM_AperturaCaja nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_AperturaCaja.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = 1;

            }
            catch
            {


            }
            return ret;

        }

        public string TraeFechaArqueo(DateTime FechArqueo)
        {
            string ret ="0";
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Historial_Arqueo
                            where s.FechaArqueo.Equals(FechArqueo)
                            select new { s.FechaArqueo }).FirstOrDefault();
                if (temp != null)
                {
                    ret =temp.FechaArqueo.ToString();
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public string TraeCodigoCliente(int IdPreventa)
        {
            string ret = "0";
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Preventa
                            where s.Preventa_ID.Equals(IdPreventa)
                            select new { s.CodigoCliente }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CodigoCliente.ToString();
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool InsertaLog(SMM_LogCaja nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_LogCaja.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;

        }



    }


}
