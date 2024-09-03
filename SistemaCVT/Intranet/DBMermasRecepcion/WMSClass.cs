using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class WMSClass : IDisposable
    {
        public WMSClass()
        {
        }
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        private bool disposed;
        public List<Reception> ObtieneReceptionPorId(int ID)
        {
            List<Reception> ret = new List<Reception>();
            ret = (from r in DBDatos.Reception
                   where r.Reception_Id.Equals(ID) && r.Reception_Status.Equals(1)
                   select r).ToList<Reception>();
            return ret;
        }
        public void Dispose()
        {
            this.Dispose(true);
            GC.SuppressFinalize(this);
        }
        public void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    this.DBDatos.Dispose();
                }
                this.disposed = true;
            }
        }

        public bool ActualizaEncRecepcion(int ID, string Proveedor, int OC, int NumDoc)
        {
            bool ret = false;
            try
            {
                var query = from r in DBDatos.Reception
                            where r.Reception_Id.Equals(ID)
                            select r;
                foreach (var t in query)
                {
                    t.Business_Partner_Provider = Proveedor;
                    t.Reception_U_NumDocSAP = OC;
                    if (t.Reception_DocNumber != NumDoc)
                    {
                        t.Reception_DocNumber = NumDoc;
                        var det = from p in DBDatos.Package
                                  where p.Reception_Id.Equals(ID)
                                  select p;
                        foreach (var p in det)
                        {
                            p.Package_Barcode = NumDoc.ToString();
                        }

                    }

                }
                DBDatos.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public List<Package> ObtieneInfoPallet(string SSCC)
        {
            List<Package> ret = new List<Package>();
            try
            {
                ret = (from p in DBDatos.Package
                       where (p.Package_Status.Equals(3) || p.Package_Status.Equals(2) || p.Package_Status.Equals(1)) && p.Package_OutDate.Equals(null) && p.Package_SSCC.Equals(SSCC)
                       select p).ToList<Package>();
            }
            catch
            {
            }
            return ret;
        }
        public List<Package> ObtieneInfoPalletPosicionamiento(string SSCC)
        {
            List<Package> ret = new List<Package>();
            try
            {
                ret = (from p in DBDatos.Package
                       where (p.Package_Status.Equals(2) || p.Package_Status.Equals(3)) && p.Package_OutDate.Equals(null) && p.Package_SSCC.Equals(SSCC)
                       select p).ToList<Package>();
            }
            catch
            {
            }
            return ret;
        }
        public List<Package> ObtieneInfoPallet(int Pkid)
        {
            List<Package> ret = new List<Package>();
            try
            {
                ret = (from p in DBDatos.Package
                       where p.Package_Status.Equals(3) && p.Package_OutDate.Equals(null) && p.Package_Id.Equals(Pkid)
                       select p).ToList<Package>();
            }
            catch
            {
            }
            return ret;
        }
        public List<Package> ObtieneInfoPalletCE(int Pkid)
        {
            List<Package> ret = new List<Package>();
            try
            {
                ret = (from p in DBDatos.Package
                       where p.Package_Id.Equals(Pkid)
                       select p).ToList<Package>();
            }
            catch
            {
            }
            return ret;
        }
        public List<ArticleProvider> ObtieneInfoProducto(int ID)
        {
            List<ArticleProvider> ret = new List<ArticleProvider>();
            ret = (from r in DBDatos.ArticleProvider
                   where r.ArticleProvider_Id.Equals(ID)
                   select r).ToList<ArticleProvider>();
            return ret;
        }
        public List<Transfer> ObtieneInfoTransferencia(int transferId)
        {
            List<Transfer> ret = new List<Transfer>();
            try
            {
                ret = (from t in DBDatos.Transfer
                       where t.Transfer_Id.Equals(transferId)
                       select t).ToList<Transfer>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<Order> ObtieneInfoPedido(int OrderId)
        {
            List<Order> ret = new List<Order>();
            try
            {
                ret = (from t in DBDatos.Order
                       where t.Order_Id.Equals(OrderId)
                       select t).ToList<Order>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<Layout> ObtieneInfoLayout(int layoutid)
        {
            List<Layout> ret = new List<Layout>();
            try
            {
                ret = (from t in DBDatos.Layout
                       where t.Layout_Id.Equals(layoutid)
                       select t).ToList<Layout>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string ObtieneNombreCortoSitio(int siteid)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from s in DBDatos.Site
                            where s.Site_Id.Equals(siteid)
                            select new { s.Site_ShortDescription }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_ShortDescription;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int ObtieneSitioByNombreCorto(string sitesd)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Site
                            where s.Site_ShortDescription.Equals(sitesd)
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
        public int ObtieneIdStaff(string username)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Staff
                            where s.Staff_UserName.Equals(username)
                            select new { s.Staff_Id }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Staff_Id;
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }
        public int ObtieneIdStaffTransfer(int idtrans)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Transfer
                            where s.Transfer_Id.Equals(idtrans)
                            select new { s.Staff_Id }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Staff_Id;
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }
        public int ObtieneSitioDestino(int idtrans)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Transfer
                            where s.Transfer_Id.Equals(idtrans)
                            select new { s.Site_Id_Destiny }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Site_Id_Destiny;
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }

        public int ObtieneSiteLayout(int? layoutid)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDatos.Layout
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
        public int ObtieneSiteRecepcion(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDatos.Reception
                            where l.Reception_Id.Equals(recepid)
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
        public string ObtieneCodProduct(int APid)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from ap in DBDatos.ArticleProvider
                            where ap.ArticleProvider_Id.Equals(APid)
                            select new { ap.ArticleProvider_CodClient }).FirstOrDefault();
                if (temp != null)
                    ret = temp.ArticleProvider_CodClient;
            }
            catch (Exception)
            {
                ret = string.Empty;

            }
            return ret;
        }
        public int ObtieneIdProduct(string CodProducto)
        {
            int ret = 0;
            try
            {
                var temp = (from ap in DBDatos.ArticleProvider
                            where ap.ArticleProvider_CodClient.Equals(CodProducto)
                            select new { ap.ArticleProvider_Id }).FirstOrDefault();
                if (temp != null)
                    ret = temp.ArticleProvider_Id;
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }
        public int ObtieneDiasVencimiento(string CodProduct)
        {
            int ret = 0;
            try
            {
                var temp = (from ap in DBDatos.ArticleProvider
                            where ap.ArticleProvider_CodClient.Equals(CodProduct)
                            select new { ap.ArticleProvider_ExpiryTime }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.ArticleProvider_ExpiryTime);
                }
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }
        public int ObtienePackageId(string sscc)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Package
                            where p.Package_SSCC.Equals(sscc) && p.Package_Status.Equals(3)
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
        public int ObtienePackageIdPosicionamiento(string sscc)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Package
                            where p.Package_SSCC.Equals(sscc) && (p.Package_Status.Equals(3) || p.Package_Status.Equals(2))
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
        public int ObtieneMaxIdMovement(int pkId)
        {
            int ret = 0;
            try
            {
                var temp = (from m in DBDatos.Movement
                            where m.Package_Id.Equals(pkId)
                            orderby m.Movement_Id descending
                            select new { m.Movement_Id }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Movement_Id;


            }
            catch (Exception)
            {
                ret = 0;
            }
            return ret;
        }
        public bool ActualizaMovementDate(int Movement_Id, int packageId)
        {
            DateTime now = DateTime.Now;
            try
            {
                IQueryable<Movement> queryable = from t in this.DBDatos.Movement
                                                 where ((t.Package_Id.Equals(packageId)) && (t.Movement_Id != Movement_Id)) && t.Movement_OutDate.Equals(null)
                                                 select t;
                if (queryable != null)
                {
                    foreach (Movement movement in queryable)
                    {
                        movement.Movement_OutDate = new DateTime?(now);
                    }
                }
                this.DBDatos.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool AddMovement(int Site_Id, int MovementType, int Quantity, int EntityId, int StaffId, int NewSaldo, decimal NewNet, decimal NewGross, int PackageId)
        {
            DateTime now = DateTime.Now;
            bool flag = false;
            int num = 0;
            try
            {
                Movement entity = new Movement
                {
                    Site_Id = Site_Id,
                    Company_Id = 1,
                    Entity_Id = EntityId,
                    Staff_Id = StaffId,
                    Package_Id = PackageId,
                    Movement_InDate = now,
                    Movement_Value = new int?(Quantity),
                    MoveType_Id = MovementType,
                    Movement_NewNetWeight = new decimal?(NewNet),
                    Movement_NewQuantity = new int?(NewSaldo),
                    Movement_NewGrossWeight = new decimal?(NewGross)
                };
                this.DBDatos.Movement.InsertOnSubmit(entity);
                this.DBDatos.SubmitChanges();
                num = entity.Movement_Id;
                flag = true;
            }
            catch
            {
                flag = false;
            }
            if (flag)
            {
                this.ActualizaMovementDate(num, PackageId);
            }
            return flag;
        }
        public bool ActualizaRestaCantidadPackage(int PackageId, int Cantidad)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(PackageId)
                                                select t;
                foreach (Package package in queryable)
                {
                    int CantidadActual = package.Package_Quantity;
                    int num = Cantidad;
                    package.Package_Quantity = CantidadActual - Cantidad;
                    if (CantidadActual - Cantidad == 0)
                    {
                        package.Package_Status = 7;
                        package.Package_OutDate = DateTime.Now;
                    }
                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool DardeBajaPalletTransformacion(int TransformacionId)
        {
            bool ret = false;
            try
            {
                List<CVT_TransformacionDetalle> dt = new List<CVT_TransformacionDetalle>();
                dt = (from tr in DBDesaint.CVT_TransformacionDetalle
                      where tr.Transformacion_Id.Equals(TransformacionId)
                      select tr).ToList<CVT_TransformacionDetalle>();
                foreach (var n in dt)
                {
                    IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                    where t.Package_Id.Equals(n.Package_Id)
                                                    select t;
                    foreach (Package package in queryable)
                    {
                        package.Package_Quantity = 0;
                        package.Package_Status = 7;
                        package.Package_OutDate = DateTime.Now;
                    }
                    this.DBDatos.SubmitChanges();
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool DardeBajaPallet(int PackageId)
        {
            bool ret = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(PackageId)
                                                select t;
                foreach (Package package in queryable)
                {
                    package.Package_Quantity = 0;
                    package.Package_Status = 7;
                    package.Package_OutDate = DateTime.Now;
                }
                this.DBDatos.SubmitChanges();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool ActualizaSumaCantidadPackage(int PackageId, int Cantidad)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(PackageId)
                                                select t;
                foreach (Package package in queryable)
                {
                    int CantidadActual = package.Package_Quantity;
                    int num = Cantidad;
                    package.Package_Quantity = CantidadActual + Cantidad;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public int getNewCorrelativo(int SiteID)
        {
            int num = 0;
            try
            {
                Correlative correlative = (from c in this.DBDatos.Correlative
                                           where (c.Company_Id.Equals(1) && c.Site_Id.Equals(SiteID)) && c.Correlative_Id.Equals(6)
                                           select c).FirstOrDefault<Correlative>();
                if (correlative == null)
                {
                    return num;
                }
                int? nullable = correlative.Correlative_Now + 1;
                int? nullable2 = correlative.Correlative_Out;

                correlative.Correlative_Now = nullable;
                this.DBDatos.SubmitChanges();
                num = correlative.Correlative_Now.Value;


            }
            catch
            {
            }

            return num;
        }
        public int ClonePackage(Package PackageModelo)
        {
            int num = 0;
            try
            {
                DateTime now = DateTime.Now;
                Package entity = new Package
                {
                    Company_Id = PackageModelo.Company_Id,
                    Accounts_Id = PackageModelo.Accounts_Id,
                    ArticleProvider_Id = PackageModelo.ArticleProvider_Id,
                    ArticleProvider_GrossWeight = PackageModelo.ArticleProvider_GrossWeight,
                    EntryType = 2,
                    Layout_Id = PackageModelo.Layout_Id,
                    Package_SSCC = getNewCorrelativo(ObtieneSiteLayout(PackageModelo.Layout_Id)).ToString(),
                    Package_SSCCParent = PackageModelo.Package_SSCCParent,
                    Package_Barcode = PackageModelo.Package_Barcode,
                    Package_QuantityInitial = 1,
                    Package_Quantity = 0,
                    Package_NetWeightInitial = new decimal?(PackageModelo.ArticleProvider_GrossWeight),
                    Package_NetWeight = 0,
                    Package_GrossWeightInitial = new decimal?(1),
                    Package_GrossWeight = new decimal?(1),
                    Package_Height = PackageModelo.Package_Height,
                    Package_Status = PackageModelo.Package_Status,
                    Package_QualityStatus = PackageModelo.Package_QualityStatus,
                    Package_Lot = PackageModelo.Package_Lot,
                    Package_Mixed = PackageModelo.Package_Mixed,
                    Package_Owner = PackageModelo.Package_Owner,
                    Package_InDate = now,
                    Package_SN = PackageModelo.Package_SN,
                    Package_PN = PackageModelo.Package_PN,
                    Package_ProductionDate = PackageModelo.Package_ProductionDate,
                    Package_ExpiresDate = PackageModelo.Package_ExpiresDate,
                    PackageState_Id = PackageModelo.PackageState_Id,
                    Package_Origin = PackageModelo.Package_Origin,
                    Package_Destination = PackageModelo.Package_Destination,
                    Reception_Id = 0,
                    Supportive_Id = PackageModelo.Supportive_Id,
                    Package_CrossDocking = PackageModelo.Package_CrossDocking,
                    Package_Data1 = (PackageModelo.Package_Data1 != null) ? PackageModelo.Package_Data1 : string.Empty,
                    Package_Data2 = (PackageModelo.Package_Data2 != null) ? PackageModelo.Package_Data2 : string.Empty,
                    PackageState_Id_Initial = PackageModelo.PackageState_Id
                };
                DBDatos.Package.InsertOnSubmit(entity);
                DBDatos.SubmitChanges();
                num = Convert.ToInt32(entity.Package_SSCC);
            }
            catch (Exception exception)
            {
                num = 0;
            }
            return num;
        }
        public bool RepaletizaConDestino(string Origen, string Destino, int Cantidad, string username)
        {
            bool ret = false;
            try
            {
                List<Package> PO = ObtieneInfoPallet(Origen);

                foreach (var p in PO)
                {
                    if (p.Package_Quantity - Cantidad >= 0)
                    {
                        #region Transacciones
                        //Agrega PickingList
                        PickingList NPL = new PickingList();
                        NPL.Company_Id = p.Company_Id;
                        NPL.Site_Id = ObtieneSiteLayout(p.Layout_Id);
                        NPL.PickingList_Date = DateTime.Now;
                        NPL.Order_Type = 0;
                        NPL.Order_Id = 0;
                        NPL.PickingList_ProductCode = ObtieneCodProduct(p.ArticleProvider_Id);
                        NPL.ArticleProvider_Id = p.ArticleProvider_Id;
                        NPL.MeasurementUnit_Id = 1;
                        NPL.PickingList_Quantity = Cantidad;
                        NPL.Package_Id_Origin = p.Package_Id;
                        NPL.Package_SSCC_Origin = p.Package_SSCC;
                        NPL.Package_Id_Destiny = ObtienePackageId(Destino);
                        NPL.Package_SSCC_Destiny = Destino;
                        NPL.PickingList_Level = 1;
                        NPL.Staff_Id = ObtieneIdStaff(username);
                        DBDatos.PickingList.InsertOnSubmit(NPL);
                        DBDatos.SubmitChanges();

                        // Agrega Movimientos
                        AddMovement(ObtieneSiteLayout(p.Layout_Id), 2, Cantidad, 7, ObtieneIdStaff(username), p.Package_Quantity - Cantidad, 1, 1, p.Package_Id);
                        //Actualiza Origen
                        ActualizaRestaCantidadPackage(p.Package_Id, Cantidad);
                        List<Package> PD = ObtieneInfoPallet(Destino);
                        foreach (var p1 in PD)
                        {
                            //Agrega Movimiento Destino
                            AddMovement(ObtieneSiteLayout(p.Layout_Id), 1, Cantidad, 7, ObtieneIdStaff(username), p1.Package_Quantity + Cantidad, 1, 1, p1.Package_Id);
                            //Actualiza Destino
                            ActualizaSumaCantidadPackage(p1.Package_Id, Cantidad);
                            AddLocation(p1.Package_Id, (int)p.Layout_Id, ObtieneIdStaff(username));
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
        public int VerificaReservaPallet(string SSCC)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Package
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
        public string RepaletizaNuevo(string Origen, int Cantidad, string username)
        {
            string ret = string.Empty;
            int packageNuevo = 0;
            List<Package> PO = ObtieneInfoPallet(Origen);
            try
            {

                foreach (var p in PO)
                {
                    if (p.Package_Quantity >= Cantidad)
                    {
                        packageNuevo = ClonePackage(p);
                        #region Transacciones
                        //Agrega PickingList
                        PickingList NPL = new PickingList();
                        NPL.Company_Id = p.Company_Id;
                        NPL.Site_Id = ObtieneSiteLayout(p.Layout_Id);
                        NPL.PickingList_Date = DateTime.Now;
                        NPL.Order_Type = 0;
                        NPL.Order_Id = 0;
                        NPL.PickingList_ProductCode = ObtieneCodProduct(p.ArticleProvider_Id);
                        NPL.ArticleProvider_Id = p.ArticleProvider_Id;
                        NPL.MeasurementUnit_Id = 1;
                        NPL.PickingList_Quantity = Cantidad;
                        NPL.Package_Id_Origin = p.Package_Id;
                        NPL.Package_SSCC_Origin = p.Package_SSCC;
                        NPL.Package_Id_Destiny = ObtienePackageId(packageNuevo.ToString());
                        NPL.Package_SSCC_Destiny = packageNuevo.ToString();
                        NPL.PickingList_Level = 1;
                        NPL.Staff_Id = ObtieneIdStaff(username);
                        DBDatos.PickingList.InsertOnSubmit(NPL);
                        DBDatos.SubmitChanges();

                        // Agrega Movimientos
                        AddMovement(ObtieneSiteLayout(p.Layout_Id), 2, Cantidad, 7, ObtieneIdStaff(username), p.Package_Quantity - Cantidad, 1, 1, p.Package_Id);
                        //Actualiza Origen
                        ActualizaRestaCantidadPackage(p.Package_Id, Cantidad);
                        List<Package> PD = ObtieneInfoPallet(packageNuevo.ToString());
                        foreach (var p1 in PD)
                        {
                            //Agrega Movimiento Destino
                            AddMovement(ObtieneSiteLayout(p.Layout_Id), 1, Cantidad, 7, ObtieneIdStaff(username), p1.Package_Quantity + Cantidad, 1, 1, p1.Package_Id);
                            //Actualiza Destino
                            ActualizaSumaCantidadPackage(p1.Package_Id, Cantidad);
                            AddLocation(p1.Package_Id, (int)p.Layout_Id, ObtieneIdStaff(username));
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
        public int CuentaDetalleTransferencia(int IdTransferencia)
        {
            int ret = 0;
            try
            {
                var temp = (from td in DBDatos.Transfer_Detail
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
        public bool CambiaEstadoTransferencia(int IdTransferencia, int Estado)
        {
            bool flag = false;
            try
            {
                IQueryable<Transfer> queryable = from t in this.DBDatos.Transfer
                                                 where t.Transfer_Id.Equals(IdTransferencia)
                                                 select t;
                foreach (Transfer tr in queryable)
                {
                    tr.Status = Estado;
                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public int ObtieneEstadoTransferencia(int IdTransferencia)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBDatos.Transfer
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
        public List<CVT_VW_FiltroTransferencia> ObtieneFiltroTransferencia(int TransferId, int Producto, int NPallet, string Lote, int Posicion)
        {
            DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
            List<Transfer> transfer = new List<Transfer>();

            List<CVT_VW_FiltroTransferencia> ret = new List<CVT_VW_FiltroTransferencia>();
            try
            {
                transfer = (from t in DBDatos.Transfer
                            where t.Transfer_Id.Equals(TransferId)
                            select t).ToList<Transfer>();
                foreach (var d in transfer)
                {
                    ret = (from f in DBDesaint.CVT_VW_FiltroTransferencia
                           where (f.Site_Id.Equals(d.Site_Id)) &&
                                 (f.Layout_Id.Equals(Posicion) || Posicion == 0) &&
                                 (f.ArticleProvider_Id.Equals(Producto) || Producto == 0) &&
                                 (f.Package_Lot.Equals(Lote) || Lote == string.Empty) &&
                                 (f.Package_SSCC.Equals(NPallet) || NPallet == 0)
                           select f).ToList<CVT_VW_FiltroTransferencia>();
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<CVT_VW_FiltroTransferencia> ObtieneFiltroPedido(int PedidoId, int Producto, int NPallet, string Lote, int Posicion)
        {
            DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
            List<Order> Pedido = new List<Order>();

            List<CVT_VW_FiltroTransferencia> ret = new List<CVT_VW_FiltroTransferencia>();
            try
            {
                Pedido = (from t in DBDatos.Order
                          where t.Order_Id.Equals(PedidoId)
                          select t).ToList<Order>();
                foreach (var d in Pedido)
                {
                    ret = (from f in DBDesaint.CVT_VW_FiltroTransferencia
                               //join op in DBDatos.OrderProForm on f.ArticleProvider_Id equals op.ArticleProvider_Id
                           where (f.Site_Id.Equals(d.Site_Id)) && //(op.Order_Id.Equals(PedidoId)) &&
                                 (f.Layout_Id.Equals(Posicion) || Posicion == 0) &&
                                 (f.ArticleProvider_Id.Equals(Producto) || Producto == 0) &&
                                 (f.Package_Lot.Equals(Lote) || Lote == string.Empty) &&
                                 (f.Package_SSCC.Equals(NPallet) || NPallet == 0)
                           select f).ToList<CVT_VW_FiltroTransferencia>();
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool AgregaBultoTransferencia(int transferid, int sitioid, int packageid, int layoutid, string username)
        {
            bool ret = false;
            int artId = 0;
            string lote = string.Empty;
            int cantidad = 0;
            try
            {
                Transfer_Detail vTD = new Transfer_Detail();
                vTD.Transfer_Id = transferid;
                vTD.Task_Id = 0;
                vTD.Status = 1;
                vTD.Site_Id = sitioid;
                vTD.Package_Id = packageid;
                vTD.Layout_Id_Actual = layoutid;
                vTD.Date = DateTime.Now;
                vTD.Company_Id = 1;
                DBDatos.Transfer_Detail.InsertOnSubmit(vTD);
                DBDatos.SubmitChanges();

                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(packageid)
                                                select t;
                foreach (Package package in queryable)
                {
                    lote = package.Package_Lot;
                    artId = package.ArticleProvider_Id;
                    cantidad = package.Package_Quantity;
                    package.Package_ReserveQuantity = package.Package_Quantity;

                }
                this.DBDatos.SubmitChanges();


                Reserve vRE = new Reserve();
                vRE.Company_Id = 1;
                vRE.Package_Id = packageid;
                vRE.Layout_Id = layoutid;
                vRE.ArticleProvider_Id = artId;
                vRE.Lot = lote;
                vRE.Reserve_Quantity = cantidad;
                vRE.Reserve_Status = 1;
                vRE.Reserve_Date = DateTime.Now;
                vRE.Staff_Id = ObtieneIdStaff(username);
                vRE.Transfer_Id = transferid;

                DBDatos.Reserve.InsertOnSubmit(vRE);
                DBDatos.SubmitChanges();
                ret = true;

            }
            catch (Exception er)
            {
                string error = er.Message;

            }
            return ret;
        }
        public bool AgregaBultoTransferenciaRF(int transferid, int packageid,  string username)
        {
            bool ret = false;
            int artId = 0;
            string lote = string.Empty;
            int cantidad = 0;
            int? layoutID = 0;
            int sitioid = 0;

            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(packageid)
                                                select t;
                foreach (Package package in queryable)
                {
                    lote = package.Package_Lot;
                    artId = package.ArticleProvider_Id;
                    cantidad = package.Package_Quantity;
                    layoutID = package.Layout_Id;
                    package.Package_ReserveQuantity = package.Package_Quantity;

                }
                this.DBDatos.SubmitChanges();
                IQueryable<Layout> queryable1 = from t in this.DBDatos.Layout
                                                where t.Layout_Id.Equals(layoutID)
                                                select t;
                foreach (Layout layoutq in queryable1)
                {
                    sitioid = layoutq.Site_Id;
                }
                
                Transfer_Detail vTD = new Transfer_Detail();
                vTD.Transfer_Id = transferid;
                vTD.Task_Id = 0;
                vTD.Status = 1;
                vTD.Site_Id = sitioid;
                vTD.Package_Id = packageid;
                vTD.Layout_Id_Actual = layoutID;
                vTD.Date = DateTime.Now;
                vTD.Company_Id = 1;
                DBDatos.Transfer_Detail.InsertOnSubmit(vTD);
                DBDatos.SubmitChanges();

                


                Reserve vRE = new Reserve();
                vRE.Company_Id = 1;
                vRE.Package_Id = packageid;
                vRE.Layout_Id = layoutID;
                vRE.ArticleProvider_Id = artId;
                vRE.Lot = lote;
                vRE.Reserve_Quantity = cantidad;
                vRE.Reserve_Status = 1;
                vRE.Reserve_Date = DateTime.Now;
                vRE.Staff_Id = ObtieneIdStaff(username);
                vRE.Transfer_Id = transferid;

                DBDatos.Reserve.InsertOnSubmit(vRE);
                DBDatos.SubmitChanges();
                ret = true;

            }
            catch (Exception er)
            {
                string error = er.Message;

            }
            return ret;
        }
        public bool EliminaBultoTransferencia(int transferid, int packageid)
        {
            bool ret = false;
            try
            {
                var t = from td in DBDatos.Transfer_Detail
                        where td.Package_Id.Equals(packageid) && td.Transfer_Id.Equals(transferid)
                        select td;
                foreach (var detail in t)
                {
                    DBDatos.Transfer_Detail.DeleteOnSubmit(detail);
                }
                DBDatos.SubmitChanges();

                IQueryable<Package> queryable = from p in this.DBDatos.Package
                                                where p.Package_Id.Equals(packageid)
                                                select p;
                foreach (Package package in queryable)
                {
                    package.Package_ReserveQuantity = 0;
                }
                this.DBDatos.SubmitChanges();


                var reserve = from r in DBDatos.Reserve
                              where r.Package_Id.Equals(packageid) && r.Transfer_Id.Equals(transferid)
                              select r;
                foreach (var detail in reserve)
                {
                    DBDatos.Reserve.DeleteOnSubmit(detail);
                }
                DBDatos.SubmitChanges();

                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<Transfer_Detail> ObtieneDetalleTransferencia(int transferid)
        {
            List<Transfer_Detail> ret = new List<Transfer_Detail>();
            try
            {
                ret = (from td in DBDatos.Transfer_Detail
                       where td.Transfer_Id.Equals(transferid)
                       select td).ToList<Transfer_Detail>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<CVT_VW_TranferenciaSAP> ObtieneVWDetalleTransferencia(int transferid)
        {
            List<CVT_VW_TranferenciaSAP> ret = new List<CVT_VW_TranferenciaSAP>();
            try
            {
                DBDesaint.CommandTimeout = 6000;
                ret = (from td in DBDesaint.CVT_VW_TranferenciaSAP
                       where td.Transfer_Id.Equals(transferid)
                       select td).ToList<CVT_VW_TranferenciaSAP>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public List<CVT_VW_TranferSAPLotes> ObtieneVWDetalleTransferenciaLotes(int transferid, string artcode)
        {
            List<CVT_VW_TranferSAPLotes> ret = new List<CVT_VW_TranferSAPLotes>();
            try
            {
                ret = (from td in DBDesaint.CVT_VW_TranferSAPLotes
                       where td.Transfer_Id.Equals(transferid) && td.ArticleProvider_CodClient.Equals(artcode)
                       select td).ToList<CVT_VW_TranferSAPLotes>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int AgregaTareaTransferencia(int SiteId, int TaskType, int ArtId, int LayoutIdOrigin, int? LayoutIdDestiny, int? Package_Id, int QuantityToPick, string Lote, int Task_Status, int UserId, int AsignadoId, int ReserveId)
        {

            int tarea = 0;
            try
            {

                Task entity = new Task
                {
                    Company_Id = 1,
                    Site_Id = SiteId,
                    Task_Type = new int?(TaskType),
                    Task_Sku = new int?(ArtId),
                    Task_Layout_Id_Origin = new int?(LayoutIdOrigin),
                    Task_Layout_Id_Destiny = LayoutIdDestiny,
                    Task_Package_Id = Package_Id,
                    Task_QuantityToPick = new int?(QuantityToPick),
                    Task_Quantity_Picked = QuantityToPick,
                    Task_Status = new int?(Task_Status),
                    Task_CreateBy = new int?(UserId),
                    Task_Lot = Lote,
                    Task_DateCreated = new DateTime?(DateTime.Now),
                    Task_Assigned = new int?(AsignadoId),
                    Reserve_Id = new int?(ReserveId),
                    Task_Layout_Id_End = LayoutIdDestiny,
                    Staff_Id = AsignadoId,
                    Task_GeneratedBy = AsignadoId,
                    Task_DateMod = DateTime.Now,
                    Task_ModBy = AsignadoId,
                    Task_Order_Id = 0
                };
                this.DBDatos.Task.InsertOnSubmit(entity);
                this.DBDatos.SubmitChanges();
                tarea = entity.Task_Id;
            }
            catch
            {
                tarea = 0;
            }
            return tarea;
        }
        public int AgregaTareaPedido(int SiteId, int TaskType, int ArtId, int LayoutIdOrigin, int? LayoutIdDestiny, int? Package_Id, int QuantityToPick, string Lote, int Task_Status, int UserId, int AsignadoId, int ReserveId, int orderid)
        {

            int tarea = 0;
            try
            {

                Task entity = new Task
                {
                    Company_Id = 1,
                    Site_Id = SiteId,
                    Task_Type = new int?(TaskType),
                    Task_Sku = new int?(ArtId),
                    Task_Layout_Id_Origin = new int?(LayoutIdOrigin),
                    Task_Layout_Id_Destiny = LayoutIdDestiny,
                    Task_Package_Id = Package_Id,
                    Task_QuantityToPick = new int?(QuantityToPick),
                    Task_Quantity_Picked = QuantityToPick,
                    Task_Status = new int?(Task_Status),
                    Task_CreateBy = new int?(UserId),
                    Task_Lot = Lote,
                    Task_DateCreated = new DateTime?(DateTime.Now),
                    Task_Assigned = new int?(AsignadoId),
                    Reserve_Id = new int?(ReserveId),
                    Task_Layout_Id_End = LayoutIdDestiny,
                    Staff_Id = AsignadoId,
                    Task_GeneratedBy = AsignadoId,
                    Task_DateMod = DateTime.Now,
                    Task_ModBy = AsignadoId,
                    Task_Order_Id = orderid
                };
                this.DBDatos.Task.InsertOnSubmit(entity);
                this.DBDatos.SubmitChanges();
                tarea = entity.Task_Id;
            }
            catch
            {
                tarea = 0;
            }
            return tarea;
        }
        public int ObtieneReservaId(int packageid, int transferid)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Reserve
                            where r.Transfer_Id.Equals(transferid) && r.Package_Id.Equals(packageid)
                            select new { r.Reserve_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Reserve_Id);
                }
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }
        public int ObtieneReservaPedidoId(int packageid, int orderid)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Reserve
                            where r.WavePicking_Id.Equals(orderid) && r.Package_Id.Equals(packageid)
                            select new { r.Reserve_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Reserve_Id);
                }
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }
        public bool ActualizaReserve(int reserveid, int estado)
        {
            bool flag = false;
            try
            {
                IQueryable<Reserve> queryable = from t in this.DBDatos.Reserve
                                                where t.Reserve_Id.Equals(reserveid)
                                                select t;
                foreach (Reserve reserve in queryable)
                {
                    reserve.Reserve_Status = estado;
                }
                this.DBDatos.SubmitChanges();
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
                IQueryable<Location> queryable = from t in this.DBDatos.Location
                                                 where t.Package_Id.Equals(PackageId) && t.Location_OutDate.Equals(null)
                                                 select t;
                foreach (Location location in queryable)
                {

                    location.Location_OutDate = DateTime.Now;

                }
                this.DBDatos.SubmitChanges();
                List<Layout> dt = ObtieneInfoLayout(LayoutDestinoId);
                foreach (var l in dt)
                {
                    Location entity = new Location
                    {
                        Company_Id = 1,
                        Site_Id = l.Site_Id,
                        Warehouse_Id = l.Warehouse_Id,
                        Layout_Id = LayoutDestinoId,
                        Package_Id = PackageId,
                        Location_InDate = now,
                        Staff_Id = new int?(StaffId)
                    };
                    this.DBDatos.Location.InsertOnSubmit(entity);
                    this.DBDatos.SubmitChanges();
                }
                flag = true;
            }
            catch
            {
                flag = false;
            }


            return flag;
        }
        public bool ActualizaLayoutReservePackage(int PackageId, int layoutid)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(PackageId)
                                                select t;
                foreach (Package package in queryable)
                {

                    package.Layout_Id = layoutid;
                    package.Package_ReserveQuantity = 0;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaLimpiaReservePackage(int TransferId)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from p in this.DBDatos.Package
                                                join t in this.DBDatos.Transfer_Detail on p.Package_Id equals t.Package_Id
                                                where t.Transfer_Id.Equals(TransferId)
                                                select p;
                foreach (Package package in queryable)
                {

                    //package.Layout_Id = layoutid;
                    package.Package_ReserveQuantity = 0;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaLayoutPackage(int PackageId, int layoutid)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(PackageId)
                                                select t;
                foreach (Package package in queryable)
                {
                    package.Package_Status = 3;
                    package.Layout_Id = layoutid;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaTipoPallet(int npallet, int idTipo)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_SSCC.Equals(npallet)
                                                select t;
                foreach (Package package in queryable)
                {
                    package.Supportive_Id = idTipo;
                    flag = true;


                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaFechasPackage(string sscc, DateTime fp, DateTime fv, string lp,string lt)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_SSCC.Equals(sscc)
                                                select t;
                foreach (Package package in queryable)
                {
                    package.Package_ProductionDate = fp;
                    package.Package_ExpiresDate = fv;
                    package.Package_Data1 = lp;
                    package.Package_Lot = lt;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaEstadoyTareaTransferDetail(int transferid, int packageid, int estado, int tareaid)
        {
            bool flag = false;
            try
            {
                IQueryable<Transfer_Detail> queryable = from t in this.DBDatos.Transfer_Detail
                                                        where t.Package_Id.Equals(packageid) && t.Transfer_Id.Equals(transferid)
                                                        select t;
                foreach (Transfer_Detail td in queryable)
                {

                    td.Status = estado;
                    td.Task_Id = tareaid;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaEstadoTransfer(int transferid, int estado, string sync)
        {
            bool flag = false;
            try
            {
                IQueryable<Transfer> queryable = from t in this.DBDatos.Transfer
                                                 where t.Transfer_Id.Equals(transferid)
                                                 select t;
                foreach (Transfer td in queryable)
                {

                    td.Status = estado;
                    td.INV_0010_SyncStat = Convert.ToChar(sync);

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaFechaUsuarioTransferencia(int transferid, int User)
        {
            bool flag = false;
            try
            {
                IQueryable<Transfer> queryable = from t in this.DBDatos.Transfer
                                                 where t.Transfer_Id.Equals(transferid)
                                                 select t;
                foreach (Transfer td in queryable)
                {

                    td.Transfer_U_UsuarioCierre = User;
                    td.Transfer_U_FechaCierre = DateTime.Now;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public DataTable ObtieneControlCierreRecepciones()
        {
            DataTable ret = new DataTable();
            DBMLCVTDESAINTDataContext dbdesaint = new DBMLCVTDESAINTDataContext();
            try
            {
                var temp = dbdesaint.CVT_ValidaRecepcionesParaCierre();
                ret = Utilidades.LINQToDataTable(temp);
            }
            catch
            {
            }
            return ret;
        }
        public string EvaluaRecepcionCierre(DataTable dt, int recepid)
        {
            string ret = string.Empty;
            try
            {

            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneCantidadBultosLote(string Lote)
        {
            int ret = 0;
            try
            {
                ret = (from p in DBDatos.Package
                       where p.Package_Lot.Equals(Lote) && p.Reception_Id != 0
                       select p).Count();
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneEnvasesStockLote(string Lote)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBDatos.Package
                           where p.Package_Lot.Equals(Lote)
                           select p;
                ret = temp.Select(c => c.Package_Quantity).Sum();
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneEnvasesProducidosLote(string Lote)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBDatos.Package
                           where p.Package_Lot.Equals(Lote)
                           select p;
                ret = temp.Select(c => c.Package_QuantityInitial).Sum();
            }
            catch
            {
            }
            return ret;
        }
        public int ObtienePaletizadoProducto(string CodProducto)
        {
            int ret = 0;
            try
            {
                var temp = (from a in DBDatos.ArticleProvider
                            where a.ArticleProvider_CodClient.Equals(CodProducto)
                            select new { a.ArticleProvider_U_CantidadPaletizado }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.ArticleProvider_U_CantidadPaletizado);
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public int AgregaBultoProduccion(Package nuevo)
        {
            int ret = 0;
            try
            {

                DBDatos.Package.InsertOnSubmit(nuevo);
                DBDatos.SubmitChanges();
                ret = nuevo.Package_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int ObtieneRecepcionProductivaLote(string Lote)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Reception
                            join p in DBDatos.Package on r.Reception_Id equals p.Reception_Id
                            where p.Package_Lot == (Lote) && p.Reception_Id != 0 && r.Reception_Type == 2 && r.DocType_Id == 4
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
        public int ObtieneRecepcionProductivaLoteR(string Lote, string art)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Reception
                            join p in DBDatos.Package on r.Reception_Id equals p.Reception_Id
                            join a in DBDatos.ArticleProvider on p.ArticleProvider_Id equals a.ArticleProvider_Id
                            where p.Package_Lot == (Lote) && p.Reception_Id != 0 && a.ArticleProvider_CodClient != art && r.Site_Id == 2 && r.Reception_Type == 2 && r.DocType_Id == 4
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
        public int ObtieneRecepcionProductivaLoteB(string Lote, string art)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Reception
                            join p in DBDatos.Package on r.Reception_Id equals p.Reception_Id
                            join a in DBDatos.ArticleProvider on p.ArticleProvider_Id equals a.ArticleProvider_Id
                            where p.Package_Lot == (Lote) && p.Reception_Id != 0 && a.ArticleProvider_CodClient != art && r.Site_Id == 85 && r.Reception_Type == 2 && r.DocType_Id == 4
                            select new { p.Reception_Id }).FirstOrDefault();

                // se midifica de r.Site_Id == 3 a r.Site_Id == 85
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
        public int AgregaRecepcionProduccion(int site, int sector, int Usuario, int OF, int IDPais)
        {
            int ret = 0;
            try
            {
                Reception nueva = new Reception();
                nueva.Company_Id = 1;
                nueva.Site_Id = site;
                nueva.Business_Partner_Owner = "19";
                nueva.Business_Partner_Provider = "19";
                nueva.AccessControl_Id = 0;
                nueva.Staff_Id = Usuario;
                nueva.Sector_Id = sector;
                nueva.Worktype_Id = 1;
                nueva.DocType_Id = 4;
                nueva.Reception_DocNumber = OF;
                nueva.Reception_DateIn = DateTime.Now;
                nueva.Reception_DateOut = DateTime.Now.AddHours(8);
                nueva.Reception_Note = "Recepcion creada automaticamente por Sistema Etiquetado";
                nueva.Reception_Status = 2;
                nueva.Reception_GrossWeight = 0;
                nueva.Reception_NetWeight = 0;
                nueva.Reception_Tare = 0;
                nueva.Reception_SendStat = 1;
                nueva.Reception_seals1 = string.Empty;
                nueva.Reception_seals2 = string.Empty;
                nueva.Reception_seals3 = string.Empty;
                nueva.Reception_NumContainer = string.Empty;
                nueva.Reception_Type = 2;
                nueva.Reception_Origin = IDPais;
                nueva.Reception_Destination = 1;
                nueva.Reception_RefrigerationUnit = 0;
                nueva.Reception_Sealed = 0;
                nueva.Reception_CrossDocking = 0;
                DBDatos.Reception.InsertOnSubmit(nueva);
                DBDatos.SubmitChanges();
                ret = nueva.Reception_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int AgregaRecepcionTransformacion(int site, int sector, int Usuario, int OF)
        {
            int ret = 0;
            try
            {
                Reception nueva = new Reception();
                nueva.Company_Id = 1;
                nueva.Site_Id = site;
                nueva.Business_Partner_Owner = "19";
                nueva.Business_Partner_Provider = "19";
                nueva.AccessControl_Id = 0;
                nueva.Staff_Id = Usuario;
                nueva.Sector_Id = sector;
                nueva.Worktype_Id = 1;
                nueva.DocType_Id = 12;
                nueva.Reception_DocNumber = OF;
                nueva.Reception_DateIn = DateTime.Now;
                nueva.Reception_DateOut = DateTime.Now.AddHours(8);
                nueva.Reception_Note = "Recepcion creada automaticamente por Sistema CVT - Modulo Transformaciones";
                nueva.Reception_Status = 2;
                nueva.Reception_GrossWeight = 0;
                nueva.Reception_NetWeight = 0;
                nueva.Reception_Tare = 0;
                nueva.Reception_SendStat = 1;
                nueva.Reception_seals1 = string.Empty;
                nueva.Reception_seals2 = string.Empty;
                nueva.Reception_seals3 = string.Empty;
                nueva.Reception_NumContainer = string.Empty;
                nueva.Reception_Type = 1;
                nueva.Reception_Origin = 1;
                nueva.Reception_Destination = 1;
                nueva.Reception_RefrigerationUnit = 0;
                nueva.Reception_Sealed = 0;
                nueva.Reception_CrossDocking = 0;
                DBDatos.Reception.InsertOnSubmit(nueva);
                DBDatos.SubmitChanges();
                ret = nueva.Reception_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool AgregaProductoRecepcionReported(int recep, int artid, int siteid)
        {
            bool ret = true;
            try
            {
                ReceptionReported nuevo = new ReceptionReported();
                nuevo.ArticleProvider_Id = artid;
                nuevo.Company_Id = 1;
                nuevo.Reception_Id = recep;
                nuevo.ReceptionReported_Quantity = 1;
                nuevo.ReceptionReported_Weigth = 1;
                nuevo.Site_Id = siteid;
                DBDatos.ReceptionReported.InsertOnSubmit(nuevo);
                DBDatos.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public bool AgregaBultoPedido(int orderid, int sitioid, int packageid, int layoutid, string username)
        {
            bool ret = false;
            int artId = 0;
            string lote = string.Empty;
            int cantidad = 0;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(packageid)
                                                select t;
                foreach (Package package in queryable)
                {
                    lote = package.Package_Lot;
                    artId = package.ArticleProvider_Id;
                    cantidad = package.Package_Quantity;
                    if (VerificaExisteProductoOrder(orderid, artId) == artId)
                    {
                        int cantsolicitada = VerificaCantidadSolicitadaProductoOrder(orderid, artId);
                        int cantcompletada = VerificaCantidadCompletadaProductoOrder(orderid, artId);
                        if (cantcompletada + cantidad <= cantsolicitada)
                        {
                            package.Package_ReserveQuantity = package.Package_Quantity;
                        }
                    }

                }
                this.DBDatos.SubmitChanges();
                if (VerificaExisteProductoOrder(orderid, artId) == artId)
                {
                    int cantsolicitada = VerificaCantidadSolicitadaProductoOrder(orderid, artId);
                    int cantcompletada = VerificaCantidadCompletadaProductoOrder(orderid, artId);
                    if (cantcompletada + cantidad <= cantsolicitada)
                    {
                        OrderDetail vPD = new OrderDetail();
                        vPD.Order_Id = orderid;
                        vPD.Company_Id = 1;
                        vPD.OrderDetail_Status = 1;
                        vPD.Site_Id = sitioid;
                        vPD.Package_Id = packageid;
                        vPD.OrderDetail_Quantity = cantidad;
                        DBDatos.OrderDetail.InsertOnSubmit(vPD);
                        DBDatos.SubmitChanges();


                        Reserve vRE = new Reserve();
                        vRE.Company_Id = 1;
                        vRE.Package_Id = packageid;
                        vRE.Layout_Id = layoutid;
                        vRE.ArticleProvider_Id = artId;
                        vRE.Lot = lote;
                        vRE.Reserve_Quantity = cantidad;
                        vRE.Reserve_Status = 1;
                        vRE.Reserve_Date = DateTime.Now;
                        vRE.Staff_Id = ObtieneIdStaff(username);
                        vRE.WavePicking_Id = orderid;


                        DBDatos.Reserve.InsertOnSubmit(vRE);
                        DBDatos.SubmitChanges();
                        ret = true;
                    }
                }

            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int VerificaExisteProductoOrder(int orderid, int artid)
        {
            int ret = 0;
            try
            {
                var temp = (from op in DBDatos.OrderProForm
                            where op.ArticleProvider_Id.Equals(artid) && op.Order_Id.Equals(orderid)
                            select new { op.ArticleProvider_Id }).FirstOrDefault();
                if (temp != null)
                    ret = (int)temp.ArticleProvider_Id;
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }
        public int VerificaCantidadSolicitadaProductoOrder(int orderid, int artid)
        {
            int ret = 0;
            try
            {
                var temp = (from op in DBDatos.OrderProForm
                            where op.ArticleProvider_Id.Equals(artid) && op.Order_Id.Equals(orderid)
                            select new { op.OrderProForm_Quantity }).FirstOrDefault();
                if (temp != null)
                    ret = (int)temp.OrderProForm_Quantity;
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }
        public int VerificaCantidadCompletadaProductoOrder(int orderid, int artid)
        {
            int ret = 0;
            try
            {
                var temp = (from op in DBDatos.VIEW_ORDERPROFORM
                            where op.ArticleProvider_Id.Equals(artid) && op.Order_Id.Equals(orderid)
                            select new { op.Cant_Completada }).FirstOrDefault();
                if (temp != null)
                    ret = (int)temp.Cant_Completada;
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }

        public int ObtieneEstadoPedido(int IdPedido)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBDatos.Order
                            where t.Order_Id.Equals(IdPedido)
                            select new { t.Order_Status }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Order_Status);
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string ObtieneCodClientPedido(int IdPedido)
        {
            string ret = "";
            try
            {
                var temp = (from t in DBDatos.Order
                            where t.Order_Id.Equals(IdPedido)
                            select new { t.Order_BusinessPartnerDestiny }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Order_BusinessPartnerDestiny;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool EliminaBultoPedido(int orderid, int packageid)
        {
            bool ret = false;
            try
            {
                var t = from td in DBDatos.OrderDetail
                        where td.Package_Id.Equals(packageid) && td.Order_Id.Equals(orderid)
                        select td;
                foreach (var detail in t)
                {
                    DBDatos.OrderDetail.DeleteOnSubmit(detail);
                }
                DBDatos.SubmitChanges();

                IQueryable<Package> queryable = from p in this.DBDatos.Package
                                                where p.Package_Id.Equals(packageid)
                                                select p;
                foreach (Package package in queryable)
                {
                    package.Package_ReserveQuantity = 0;
                }
                this.DBDatos.SubmitChanges();


                var reserve = from r in DBDatos.Reserve
                              where r.Package_Id.Equals(packageid) && r.WavePicking_Id.Equals(orderid)
                              select r;
                foreach (var detail in reserve)
                {
                    DBDatos.Reserve.DeleteOnSubmit(detail);
                }
                DBDatos.SubmitChanges();

                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int CuentaDetallePedido(int IdOrder)
        {
            int ret = 0;
            try
            {
                var temp = (from td in DBDatos.OrderDetail
                            where td.Order_Id.Equals(IdOrder)
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
        public int PedidoAsociadoSAP(int idOrder)
        {
            int ret = 0;
            try
            {
                var temp = (from o in DBDatos.Order
                            where o.Order_Id == (idOrder) && o.Order_U_NumDocSAP != null && o.Order_U_TipoDocSAP != null
                            select new { o.Order_Id }).FirstOrDefault();
                if (temp.Order_Id != null)
                {
                    ret = 1;
                }
            }
            catch
            {
            }
            return ret;
        }
        public bool CierrePedidoSP( int OrderID, int StaffID)
        {
            bool ret = false;
            try
            {
                DBDatos.CVT_CierrePedido(OrderID, StaffID);
                ret = true;
            }
            catch
            {
                ret = false;
            }
            return ret;
        }

        public bool CambiaEstadoPedido(int IdOrder, int Estado)
        {
            bool flag = false;
            try
            {
                IQueryable<Order> queryable = from t in this.DBDatos.Order
                                              where t.Order_Id.Equals(IdOrder)
                                              select t;
                foreach (Order tr in queryable)
                {
                    tr.Order_Status = Estado;
                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public List<OrderDetail> ObtieneDetallePedido(int orderid)
        {
            List<OrderDetail> ret = new List<OrderDetail>();
            try
            {
                ret = (from td in DBDatos.OrderDetail
                       where td.Order_Id.Equals(orderid)
                       select td).ToList<OrderDetail>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string TraeFechaCreacionPedido(int orderid)
        {
            string ret = "-1";
            try
            {
                var temp = (from td in DBDatos.Order
                            where td.Order_Id.Equals(orderid)
                            select new { td.Order_SoliciteDate }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.Order_SoliciteDate);
            }
            catch
            {
                return ret;
            }
            return ret;
        }
        public int CreaExpedicion(int siteid, int orderid, int usuario, int docsap)
        {
            int ret = 0;
            try
            {

                DateTime fTrans = Convert.ToDateTime(TraeFechaCreacionPedido(orderid));

                Expedition vnew = new Expedition();
                vnew.Company_Id = 1;
                vnew.Site_Id = siteid;
                vnew.Business_Partner_Id = "19";
                vnew.DocType_Id = 1;
                vnew.AccessControl_Id = 0;
                vnew.Order_Id = orderid;
                vnew.Staff_Id = usuario;
                vnew.Sector_Id = ObtieneSectorPF(siteid);
                vnew.WorkType_Id = 1;
                vnew.ClientDestiny_Id = 1;
                vnew.Expedition_DocNumber = orderid;
                vnew.Expedition_DateIn = fTrans;
                vnew.Expedition_DateOut = DateTime.Now;
                vnew.Expedition_Note = "Generada por Sistema CVT";
                vnew.Expedition_GrossWeight = 0;
                vnew.Expedition_NetWeight = 0;
                vnew.Expedition_Tare = 0;
                vnew.Expedition_Status = 1;
                vnew.Expedition_Stamp = string.Empty;
                vnew.Expedition_seals1 = string.Empty;
                vnew.Expedition_seals2 = string.Empty;
                vnew.Expedition_seals3 = string.Empty;
                vnew.Expedition_NumContainer = string.Empty;
                vnew.Expedition_Type = 1;
                vnew.Expedition_SendState = 1;
                vnew.Expedition_Sync = 0;
                vnew.Expedition_U_TipoDocSAP = 13;
                vnew.Expedition_U_NumDocSAP = docsap;
                vnew.Expedition_U_Motivo = 01;
                DBDatos.Expedition.InsertOnSubmit(vnew);
                DBDatos.SubmitChanges();
                ret = vnew.Expedition_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string TraeFechaCreacionTransformacion(int transformacionId)
        {
            string ret="-1";
            try
            {
                var temp = (from td in DBDesaint.CVT_Transformacion
                            where td.Transformacion_Id.Equals(transformacionId)
                            select new { td.Fecha }).FirstOrDefault(); 
                if (temp != null)
                    ret =Convert.ToString(temp.Fecha);
            }
            catch
            {
             return  ret;
            }
            return ret;
        }
        public int CreaExpedicionRapida(int siteid, int usuario, int transformacionId)
        {
            int ret = 0;
            try
            {

                DateTime fTrans=Convert.ToDateTime(TraeFechaCreacionTransformacion(transformacionId));

                Expedition vnew = new Expedition();
                vnew.Company_Id = 1;
                vnew.Site_Id = siteid;
                vnew.Business_Partner_Id = "19";
                vnew.DocType_Id = 4;
                vnew.AccessControl_Id = 0;
                vnew.Staff_Id = usuario;
                vnew.Sector_Id = ObtieneSectorPF(siteid);
                vnew.WorkType_Id = 1;
                vnew.ClientDestiny_Id = 1;
                vnew.Expedition_DocNumber = transformacionId;
                vnew.Expedition_DateIn = fTrans;
                vnew.Expedition_DateOut = DateTime.Now;
                vnew.Expedition_Note = "Generada por Sistema CVT - Modulo Transformaciones";
                vnew.Expedition_GrossWeight = 0;
                vnew.Expedition_NetWeight = 0;
                vnew.Expedition_Tare = 0;
                vnew.Expedition_Status = 2;
                vnew.Expedition_Stamp = string.Empty;
                vnew.Expedition_seals1 = string.Empty;
                vnew.Expedition_seals2 = string.Empty;
                vnew.Expedition_seals3 = string.Empty;
                vnew.Expedition_NumContainer = string.Empty;
                vnew.Expedition_Type = 5;
                vnew.Expedition_SendState = 1;
                vnew.Expedition_Sync = 0;
                vnew.Expedition_U_Motivo = 02;
                DBDatos.Expedition.InsertOnSubmit(vnew);
                DBDatos.SubmitChanges();
                ret = vnew.Expedition_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int CreaExpedicionRapidaConsumo(int siteid, int usuario, int OF)
        {
            int ret = 0;
            try
            {
                Expedition vnew = new Expedition();
                vnew.Company_Id = 1;
                vnew.Site_Id = siteid;
                vnew.Business_Partner_Id = "19";
                vnew.DocType_Id = 4;
                vnew.AccessControl_Id = 0;
                vnew.Staff_Id = usuario;
                vnew.Sector_Id = ObtieneSectorPF(siteid);
                vnew.WorkType_Id = 1;
                vnew.ClientDestiny_Id = 1;
                vnew.Expedition_DocNumber = OF;
                vnew.Expedition_DateIn = DateTime.Now;
                vnew.Expedition_DateOut = DateTime.Now;
                vnew.Expedition_Note = "Generada por Sistema CVT - Consumo";
                vnew.Expedition_GrossWeight = 0;
                vnew.Expedition_NetWeight = 0;
                vnew.Expedition_Tare = 0;
                vnew.Expedition_Status = 2;
                vnew.Expedition_Stamp = string.Empty;
                vnew.Expedition_seals1 = string.Empty;
                vnew.Expedition_seals2 = string.Empty;
                vnew.Expedition_seals3 = string.Empty;
                vnew.Expedition_NumContainer = string.Empty;
                vnew.Expedition_Type = 5;
                vnew.Expedition_SendState = 1;
                vnew.Expedition_Sync = 0;
                DBDatos.Expedition.InsertOnSubmit(vnew);
                DBDatos.SubmitChanges();
                ret = vnew.Expedition_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int AgregaDetalleExpedicion(int expid, int cantidad, int packageid, string sscc, int siteid, int usuario)
        {
            int ret = 0;
            try
            {
                ExpeditionDetail vnd = new ExpeditionDetail();
                vnd.Company_Id = 1;
                vnd.Expedition_Id = expid;
                vnd.ExpeditionDetail_Confirmed = 1;
                vnd.ExpeditionDetail_ConfirmedDate = DateTime.Now;
                vnd.ExpeditionDetail_GrossWeight = 0;
                vnd.ExpeditionDetail_NetWeight = 0;
                vnd.ExpeditionDetail_Quantity = cantidad;
                vnd.ExpeditionDetail_TimeOut = DateTime.Now;
                vnd.Package_Id = packageid;
                vnd.Package_SSCC = sscc;
                vnd.Package_SSCCParent = string.Empty;
                vnd.Site_Id = siteid;
                vnd.Staff_Id = usuario;
                DBDatos.ExpeditionDetail.InsertOnSubmit(vnd);
                DBDatos.SubmitChanges();
                ret = 1;



            }
            catch
            {

            }
            return ret;
        }
        public int AgregaDetalleExpedicionTransformacion(int expid, int siteid, int usuario, int TransformacionId)
        {
            int ret = 0;
            try
            {
                List<CVT_TransformacionDetalle> dt = new List<CVT_TransformacionDetalle>();
                dt = (from tr in DBDesaint.CVT_TransformacionDetalle
                      where tr.Transformacion_Id.Equals(TransformacionId)
                      select tr).ToList<CVT_TransformacionDetalle>();
                foreach (var n in dt)
                {
                    IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                    where t.Package_Id.Equals(n.Package_Id)
                                                    select t;
                    foreach (Package package in queryable)
                    {
                        ExpeditionDetail vnd = new ExpeditionDetail();
                        vnd.Company_Id = 1;
                        vnd.Expedition_Id = expid;
                        vnd.ExpeditionDetail_Confirmed = 1;
                        vnd.ExpeditionDetail_ConfirmedDate = DateTime.Now;
                        vnd.ExpeditionDetail_GrossWeight = 0;
                        vnd.ExpeditionDetail_NetWeight = 0;
                        vnd.ExpeditionDetail_Quantity = package.Package_Quantity;
                        vnd.ExpeditionDetail_TimeOut = DateTime.Now;
                        vnd.Package_Id = package.Package_Id;
                        vnd.Package_SSCC = package.Package_SSCC;
                        vnd.Package_SSCCParent = string.Empty;
                        vnd.Site_Id = siteid;
                        vnd.Staff_Id = usuario;
                        DBDatos.ExpeditionDetail.InsertOnSubmit(vnd);
                        DBDatos.SubmitChanges();
                    }
                }
                ret = 1;



            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_VW_PalletTransferidosCV300> ObtienePalletConsumoOF(int OF)
        {
            List<CVT_VW_PalletTransferidosCV300> ret = new List<CVT_VW_PalletTransferidosCV300>();
            try
            {
                ret = (from v in DBDatos.CVT_VW_PalletTransferidosCV300
                       where v.Transfer_U_Folio_Entidad.Equals(OF)
                       select v).ToList<CVT_VW_PalletTransferidosCV300>();
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneSectorPF(int siteid)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Sector
                            where s.Site_Id.Equals(siteid) && s.Sector_Status.Equals(8)
                            select new { s.Sector_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Sector_Id);
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int CreaPickingListPedido(PickingList nuevo)
        {
            int ret = 0;
            try
            {
                DBDatos.PickingList.InsertOnSubmit(nuevo);
                DBDatos.SubmitChanges();
                ret = 1;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool ActualizaEstadoExpedicion(int Expeditionid, int estado, bool sync)
        {
            bool flag = false;
            try
            {
                IQueryable<Expedition> queryable = from t in this.DBDatos.Expedition
                                                   where t.Expedition_Id.Equals(Expeditionid)
                                                   select t;
                foreach (Expedition td in queryable)
                {

                    td.Expedition_Status = estado;
                    if (sync == true)
                    {
                        td.INV_0010_SyncStat = 'U';
                        td.INV_0010_UpdFrom = 'I';
                    }
                    else
                    {
                        td.INV_0010_SyncStat = 'S';
                        td.INV_0010_UpdFrom = 'D';
                    }

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaSectorPedido(int Orderid, int sectorid)
        {
            bool flag = false;
            try
            {
                IQueryable<Order> queryable = from t in this.DBDatos.Order
                                              where t.Order_Id.Equals(Orderid)
                                              select t;
                foreach (Order td in queryable)
                {

                    td.Sector_Id = sectorid;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public string ObtieneSiteExpedicion(int ExpId)
        {
            string ret = "";
            try
            {
                var temp = (from e in DBDatos.Expedition
                            join si in DBDatos.Site on e.Site_Id equals si.Site_Id
                            where e.Expedition_Id.Equals(ExpId)
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
        public bool AgregaAgendamiento(Scheduler vNuevo)
        {
            bool ret = false;
            try
            {
                DBDatos.Scheduler.InsertOnSubmit(vNuevo);
                DBDatos.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int VerificaAgendamiento(string Contenedor, int OC)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Scheduler
                            where s.Scheduler_USE.Equals(OC) && s.Scheduler_Note.Equals(Contenedor)
                            select new { s.Scheduler_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Scheduler_Id;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;

        }

        public List<CVT_VW_ResumenPedidoEnc> ObtieneEncPedido(int idpedido)
        {
            List<CVT_VW_ResumenPedidoEnc> ret = new List<CVT_VW_ResumenPedidoEnc>();
            try
            {
                ret = (from vrp in DBDatos.CVT_VW_ResumenPedidoEnc
                       where vrp.Order_Id.Equals(idpedido)
                       select vrp).ToList<CVT_VW_ResumenPedidoEnc>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_VW_ResumenPedidoLote> ObtieneEncPedido(int idpedido, string codproducto)
        {
            List<CVT_VW_ResumenPedidoLote> ret = new List<CVT_VW_ResumenPedidoLote>();
            try
            {
                ret = (from vrp in DBDatos.CVT_VW_ResumenPedidoLote
                       where vrp.Order_Id.Equals(idpedido) && vrp.ArticleProvider_CodClient.Equals(codproducto)
                       select vrp).ToList<CVT_VW_ResumenPedidoLote>();
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaReceptionReported(ReceptionReported nn)
        {
            bool ret = false;
            try
            {
                DBDatos.ReceptionReported.InsertOnSubmit(nn);
                DBDatos.SubmitChanges();
                ret = true;

            }
            catch
            {
            }
            return ret;
        }

        public int ObtieneOrigenPackage(int idRecep)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Reception
                            where s.Reception_Id.Equals(idRecep)
                            select new { s.Reception_Origin }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Reception_Origin;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public bool InsertaPackageReception(Package nn)
        {
            bool ret = false;
            try
            {
                DBDatos.Package.InsertOnSubmit(nn);
                DBDatos.SubmitChanges();
                ret = true;

            }
            catch
            {
            }
            return ret;
        }
        public bool ConfirmaPalletRecepcion(int pkid, int layoutid)
        {
            bool ret = false;
            try
            {
                IQueryable<Package> queryable = from p in this.DBDatos.Package
                                                where p.Package_Id.Equals(pkid)
                                                select p;
                foreach (Package package in queryable)
                {
                    package.Layout_Id = layoutid;
                    package.Package_Status = 2;
                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public int PalletNoConfirmadosRecepcion(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Package
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
        public int PalletConfirmadosRecepcion(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Package
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
        public int PalletLoteDiferente(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Package
                            join r in DBDatos.Reception on p.Reception_Id equals r.Reception_Id
                            where p.Reception_Id == recepid && !p.Package_Lot.Contains(r.Reception_U_NumDocSAP.ToString())
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
        public int LoteSugeridoRecepcion(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.CVT_VW_LoteSugeridoRecepcion
                            join r in DBDatos.Reception on p.Reception_Id equals r.Reception_Id
                            join pk in DBDatos.Package on r.Reception_Id equals pk.Reception_Id
                            where p.Reception_Id == recepid && pk.Package_Lot != p.LoteSugerido
                            select new { pk.Package_Id }).FirstOrDefault();
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
        public int CantPalletRecepcion(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Package
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
        public int PalletNoPosicionadosRecepcion(int recepid)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Package
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
        public bool CierraRecepcion(int recepid)
        {
            bool ret = false;
            try
            {
                IQueryable<Reception> queryable = from p in this.DBDatos.Reception
                                                  where p.Reception_Id.Equals(recepid)
                                                  select p;
                foreach (Reception reception in queryable)
                {
                    reception.Reception_Status = 2;
                    reception.Reception_DateOut = DateTime.Now;
                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public bool AnulaRecepcion(int recepid)
        {
            bool ret = false;
            try
            {
                IQueryable<Reception> queryable = from p in this.DBDatos.Reception
                                                  where p.Reception_Id.Equals(recepid)
                                                  select p;
                foreach (Reception reception in queryable)
                {
                    reception.Reception_Status = 3;
                    reception.Reception_DateOut = DateTime.Now;
                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public bool EliminaBultoRecepcion(int recepid)
        {
            bool ret = false;
            try
            {
                var temp = from p in DBDatos.Package
                           where p.Reception_Id == recepid
                           select p;
                foreach (var detail in temp)
                {
                    DBDatos.Package.DeleteOnSubmit(detail);
                }
                DBDatos.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_VW_ExpeditionDetailSync1> ObtieneExpedicionDetalle(int expid)
        {
            List<CVT_VW_ExpeditionDetailSync1> ret = new List<CVT_VW_ExpeditionDetailSync1>();
            try
            {
                ret = (from ce in DBDatos.CVT_VW_ExpeditionDetailSync1
                       where ce.Expedition_Id.Equals(expid)
                       select ce).ToList<CVT_VW_ExpeditionDetailSync1>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_VW_ExpeditionDetailLotSync> ObtieneExpedicionDetalleLote(int expid, string CodProd)
        {
            List<CVT_VW_ExpeditionDetailLotSync> ret = new List<CVT_VW_ExpeditionDetailLotSync>();
            try
            {
                ret = (from ce in DBDatos.CVT_VW_ExpeditionDetailLotSync
                       where ce.Expedition_Id.Equals(expid) && ce.ArticleProvider_CodClient.Equals(CodProd)
                       select ce).ToList<CVT_VW_ExpeditionDetailLotSync>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_VW_RecepcionDetalle> ObtieneDetalleRecepcion(int recepid)
        {
            List<CVT_VW_RecepcionDetalle> ret = new List<CVT_VW_RecepcionDetalle>();
            try
            {
                ret = (from r in DBDatos.CVT_VW_RecepcionDetalle
                       where r.Reception_Id == recepid
                       select r).ToList<CVT_VW_RecepcionDetalle>();
            }
            catch
            {
            }
            return ret;
        }

        public List<VW_EXPEDICION_FILM_DETALLE> ObtieneDetalleExpedicionfilm(int expId)
        {
            List<VW_EXPEDICION_FILM_DETALLE> ret = new List<VW_EXPEDICION_FILM_DETALLE>();
            try
            {
                ret = (from r in DBDesaint.VW_EXPEDICION_FILM_DETALLE
                       where r.ExpFilm_id == expId
                       select r).ToList<VW_EXPEDICION_FILM_DETALLE>();
            }
            catch
            {
            }
            return ret;
        }

        public List<CVT_VW_RecepcionDetalle> ObtieneDetalleRecepcionExceso(int recepid, string codProducto)
        {
            List<CVT_VW_RecepcionDetalle> ret = new List<CVT_VW_RecepcionDetalle>();
            try
            {
                ret = (from r in DBDatos.CVT_VW_RecepcionDetalle
                       where r.Reception_Id == recepid && r.ArticleProvider_CodClient.Equals(codProducto)
                       select r).ToList<CVT_VW_RecepcionDetalle>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_VW_RecepcionDetalleLote> ObtieneDetalleLoteRecepcion(int recepid, string codprod)
        {
            List<CVT_VW_RecepcionDetalleLote> ret = new List<CVT_VW_RecepcionDetalleLote>();
            try
            {
                ret = (from r in DBDatos.CVT_VW_RecepcionDetalleLote
                       where r.Reception_Id == recepid && r.ArticleProvider_CodClient == codprod
                       select r).ToList<CVT_VW_RecepcionDetalleLote>();
            }
            catch
            {
            }
            return ret;
        }

        public List<VW_EXPEDICION_FILM_DETALLE_LOTE> ObtieneDetalleLoteExpedicionFilm(int expId, string codprod)
        {
            List<VW_EXPEDICION_FILM_DETALLE_LOTE> ret = new List<VW_EXPEDICION_FILM_DETALLE_LOTE>();
            try
            {
                ret = (from r in DBDesaint.VW_EXPEDICION_FILM_DETALLE_LOTE
                       where r.ExpFilm_id == expId && r.Producto == codprod
                       select r).ToList<VW_EXPEDICION_FILM_DETALLE_LOTE>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_VW_RecepcionDetalleLote> ObtieneDetalleLoteRecepcion(int recepid, string codprod, string Motivo)
        {
            List<CVT_VW_RecepcionDetalleLote> ret = new List<CVT_VW_RecepcionDetalleLote>();
            try
            {
                ret = (from r in DBDatos.CVT_VW_RecepcionDetalleLote
                       where r.Reception_Id == recepid && r.ArticleProvider_CodClient == codprod && r.DevolucionMotivo_Id == Motivo
                       select r).ToList<CVT_VW_RecepcionDetalleLote>();
            }
            catch
            {
            }
            return ret;
        }
        public string ObtieneFechasDespachadas(int NumPedido, string Codproducto, string lote)
        {
            string ret = string.Empty;
            try
            {
                List<CVT_VW_FechasDespachadas> dt = new List<CVT_VW_FechasDespachadas>();
                dt = (from fd in DBDatos.CVT_VW_FechasDespachadas
                      where fd.ArticleProvider_CodClient == Codproducto && fd.Package_Lot == lote && fd.Order_U_NumDocSAP == NumPedido
                      select fd).ToList<CVT_VW_FechasDespachadas>();
                foreach (var d in dt)
                {
                    string ret1 = "F.Prod=" + d.Package_ProductionDate.ToShortDateString() + " F.Venc=" + d.Package_ExpiresDate.ToShortDateString() + Environment.NewLine;
                    if (ret != ret1)
                    {
                        ret = ret + ret1;
                    }
                }
            }
            catch
            {
            }
            return ret;
        }
        public string ObtieneLotePallet(int Id)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from p in DBDatos.Package
                            where p.Package_Id.Equals(Id)
                            select new { p.Package_Lot }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Package_Lot;
                }

            }
            catch
            {
            }
            return ret;
        }

        public int obtenerIdUserWms(string nomUser)
        {
            int res = 0;

            var tem = (from u in DBDatos.Staff
                       where u.Staff_UserName.Equals(nomUser)
                       select new { u.Staff_Id }).First();
            if (tem != null)
            {
                res = tem.Staff_Id;
            }
            return res;
        }

        public void SP_actualizarContrasenaUserWms(string clave, int idUser)
        {
            try
            {
                DBDatos.CVT_ACTUALIZA_CLAVE_ENCRIPTADASTAFF(clave, idUser);
            }
            catch { }

        }

        public void SP_actualizaHoraYGrueroEncargadoPedido(int horainiArmado, int HorainiCarga, int HoraTermArmado, int HoraTermCarga,
                                                           int MinIniArmado, int MinIniCarga, int MinTerArmado, int MinTerCarga, int idGrua, int idPed, string ArmadoPedido)
        {
            try
            {
                DBDatos.CVT_ACTUALIZA_HORA_ARMADO_CARGAPEDIDO(horainiArmado, HorainiCarga, HoraTermArmado, HoraTermCarga, MinIniArmado, MinIniCarga, MinTerArmado, MinTerCarga, idGrua, idPed, ArmadoPedido);
            }
            catch { };
        }

        public List<Order> ObtieneHorayGruero(int NumPedido)
        {
            List<Order> ret = new List<Order>();

            try
            {

                ret = (from fd in DBDatos.Order
                       where fd.Order_Id.Equals(NumPedido)
                       select fd).ToList<Order>();
            }
            catch
            {
            }
            return ret;
        }

        public string obtenerNombreGrueroOrden(int numpedido)
        {

            string res = "";
            try
            {
                var tem = (from u in DBDatos.Staff
                           where u.Staff_Id.Equals(numpedido)
                           select new { u.Staff_Name }).First();
                if (tem != null)
                {
                    res = tem.Staff_Name;
                }
                return res;
            }
            catch
            {
                return res;

            }
            return res;

        }

        #region expedidicion rapida      
        public List<Expedition> ObtieneDatosDeExpedicionRapida(int numExpRap)
        {
            List<Expedition> ret = new List<Expedition>();

            try
            {

                ret = (from fd in DBDatos.Expedition
                       where fd.Expedition_Id.Equals(numExpRap)
                       select fd).ToList<Expedition>();
            }
            catch
            {
            }
            return ret;
        }



        public List<Package> ObtieneDatosDelBulto(int pkg)
        {
            List<Package> ret = new List<Package>();

            try
            {

                ret = (from fd in DBDatos.Package
                       where fd.Package_SSCC.Equals(pkg)
                       select fd).ToList<Package>();
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaRegistroDetalleExpRapida(ExpeditionDetail nuevo)
        {
            bool ret = false;
            try
            {
                DBDatos.ExpeditionDetail.InsertOnSubmit(nuevo);
                DBDatos.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }

        public bool ActualizaEstadoExpedicionRapida(int Expeditionid, int estado, bool sync, int confirmed)
        {
            bool flag = false;
            try
            {
                IQueryable<Expedition> queryable = from t in this.DBDatos.Expedition
                                                   where t.Expedition_Id.Equals(Expeditionid)
                                                   select t;
                foreach (Expedition td in queryable)
                {

                    td.Expedition_Status = estado;
                    if (sync == true)
                    {
                        td.INV_0010_SyncStat = 'U';
                        td.INV_0010_UpdFrom = 'I';
                    }
                    else
                    {
                        td.INV_0010_SyncStat = 'S';
                        td.INV_0010_UpdFrom = 'D';
                        td.Expedition_DateOut = DateTime.Now;
                        td.Expedition_Confirmed = confirmed;
                        td.Expedition_Included = confirmed;
                    }

                }
                this.DBDatos.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool DardeBajaPalletExpedicionRapida(int expd)
        {
            bool ret = false;
            try
            {
                List<ExpeditionDetail> dt = new List<ExpeditionDetail>();
                dt = (from tr in DBDatos.ExpeditionDetail
                      where tr.Expedition_Id.Equals(expd)
                      select tr).ToList<ExpeditionDetail>();
                foreach (var n in dt)
                {
                    IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                    where t.Package_Id.Equals(n.Package_Id)
                                                    select t;
                    foreach (Package package in queryable)
                    {
                        package.Package_Quantity = 0;
                        package.Package_Status = 7;
                        package.Package_OutDate = DateTime.Now;
                        package.Package_ReserveQuantity = 0;
                    }
                    this.DBDatos.SubmitChanges();
                    ret = true;
                }

            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int TraeCantidadIncluidos(int expd)
        {
            int ret = 0;
            try
            {
                List<ExpeditionDetail> dt = new List<ExpeditionDetail>();
                dt = (from tr in DBDatos.ExpeditionDetail
                      where tr.Expedition_Id.Equals(expd)
                      select tr).ToList<ExpeditionDetail>();
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


        public int ObtieneEstadoExpedicion(int numExp)
        {

            int res = 0;
            try
            {
                var tem = (from u in DBDatos.Expedition
                           where u.Expedition_Id.Equals(numExp)
                           select new { u.Expedition_Status }).First();
                if (tem != null)
                {
                    res = tem.Expedition_Status;
                }
                return res;
            }
            catch
            {
                return res;

            }
            return res;

        }
        #endregion

        public DataTable SP_TransferenciasEfectuadas(DateTime Fini, DateTime Fterm, string bOrign, string bDestn)

        {

            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDatos.CVT_TRANSFERENCIAS_EFECTUADAS(Fini, Fterm, bOrign, bDestn));
            }
            catch (Exception)
            {

            }
            return ret;
        }


        public DataTable SP_ConsultaPosicion(int idPos)

        {

            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_CONSULTAPOSICION(idPos));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_TrazabilidadProdLote(string codPro, string idlote)

        {

            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_TRAZABILIDADPRODUCTOLOTE(codPro, idlote));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool EliminaBultoExpedicionRapida(string idBulto)
        {
            bool ret = false;
            try
            {
                var temp = from p in DBDatos.ExpeditionDetail
                           where p.Package_SSCC == idBulto
                           select p;
                foreach (var detail in temp)
                {
                    DBDatos.ExpeditionDetail.DeleteOnSubmit(detail);
                }
                DBDatos.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }

        public DataTable SP_DetalleRecepcionDiaria(DateTime Fini, DateTime Fterm)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDatos.CVT_SP_DETALLE_RECEPCIONES_DIARIAS(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int ObtieneIdSitio(String Bodega)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Site
                            where p.Site_ShortDescription.Equals(Bodega)
                            select new { p.Site_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_Id;
                }

            }
            catch
            {
            }
            return ret;
        }
        public int CreaNuevoSector(Sector s)
        {
            int ret = 0;
            try
            {

                DBDatos.Sector.InsertOnSubmit(s);
                DBDatos.SubmitChanges();
                ret = s.Sector_Id;
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public int InsertaNuevaDistribucion(Warehouse nuevo)
        {
            int ret = 0;
            try
            {
                DBDatos.Warehouse.InsertOnSubmit(nuevo);
                DBDatos.SubmitChanges();
                ret = nuevo.Warehouse_Id;

            }
            catch
            {


            }
            return ret;
        }

        public int CreaSitio(Site nuevo)
        {
            int ret = 0;
            try
            {
                DBDatos.Site.InsertOnSubmit(nuevo);
                DBDatos.SubmitChanges();
                ret = nuevo.Site_Id;

            }
            catch
            {


            }
            return ret;
        }

        public int CreaNuevoLayout(Layout nuevo)
        {
            int ret = 0;
            try
            {
                DBDatos.Layout.InsertOnSubmit(nuevo);
                DBDatos.SubmitChanges();
                ret = nuevo.Layout_Id;

            }
            catch
            {


            }
            return ret;
        }
        public bool CierreTransferenciaPROC(int TransferID, int? LayoutID, int StaffID)
        {
            bool ret = false;
            try
            {
                DBDatos.CVT_CierraTransferencia(TransferID, LayoutID, StaffID);
                ret = true;
            }
            catch
            {
                ret = false;
            }
            return ret;
        }

        public DataTable SP_EstadiaProdCV200()
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDatos.CVT_SP_EstadiaProductosCV200());
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int ObtieneMotivoExpedicion(int idExp)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Expedition
                            where s.Expedition_Id.Equals(idExp)
                            select new { s.Expedition_U_Motivo }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Expedition_U_Motivo);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public string ObtieneSiteTransferencia(int TranfID)
        {
            string ret = "";
            try
            {
                var temp = (from e in DBDatos.Transfer
                            join si in DBDatos.Site on e.Site_Id equals si.Site_Id
                            where e.Transfer_Id.Equals(TranfID)
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

        public string ObtieneSiteDestinoTransferencia(int TranfID)
        {
            string ret = "";
            try
            {
                var temp = (from e in DBDatos.Transfer
                            join si in DBDatos.Site on e.Site_Id_Destiny equals si.Site_Id
                            where e.Transfer_Id.Equals(TranfID)
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
        public int TraeTransferEntidad(int TranfID)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Transfer
                            where s.Transfer_Id.Equals(TranfID)
                            select new { s.Transfer_U_Entidad }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Transfer_U_Entidad);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int TraeTransferFolioEnt(int TranfID)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Transfer
                            where s.Transfer_Id.Equals(TranfID)
                            select new { s.Transfer_U_Folio_Entidad }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Transfer_U_Folio_Entidad);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int VerificaFolioEntidad(int FolioEnt)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Layout
                            where s.Layout_Id.Equals(FolioEnt)
                            select new { s.Layout_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Layout_Id);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable Sp_BuscaLotePT(string lote)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDatos.CVT_SP_TRAZABILIDADFumigacion(lote, 3));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int VerificaExisBultosDetExpedicion(int idExp)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.ExpeditionDetail
                            where s.Expedition_Id.Equals(idExp)
                            select new { s.Expedition_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Expedition_Id);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool eliminaExpedicionRapida(int idExp)
        {
            bool ret = false;
            try
            {

                //List<CVT_Tickets_Respuesta> dt = new List<CVT_Tickets_Respuesta>();
                var dt = (from tr in DBDatos.Expedition
                          where tr.Expedition_Id.Equals(idExp)
                          select tr);/*.ToList<CVT_Tickets_Respuesta>();*/
                foreach (var n in dt)
                {
                    //if (n.Id_Ticket == IdTicket)
                    //{
                    DBDatos.Expedition.DeleteOnSubmit(n);
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDatos.SubmitChanges();
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

        public int VerificaLayoutIdPos(int nPosicion, int bodega)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Layout
                            where s.Layout_Id.Equals(nPosicion) && s.Site_Id.Equals(bodega)
                            select new { s.Layout_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Layout_Id);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int TraeSiteIdRecepcion(int nRep)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Reception
                            where s.Reception_Id.Equals(nRep)
                            select new { s.Site_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Site_Id);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int ActualizaLayoutPosMasivo(int recepId, int Ubicacion, int idUserWms)
        {
            //bool ret = false;

            int con = 0;
            try
            {
                List<Package> dt = new List<Package>();
                dt = (from tr in DBDatos.Package
                      join ly in DBDatos.Layout on tr.Layout_Id equals ly.Layout_Id
                      where tr.Reception_Id.Equals(recepId) && (tr.Package_Status.Equals(2) || tr.Package_Status.Equals(3)) 
                      select tr).ToList<Package>();
                foreach (var n in dt)
                {
                    IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                    where t.Package_Id.Equals(n.Package_Id)
                                                    select t;
                    foreach (Package package in queryable)
                    {

                        package.Layout_Id = Ubicacion;
                        package.Package_Status = 3;
                        AddLocation(package.Package_Id, Ubicacion, idUserWms);
                        con++;
                    }
                    this.DBDatos.SubmitChanges();
                }
                //ret = true;
            }
            catch (Exception)
            {


            }
            return con;
        }


        public int TraePaisOFRecepcionPRod(int OFProd)
        {
            int ret = 0;
            try
            {
                var temp = (from op in DBDatos.CVT_PAIS_OF
                            where op.DocNum.Equals(OFProd)
                            select new { op.Country_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Country_Id);
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }

        public DataTable SP_InformeStock(int sitio, string codproducto, string lote)

        {
            if (codproducto == "")
                codproducto = "Todos";
            if (lote == "")
                lote = "Todos";
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_CVT_STOCK(sitio, codproducto, lote));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_TransferenciasXRecepcionar(int sitio)

        {
            
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_TransferenciasXConfirmar(sitio));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int VerificaCodUbicacion(int CodUbica)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Layout
                            where s.Layout_Id.Equals(CodUbica)
                            select new { s.Layout_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Layout_Id);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public bool ActualizaUbicacionPackage(int Npall, int layoutid)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_SSCC.Equals(Npall)
                                                select t;
                foreach (Package package in queryable)
                {
                    package.Package_Status = 3;
                    package.Layout_Id = layoutid;

                }
                this.DBDatos.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaPaisOrigenPackage(int Npall, int countryid)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_SSCC.Equals(Npall)
                                                select t;
                foreach (Package package in queryable)
                {
                    
                    package.Package_Origin = countryid;

                }
                this.DBDatos.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public List<CVT_VW_BultoConReserva> TraeReservaTransPerd(int NPallet)
        {
            List<CVT_VW_BultoConReserva> ret = new List<CVT_VW_BultoConReserva>();

            try
            {

                ret = (from fd in DBDatos.CVT_VW_BultoConReserva
                       where fd.SSCC.Equals(NPallet)
                       select fd).ToList<CVT_VW_BultoConReserva>();
            }
            catch
            {
            }
            return ret;
        }
        public bool ActualizaReservaPackage(int NPallet)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_SSCC.Equals(NPallet)
                                                select t;
                foreach (Package package in queryable)
                {
                    package.Package_ReserveQuantity = 0;
                }
                this.DBDatos.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool insertaCantPalletPedido(int IdPed, int CntBlancos, int CantChep,int cantBlancoChep)
        {
            bool flag = false;
            try
            {
                IQueryable<Order> queryable = from t in this.DBDatos.Order
                                              where t.Order_Id.Equals(IdPed)
                                              select t;
                foreach (Order ord in queryable)
                {
                    ord.Order_U_CantPalletBlanco = CntBlancos;
                    ord.Order_U_CantPalletChep = CantChep;
                    ord.Order_U_CantBlancoTipChep = cantBlancoChep;
                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public int TraeEstadoPedido (int IdPed)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDatos.Order
                            where s.Order_Id.Equals(IdPed)
                            select new { s.Order_Status }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Order_Status);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public string TraeCorreoUsuarioRechazo(int IdTransf)
        {
            string ret ="-1";
            try
            {
                var temp = (from s in DBDesaint.VW_Correos_Rechazo_tranferencia
                            where s.Transfer_Id.Equals(IdTransf)
                            select new { s.MailUsuario }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.MailUsuario;
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int EvaluaTipoBloqueo(int packageid)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Package
                            where r.Package_Id.Equals(packageid)
                            select new { r.ID_TipoBloqueo }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.ID_TipoBloqueo);
                }
            }
            catch (Exception)
            {
                ret = 0;

            }
            return ret;
        }
        public string TraeCodClientBloq(int packageid)
        {
            string ret = "";
            try
            {
                var temp = (from r in DBDatos.Package
                            where r.Package_Id.Equals(packageid)
                            select new { r.CodBloqueoCliente }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CodBloqueoCliente.ToString();
                }
            }
            catch (Exception)
            {
                ret = "";

            }
            return ret;
        }
        public int TraeNumeroTransferenciaRechazo(int ID)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Transfer
                            where r.Type_Id.Equals(3) && r.Transfer_U_TransferOrigin.Equals(ID) && r.Status.Equals(1)
                            select new { r.Transfer_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Transfer_Id;
                }
                else
                {
                    ret = DBDatos.SP_DuplicaTransferencia(ID);
                }
            }
            catch (Exception)
            {
                ret = 0;

            }

            return ret;
        }
        public int ActualizaIDtransferenciPalletRechazado(int transferidrechazo, int packageid, int transferid)
        {
            int ret = 0;
            try
            {
                DBDatos.SP_ActualizaTransferIdRechazo(transferid, packageid, transferidrechazo);
                ret = 1;
            }
            catch
            { 
                ret = 0; 
            }
            return ret;
        }
        public int RegistraPalletRechazado(int transferidrechazo, int packageid, string motivo)
        {
            int ret = 0;
            try
            {
                DBDesaint.SP_ResgistraRechazoTransferencia(packageid, transferidrechazo, motivo);
                ret = 1;
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public DataTable SP_PosicionamientoFecha(DateTime fecha)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_PosicionamientosFecha(fecha));
            }
            catch (Exception)
            {

            }
            return ret;
        }

    }
}
