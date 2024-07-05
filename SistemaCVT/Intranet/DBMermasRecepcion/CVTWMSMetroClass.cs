using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace DBMermasRecepcion
{
    public class CVTWMSMetroClass
    {
        public CVTWMSMetroClass()
        {
        }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTWMSMETRODataContext DBWMSMetro = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext Mmtro = new DBMLCVTMMETRODataContext();


        #region Recepcion
        public bool InsertaNuevaRecepcion(SMM_Reception nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Reception.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;
        }
        public List<SMM_VW_ExpedicionDetalle> ObtieneExpedicionDetalleSMM(int expid)
        {
            List<SMM_VW_ExpedicionDetalle> ret = new List<SMM_VW_ExpedicionDetalle>();
            try
            {
                ret = (from ce in DBWMSMetro.SMM_VW_ExpedicionDetalle
                       where ce.Expedition_Id.Equals(expid)
                       select ce).ToList<SMM_VW_ExpedicionDetalle>();
            }
            catch
            {

            }
            return ret;
        }
        public string TraeProveedorSMM(string codpro)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from s in Mmtro.MMetro_OITM
                            where s.ItemCode.Equals(codpro)
                            select new { s.CardCode }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CardCode;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string TraeBarCodeProductoSMM(string codpro)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from s in Mmtro.MMetro_OITM
                            where s.ItemCode.Equals(codpro)
                            select new { s.CodeBars }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CodeBars;
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
                var temp = (from s in DBWMSMetro.SMM_Site
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
        public int ObtieneSitioByNombre(string sitesd)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Site
                            where s.Site_Description.Equals(sitesd)
                            select new { s.Site_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_Id;
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int obtieneTipoRecepcion(int idRecepcion)
        {
            int res = 0;

            var tem = (from u in DBWMSMetro.SMM_Reception
                       where u.Reception_Id.Equals(idRecepcion)
                       select new { u.Reception_Type }).First();
            if (tem != null)
            {
                res = Convert.ToInt32(tem.Reception_Type);
            }
            return res;
        }
        public int obtieneBodegaRecepcion(int idRecepcion)
        {
            int res = 0;

            var tem = (from u in DBWMSMetro.SMM_Reception
                       where u.Reception_Id.Equals(idRecepcion)
                       select new { u.Site_Id }).First();
            if (tem != null)
            {
                res = Convert.ToInt32(tem.Site_Id);
            }
            return res;
        }
        public int obtieneNumDocSAPRecepcion(int idRecepcion)
        {
            int res = 0;

            var tem = (from u in DBWMSMetro.SMM_Reception
                       where u.Reception_Id.Equals(idRecepcion)
                       select new { u.NumDocSAP }).First();
            if (tem != null)
            {
                res = Convert.ToInt32(tem.NumDocSAP);
            }
            return res;
        }

        public int obtieneEstadoRecepcion(int idRecepcion)
        {
            int res = 0;

            try
            {
                var tem = (from u in DBWMSMetro.SMM_Reception
                           where u.Reception_Id.Equals(idRecepcion)
                           select new { u.Reception_Status }).First();
                if (tem != null)
                {
                    return res = Convert.ToInt32(tem.Reception_Status);
                }
            }
            catch (Exception)
            {

                return res = 0;
            }

            return res;

        }
        public string obtieneProveedorRecepcion(int idRecepcion)
        {
            string res = "";

            var tem = (from u in DBWMSMetro.SMM_Reception
                       where u.Reception_Id.Equals(idRecepcion)
                       select new { u.CardCode }).First();
            if (tem != null)
            {
                res = tem.CardCode;
            }
            return res;
        }

        public bool InsertaPackageReception(SMM_Package nn)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Package.InsertOnSubmit(nn);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch
            {
            }
            return ret;
        }

        public int CreaNewCorrelativo()
        {
            int num = 0;
            try
            {
                SMM_Correlative correlative = (from c in DBWMSMetro.SMM_Correlative
                                               select c).FirstOrDefault<SMM_Correlative>();

                if (correlative == null)
                {
                    return num;
                }
                int? nullable = correlative.Correlative_Now + 1;
                int? nullable2 = correlative.Correlative_Out;

                correlative.Correlative_Now = nullable;
                this.DBWMSMetro.SubmitChanges();
                num = correlative.Correlative_Now.Value;


            }
            catch
            {
            }

            return num;
        }
        public int obtieneSiteIDRecepcion(int idRecepcion)
        {
            int res = 0;

            var tem = (from u in DBWMSMetro.SMM_Reception
                       where u.Reception_Id.Equals(idRecepcion)
                       select new { u.Site_Id }).First();
            if (tem != null)
            {
                res = tem.Site_Id;
            }
            return res;
        }
        public int ObtieneUbicacionDefecto(int siteid, string tipo)
        {
            int ret = 0;
            try
            {
                var temp = (from d in DBWMSMetro.SMM_Layout
                            where d.Site_Id.Equals(siteid) && d.UbicacionxDefecto.Equals(tipo)
                            select new { d.Layout_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Layout_Id);
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<SMM_Layout> ObtieneInfoLayout(int layoutid)
        {
            List<SMM_Layout> ret = new List<SMM_Layout>();
            try
            {
                ret = (from t in DBWMSMetro.SMM_Layout
                       where t.Layout_Id.Equals(layoutid)
                       select t).ToList<SMM_Layout>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool AgregaLocation(int PackageId, int LayoutDestinoId, int StaffId)
        {
            bool flag = false;
            DateTime now = DateTime.Now;
            try
            {
                IQueryable<SMM_Location> queryable = from t in this.DBWMSMetro.SMM_Location
                                                     where t.Package_Id.Equals(PackageId) && t.Location_OutDate.Equals(null)
                                                     select t;
                foreach (SMM_Location location in queryable)
                {

                    location.Location_OutDate = DateTime.Now;

                }
                this.DBWMSMetro.SubmitChanges();
                List<SMM_Layout> dt = ObtieneInfoLayout(LayoutDestinoId);
                foreach (var l in dt)
                {
                    SMM_Location entity = new SMM_Location
                    {
                        Site_Id = l.Site_Id,
                        Layout_Id = LayoutDestinoId,
                        Package_Id = PackageId,
                        Location_InDate = now,
                        idUsuario = new int?(StaffId)
                    };
                    this.DBWMSMetro.SMM_Location.InsertOnSubmit(entity);
                    this.DBWMSMetro.SubmitChanges();
                }
                flag = true;
            }
            catch
            {
                flag = false;
            }


            return flag;
        }
        public bool ConfirmaPalletRecepcionSMM(int pkid, int layoutid)
        {
            bool ret = false;
            try
            {
                IQueryable<SMM_Package> queryable = from p in this.DBWMSMetro.SMM_Package
                                                    where p.Package_Id.Equals(pkid)
                                                    select p;
                foreach (SMM_Package package in queryable)
                {
                    package.Layout_Id = layoutid;
                    package.Package_Status = 2;
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public int PalletConfirmadosRecepcionSMM(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Package
                            where p.Reception_Id == recepid && p.Package_Status != 1
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Package_Id;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public bool EliminaBultoRecepcionSMM(int recepid)
        {
            bool ret = false;
            try
            {
                var temp = from p in DBWMSMetro.SMM_Package
                           where p.Reception_Id == recepid
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_Package.DeleteOnSubmit(detail);
                }
                DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public bool AnulaRecepcionSMM(int recepid)
        {
            bool ret = false;
            try
            {
                IQueryable<SMM_Reception> queryable = from p in this.DBWMSMetro.SMM_Reception
                                                      where p.Reception_Id.Equals(recepid)
                                                      select p;
                foreach (SMM_Reception reception in queryable)
                {
                    reception.Reception_Status = 3;
                    reception.Reception_DateOut = DateTime.Now;
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public int CantPalletRecepcionSMM(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Package
                            where p.Reception_Id == recepid
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Package_Id;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public int PalletNoConfirmadosRecepcionSMM(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Package
                            where p.Reception_Id == recepid && p.Package_Status == 1
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Package_Id;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public int PalletNoPosicionadosRecepcionSMM(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Package
                            where p.Reception_Id == recepid && (p.Package_Status.Equals(2) || p.Package_Status.Equals(1))
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Package_Id;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public bool CierraRecepcionSMM(int recepid)
        {
            bool ret = false;
            try
            {
                IQueryable<SMM_Reception> queryable = from p in this.DBWMSMetro.SMM_Reception
                                                      where p.Reception_Id.Equals(recepid)
                                                      select p;
                foreach (SMM_Reception reception in queryable)
                {
                    reception.Reception_Status = 2;
                    reception.Reception_DateOut = DateTime.Now;
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }




        public List<SMM_VW_DetalleRecepcion> ObtieneDetalleRecepcionSMM(int recepid)
        {
            List<SMM_VW_DetalleRecepcion> ret = new List<SMM_VW_DetalleRecepcion>();
            try
            {
                ret = (from r in DBWMSMetro.SMM_VW_DetalleRecepcion
                       where r.Reception_Id.Equals(recepid)
                       select r).ToList<SMM_VW_DetalleRecepcion>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }
        public List<SMM_VW_DetalleRecepcion_Transferencia> ObtieneDetalleRecepcionSMMTransferencia(int recepid)
        {
            List<SMM_VW_DetalleRecepcion_Transferencia> ret = new List<SMM_VW_DetalleRecepcion_Transferencia>();
            try
            {
                ret = (from r in DBWMSMetro.SMM_VW_DetalleRecepcion_Transferencia
                       where r.Reception_Id.Equals(recepid)
                       select r).ToList<SMM_VW_DetalleRecepcion_Transferencia>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }
        public List<VW_STOCK_FECHA_RECEPCION> ObtieneDetosStockRecepcion(int recepid)
        {
            List<VW_STOCK_FECHA_RECEPCION> ret = new List<VW_STOCK_FECHA_RECEPCION>();
            try
            {
                ret = (from r in DBWMSMetro.VW_STOCK_FECHA_RECEPCION
                       where r.Reception_Id.Equals(recepid)
                       select r).ToList<VW_STOCK_FECHA_RECEPCION>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }


        public string VerificaUbcacionxDef(int Site)
        {
            string res = "";

            var tem = (from u in DBWMSMetro.SMM_Layout
                       where u.Site_Id.Equals(Site) && u.UbicacionxDefecto.Equals('Y')
                       select new { u.UbicacionxDefecto }).FirstOrDefault();
            if (tem != null)
            {
                res = tem.UbicacionxDefecto;
            }
            return res;
        }

        public string VerificaStockEnTabla(int bodega, string codProducto, DateTime fech)
        {
            string res = "";

            var tem = (from u in DBWMSMetro.SMM_StockFecha
                       where u.Bodega.Equals(bodega) && u.Producto.Equals(codProducto) && u.FechaProduccion.Equals(fech)
                       select new { u.Producto }).FirstOrDefault();
            if (tem != null)
            {
                res = tem.Producto;
            }
            return res;
        }

        public int VerificaUbcacionExiste(int Site, int xFil, int xPas)
        {
            int res = 0;

            var tem = (from u in DBWMSMetro.SMM_Layout
                       where u.Site_Id.Equals(Site) && u.Layout_X_Fila.Equals(xFil) && u.Layout_Y_Pasillo.Equals(xPas)
                       select new { u.Layout_Id }).FirstOrDefault();
            if (tem != null)
            {
                res = tem.Layout_Id;
            }
            return res;
        }
        public bool InsertaNuevoLayout(SMM_Layout nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Layout.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;
        }
        #endregion

        #region Transferencia
        public List<SMM_VW_TransferDetail> ObtieneVWDetalleTransferencia(int transferid)
        {
            List<SMM_VW_TransferDetail> ret = new List<SMM_VW_TransferDetail>();
            try
            {
                ret = (from td in DBWMSMetro.SMM_VW_TransferDetail
                       where td.Transfer_Id.Equals(transferid)
                       select td).ToList<SMM_VW_TransferDetail>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<SMM_Transfer> ObtieneInfoTransferencia(int transferId)
        {
            List<SMM_Transfer> ret = new List<SMM_Transfer>();
            try
            {
                ret = (from t in DBWMSMetro.SMM_Transfer
                       where t.Transfer_Id.Equals(transferId)
                       select t).ToList<SMM_Transfer>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public decimal CantidadEnOC(int numDoc, string Item, string CodigoBarra )
        {
            decimal res = 0;

            var tem = (from u in Mmtro.VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA
                       where u.ItemCode.Equals(Item) && u.DocNum.Equals(numDoc) && u.CodeBars.Equals(CodigoBarra)
                       select new { u.OpenQty }).First();
            if (tem != null)
            {
                res = Convert.ToDecimal(tem.OpenQty);
            }
            return res;
        }
        public int CantidadUnidadesEnOC(int numDoc, string Item)
        {
            int res = 0;

            var tem = (from u in Mmtro.VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA_UnixCajas
                       where u.ItemCode.Equals(Item) && u.DocNum.Equals(numDoc)
                       select new { u.UnidadesTotales}).First();
            if (tem != null)
            {
                res = Convert.ToInt32(tem.UnidadesTotales);
            }
            return res;
        }


        public List<SMM_Transfer> ObtieneInfoTransferenciaSMM(int transferId)
        {
            List<SMM_Transfer> ret = new List<SMM_Transfer>();
            try
            {
                ret = (from t in DBWMSMetro.SMM_Transfer
                       where t.Transfer_Id.Equals(transferId)
                       select t).ToList<SMM_Transfer>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string ObtieneNombreCortoSitioSMM(int siteid)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Site
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

        public int TraePalletSinConfirmar(int TransferID)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Transfer_Detail
                            where s.Transfer_Id.Equals(TransferID) && s.Package_Confirm.Equals("0")
                            select new { s.Package_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Package_Id;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int CuentaDetalleTransferenciaSMM(int IdTransferencia)
        {
            int ret = 0;
            try
            {
                var temp = (from td in DBWMSMetro.SMM_Transfer_Detail
                            where td.Transfer_Id.Equals(IdTransferencia)
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
        public bool CierreTransferenciaPROCSMM(int TransferID, int? LayoutID, int StaffID)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.CVT_CierraTransferenciaSMM(TransferID, LayoutID, StaffID);
                ret = true;
            }
            catch
            {
                ret = false;
            }
            return ret;
        }

        public bool ActualizaEstadoTransferSMM(int transferid, int estado)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Transfer> queryable = from t in this.DBWMSMetro.SMM_Transfer
                                                     where t.Transfer_Id.Equals(transferid)
                                                     select t;
                foreach (SMM_Transfer td in queryable)
                {

                    td.Status = estado;
                    td.Transfer_FechaCierre = DateTime.Now;

                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public List<SMM_Transfer_Detail> ObtieneDetalleTransferenciaSMM(int transferid)
        {
            List<SMM_Transfer_Detail> ret = new List<SMM_Transfer_Detail>();
            try
            {
                ret = (from td in DBWMSMetro.SMM_Transfer_Detail
                       where td.Transfer_Id.Equals(transferid)
                       select td).ToList<SMM_Transfer_Detail>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool EliminaBultoTransferenciaSMM(int transferid, int packageid)
        {
            bool ret = false;
            try
            {
                var t = from td in DBWMSMetro.SMM_Transfer_Detail
                        where td.Package_Id.Equals(packageid) && td.Transfer_Id.Equals(transferid)
                        select td;
                foreach (var detail in t)
                {
                    DBWMSMetro.SMM_Transfer_Detail.DeleteOnSubmit(detail);
                }
                DBWMSMetro.SubmitChanges();

                IQueryable<SMM_Package> queryable = from p in this.DBWMSMetro.SMM_Package
                                                    where p.Package_Id.Equals(packageid)
                                                    select p;
                foreach (SMM_Package package in queryable)
                {
                    package.Package_ReserveQuantity = 0;
                }
                this.DBWMSMetro.SubmitChanges();


                var reserve = from r in DBWMSMetro.SMM_Reserve
                              where r.Package_Id.Equals(packageid) && r.Transfer_Id.Equals(transferid)
                              select r;
                foreach (var detail in reserve)
                {
                    DBWMSMetro.SMM_Reserve.DeleteOnSubmit(detail);
                }
                DBWMSMetro.SubmitChanges();

                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public List<CVT_VW_FiltroTransferenciasSMM> ObtieneFiltroTransferenciaSMM(int TransferId, string Producto, int NPallet, string Lote, int Posicion)
        {

            List<SMM_Transfer> transfer = new List<SMM_Transfer>();

            List<CVT_VW_FiltroTransferenciasSMM> ret = new List<CVT_VW_FiltroTransferenciasSMM>();
            try
            {
                transfer = (from t in DBWMSMetro.SMM_Transfer
                            where t.Transfer_Id.Equals(TransferId)
                            select t).ToList<SMM_Transfer>();
                foreach (var d in transfer)
                {
                    ret = (from f in DBWMSMetro.CVT_VW_FiltroTransferenciasSMM
                           where (f.Site_Id.Equals(d.Site_Id)) &&
                                 (f.Layout_Id.Equals(Posicion) || Posicion == 0) &&
                                 (f.ItemCode.Equals(Producto) || Producto == string.Empty) &&
                                 (f.Package_Lot.Equals(Lote) || Lote == string.Empty) &&
                                 (f.Package_SSCC.Equals(NPallet) || NPallet == 0)
                           select f).ToList<CVT_VW_FiltroTransferenciasSMM>();
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool AgregaBultoTransferenciaSMM(int sitioid, int packageid, int layoutid, int IdUsuario, int transferid, decimal quantity)
        {
            bool ret = false;
            string artId = string.Empty;
            string lote = string.Empty;
            decimal cantidad = 0;
            try
            {
                SMM_Transfer_Detail vTD = new SMM_Transfer_Detail();
                vTD.Transfer_Id = transferid;
                vTD.Package_Quantity = quantity;
                vTD.Status = 1;
                vTD.Site_Id = sitioid;
                vTD.Package_Id = packageid;
                vTD.Layout_Id_Actual = layoutid;
                vTD.Date = DateTime.Now;
                vTD.Package_Confirm = 0;
                DBWMSMetro.SMM_Transfer_Detail.InsertOnSubmit(vTD);
                DBWMSMetro.SubmitChanges();

                IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                    where t.Package_Id.Equals(packageid)
                                                    select t;
                foreach (SMM_Package package in queryable)
                {
                    lote = package.Package_Lot;
                    artId = package.ItemCode;
                    cantidad = Convert.ToDecimal(package.Package_Quantity);
                    package.Package_ReserveQuantity = package.Package_Quantity;

                }
                this.DBWMSMetro.SubmitChanges();

                ///
                SMM_Reserve vRE = new SMM_Reserve();
                vRE.Package_Id = packageid;
                vRE.Layout_Id = layoutid;
                vRE.ItemCode = artId;
                vRE.Lot = lote;
                vRE.Reserve_Quantity = cantidad;
                vRE.Reserve_Status = 1;
                vRE.Reserve_Date = DateTime.Now;
                vRE.IdUsuario = IdUsuario;
                vRE.Transfer_Id = transferid;

                DBWMSMetro.SMM_Reserve.InsertOnSubmit(vRE);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch (Exception er)
            {
                string error = er.Message;

            }
            return ret;
        }
        public int ObtieneEstadoTransferenciaSMM(int IdTransferencia)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBWMSMetro.SMM_Transfer
                            where t.Transfer_Id.Equals(IdTransferencia)
                            select new { t.Status }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Status);
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool DardeBajaPalletTransferenciaSMM(int idTrnasf)
        {
            bool ret = false;
            try
            {
                List<SMM_Transfer_Detail> dt = new List<SMM_Transfer_Detail>();
                dt = (from tr in DBWMSMetro.SMM_Transfer_Detail
                      where tr.Transfer_Id.Equals(idTrnasf)
                      select tr).ToList<SMM_Transfer_Detail>();
                foreach (var n in dt)
                {
                    IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                        where t.Package_Id.Equals(n.Package_Id)
                                                        select t;
                    foreach (SMM_Package package in queryable)
                    {
                        package.Package_Quantity = 0;
                        package.Package_Status = 7;
                        package.Package_OutDate = DateTime.Now;
                        package.Package_ReserveQuantity = 0;
                    }
                    this.DBWMSMetro.SubmitChanges();
                    ret = true;
                }

            }
            catch (Exception)
            {


            }
            return ret;
        }

        #endregion
        public List<SMM_Expedition> ObtieneDatosDeExpedicionRapidaSMM(int numExpRap)
        {
            List<SMM_Expedition> ret = new List<SMM_Expedition>();

            try
            {

                ret = (from fd in DBWMSMetro.SMM_Expedition
                       where fd.Expedition_Id.Equals(numExpRap)
                       select fd).ToList<SMM_Expedition>();
            }
            catch
            {
            }
            return ret;
        }

        public List<SMM_Package> ObtieneDatosDelBultoSMM(int pkg)
        {
            List<SMM_Package> ret = new List<SMM_Package>();

            try
            {
                ret = (from fd in DBWMSMetro.SMM_Package
                       where fd.Package_SSCC.Equals(pkg) && fd.Package_Status.Equals(2)
                       select fd).ToList<SMM_Package>();
            }
            catch
            {
            }
            return ret;
        }

        public int ObtieneSiteLayoutSMM(int? layoutid)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBWMSMetro.SMM_Layout
                            where l.Layout_Id.Equals(layoutid)
                            select new { l.Site_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_Id;
                }
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }

        public bool InsertaRegistroDetalleExpRapidaSMM(SMM_ExpeditionDetail nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_ExpeditionDetail.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
            }
            catch(Exception ex)
            {
                string msj = ex.Message;

            }
            return ret;
        }
        public bool EliminaBultoExpedicionRapidaSMM(string idBulto)
        {
            bool ret = false;
            try
            {
                var temp = from p in DBWMSMetro.SMM_ExpeditionDetail
                           where p.Package_SSCC == idBulto
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_ExpeditionDetail.DeleteOnSubmit(detail);
                }
                DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public List<SMM_Expedition> ObtieneDatosDeExpedicionRapida(int numExpRap)
        {
            List<SMM_Expedition> ret = new List<SMM_Expedition>();

            try
            {

                ret = (from fd in DBWMSMetro.SMM_Expedition
                       where fd.Expedition_Id.Equals(numExpRap)
                       select fd).ToList<SMM_Expedition>();
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneMotivoExpedicionSMM(int idExp)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Expedition
                            where s.Expedition_Id.Equals(idExp)
                            select new { s.Expedition_Motivo }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Expedition_Motivo);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool ActualizaEstadoExpedicionRapidaSMM(int Expeditionid, int estado/* bool sync, int confirmed*/)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Expedition> queryable = from t in this.DBWMSMetro.SMM_Expedition
                                                       where t.Expedition_Id.Equals(Expeditionid)
                                                       select t;
                foreach (SMM_Expedition td in queryable)
                {

                    td.Expedition_Status = estado;
                    td.Expedition_DateOut = DateTime.Now;

                }
                this.DBWMSMetro.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        //public int ActualizaConfirma(int PackageId, int transfer)
        //{
        //    int flag = 0;
        //    try
        //    {
        //        IQueryable<SMM_Transfer_Detail> queryable = from t in this.wmsM.SMM_Transfer_Detail
        //                                                    where t.Package_Id.Equals(PackageId) && t.Transfer_Id.Equals(transfer)
        //                                                    select t;
        //        foreach (SMM_Transfer_Detail package in queryable)
        //        {
        //            package.Package_Confirm = 1;

        //        }
        //        this.wmsM.SubmitChanges();
        //        flag = 1;
        //    }
        //    catch
        //    {
        //        flag = 0;
        //    }
        //    return flag;
        //}

        public bool DardeBajaPalletExpedicionRapidaSMM(int expd)
        {
            bool ret = false;
            try
            {
                List<SMM_ExpeditionDetail> dt = new List<SMM_ExpeditionDetail>();
                dt = (from tr in DBWMSMetro.SMM_ExpeditionDetail
                      where tr.Expedition_Id.Equals(expd)
                      select tr).ToList<SMM_ExpeditionDetail>();
                foreach (var n in dt)
                {
                    IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                        where t.Package_Id.Equals(n.Package_Id)
                                                        select t;
                    foreach (SMM_Package package in queryable)
                    {
                        //package.Package_Quantity = 0;
                        package.Package_Status = 7;
                        package.Package_OutDate = DateTime.Now;
                        package.Package_ReserveQuantity = 0;
                    }
                    this.DBWMSMetro.SubmitChanges();
                    ret = true;
                }

            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int ObtieneCantidadBultosLoteSMM(string Lote)
        {
            int ret = 0;
            try
            {
                ret = (from p in DBWMSMetro.SMM_Package
                       where p.Package_Lot.Equals(Lote) && p.Reception_Id != 0
                       select p).Count();
            }
            catch
            {
            }
            return ret;
        }

        public decimal ObtieneEnvasesStockLoteSMM(string Lote)
        {
            decimal ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_Package
                           where p.Package_Lot.Equals(Lote)
                           select p;
                ret = Convert.ToDecimal(temp.Select(c => c.Package_Quantity).Sum());
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneEnvasesProducidosLoteSMM(string Lote)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_Package
                           where p.Package_Lot.Equals(Lote)
                           select p;
                ret = Convert.ToInt32(temp.Select(c => c.Package_QuantityInitial).Sum());
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneRecepcionProductivaLoteSMM(string Lote)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBWMSMetro.SMM_Reception
                            join p in DBWMSMetro.SMM_Package on r.Reception_Id equals p.Reception_Id
                            where p.Package_Lot == (Lote) && p.Reception_Id != 0 && r.Reception_Type == 3 && r.DocType.Equals("PPR")
                            select new { p.Reception_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Reception_Id);
                }
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }
        public int AgregaRecepcionProduccionSMM(int site, int Usuario, int OF, string codprovee)
        {
            int ret = 0;
            try
            {
                SMM_Reception nueva = new SMM_Reception();
                nueva.Site_Id = site;
                nueva.CardCode = codprovee;
                nueva.IdUsuario = Usuario;
                nueva.DocType = "PPR";
                nueva.Reception_DocNumber = OF;
                nueva.Reception_DateIn = DateTime.Now;
                nueva.Reception_DateOut = DateTime.Now.AddHours(8);
                nueva.Reception_Note = "Recepcion creada automaticamente por Sistema Etiquetado";
                nueva.Reception_Status = 2;
                nueva.Reception_Type = 3;
                DBWMSMetro.SMM_Reception.InsertOnSubmit(nueva);
                DBWMSMetro.SubmitChanges();
                ret = nueva.Reception_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int AgregaBultoProduccionSMM(SMM_Package nuevo)
        {
            int ret = 0;
            try
            {

                DBWMSMetro.SMM_Package.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = nuevo.Package_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int VerificaReservaPalletSMM(string SSCC)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBWMSMetro.SMM_Package
                            where r.Package_SSCC.Equals(SSCC)
                            select new { r.Package_ReserveQuantity }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (int)temp.Package_ReserveQuantity;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }


        public List<SMM_Package> ObtieneInfoPalletSMM(string SSCC)
        {
            List<SMM_Package> ret = new List<SMM_Package>();
            try
            {
                ret = (from p in DBWMSMetro.SMM_Package
                       where p.Package_Status.Equals(2) && p.Package_OutDate.Equals(null) && p.Package_SSCC.Equals(SSCC)
                       select p).ToList<SMM_Package>();
            }
            catch
            {
            }
            return ret;
        }
        public int ObtienePackageIdSMM(string sscc)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Package
                            where p.Package_SSCC.Equals(sscc) && p.Package_Status.Equals(2)
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Package_Id;
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }

        public bool ActualizaRestaCantidadPackageSMM(int PackageId, decimal Cantidad)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                    where t.Package_Id.Equals(PackageId)
                                                    select t;
                foreach (SMM_Package package in queryable)
                {
                    decimal CantidadActual = Convert.ToDecimal(package.Package_Quantity);
                    decimal num = Cantidad;
                    package.Package_Quantity = CantidadActual - Cantidad;
                    if (CantidadActual - Cantidad == 0)
                    {
                        package.Package_Status = 7;
                        package.Package_OutDate = DateTime.Now;
                    }
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaSumaCantidadPackageSMM(int PackageId, decimal Cantidad)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                    where t.Package_Id.Equals(PackageId)
                                                    select t;
                foreach (SMM_Package package in queryable)
                {
                    decimal CantidadActual = Convert.ToDecimal(package.Package_Quantity);
                    decimal num = Cantidad;
                    package.Package_Quantity = CantidadActual + Cantidad;

                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaFechaPallet(int PackageId, DateTime fechaExp)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                    where t.Package_Id.Equals(PackageId)
                                                    select t;
                foreach (SMM_Package package in queryable)
                {

                    package.Package_ExpiresDate = fechaExp;
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool AddLocation(int PackageId, int LayoutDestinoId, int StaffId)
        {
            bool flag = false;
            DateTime now = DateTime.Now;
            try
            {
                IQueryable<SMM_Location> queryable = from t in this.DBWMSMetro.SMM_Location
                                                     where t.Package_Id.Equals(PackageId) && t.Location_OutDate.Equals(null)
                                                     select t;
                foreach (SMM_Location location in queryable)
                {

                    location.Location_OutDate = DateTime.Now;

                }
                this.DBWMSMetro.SubmitChanges();
                List<SMM_Layout> dt = ObtieneInfoLayout(LayoutDestinoId);
                foreach (var l in dt)
                {
                    SMM_Location entity = new SMM_Location
                    {

                        Site_Id = l.Site_Id,
                        Layout_Id = LayoutDestinoId,
                        Package_Id = PackageId,
                        Location_InDate = now,
                        idUsuario = new int?(StaffId)
                    };
                    this.DBWMSMetro.SMM_Location.InsertOnSubmit(entity);
                    this.DBWMSMetro.SubmitChanges();
                }
                flag = true;
            }
            catch
            {
                flag = false;
            }


            return flag;
        }

        public bool RepaletizaConDestinoSMM(string Origen, string Destino, decimal Cantidad, int username, DateTime fechExpira)
        {
            bool ret = false;
            try
            {
                List<SMM_Package> PO = ObtieneInfoPalletSMM(Origen);
                SAPSMM sp = new SAPSMM();

                foreach (var p in PO)
                {
                    if (p.Package_Quantity - Cantidad >= 0)
                    {
                        #region Transacciones
                        //Agrega PickingList
                        SMM_PickingList NPL = new SMM_PickingList();
                        NPL.Site_Id = ObtieneSiteLayoutSMM(p.Layout_Id);
                        NPL.PickingList_Date = DateTime.Now;
                        NPL.itemCode = p.ItemCode;
                        NPL.itemName = sp.ObtieneNombreProducto(p.ItemCode).ToString();
                        NPL.PickingList_Quantity = Cantidad;
                        NPL.Package_Id_Origin = p.Package_Id;
                        NPL.Package_SSCC_Origin = p.Package_SSCC;
                        NPL.Package_Id_Destiny = ObtienePackageIdSMM(Destino);
                        NPL.Package_SSCC_Destiny = Destino;
                        NPL.IdUsuario = username;                        
                        DBWMSMetro.SMM_PickingList.InsertOnSubmit(NPL);
                        DBWMSMetro.SubmitChanges();

                        // Agrega Movimientos
                        //AddMovement(ObtieneSiteLayout(p.Layout_Id), 2, Cantidad, 7, ObtieneIdStaff(username), p.Package_Quantity - Cantidad, 1, 1, p.Package_Id);
                        //Actualiza Origen
                        ActualizaRestaCantidadPackageSMM(p.Package_Id, Cantidad);
                        List<SMM_Package> PD = ObtieneInfoPalletSMM(Destino);
                        foreach (var p1 in PD)
                        {
                            //Agrega Movimiento Destino
                            //AddMovement(ObtieneSiteLayout(p.Layout_Id), 1, Cantidad, 7, ObtieneIdStaff(username), p1.Package_Quantity + Cantidad, 1, 1, p1.Package_Id);
                            //Actualiza Destino
                            ActualizaSumaCantidadPackageSMM(p1.Package_Id, Cantidad);
                            ActualizaFechaPallet(p1.Package_Id, fechExpira);
                            AddLocation(p1.Package_Id, (int)p.Layout_Id, username);
                        }



                        #endregion
                    }
                }
                ret = true;
            }
            catch (Exception)
            {

                ret = false;
            }
            return ret;
        }


        public int ClonePackage(SMM_Package PackageModelo)
        {
            int num = 0;
            try
            {
                DateTime now = DateTime.Now;
                SMM_Package entity = new SMM_Package
                {
                    Reception_Id = 0,
                    Layout_Id = PackageModelo.Layout_Id,
                    ItemCode = PackageModelo.ItemCode,
                    Package_QuantityInitial = 1,
                    Package_Quantity = 0,
                    Package_Status = PackageModelo.Package_Status,
                    Package_SSCC = CreaNewCorrelativo().ToString(),
                    Package_Lot = PackageModelo.Package_Lot,
                    Package_ProductionDate = PackageModelo.Package_ProductionDate,
                    Package_ExpiresDate = PackageModelo.Package_ExpiresDate,
                    Package_InDate = now,
                    Package_SN = PackageModelo.Package_SN,
                    Package_Data1 = (PackageModelo.Package_Data1 != null) ? PackageModelo.Package_Data1 : string.Empty,
                    Package_Data2 = (PackageModelo.Package_Data2 != null) ? PackageModelo.Package_Data2 : string.Empty,
                    UnMedida = PackageModelo.UnMedida,
                    BaseUnMed=PackageModelo.BaseUnMed,
                    UgpEntry=PackageModelo.UgpEntry,
                    UomEntry=PackageModelo.UomEntry,
                    UomCode=PackageModelo.UomCode,
                };
                DBWMSMetro.SMM_Package.InsertOnSubmit(entity);
                DBWMSMetro.SubmitChanges();
                num = Convert.ToInt32(entity.Package_SSCC);
            }
            catch (Exception exception)
            {
                num = 0;
            }
            return num;
        }
        public string RepaletizaNuevo(string Origen, decimal Cantidad, int username)
        {
            string ret = string.Empty;
            int packageNuevo = 0;
            List<SMM_Package> PO = ObtieneInfoPalletSMM(Origen);
            SAPSMM sp = new SAPSMM();
            try
            {

                foreach (var p in PO)
                {
                    if (p.Package_Quantity >= Cantidad)
                    {
                        packageNuevo = ClonePackage(p);
                        #region Transacciones
                        //Agrega PickingList
                        SMM_PickingList NPL = new SMM_PickingList();
                        NPL.Site_Id = ObtieneSiteLayoutSMM(p.Layout_Id);
                        NPL.PickingList_Date = DateTime.Now;
                        NPL.itemCode = p.ItemCode;
                        NPL.itemName = sp.ObtieneNombreProducto(p.ItemCode).ToString();
                        NPL.PickingList_Quantity = Cantidad;
                        NPL.Package_Id_Origin = p.Package_Id;
                        NPL.Package_SSCC_Origin = p.Package_SSCC;
                        NPL.Package_Id_Destiny = ObtienePackageIdSMM(packageNuevo.ToString());
                        NPL.Package_SSCC_Destiny = packageNuevo.ToString();
                        NPL.IdUsuario = username;
                        DBWMSMetro.SMM_PickingList.InsertOnSubmit(NPL);
                        DBWMSMetro.SubmitChanges();

                        // Agrega Movimientos
                        //AddMovement(ObtieneSiteLayout(p.Layout_Id), 2, Cantidad, 7, ObtieneIdStaff(username), p.Package_Quantity - Cantidad, 1, 1, p.Package_Id);
                        //Actualiza Origen
                        ActualizaRestaCantidadPackageSMM(p.Package_Id, Cantidad);
                        List<SMM_Package> PD = ObtieneInfoPalletSMM(packageNuevo.ToString());
                        foreach (var p1 in PD)
                        {
                            //Agrega Movimiento Destino
                            //AddMovement(ObtieneSiteLayout(p.Layout_Id), 1, Cantidad, 7, ObtieneIdStaff(username), p1.Package_Quantity + Cantidad, 1, 1, p1.Package_Id);
                            //Actualiza Destino
                            ActualizaSumaCantidadPackageSMM(p1.Package_Id, Cantidad);
                            AddLocation(p1.Package_Id, (int)p.Layout_Id, username);
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


        public DataTable SP_InformeInventario(int folio)

        {
            DataTable ret = new DataTable();
            try
            {
                DBWMSMetro.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBWMSMetro.SMM_Informeinventario(folio));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int CreaNuevoDetalleCotizacion(SMM_Cotizacion_Cajas_Detalle Coti)
        {
            int ret = 0;
            try
            {

                DBWMSMetro.SMM_Cotizacion_Cajas_Detalle.InsertOnSubmit(Coti);
                DBWMSMetro.SubmitChanges();
                ret = Coti.Id_Det_Cotizacion;
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public int CreaNuevaCotizacion(SMM_Cotizacion_Cajas CotiN)
        {
            int ret = 0;
            try
            {

                DBWMSMetro.SMM_Cotizacion_Cajas.InsertOnSubmit(CotiN);
                DBWMSMetro.SubmitChanges();
                ret = CotiN.Cotizacion_Id;
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public bool ActualizaCotizacion(int idCotizacion, SMM_Cotizacion_Cajas vEditado)
        {
            bool ret = false;
            try
            {
                var t = from a in DBWMSMetro.SMM_Cotizacion_Cajas
                        where a.Cotizacion_Id.Equals(idCotizacion)
                        select a;
                foreach (var r in t)
                {
                    r.FormaDePago = vEditado.FormaDePago;
                    r.PrecioVenta = vEditado.PrecioVenta;

                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBWMSMetro.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool ActualizaEstadoCotizacion(int idCotizacion, int status)
        {
            bool ret = false;
            try
            {
                var t = from a in DBWMSMetro.SMM_Cotizacion_Cajas
                        where a.Cotizacion_Id.Equals(idCotizacion)
                        select a;
                foreach (var r in t)
                {
                    r.Estado =status;                

                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBWMSMetro.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int CreaDireccionCotizacion(SMM_Cotizacion_Cajas_Direccion Direc)
        {
            int ret = 0;
            try
            {

                DBWMSMetro.SMM_Cotizacion_Cajas_Direccion.InsertOnSubmit(Direc);
                DBWMSMetro.SubmitChanges();
                ret = Direc.Id_Direccion_Coti;
            }
            catch (Exception ex)
            {

            }
            return ret;
        }
        public void EliminaCotizacion(int Cotizacion)
        {

            var el = (from r in DBWMSMetro.SMM_Cotizacion_Cajas
                      where r.Cotizacion_Id.Equals(Cotizacion)
                      select r).FirstOrDefault();

            if (el != null)
            {
                DBWMSMetro.SMM_Cotizacion_Cajas.DeleteOnSubmit(el);
                DBWMSMetro.SubmitChanges();

            }
        }
        public int TraeEstadoCotizacion(int Cotizacion)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBWMSMetro.SMM_Cotizacion_Cajas
                            where r.Cotizacion_Id.Equals(Cotizacion)
                            select new { r.Estado }).FirstOrDefault();
                if (temp != null)
                {
                    ret =Convert.ToInt32(temp.Estado);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public void EliminaDirecciones(int Cotizacion)
        {

            var el = (from r in DBWMSMetro.SMM_Cotizacion_Cajas_Direccion
                      where r.Id_Cotizacion.Equals(Cotizacion)
                      select r).FirstOrDefault();

            if (el != null)
            {
                DBWMSMetro.SMM_Cotizacion_Cajas_Direccion.DeleteOnSubmit(el);
                DBWMSMetro.SubmitChanges();

            }
        }

        public int ObtieneDireccionFac(int idCoti)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Cotizacion_Cajas_Direccion
                            where p.Id_Cotizacion.Equals(idCoti) && p.TipoDireccion.Equals("F")
                            select new { p.Id_Direccion_Coti }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Id_Direccion_Coti;
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }
        public string ObtieneTipoPago(int idCoti)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Cotizacion_Cajas
                            where p.Cotizacion_Id.Equals(idCoti)
                            select new { p.FormaDePago }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.FormaDePago.ToString();
                }
            }
                  
            catch (Exception)
            {

                ret = "";
            }
            return ret;
        }
        public int ObtienePrecioVenta(int idCoti)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Cotizacion_Cajas
                            where p.Cotizacion_Id.Equals(idCoti)
                            select new { p.PrecioVenta }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.PrecioVenta);
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }
        public bool AgregaProdOrdenVenta(SMM_Orden_de_Ventas_Detalle nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Orden_de_Ventas_Detalle.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }

        public bool AgregaOrdenVenta(SMM_Orden_de_Ventas nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Orden_de_Ventas.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }

        public bool RegistraCliente(SMM_Clientes_Orden_Venta nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Clientes_Orden_Venta.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }

        public string VerificaClinte(string rut)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBWMSMetro.SMM_Clientes_Orden_Venta
                            where p.RutCliente.Equals(rut)
                            select new { p.RutCliente }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.RutCliente);
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaLayoutPackage(int PackageId, int layoutid)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                    where t.Package_Id.Equals(PackageId)
                                                    select t;
                foreach (SMM_Package package in queryable)
                {
                    package.Layout_Id = layoutid;

                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public DataTable SP_OrdenTotales(int idOrden)

        {
            DataTable ret = new DataTable();
            try
            {
                DBWMSMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBWMSMetro.SP_ResumenOV(idOrden));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public List<SMM_MAIL_USUARIOS_MAYORISTA> TraeMailUsuarios()
        {
            List<SMM_MAIL_USUARIOS_MAYORISTA> ret = new List<SMM_MAIL_USUARIOS_MAYORISTA>();
            try
            {
                ret = (from ce in DBDesaint.SMM_MAIL_USUARIOS_MAYORISTA
                       select ce).ToList<SMM_MAIL_USUARIOS_MAYORISTA>();
            }
            catch
            {

            }
            return ret;
        }

        public List<VW_LISTA_MATERIALES_CAJAS_TIPO> ListaMaterialesCaja(string CdCaja)
        {
            List<VW_LISTA_MATERIALES_CAJAS_TIPO> ret = new List<VW_LISTA_MATERIALES_CAJAS_TIPO>();
            try
            {
                ret = (from ce in Mmtro.VW_LISTA_MATERIALES_CAJAS_TIPO
                       where ce.CodProductoPadre.Equals(CdCaja)
                       select ce).ToList<VW_LISTA_MATERIALES_CAJAS_TIPO>();
            }
            catch
            {

            }
            return ret;
        }

        public List<VW_LISTADO_PRODUCTOS_SOLICITUD> ListaSolicitud(int idsoli)
        {
            List<VW_LISTADO_PRODUCTOS_SOLICITUD> ret = new List<VW_LISTADO_PRODUCTOS_SOLICITUD>();
            try
            {
                ret = (from ce in DBWMSMetro.VW_LISTADO_PRODUCTOS_SOLICITUD
                       where ce.Id_Solicitud.Equals(idsoli)
                       select ce).ToList<VW_LISTADO_PRODUCTOS_SOLICITUD>();
            }
            catch
            {

            }
            return ret;
        }

        public bool actualizaEstadoSolicitud(int soliId, int Estado)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Solicitud_Transferencia> queryable = from t in this.DBWMSMetro.SMM_Solicitud_Transferencia
                                                                    where t.Id_Solicitud.Equals(soliId)
                                                                    select t;
                foreach (SMM_Solicitud_Transferencia package in queryable)
                {
                    package.Estado = Estado;

                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public List<SMM_Transfer> ObtieneDatosCabTransfer(int idTransfer)
        {
            List<SMM_Transfer> ret = new List<SMM_Transfer>();
            try
            {
                ret = (from ce in DBWMSMetro.SMM_Transfer
                       where ce.Transfer_Id.Equals(idTransfer)
                       select ce).ToList<SMM_Transfer>();
            }
            catch
            {

            }
            return ret;
        }


        public bool CambiaEstadoTransferencia(int transferid, int estado)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Transfer> queryable = from t in this.DBWMSMetro.SMM_Transfer
                                                     where t.Transfer_Id.Equals(transferid)
                                                     select t;
                foreach (SMM_Transfer td in queryable)
                {

                    td.Status = estado;
                    flag = true;
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public List<SMM_Solicitud_Transferencia> ListaSolicitudTransferencia(int idsoli)
        {
            List<SMM_Solicitud_Transferencia> ret = new List<SMM_Solicitud_Transferencia>();
            try
            {
                ret = (from ce in DBWMSMetro.SMM_Solicitud_Transferencia
                       where ce.Id_Solicitud.Equals(idsoli)
                       select ce).ToList<SMM_Solicitud_Transferencia>();
            }
            catch
            {

            }
            return ret;
        }


        public string ObtienenombreProducto(string CodPro)
        {
            string ret = "";
            try
            {
                var temp = (from p in Mmtro.MMetro_OITM
                            where p.ItemCode.Equals(CodPro)
                            select new { p.ItemName }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.ItemName);
            }
            catch (Exception)
            {


            }
            return ret;
        }


        public bool ActualizaPallet(int npall, string loteInt, string loteProv, DateTime fechPro, DateTime fechVen)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                    where t.Package_SSCC.Equals(npall)
                                                    select t;
                foreach (SMM_Package td in queryable)
                {

                    td.Package_Lot = loteInt;
                    td.Package_Data1 = loteProv;
                    td.Package_ProductionDate = fechPro;
                    td.Package_ExpiresDate = fechVen;
                    flag = true;
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool InsertaStockTabla(SMM_StockFecha nn)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_StockFecha.InsertOnSubmit(nn);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch
            {
            }
            return ret;
        }

        public bool ActualizaTablaStock(int bodega, string codProducto, DateTime fech, decimal cantidad)
        {
            bool ret = false;
            try
            {
                IQueryable<SMM_StockFecha> queryable = from p in this.DBWMSMetro.SMM_StockFecha
                                                       where p.Bodega.Equals(bodega) && p.Producto.Equals(codProducto) && p.FechaProduccion.Equals(fech)
                                                       select p;
                foreach (SMM_StockFecha stock in queryable)
                {
                    stock.Cantidad = stock.Cantidad + cantidad;
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public bool ActualizaRestaTablaStock(int bodega, string codProducto, DateTime fech, decimal cantidad)
        {
            bool ret = false;
            try
            {
                IQueryable<SMM_StockFecha> queryable = from p in this.DBWMSMetro.SMM_StockFecha
                                                       where p.Bodega.Equals(bodega) && p.Producto.Equals(codProducto) && p.FechaProduccion.Equals(fech)
                                                       select p;
                foreach (SMM_StockFecha stock in queryable)
                {
                    stock.Cantidad = stock.Cantidad - cantidad;
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }


        public List<VW_STOCK_FECHA_TRANSFERENCIA> ObtieneDetosStockTransferencia(int transferID)
        {
            List<VW_STOCK_FECHA_TRANSFERENCIA> ret = new List<VW_STOCK_FECHA_TRANSFERENCIA>();
            try
            {
                ret = (from r in DBWMSMetro.VW_STOCK_FECHA_TRANSFERENCIA
                       where r.Transfer_Id.Equals(transferID)
                       select r).ToList<VW_STOCK_FECHA_TRANSFERENCIA>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }

        public List<SMM_VW_DATO_PROD_RECEPCION> ObtieneDetosProdRecepcion(string itemcode,string codBar)
        {
            List<SMM_VW_DATO_PROD_RECEPCION> ret = new List<SMM_VW_DATO_PROD_RECEPCION>();
            try
            {
                ret = (from r in Mmtro.SMM_VW_DATO_PROD_RECEPCION
                       where r.ItemCode.Equals(itemcode)&& r.BcdCode.Equals(codBar)
                       select r).ToList<SMM_VW_DATO_PROD_RECEPCION>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }
        //public int UMedidaRecepcion(string itemcode, string codBar)
        //{
        //    //List<SMM_VW_DATO_PROD_RECEPCION> ret = new List<SMM_VW_DATO_PROD_RECEPCION>();

        //    int ret = 0;
        //    try
        //    {
        //        ret = (from r in Mmtro.SMM_VW_DATO_PROD_RECEPCION
        //               where r.ItemCode.Equals(itemcode) && r.BcdCode.Equals(codBar)
        //               select new { r.UomEntry}).FirstOrDefault();

        //        if (temp != null)
        //            ret = Convert.ToInt32(temp.DiasAcep);
        //    }
        //    catch (Exception ex)
        //    {
        //        string a = ex.Message.ToString();
        //    }
        //    return ret;
        //}

        public int UMedidaRecepcion(string itemcode, string codBar)
        {
            int ret = 0;
            try
            {
                var temp = (from p in Mmtro.SMM_VW_DATO_PROD_RECEPCION
                            where p.ItemCode.Equals(itemcode) && p.BcdCode.Equals(codBar)
                            select new { p.UomEntry }).FirstOrDefault();
                if (temp != null)
                    ret = temp.UomEntry;
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }
        public List<VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA> ObtieneDetosProdRecepcionxCompra(string itemcode, string codBar)
        {
            List<VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA> ret = new List<VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA>();
            try
            {
                ret = (from r in Mmtro.VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA
                       where r.ItemCode.Equals(itemcode) && r.CodeBars.Equals(codBar)
                       select r).ToList<VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }

        public bool ActualizaPKGTransformacion(int SSCC, int Cant,string CodBarr,string UMed,int Bumed,int ugp,int uom,string uomCod)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Package> queryable = from t in this.DBWMSMetro.SMM_Package
                                                    where t.Package_SSCC.Equals(SSCC)
                                                    select t;
                foreach (SMM_Package package in queryable)
                {

                    package.Package_QuantityInitial = Cant;
                    package.Package_Quantity = Cant;
                    package.Package_SN = CodBarr;
                    package.UnMedida = UMed;
                    package.BaseUnMed = Bumed;
                    package.UgpEntry = ugp;
                    package.UomEntry = uom;
                    package.UomCode = uomCod;
                }
               this.DBWMSMetro.SubmitChanges();

                flag = true;

            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public List<SMM_VW_DATO_PROD_RECEPCION> ObtieneDetosProdRecSAP(string itemcode, string codBar,int uomEntr)
        {
            List<SMM_VW_DATO_PROD_RECEPCION> ret = new List<SMM_VW_DATO_PROD_RECEPCION>();
            try
            {
                ret = (from r in Mmtro.SMM_VW_DATO_PROD_RECEPCION
                       where r.ItemCode.Equals(itemcode) && r.BcdCode.Equals(codBar) && r.UomEntry.Equals(uomEntr)
                       select r).ToList<SMM_VW_DATO_PROD_RECEPCION>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }

        public int diasUtil(string codp)
        {
            int ret = 0;
            try
            {
                var temp = (from p in Mmtro.VW_DIAS_VIDA_UTIL
                            where p.CodProducto.Equals(codp) 
                            select new { p.DiasAcep }).FirstOrDefault();
                if (temp != null)
                    ret =Convert.ToInt32(temp.DiasAcep);
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }
        public int diasUtilesEfec(string codp)
        {
            int ret = 0;
            try
            {
                var temp = (from p in Mmtro.VW_DIAS_VIDA_UTIL
                            where p.CodProducto.Equals(codp)
                            select new { p.Dias }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Dias);
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }

        public bool AgregaProdListaCaja(SMM_Cotizacion_Cajas_Detalle nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Cotizacion_Cajas_Detalle.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;
            }
            catch(Exception ex)
            {

                string g = ex.Message.ToString();
            }
            return ret;
        }

        public List<SMM_Ajuste_Documento_Electronico> ObtieneDetosAjusteDocElectronico(int IdPrev)
        {
            List<SMM_Ajuste_Documento_Electronico> ret = new List<SMM_Ajuste_Documento_Electronico>();
            try
            {
                ret = (from r in Mmtro.SMM_Ajuste_Documento_Electronico
                       where r.Preventa_ID.Equals(IdPrev)
                       select r).ToList<SMM_Ajuste_Documento_Electronico>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }
        public int InsertaNuevoComisionProd(SMM_ComisionProductos nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_ComisionProductos.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = 1;
            }
            catch
            {
                return ret;

            }
            return ret;
        }
        public List<VW_SMM_ComisionProductos> ObtieneDatosProdComi(string CodPro)
        {
            List<VW_SMM_ComisionProductos> ret = new List<VW_SMM_ComisionProductos>();
            try
            {
                ret = (from r in Mmtro.VW_SMM_ComisionProductos
                       where r.ItemCode.Equals(CodPro)
                       select r).ToList<VW_SMM_ComisionProductos>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }
        public List<SMM_ComisionProductos> verificaRegistroComi(string CodPro)
        {
            List<SMM_ComisionProductos> ret = new List<SMM_ComisionProductos>();
            try
            {
                ret = (from r in DBWMSMetro.SMM_ComisionProductos
                       where r.CodProducto.Equals(CodPro)
                       select r).ToList<SMM_ComisionProductos>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }

        public bool ActualizaEstadoRegimp(int idRegImp)
        {
            bool ret = false;
            try
            {
                IQueryable<SMM_RegImpEtiqueta> queryable = from p in this.DBWMSMetro.SMM_RegImpEtiqueta
                                                           where p.IdRegImpEtiq.Equals(idRegImp)
                                                      select p;
                foreach (SMM_RegImpEtiqueta reg in queryable)
                {
                    reg.Estado = 2;
                  
                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public bool ActualizaEstadoEtiquetaSala(int idRegImp)
        {
            bool ret = false;
            try
            {
                IQueryable<SMM_RegPalletSala> queryable = from p in this.DBWMSMetro.SMM_RegPalletSala
                                                          where p.IdRegPallet.Equals(idRegImp)
                                                           select p;
                foreach (SMM_RegPalletSala reg in queryable)
                {
                    reg.Estado = 2;

                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public List<SMM_RegImpEtiqueta> ListImpEtiq()
        {
            List<SMM_RegImpEtiqueta> ret = new List<SMM_RegImpEtiqueta>();
            try
            {
                ret = (from r in DBWMSMetro.SMM_RegImpEtiqueta
                       where r.Estado.Equals(1)
                       select r).ToList<SMM_RegImpEtiqueta>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }

    }
}
