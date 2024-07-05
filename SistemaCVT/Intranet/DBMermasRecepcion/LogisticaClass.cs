using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class LogisticaClass
    {
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        public LogisticaClass() { }

        public DataTable SP_ListaPedidoDetalle(int numdoc)

        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_LOGTRANSDetallePedidoSeleccionado(numdoc));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_GrillaPedidos(DateTime Fini, int id)

        {

            DataTable ret = new DataTable();
            try
            {
                Fini = Convert.ToDateTime(Fini.ToShortDateString());

                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_LOGTRANSGridPedidos2(Fini, " ", " ", " ", 0, " ", " ", id));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ListadoPendienteVentas(DateTime Fini, DateTime Fterm)

        {
            DBSap.CommandTimeout = 2000;
            DataTable ret = new DataTable();
            try
            {
                Fini = Convert.ToDateTime(Fini.ToShortDateString());
                Fterm = Convert.ToDateTime(Fterm.ToShortDateString());
                ret = Utilidades.LINQToDataTable(DBSap.CVT_ListadoPendientesVentas(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_PendienteVentaFinal()

        {
            DBSap.CommandTimeout = 2000;
            DataTable ret = new DataTable();
            try
            {
                
                ret = Utilidades.LINQToDataTable(DBSap.SP_PendientesVentas());
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public List<CVT_Contenedores> ObtieneDatosContenedores(int cont)
        {
            List<CVT_Contenedores> ret = new List<CVT_Contenedores>();
            try
            {
                ret = (from p in DBDesaint.CVT_Contenedores
                       where p.IdContenedor.Equals(cont)
                       select p).ToList<CVT_Contenedores>();
            }
            catch
            {

            }
            return ret;
        }

        public List<VW_CVT_LOGTRANSTraePesoTotalProd2> ObtienePesoVolumen(string CodPro)
        {
            List<VW_CVT_LOGTRANSTraePesoTotalProd2> ret = new List<VW_CVT_LOGTRANSTraePesoTotalProd2>();
            try
            {
                ret = (from p in DBDesaint.VW_CVT_LOGTRANSTraePesoTotalProd2
                       where p.ItemCode.Equals(CodPro)
                       select p).ToList<VW_CVT_LOGTRANSTraePesoTotalProd2>();
            }
            catch
            {

            }
            return ret;
        }

        public void SP_insertaContenedorCarga(int idConCarga, Int16 tipoCont, int nPedido, Int16 Linea, string codProducto, int cantidad, int cantPallet, int cantBase, int cantCorr, decimal pTotal, decimal vTotal, string obUso, string obEntrega, int user,
                                               string equi, string eqUsuario, string ipad, int idllam)

        {

            try
            {


                DBDesaint.CVT_LOGTRANSInsUpdContenedorCarga2(idConCarga, tipoCont, nPedido, Linea, codProducto, cantidad, cantPallet, cantBase, cantCorr, pTotal, vTotal, obUso, obEntrega, user
                                                     , equi, eqUsuario, ipad, idllam);
            }
            catch (Exception)
            {

            }

        }

        public DataTable SP_PalletPedido(int numdoc)

        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_LOGTRANSBuscaPalletsPedido2(numdoc));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public List<CVT_ContenedorCarga> ObtieneDatosContenedorCarga(int idContene)
        {
            List<CVT_ContenedorCarga> ret = new List<CVT_ContenedorCarga>();
            try
            {
                ret = (from p in DBDesaint.CVT_ContenedorCarga
                       where p.IdContenedorCarga.Equals(idContene)
                       select p).ToList<CVT_ContenedorCarga>();
            }
            catch
            {

            }
            return ret;
        }

        public void eliminaPallets(int idContene, int idUser, string equipo, string user, string ip)
        {

            try
            {
                DBDesaint.CVT_LOGTRANSEliminaPallet2(idContene, idUser, equipo, user, ip);
            }
            catch
            {

            }
        }

        public void InsertaPalletMixto(int idContene, int idContCar, Int16 tipCont, int nmPedido, Int16 linea, string codPro, decimal cantidad, decimal cntPallet, decimal cntbase,
                                        decimal cntAltura, string obuso, string obentrega, int iduser, string equi, string user, string ipa, decimal pesot, decimal volt)
        {

            try
            {
                DBDesaint.CVT_LOGTRANSInsUpdContenedorCargaDet2(idContene, idContCar, tipCont, nmPedido, linea, codPro, cantidad, cntPallet, cntbase, cntAltura, obuso, obentrega, iduser, equi
                                                                 , user, ipa, pesot, volt);
            }
            catch
            {

            }

        }

        public int obtenerIdContenedorPalletMixto(int codDoc,int numlinea)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDesaint.CVT_ContenedorCargaDet
                            where u.NumPedido.Equals(codDoc)&& u.NumPedidoLinea.Equals(numlinea)
                            select new { u.IdContenedorCarga}).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.IdContenedorCarga;
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public List<CVT_ContenedorCarga> ObtieneDatosContenedorCargaMixto(int idContene,int tipoco)
        {
            List<CVT_ContenedorCarga> ret = new List<CVT_ContenedorCarga>();
            try
            {
                ret = (from p in DBDesaint.CVT_ContenedorCarga
                       where p.NumPedido.Equals(idContene) && p.TipoContenedor.Equals(tipoco)
                       select p).ToList<CVT_ContenedorCarga>();
            }
            catch
            {

            }
            return ret;
        }


        public DataTable SP_ListadetPalleMix(int numcont)

        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_LOGTRANSListaDetPalletMixto2(numcont));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public void EliminaProductoPalletMixto(int idCn,int idCnCarg,int nOrden,int idUser,string equi,string user,string ipa)
        {

            try
            {
                DBDesaint.CVT_LOGTRANSEliminaProdDePalletMixto2(idCn, idCnCarg, nOrden, idUser, equi, user, ipa);
            }
            catch
            {

            }

        }
        public void ConfirmaPalletMixto(int idCn, int idUser, string equi, string user, string ipa)
        {

            try
            {
                DBDesaint.CVT_LOGTRANSConfirmaContenedorCargaDet2(idCn,idUser, equi, user, ipa);
            }
            catch
            {

            }

        }
        public DataTable SP_ListadoPendienteEntrega()

        {
            DBSap.CommandTimeout = 2000;
            DataTable ret = new DataTable();
            try
            {

                ret = Utilidades.LINQToDataTable(DBSap.CVT_SP_LISTADO_PENDIENTE_ENTREGAS());
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }
        public bool InsertaAsignacion(CVT_AsignacionRuta det)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_AsignacionRuta.InsertOnSubmit(det);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch (Exception ex) 
            {
                ret=false;
            }
            return ret;
        }
        public bool ActualizaCamionAsignacionMasivo(string CamionActual, DateTime fecha, string CamionDestino, string Chofer, string Carro, string Hora, int CantPeonetas, string obs)
        {
            bool ret = false;
            try
            {
                string[] values = Hora.Split(':');

                TimeSpan ts = new TimeSpan(Convert.ToInt32(values[0]), Convert.ToInt32(values[1]), 0);

                var t = from a in DBDesaint.CVT_AsignacionRuta
                        where a.Camion_ID == CamionActual && a.FechaEntrega == fecha
                        select a;
                foreach (var r in t)
                {

                    r.Camion_ID = CamionDestino;
                    r.Chofer = Chofer;
                    r.Carro = Carro;
                    r.CantPeonetas = CantPeonetas;
                    r.HoraSalida=ts;
                    r.Observacion= obs;
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception ex)
            {
                ret = false;
            }
            return ret;
        }
        
    }
}
