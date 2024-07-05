using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class ControlFilmClass
    {
        public ControlFilmClass() { }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext wms = new DBMLCVTWMSDataContext();


        public List<CVT_FILM_RECEPCION> DatosRecepcionFilmEnc(int IdRec)
        {
            List<CVT_FILM_RECEPCION> ret = new List<CVT_FILM_RECEPCION>();

            try
            {
                ret = (from p in DBDesaint.CVT_FILM_RECEPCION
                       where p.FolioRecep_Film.Equals(IdRec)
                       select p).ToList<CVT_FILM_RECEPCION>();
            }
            catch
            {

            }
            return ret;
        }

        public int ObtieneSiteRecepcionFilm(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDesaint.CVT_FILM_RECEPCION
                            where l.FolioRecep_Film.Equals(recepid)
                            select new { l.Bodega_Recep }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Bodega_Recep);
                }
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }

        public bool InsertaDetRecepcion(CVT_FILM_BOBINA nn)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_FILM_BOBINA.InsertOnSubmit(nn);
                DBDesaint.SubmitChanges();
                ret = true;

            }
            catch
            {
            }
            return ret;
        }

        public bool ConfirmaPalletRecepcionFilm(int pkid)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_FILM_BOBINA> queryable = from p in this.DBDesaint.CVT_FILM_BOBINA
                                                        where p.NBobina.Equals(pkid)
                                                        select p;
                foreach (CVT_FILM_BOBINA package in queryable)
                {

                    package.EstadoBobina = 2;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public int PalletConfirmadosRecepcionFilm(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDesaint.CVT_FILM_BOBINA
                            where p.FolioRecep_Film == recepid && p.EstadoBobina != 1
                            select new { p.NBobina }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.NBobina;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }

        public bool EliminaBobinaRecepcion(int recepid)
        {
            bool ret = false;
            try
            {
                var temp = from p in DBDesaint.CVT_FILM_BOBINA
                           where p.FolioRecep_Film == recepid
                           select p;
                foreach (var detail in temp)
                {
                    DBDesaint.CVT_FILM_BOBINA.DeleteOnSubmit(detail);
                }
                DBDesaint.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public bool AnulaRecepcionFilm(int recepid)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_FILM_RECEPCION> queryable = from p in this.DBDesaint.CVT_FILM_RECEPCION
                                                           where p.FolioRecep_Film.Equals(recepid)
                                                           select p;
                foreach (CVT_FILM_RECEPCION reception in queryable)
                {
                    reception.Estado = 3;
                    //reception.Reception_DateOut = DateTime.Now;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public int CantPalletRecepcionFilm(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDesaint.CVT_FILM_BOBINA
                            where p.FolioRecep_Film == recepid
                            select new { p.NBobina }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.NBobina;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }

        public int PalletNoConfirmadosRecepcionFilm(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDesaint.CVT_FILM_BOBINA
                            where p.FolioRecep_Film == recepid && p.EstadoBobina == 1
                            select new { p.NBobina }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.NBobina;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }

        public bool CierraRecepcionFilm(int recepid)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_FILM_RECEPCION> queryable = from p in this.DBDesaint.CVT_FILM_RECEPCION
                                                           where p.FolioRecep_Film.Equals(recepid)
                                                           select p;
                foreach (CVT_FILM_RECEPCION reception in queryable)
                {
                    reception.Estado = 2;
                    reception.FechaRecep = DateTime.Now;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public List<CVT_FILM_SOLICITUD_TRANSFERENCIA> DatosSolicitudTransferencia(int idSoli)
        {
            List<CVT_FILM_SOLICITUD_TRANSFERENCIA> ret = new List<CVT_FILM_SOLICITUD_TRANSFERENCIA>();
            try
            {
                ret = (from p in DBDesaint.CVT_FILM_SOLICITUD_TRANSFERENCIA
                       where p.Id_Solicitud.Equals(idSoli)
                       select p).ToList<CVT_FILM_SOLICITUD_TRANSFERENCIA>();
            }
            catch
            {

            }
            return ret;

        }
        public int ObtieneEstadoSolicitudTransfer(int idSolisitud)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDesaint.CVT_FILM_SOLICITUD_TRANSFERENCIA
                            where s.Id_Solicitud.Equals(idSolisitud)
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
        public decimal ObtieneCantSolicitada(int idSolisitud)
        {
            decimal ret = 0;

            List<CVT_FILM_SOLICITUD_TRANSFERENCIA_DETALLE> nn = new List<CVT_FILM_SOLICITUD_TRANSFERENCIA_DETALLE>();
            try
            {
                nn = (from s in DBDesaint.CVT_FILM_SOLICITUD_TRANSFERENCIA_DETALLE
                      where s.Id_Solicitud.Equals(idSolisitud)
                      select s).ToList<CVT_FILM_SOLICITUD_TRANSFERENCIA_DETALLE>();

                foreach (var t in nn)
                {
                    ret += Convert.ToDecimal(t.kilosAproximados);
                }

            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string ObtieneNombreSitio(int siteid)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from s in wms.Site
                            where s.Site_Id.Equals(siteid)
                            select new { s.Site_Description }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_Description;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool InsertaTransfer(CVT_FILM_TRANSFERENCIA nn)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_FILM_TRANSFERENCIA.InsertOnSubmit(nn);
                DBDesaint.SubmitChanges();
                ret = true;

            }
            catch
            {
            }
            return ret;
        }

        public bool ActualizaSolicitud(int solici, int Estad)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_FILM_SOLICITUD_TRANSFERENCIA> queryable = from p in this.DBDesaint.CVT_FILM_SOLICITUD_TRANSFERENCIA
                                                                         where p.Id_Solicitud.Equals(solici)
                                                                         select p;
                foreach (CVT_FILM_SOLICITUD_TRANSFERENCIA reception in queryable)
                {
                    reception.Estado = Estad;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneNsolicitudTransfer(int transfer)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDesaint.CVT_FILM_TRANSFERENCIA
                            where s.Id_TransferenciaFilm.Equals(transfer)
                            select new { s.NSolicitud }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.NSolicitud);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public List<VW_FILTRO_TRANSFERENCIA_FILM> ObtieneFiltroTransferenciaFilm(int TransferId, string Producto, string lote, int Bod, int nBobi)
        {
            DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
            List<CVT_FILM_TRANSFERENCIA> transfer = new List<CVT_FILM_TRANSFERENCIA>();

            List<VW_FILTRO_TRANSFERENCIA_FILM> ret = new List<VW_FILTRO_TRANSFERENCIA_FILM>();
            try
            {
                transfer = (from t in DBDesaint.CVT_FILM_TRANSFERENCIA
                            where t.Id_TransferenciaFilm.Equals(TransferId)
                            select t).ToList<CVT_FILM_TRANSFERENCIA>();
                foreach (var d in transfer)
                {
                    ret = (from f in DBDesaint.VW_FILTRO_TRANSFERENCIA_FILM
                           where (f.IdBodega.Equals(Bod) || Bod == 0) &&
                                 (f.LoteInterno.Equals(lote) || lote == string.Empty) &&
                                 (f.Producto.Equals(Producto) || Producto == string.Empty) &&
                                 (f.NBobina.Equals(nBobi) || nBobi == 0)
                           select f).ToList<VW_FILTRO_TRANSFERENCIA_FILM>();
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool AgregaBobinaTransferencia(int nbobina, decimal pesBruto, int idTransf, decimal PesNeto, decimal PesCono)
        {
            bool ret = false;

            try
            {
                CVT_FILM_TRANSFERENCIA_DETALLE vTD = new CVT_FILM_TRANSFERENCIA_DETALLE();
                vTD.NBobina = nbobina;
                vTD.PesoBruto = pesBruto;
                vTD.Id_TransferenciaFilm = idTransf;
                vTD.PesoNeto = PesNeto;
                vTD.PesoCono = PesCono;
                DBDesaint.CVT_FILM_TRANSFERENCIA_DETALLE.InsertOnSubmit(vTD);
                DBDesaint.SubmitChanges();

                IQueryable<CVT_FILM_BOBINA> queryable = from t in this.DBDesaint.CVT_FILM_BOBINA
                                                        where t.NBobina.Equals(nbobina)
                                                        select t;
                foreach (CVT_FILM_BOBINA package in queryable)
                {

                    package.Reserve_Quantity = pesBruto;

                }
                this.DBDesaint.SubmitChanges();


            }
            catch (Exception er)
            {
                string error = er.Message;

            }
            return ret;
        }

        public List<CVT_FILM_TRANSFERENCIA_DETALLE> ObtieneDetalleTransferenciaFilm(int transferid)
        {
            List<CVT_FILM_TRANSFERENCIA_DETALLE> ret = new List<CVT_FILM_TRANSFERENCIA_DETALLE>();
            try
            {
                ret = (from td in DBDesaint.CVT_FILM_TRANSFERENCIA_DETALLE
                       where td.Id_TransferenciaFilm.Equals(transferid)
                       select td).ToList<CVT_FILM_TRANSFERENCIA_DETALLE>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool EliminaBultoTransferenciaFilm(int transferid, int numBobi)
        {
            bool ret = false;
            try
            {
                var t = from td in DBDesaint.CVT_FILM_TRANSFERENCIA_DETALLE
                        where td.NBobina.Equals(numBobi) && td.Id_TransferenciaFilm.Equals(transferid)
                        select td;
                foreach (var detail in t)
                {
                    DBDesaint.CVT_FILM_TRANSFERENCIA_DETALLE.DeleteOnSubmit(detail);
                }
                DBDesaint.SubmitChanges();

                IQueryable<CVT_FILM_BOBINA> queryable = from p in this.DBDesaint.CVT_FILM_BOBINA
                                                        where p.NBobina.Equals(numBobi)
                                                        select p;
                foreach (CVT_FILM_BOBINA package in queryable)
                {
                    package.Reserve_Quantity = 0;
                }
                this.DBDesaint.SubmitChanges();

                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int ObtieneEstadoTransferenciaFilm(int IdTransferencia)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBDesaint.CVT_FILM_TRANSFERENCIA
                            where t.Id_TransferenciaFilm.Equals(IdTransferencia)
                            select new { t.Estado }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Estado);
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int TraeBodegaDestinoFilm(int IdTransferencia)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBDesaint.CVT_FILM_TRANSFERENCIA
                            where t.Id_TransferenciaFilm.Equals(IdTransferencia)
                            select new { t.BodDestino }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.BodDestino);
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int TraeBodegaOrigenFilm(int IdTransferencia)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBDesaint.CVT_FILM_TRANSFERENCIA
                            where t.Id_TransferenciaFilm.Equals(IdTransferencia)
                            select new { t.BodOrigen }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.BodOrigen);
            }
            catch (Exception)
            {


            }
            return ret;
        }



        public int ObtieneIdUserTransfer(int idtrans)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDesaint.CVT_FILM_TRANSFERENCIA
                            where s.Id_TransferenciaFilm.Equals(idtrans)
                            select new { s.UsuarioEnvia }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.UsuarioEnvia);
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }

        public int CuentaDetalleTransferenciaFilm(int IdTransferencia)
        {
            int ret = 0;
            try
            {
                var temp = (from td in DBDesaint.CVT_FILM_TRANSFERENCIA_DETALLE
                            where td.Id_TransferenciaFilm.Equals(IdTransferencia)
                            select td).Count();
                if (temp != null)
                    ret = Convert.ToInt32(temp);
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }

        public bool CambiaEstadoTransferenciaFilm(int IdTransferencia, int Estado)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_FILM_TRANSFERENCIA> queryable = from t in this.DBDesaint.CVT_FILM_TRANSFERENCIA
                                                               where t.Id_TransferenciaFilm.Equals(IdTransferencia)
                                                               select t;
                foreach (CVT_FILM_TRANSFERENCIA tr in queryable)
                {
                    tr.Estado = Estado;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool CambiaSoliTransf(int IdTransferencia)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_FILM_TRANSFERENCIA> queryable = from t in this.DBDesaint.CVT_FILM_TRANSFERENCIA
                                                               where t.Id_TransferenciaFilm.Equals(IdTransferencia)
                                                               select t;
                foreach (CVT_FILM_TRANSFERENCIA tr in queryable)
                {
                    tr.NSolicitud = 0;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public string ObtieneBodegaTransferenciaFilm(int TranfID)
        {
            string ret = "";
            try
            {
                var temp = (from e in DBDesaint.CVT_FILM_TRANSFERENCIA
                            join si in wms.Site on e.BodOrigen equals si.Site_Id
                            where e.Id_TransferenciaFilm.Equals(TranfID)
                            select new { si.Site_ShortDescription }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_ShortDescription;
                }
            }
            catch
            {
            }
            return ret;
        }
        public string ObtieneSBodegaDestinoTransferenciaFilm(int TranfID)
        {
            string ret = "";
            try
            {
                var temp = (from e in DBDesaint.CVT_FILM_TRANSFERENCIA
                            join si in wms.Site on e.BodDestino equals si.Site_Id
                            where e.Id_TransferenciaFilm.Equals(TranfID)
                            select new { si.Site_ShortDescription }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_ShortDescription;
                }
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_FILM_TRANSFERENCIA> ObtieneInfoTransferenciaFilm(int transferId)
        {
            List<CVT_FILM_TRANSFERENCIA> ret = new List<CVT_FILM_TRANSFERENCIA>();
            try
            {
                ret = (from t in DBDesaint.CVT_FILM_TRANSFERENCIA
                       where t.Id_TransferenciaFilm.Equals(transferId)
                       select t).ToList<CVT_FILM_TRANSFERENCIA>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaFechaUsuarioEstadoTransferenciaFilm(int transferid, int User)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_FILM_TRANSFERENCIA> queryable = from t in this.DBDesaint.CVT_FILM_TRANSFERENCIA
                                                               where t.Id_TransferenciaFilm.Equals(transferid)
                                                               select t;
                foreach (CVT_FILM_TRANSFERENCIA td in queryable)
                {

                    td.UsuarioRecep = User;
                    td.FechaConfirmacion = DateTime.Now;
                    td.Estado = 3;

                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaBodegaBobinaTransferencia(int transferId, int idBodegaDestino)
        {
            bool ret = false;

            try
            {


                List<CVT_FILM_TRANSFERENCIA_DETALLE> rest = new List<CVT_FILM_TRANSFERENCIA_DETALLE>();

                rest = (from t in DBDesaint.CVT_FILM_TRANSFERENCIA_DETALLE
                        where t.Id_TransferenciaFilm.Equals(transferId)
                        select t).ToList<CVT_FILM_TRANSFERENCIA_DETALLE>();

                foreach (var t in rest)
                {
                    IQueryable<CVT_FILM_BOBINA> queryable = from p in this.DBDesaint.CVT_FILM_BOBINA
                                                            where p.NBobina.Equals(t.NBobina)
                                                            select p;
                    foreach (CVT_FILM_BOBINA bob in queryable)
                    {
                        bob.IdBodega = idBodegaDestino;
                    }
                    this.DBDesaint.SubmitChanges();
                }

                ret = true;

            }
            catch { }

            return ret;

        }
        public bool CierreTransferenciaPROCFilm(int TransferID)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_CierraTransferenciaFilm(TransferID);
                ret = true;
            }
            catch
            {
                ret = false;
            }
            return ret;
        }


        public List<CVT_FILM_BOBINA> ObtieneInfoPalletFilm(string SSCC)
        {
            List<CVT_FILM_BOBINA> ret = new List<CVT_FILM_BOBINA>();
            try
            {
                ret = (from p in DBDesaint.CVT_FILM_BOBINA
                       where p.EstadoBobina.Equals(2) && p.NBobina.Equals(SSCC)
                       select p).ToList<CVT_FILM_BOBINA>();
            }
            catch
            {
            }
            return ret;
        }

        public int VerificaReservaPalletFilm(string SSCC)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDesaint.CVT_FILM_BOBINA
                            where r.NBobina.Equals(SSCC)
                            select new { r.Reserve_Quantity }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (int)temp.Reserve_Quantity;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }

        public int VerificaFilmDetProduccion(string SSCC)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDesaint.CVT_ControlEnvasadoPT_Detalle                           
                            where r.NBobina.Equals(SSCC)
                            select new { r.NBobina }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (int)temp.NBobina;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public decimal TraePesoNeto(string SSCC)
        {
            decimal ret = 0;
            try
            {
                var temp = (from r in DBDesaint.CVT_FILM_BOBINA
                            where r.NBobina.Equals(SSCC)
                            select new { r.PesoNeto }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (decimal)temp.PesoNeto;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public List<CVT_FILM_BOBINA> ObtieneInfoPallet(string SSCC)
        {
            List<CVT_FILM_BOBINA> ret = new List<CVT_FILM_BOBINA>();
            try
            {
                ret = (from p in DBDesaint.CVT_FILM_BOBINA
                       where p.EstadoBobina.Equals(2) && p.NBobina.Equals(SSCC)
                       select p).ToList<CVT_FILM_BOBINA>();
            }
            catch
            {
            }
            return ret;
        }
        public int ClonePackage(CVT_FILM_BOBINA PackageModelo)
        {
            WMSClass wms = new WMSClass();
            int num = 0;
            try
            {
                DateTime now = DateTime.Now;
                CVT_FILM_BOBINA entity = new CVT_FILM_BOBINA
                {
                    NBobina = wms.getNewCorrelativo(Convert.ToInt32(PackageModelo.IdBodega)),
                    FolioRecep_Film = 0,
                    Producto = PackageModelo.Producto,
                    LoteInterno = PackageModelo.LoteInterno,
                    LoteProveedor = PackageModelo.LoteProveedor,
                    Fecha_Produc = PackageModelo.Fecha_Produc,
                    Fecha_Venc = PackageModelo.Fecha_Venc,
                    PesoBruto = 0,
                    PesoCono = PackageModelo.PesoCono,
                    EstadoBobina = PackageModelo.EstadoBobina,
                    PesoBrutoInicial = PackageModelo.PesoBrutoInicial,
                    //  Reserve_Quantity = PackageModelo.Reserve_Quantity,
                    IdBodega = PackageModelo.IdBodega,
                    CardCode = PackageModelo.CardCode
                };
                DBDesaint.CVT_FILM_BOBINA.InsertOnSubmit(entity);
                DBDesaint.SubmitChanges();
                num = Convert.ToInt32(entity.NBobina);
            }
            catch (Exception exception)
            {
                num = 0;
            }
            return num;
        }
        public bool ActualizaRestaCantidadPackageFilm(int PackageId, decimal Cantidad)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_FILM_BOBINA> queryable = from t in this.DBDesaint.CVT_FILM_BOBINA
                                                        where t.NBobina.Equals(PackageId)
                                                        select t;
                foreach (CVT_FILM_BOBINA package in queryable)
                {
                    decimal CantidadActual = Convert.ToDecimal(package.PesoBruto);
                    decimal num = Cantidad;
                    package.PesoBruto = CantidadActual - Cantidad;
                    //package.Reserve_Quantity = (CantidadActual - Cantidad) - package.PesoCono;
                    if (CantidadActual - Cantidad == 0)
                    {
                        package.EstadoBobina = 7;
                    }
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaSumaCantidadPackageFilmNuevo(int PackageId, decimal Cantidad)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_FILM_BOBINA> queryable = from t in this.DBDesaint.CVT_FILM_BOBINA
                                                        where t.NBobina.Equals(PackageId)
                                                        select t;
                foreach (CVT_FILM_BOBINA package in queryable)
                {
                    decimal CantidadActual = Convert.ToInt32(package.PesoBruto);
                    decimal num = Cantidad;
                    package.PesoBruto = CantidadActual + Cantidad;

                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public string RepaletizaNuevoFilm(string Origen, decimal Cantidad, int idUser)
        {
            string ret = string.Empty;
            int packageNuevo = 0;
            List<CVT_FILM_BOBINA> PO = ObtieneInfoPallet(Origen);
            try
            {

                foreach (var p in PO)
                {
                    if (p.PesoBruto >= Cantidad)
                    {
                        packageNuevo = ClonePackage(p);
                        #region Transacciones
                        //Agrega PickingList
                        CVT_FILM_REPALETIZADO NPL = new CVT_FILM_REPALETIZADO();
                        NPL.idBodega = p.IdBodega;
                        NPL.FechaRepaletizado = DateTime.Now;
                        NPL.CodProducto = p.Producto;
                        NPL.PesoBrutoOrigen = p.PesoBruto;
                        NPL.NBobinaDestino = Convert.ToInt32(packageNuevo);
                        NPL.NBobinaOrigen = p.NBobina;
                        NPL.IdUsuario = idUser;
                        NPL.PesoBrutoPickeado = Cantidad;

                        DBDesaint.CVT_FILM_REPALETIZADO.InsertOnSubmit(NPL);
                        DBDesaint.SubmitChanges();

                        //Actualiza Origen
                        ActualizaRestaCantidadPackageFilm(p.NBobina, Cantidad);
                        List<CVT_FILM_BOBINA> PD = ObtieneInfoPallet(packageNuevo.ToString());
                        foreach (var p1 in PD)
                        {
                            //Actualiza Destino
                            ActualizaSumaCantidadPackageFilmNuevo(p1.NBobina, Cantidad);
                        }

                    }

                    #endregion
                    ret = packageNuevo.ToString();
                }

            }
            catch (Exception)
            {

                ret = string.Empty;
            }
            return ret;
        }
        public bool ActualizaRestaCantidadFilmProduccion(int SSCC, decimal Cant)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_ControlEnvasadoPT_Detalle> queryable = from t in this.DBDesaint.CVT_ControlEnvasadoPT_Detalle
                                                                      where t.NBobina.Equals(SSCC)
                                                                      select t;
                foreach (CVT_ControlEnvasadoPT_Detalle package in queryable)
                {
                    decimal CantidadActual = Convert.ToDecimal(package.Cantidad);
                    decimal num = Cant;
                    package.Cantidad = Convert.ToDecimal(CantidadActual - Cant);
                    //if (CantidadActual - Cant == 0)
                    //{
                    //    package.EstadoBobina = 7;
                    //}
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public List<CVT_FILM_DEVOLUCION> ObtieneDatosDevolucion(int numDevol)
        {
            List<CVT_FILM_DEVOLUCION> ret = new List<CVT_FILM_DEVOLUCION>();

            try
            {

                ret = (from fd in DBDesaint.CVT_FILM_DEVOLUCION
                       where fd.id_DevoFilm.Equals(numDevol)
                       select fd).ToList<CVT_FILM_DEVOLUCION>();
            }
            catch
            {
            }
            return ret;
        }

        public List<CVT_FILM_BOBINA> ObtieneDatosDeBobina(int nBob)
        {
            List<CVT_FILM_BOBINA> ret = new List<CVT_FILM_BOBINA>();

            try
            {

                ret = (from fd in DBDesaint.CVT_FILM_BOBINA
                       where fd.NBobina.Equals(nBob)
                       select fd).ToList<CVT_FILM_BOBINA>();
            }
            catch
            {
            }
            return ret;
        }
        public List<VW_DATOS_BOBINAS_FILM_PROD> ObtieneDatosDeBobinaPROD(int nBob)
        {
            List<VW_DATOS_BOBINAS_FILM_PROD> ret = new List<VW_DATOS_BOBINAS_FILM_PROD>();

            try
            {

                ret = (from fd in DBDesaint.VW_DATOS_BOBINAS_FILM_PROD
                       where fd.NBobina.Equals(nBob) && fd.EstadoBobina.Equals(2) && fd.IdBodega.Equals(5) && (fd.Reserve_Quantity.Equals("0,0000") || fd.Reserve_Quantity.Equals(null))
                       select fd).ToList<VW_DATOS_BOBINAS_FILM_PROD>();
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaRegistroDevolFilmDetalle(CVT_FILM_DEVOLUCION_DETALLE nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_FILM_DEVOLUCION_DETALLE.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }
        public int VerificaBobinaEnDevolucion(int nBob)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDesaint.CVT_FILM_DEVOLUCION_DETALLE
                            where s.Nbobina.Equals(nBob)
                            select new { s.Nbobina }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Nbobina);
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }

        public bool EliminaBobinaDevolucion(int Nbob)

        {
            bool ret = false;
            try
            {
                var temp = from p in DBDesaint.CVT_FILM_DEVOLUCION_DETALLE
                           where p.Nbobina == Nbob
                           select p;
                foreach (var detail in temp)
                {
                    DBDesaint.CVT_FILM_DEVOLUCION_DETALLE.DeleteOnSubmit(detail);
                    ret = true;
                }
                DBDesaint.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public string ObtieneMotivoDevolucion(int idDev)
        {
            string ret = "";
            try
            {
                var temp = (from s in DBDesaint.CVT_FILM_DEVOLUCION
                            where s.id_DevoFilm.Equals(idDev)
                            select new { s.Motivo }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Motivo);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int TraeCantidadBobinas(int idDev)
        {
            int ret = 0;
            try
            {
                List<CVT_FILM_DEVOLUCION_DETALLE> dt = new List<CVT_FILM_DEVOLUCION_DETALLE>();
                dt = (from tr in DBDesaint.CVT_FILM_DEVOLUCION_DETALLE
                      where tr.id_DevoFilm.Equals(idDev)
                      select tr).ToList<CVT_FILM_DEVOLUCION_DETALLE>();
                foreach (var n in dt)
                {
                    ret = ret + 1;

                }
                return ret;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaEstadoDevolucion(int idDevo, int cantBobinas)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_FILM_DEVOLUCION> queryable = from t in this.DBDesaint.CVT_FILM_DEVOLUCION
                                                            where t.id_DevoFilm.Equals(idDevo)
                                                            select t;
                foreach (CVT_FILM_DEVOLUCION td in queryable)
                {

                    td.Estado = 2;
                    td.FechaTermino = DateTime.Now;
                    td.CantidadBobinas = cantBobinas;
                }
                this.DBDesaint.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool DardeBajaBobinasDevolucion(int IdDev)
        {
            bool ret = false;
            try
            {
                List<CVT_FILM_DEVOLUCION_DETALLE> dt = new List<CVT_FILM_DEVOLUCION_DETALLE>();
                dt = (from tr in DBDesaint.CVT_FILM_DEVOLUCION_DETALLE
                      where tr.id_DevoFilm.Equals(IdDev)
                      select tr).ToList<CVT_FILM_DEVOLUCION_DETALLE>();
                foreach (var n in dt)
                {
                    IQueryable<CVT_FILM_BOBINA> queryable = from t in this.DBDesaint.CVT_FILM_BOBINA
                                                            where t.NBobina.Equals(n.Nbobina)
                                                            select t;
                    foreach (CVT_FILM_BOBINA package in queryable)
                    {
                        //package.PesoBruto = 0;
                        //package.PesoCono = 0;
                        package.EstadoBobina = 7;
                        package.Reserve_Quantity = 0;
                        package.FechaBajada = DateTime.Now;
                    }
                    this.DBDesaint.SubmitChanges();
                    ret = true;
                }

            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int VerificaExisBobinasDetDevolucion(int idDevo)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDesaint.CVT_FILM_DEVOLUCION_DETALLE
                            where s.id_DevoFilm.Equals(idDevo)
                            select new { s.id_DevoFilm }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.id_DevoFilm);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool eliminaDevolucionFilm(int idDevo)
        {
            bool ret = false;
            try
            {
                var dt = (from tr in DBDesaint.CVT_FILM_DEVOLUCION
                          where tr.id_DevoFilm.Equals(idDevo)
                          select tr);
                foreach (var n in dt)
                {
                    DBDesaint.CVT_FILM_DEVOLUCION.DeleteOnSubmit(n);
                    DBDesaint.SubmitChanges();

                    return true;
                }
                ret = true;

            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string ObtieneProveedorRecepFilm(int RecFilm)
        {
            string ret = "";
            try
            {
                var temp = (from e in DBDesaint.CVT_FILM_RECEPCION
                            where e.FolioRecep_Film.Equals(RecFilm)
                            select new { e.Proveedor }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Proveedor;
                }
            }
            catch
            {
            }
            return ret;
        }

        public DataTable SP_inf_Stock_Film(string bOrign, string cProd, string lot)

        {

            DataTable ret = new DataTable();
            try
            {
                DBDesaint.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDesaint.SP_INF_STOCK_FILM(bOrign, cProd, lot));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public List<VW_DetalleRecepcion_Film> ObtieneDetalleRecepcionFilm(int recepid)
        {
            List<VW_DetalleRecepcion_Film> ret = new List<VW_DetalleRecepcion_Film>();
            try
            {
                ret = (from r in DBDesaint.VW_DetalleRecepcion_Film
                       where r.FolioRecep_Film == recepid
                       select r).ToList<VW_DetalleRecepcion_Film>();
            }
            catch
            {
            }
            return ret;
        }
        public List<VW_DetalleRecepcion_Film_lotes> ObtieneDetalleLoteRecepcionFilm(int recepid, string codprod)
        {
            List<VW_DetalleRecepcion_Film_lotes> ret = new List<VW_DetalleRecepcion_Film_lotes>();
            try
            {
                ret = (from r in DBDesaint.VW_DetalleRecepcion_Film_lotes
                       where r.FolioRecep_Film == recepid && r.Producto == codprod
                       select r).ToList<VW_DetalleRecepcion_Film_lotes>();
            }
            catch
            {
            }
            return ret;
        }

        public List<VW_DetalleRecepcion_Film> ObtieneDetalleRecepcionExcesoFilm(int recepid, string codProducto)
        {
            List<VW_DetalleRecepcion_Film> ret = new List<VW_DetalleRecepcion_Film>();
            try
            {
                ret = (from r in DBDesaint.VW_DetalleRecepcion_Film
                       where r.FolioRecep_Film == recepid && r.Producto.Equals(codProducto)
                       select r).ToList<VW_DetalleRecepcion_Film>();
            }
            catch
            {
            }
            return ret;
        }

        public List<VW_TranferenciaSAP_Film> ObtieneVWDetalleTransferenciaFilm(int transferid)
        {
            List<VW_TranferenciaSAP_Film> ret = new List<VW_TranferenciaSAP_Film>();
            try
            {
                DBDesaint.CommandTimeout = 6000;
                ret = (from td in DBDesaint.VW_TranferenciaSAP_Film
                       where td.Id_TransferenciaFilm.Equals(transferid)
                       select td).ToList<VW_TranferenciaSAP_Film>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<VW_TranferSAPLotes_Film> ObtieneVWDetalleTransferenciaLotesFilm(int transferid, string artcode)
        {
            List<VW_TranferSAPLotes_Film> ret = new List<VW_TranferSAPLotes_Film>();
            try
            {
                ret = (from td in DBDesaint.VW_TranferSAPLotes_Film
                       where td.Id_TransferenciaFilm.Equals(transferid) && td.Producto.Equals(artcode)
                       select td).ToList<VW_TranferSAPLotes_Film>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaPalletProducionFilm(int SSCC, decimal cant)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_ControlEnvasadoPT_Detalle> queryable = from p in this.DBDesaint.CVT_ControlEnvasadoPT_Detalle
                                                                      where p.NBobina.Equals(SSCC)
                                                                      select p;
                foreach (CVT_ControlEnvasadoPT_Detalle package in queryable)
                {

                    package.Cantidad = cant;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public bool CambiaEstadoBobinaCierreFolio(int IdControlFilm)
        {
            bool ret = false;
            try
            {
                List<CVT_ControlEnvasadoPT_Detalle> dt = new List<CVT_ControlEnvasadoPT_Detalle>();
                dt = (from tr in DBDesaint.CVT_ControlEnvasadoPT_Detalle
                      where tr.ID_ControlEnvPT.Equals(IdControlFilm)
                      select tr).ToList<CVT_ControlEnvasadoPT_Detalle>();
                foreach (var n in dt)
                {
                    IQueryable<CVT_FILM_BOBINA> queryable = from t in this.DBDesaint.CVT_FILM_BOBINA
                                                            where t.NBobina.Equals(n.NBobina)
                                                            select t;
                    foreach (CVT_FILM_BOBINA package in queryable)
                    {
                        //package.PesoBruto = 0;
                        //package.PesoCono = 0;
                        package.EstadoBobina = 7;
                        //package.Reserve_Quantity = 0;
                        package.FechaBajada = DateTime.Now;
                    }
                    this.DBDesaint.SubmitChanges();

                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool ReviveBobinaCierreFolio(int IdControlFilm)
        {
            bool ret = false;
            try
            {
                List<CVT_ControlEnvasadoPT_Detalle> dt = new List<CVT_ControlEnvasadoPT_Detalle>();
                dt = (from tr in DBDesaint.CVT_ControlEnvasadoPT_Detalle
                      where tr.ID_ControlEnvPT.Equals(IdControlFilm)
                      select tr).ToList<CVT_ControlEnvasadoPT_Detalle>();
                foreach (var n in dt)
                {
                    IQueryable<CVT_FILM_BOBINA> queryable = from t in this.DBDesaint.CVT_FILM_BOBINA
                                                            where t.NBobina.Equals(n.NBobina)
                                                            select t;
                    foreach (CVT_FILM_BOBINA package in queryable)
                    {
                        //package.PesoBruto = 0;
                        //package.PesoCono = 0;
                        package.EstadoBobina = 2;
                        //package.Reserve_Quantity = 0;
                        package.FechaBajada = DateTime.Now;
                    }
                    this.DBDesaint.SubmitChanges();

                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public DataTable SP_TransferenciasEfectuadasFilm(DateTime Fini, DateTime Fterm, string bOrign, string bDestn)

        {

            DataTable ret = new DataTable();
            try
            {
                DBDesaint.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_TRANSFERENCIAS_EFECTUADAS_FILM(Fini, Fterm, bOrign, bDestn));
            }
            catch (Exception)
            {

            }
            return ret;
        }


        public DataTable SP_CompStockFilm(string codpro, string bodega, string lote)

        {
            DataTable ret = new DataTable();
            try
            {
                DBDesaint.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_CompStockLotesFilm(codpro, bodega, lote));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool ActualizaReservaControlProd(int nbobina, decimal cant)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_FILM_BOBINA> queryable = from t in this.DBDesaint.CVT_FILM_BOBINA
                                                        where t.NBobina.Equals(nbobina)
                                                        select t;
                foreach (CVT_FILM_BOBINA td in queryable)
                {

                    td.Reserve_Quantity = cant;
                }
                this.DBDesaint.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public string ObtieneBodegaRepaletizado(int npall)
        {
            string ret = "";
            try
            {
                var temp = (from e in DBDesaint.CVT_FILM_BOBINA
                            join si in wms.Site on e.IdBodega equals si.Site_Id
                            where e.NBobina.Equals(npall)
                            select new { si.Site_ShortDescription }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_ShortDescription;
                }
            }
            catch
            {
            }
            return ret;
        }

        public int ObtieneBodegaPalletFilm(int npall)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDesaint.CVT_FILM_BOBINA
                            where l.NBobina.Equals(npall)
                            select new { l.IdBodega }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.IdBodega);

                }
            }
            catch
            {
            }
            return ret;
        }

        public string TraeBodegaWMS(int idBod)
        {
            string ret = "";
            try
            {
                var temp = (from l in wms.Site
                            where l.Site_Id.Equals(idBod)
                            select new { l.Site_ShortDescription }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_ShortDescription;

                }
            }
            catch
            {
            }
            return ret;
        }



        public string ObtieneBodegaUsuario(int UserID)
        {
            string ret = "";
            try
            {
                var temp = (from l in DBDesaint.CVT_Usuarios
                            where l.IdUsuario.Equals(UserID)
                            select new { l.RestriccionBodega }).FirstOrDefault();
                if (temp != null)
                {
                    if(temp.RestriccionBodega!=null)
                    {
                        ret = temp.RestriccionBodega;
                    }
                    else { ret = "0"; }
                    
                }
                
            }
            catch (Exception)
            {

                ret = "";
            }
            return ret;
        }

        #region expedicion film
        public List<CVT_FILM_EXPEDICION> ObtieneDatosDeExpedicionRapida_Film(int numExpRap)
        {
            List<CVT_FILM_EXPEDICION> ret = new List<CVT_FILM_EXPEDICION>();

            try
            {

                ret = (from fd in DBDesaint.CVT_FILM_EXPEDICION
                       where fd.ExpFilm_id.Equals(numExpRap)
                       select fd).ToList<CVT_FILM_EXPEDICION>();
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaRegistroDetalleExpRapida_film(CVT_FILM_EXPEDICION_DETALLE nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_FILM_EXPEDICION_DETALLE.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }

        public int VerificaExisBultosDetExpedicion_Film(int idExp)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDesaint.CVT_FILM_EXPEDICION_DETALLE
                            where s.ExpFilm_id.Equals(idExp)
                            select new { s.ExpFilm_id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.ExpFilm_id);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool eliminaExpedicionRapida_Film(int idExp)
        {
            bool ret = false;
            try
            {

                //List<CVT_Tickets_Respuesta> dt = new List<CVT_Tickets_Respuesta>();
                var dt = (from tr in DBDesaint.CVT_FILM_EXPEDICION
                          where tr.ExpFilm_id.Equals(idExp)
                          select tr);/*.ToList<CVT_Tickets_Respuesta>();*/
                foreach (var n in dt)
                {
                    //if (n.Id_Ticket == IdTicket)
                    //{
                    DBDesaint.CVT_FILM_EXPEDICION.DeleteOnSubmit(n);
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                    //}
                    return true;
                }
                ret = true;

            }
            catch (Exception)
            {


            }
            return ret;

        }

        public int TraeCantidadIncluidos_Film(int expd)
        {
            int ret = 0;
            try
            {
                List<CVT_FILM_EXPEDICION_DETALLE> dt = new List<CVT_FILM_EXPEDICION_DETALLE>();
                dt = (from tr in DBDesaint.CVT_FILM_EXPEDICION_DETALLE
                      where tr.ExpFilm_id.Equals(expd)
                      select tr).ToList<CVT_FILM_EXPEDICION_DETALLE>();
                foreach (var n in dt)
                {
                    ret = ret + 1;

                }
                return ret;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int ObtieneMotivoExpedicion_Film(int idExp)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDesaint.CVT_FILM_EXPEDICION
                            where s.ExpFilm_id.Equals(idExp)
                            select new { s.ExpFilm_Motivo }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.ExpFilm_Motivo);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool ActualizaEstadoExpedicionRapida_film(int Expeditionid, int estado, bool sync, int confirmed)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_FILM_EXPEDICION> queryable = from t in this.DBDesaint.CVT_FILM_EXPEDICION
                                                   where t.ExpFilm_id.Equals(Expeditionid)
                                                   select t;
                foreach (CVT_FILM_EXPEDICION td in queryable)
                {

                    td.ExpFilm_Status = estado;
                    td.ExpFilm_DateOut = DateTime.Now;
                    //if (sync == true)
                    //{
                    //    td.INV_0010_SyncStat = 'U';
                    //    td.INV_0010_UpdFrom = 'I';
                    //}
                    //else
                    //{
                    //    //td.INV_0010_SyncStat = 'S';
                    //    //td.INV_0010_UpdFrom = 'D';
                    //    //td.Expedition_DateOut = DateTime.Now;
                    //    //td.Expedition_Confirmed = confirmed;
                    //    td.Expedition_Included = confirmed;
                    //}

                }
                this.DBDesaint.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool DardeBajaPalletExpedicionRapida_Film(int expd)
        {
            bool ret = false;
            try
            {
                List<CVT_FILM_EXPEDICION_DETALLE> dt = new List<CVT_FILM_EXPEDICION_DETALLE>();
                dt = (from tr in DBDesaint.CVT_FILM_EXPEDICION_DETALLE
                      where tr.ExpFilm_id.Equals(expd)
                      select tr).ToList<CVT_FILM_EXPEDICION_DETALLE>();
                foreach (var n in dt)
                {
                    IQueryable<CVT_FILM_BOBINA> queryable = from t in this.DBDesaint.CVT_FILM_BOBINA
                                                            where t.NBobina.Equals(n.NBobina)
                                                    select t;
                    foreach (CVT_FILM_BOBINA package in queryable)
                    {
                        //package.Package_Quantity = 0;
                        package.EstadoBobina = 7;
                        package.FechaBajada = DateTime.Now;
                        package.Reserve_Quantity = package.PesoNeto;
                    }
                    this.DBDesaint.SubmitChanges();
                    ret = true;
                }

            }
            catch (Exception)
            {


            }
            return ret;
        }
        #endregion


      

    }
}
