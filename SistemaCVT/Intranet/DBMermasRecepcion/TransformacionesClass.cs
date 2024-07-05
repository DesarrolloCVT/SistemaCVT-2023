using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class TransformacionesClass
    {
        public TransformacionesClass()
        {
        }
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSAP = new DBMLCVTSAPDataContext();
        public List<CVT_Transformacion_ExpUnidades> ObtieneExpedicionUnidades(int expid)
        {
            List<CVT_Transformacion_ExpUnidades> ret = new List<CVT_Transformacion_ExpUnidades>();
            try
            {
                ret = (from v in DBWMS.CVT_Transformacion_ExpUnidades
                       where v.Expedition_Id.Equals(expid)
                       select v).ToList<CVT_Transformacion_ExpUnidades>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_Transformacion_ExpDesecho> ObtieneExpedicionDesecho(int expid)
        {
            List<CVT_Transformacion_ExpDesecho> ret = new List<CVT_Transformacion_ExpDesecho>();
            try
            {
                ret = (from v in DBWMS.CVT_Transformacion_ExpDesecho
                       where v.Expedition_Id.Equals(expid)
                       select v).ToList<CVT_Transformacion_ExpDesecho>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_Transformacion_ExpReproceso> ObtieneExpedicionReproceso(int expid)
        {
            List<CVT_Transformacion_ExpReproceso> ret = new List<CVT_Transformacion_ExpReproceso>();
            try
            {
                ret = (from v in DBWMS.CVT_Transformacion_ExpReproceso
                       where v.Expedition_Id.Equals(expid)
                       select v).ToList<CVT_Transformacion_ExpReproceso>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_Transformacion_TransUnidades> ObtieneTransferenciaUnidades(int transid)
        {
            List<CVT_Transformacion_TransUnidades> ret = new List<CVT_Transformacion_TransUnidades>();
            try
            {
                ret = (from v in DBWMS.CVT_Transformacion_TransUnidades
                       where v.Transfer_Id.Equals(transid)
                       select v).ToList<CVT_Transformacion_TransUnidades>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_Transformacion_TransDesecho> ObtieneTransferenciaDesecho(int transid)
        {
            List<CVT_Transformacion_TransDesecho> ret = new List<CVT_Transformacion_TransDesecho>();
            try
            {
                ret = (from v in DBWMS.CVT_Transformacion_TransDesecho
                       where v.Transfer_Id.Equals(transid)
                       select v).ToList<CVT_Transformacion_TransDesecho>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_Transformacion_TransReproceso> ObtieneTransferenciaReproceso(int transid)
        {
            List<CVT_Transformacion_TransReproceso> ret = new List<CVT_Transformacion_TransReproceso>();
            try
            {
                ret = (from v in DBWMS.CVT_Transformacion_TransReproceso
                       where v.Transfer_Id.Equals(transid)
                       select v).ToList<CVT_Transformacion_TransReproceso>();
            }
            catch
            {
            }
            return ret;
        }
        public bool CreaDetalleTransformacionAutomacita(int tid, List<CVT_Transformacion_ExpUnidades> dt)
        {
            bool ret = false;
            try
            {
                foreach (var l in dt)
                {
                    CVT_TransformacionDetalle nuevo = new CVT_TransformacionDetalle();
                    nuevo.Transformacion_Id = tid;
                    nuevo.Package_Id = l.Package_Id;
                    nuevo.Package_Quantity = (int)l.Quantity;
                    nuevo.ArticleProvider_Id = l.ArticleProvider_Id;
                    nuevo.ArticleProviderDestiny_Id = l.IDEsperado;
                    nuevo.PackageDestiny_Quantity = (int)l.CantidadEsperada;
                    DBDesaint.CVT_TransformacionDetalle.InsertOnSubmit(nuevo);
                    DBDesaint.SubmitChanges();
                }
            }
            catch
            {
            }
            return ret;
        }
        public bool CreaDetalleTransformacionAutomacita(int tid, List<CVT_Transformacion_ExpDesecho> dt)
        {
            bool ret = false;
            try
            {
                foreach (var l in dt)
                {
                    CVT_TransformacionDetalle nuevo = new CVT_TransformacionDetalle();
                    nuevo.Transformacion_Id = tid;
                    nuevo.Package_Id = l.Package_Id;
                    nuevo.Package_Quantity = (int)l.Quantity;
                    nuevo.ArticleProvider_Id = l.ArticleProvider_Id;
                    nuevo.ArticleProviderDestiny_Id = l.IDEsperado;
                    nuevo.PackageDestiny_Quantity = (int)l.CantidadEsperada;
                    DBDesaint.CVT_TransformacionDetalle.InsertOnSubmit(nuevo);
                    DBDesaint.SubmitChanges();
                }
            }
            catch
            {
            }
            return ret;
        }
        public bool CreaDetalleTransformacionAutomacita(int tid, List<CVT_Transformacion_ExpReproceso> dt)
        {
            bool ret = false;
            try
            {
                foreach (var l in dt)
                {
                    CVT_TransformacionDetalle nuevo = new CVT_TransformacionDetalle();
                    nuevo.Transformacion_Id = tid;
                    nuevo.Package_Id = l.Package_Id;
                    nuevo.Package_Quantity = (int)l.Quantity;
                    nuevo.ArticleProvider_Id = l.ArticleProvider_Id;
                    nuevo.ArticleProviderDestiny_Id = l.IDEsperado;
                    nuevo.PackageDestiny_Quantity = (int)l.CantidadEsperada;
                    DBDesaint.CVT_TransformacionDetalle.InsertOnSubmit(nuevo);
                    DBDesaint.SubmitChanges();
                }
            }
            catch
            {
            }
            return ret;
        }
        public bool CreaDetalleTransformacionAutomacita(int tid, List<CVT_Transformacion_TransUnidades> dt)
        {
            bool ret = false;
            try
            {
                foreach (var l in dt)
                {
                    CVT_TransformacionDetalle nuevo = new CVT_TransformacionDetalle();
                    nuevo.Transformacion_Id = tid;
                    nuevo.Package_Id = l.Package_Id;
                    nuevo.Package_Quantity = (int)l.Quantity;
                    nuevo.ArticleProvider_Id = l.ArticleProvider_Id;
                    nuevo.ArticleProviderDestiny_Id = l.IDEsperado;
                    nuevo.PackageDestiny_Quantity = (int)l.CantidadEsperada;
                    DBDesaint.CVT_TransformacionDetalle.InsertOnSubmit(nuevo);
                    DBDesaint.SubmitChanges();
                }
            }
            catch
            {
            }
            return ret;
        }
        public bool CreaDetalleTransformacionAutomacita(int tid, List<CVT_Transformacion_TransDesecho> dt)
        {
            bool ret = false;
            try
            {
                foreach (var l in dt)
                {
                    CVT_TransformacionDetalle nuevo = new CVT_TransformacionDetalle();
                    nuevo.Transformacion_Id = tid;
                    nuevo.Package_Id = l.Package_Id;
                    nuevo.Package_Quantity = (int)l.Quantity;
                    nuevo.ArticleProvider_Id = l.ArticleProvider_Id;
                    nuevo.ArticleProviderDestiny_Id = l.IDEsperado;
                    nuevo.PackageDestiny_Quantity = (int)l.CantidadEsperada;
                    DBDesaint.CVT_TransformacionDetalle.InsertOnSubmit(nuevo);
                    DBDesaint.SubmitChanges();
                }
            }
            catch
            {
            }
            return ret;
        }
        public bool CreaDetalleTransformacionAutomacita(int tid, List<CVT_Transformacion_TransReproceso> dt)
        {
            bool ret = false;
            try
            {
                foreach (var l in dt)
                {
                    CVT_TransformacionDetalle nuevo = new CVT_TransformacionDetalle();
                    nuevo.Transformacion_Id = tid;
                    nuevo.Package_Id = l.Package_Id;
                    nuevo.Package_Quantity = (int)l.Quantity;
                    nuevo.ArticleProvider_Id = l.ArticleProvider_Id;
                    nuevo.ArticleProviderDestiny_Id = l.IDEsperado;
                    nuevo.PackageDestiny_Quantity = (int)l.CantidadEsperada;
                    DBDesaint.CVT_TransformacionDetalle.InsertOnSubmit(nuevo);
                    DBDesaint.SubmitChanges();
                }
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneMaxTransformacionId()
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBDesaint.CVT_Transformacion
                            orderby t.Transformacion_Id descending
                            select new { t.Transformacion_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Transformacion_Id;
                }
            }
            catch 
            {


            }
            return ret;
        }
        public int ObtieneEstadoTransformacion(int idTrans)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBDesaint.CVT_Transformacion
                            where t.Transformacion_Id.Equals(idTrans)
                            select new { t.Estado }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Estado;
                }
            }
            catch
            {


            }
            return ret;
        }

        public int ObtieneTransformacionAjustada(int trans)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBDesaint.CVT_TransformacionAjustada
                            where t.Transformacion_Id.Equals(trans)
                            select new { t.Transformacion_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Transformacion_Id;
                }
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }
        public int ObtieneTipoTransformacion(int Id)
        {
            int ret = 0;
            var temp = (from t in DBDesaint.CVT_Transformacion
                        where t.Transformacion_Id.Equals(Id)
                        select new { t.Tipo }).FirstOrDefault();
            if (temp != null)
            {
                ret = temp.Tipo;
            }
            return ret;
        }
        public int ObtieneEntidadTransformacion(int Id)
        {
            int ret = 0;
            var temp = (from t in DBDesaint.CVT_Transformacion
                        where t.Transformacion_Id.Equals(Id)
                        select new { t.Entidad }).FirstOrDefault();
            if (temp != null)
            {
                ret = (int)temp.Entidad;
            }
            return ret;
        }
        public bool EliminaDetTransformacion(int iddet)
        {
            bool ret = false;
            try
            {
                var detail = from td in DBDesaint.CVT_TransformacionDetalle
                             where td.TransformacionDet_Id.Equals(iddet)
                             select td;
                foreach (var d in detail)
                {
                    DBDesaint.CVT_TransformacionDetalle.DeleteOnSubmit(d);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {
                
               
            }
            return ret;
        }
        public List<CVT_Transformacion> ObtieneTransformacion(int Id)
        {
            List<CVT_Transformacion> ret =new List<CVT_Transformacion>();
            try
            {
                ret = (from t in DBDesaint.CVT_Transformacion
                            where t.Transformacion_Id.Equals(Id)
                            select t).ToList<CVT_Transformacion>();
            }
            catch
            {
            }
           
            return ret;
        }
        public List<CVT_View_TransformacionDetalle> ObtieneTransformacionDetalle(int Id)
        {
            List<CVT_View_TransformacionDetalle> ret = new List<CVT_View_TransformacionDetalle>();
            try
            {
                ret = (from t in DBDesaint.CVT_View_TransformacionDetalle
                        where t.Transformacion_Id.Equals(Id)
                        select t).ToList<CVT_View_TransformacionDetalle>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_VIEW_transformacionDetalleEntradaSAP> ObtieneTransformacionDetalleEntrada(int Id)
        {
            List<CVT_VIEW_transformacionDetalleEntradaSAP> ret = new List<CVT_VIEW_transformacionDetalleEntradaSAP>();
            ret = (from t in DBDesaint.CVT_VIEW_transformacionDetalleEntradaSAP
                        where t.Transformacion_Id.Equals(Id)
                        select t).ToList<CVT_VIEW_transformacionDetalleEntradaSAP>();

            return ret;
        }
        public List<CVT_VIEW_TransformacionDetalleEntradaLotesSAP> ObtieneTransformacionDetalleEntradaLotes(int Id, int artid, string oring, string sscc)
        {
            List<CVT_VIEW_TransformacionDetalleEntradaLotesSAP> ret = new List<CVT_VIEW_TransformacionDetalleEntradaLotesSAP>();
            ret = (from t in DBDesaint.CVT_VIEW_TransformacionDetalleEntradaLotesSAP
                        where t.Transformacion_Id.Equals(Id) && t.ArticleProviderDestiny_Id.Equals(artid)&& t.Origen.Equals(oring) && t.Package_SSCC.Equals(sscc)
                        select t).ToList<CVT_VIEW_TransformacionDetalleEntradaLotesSAP>();

            return ret;
        }
        public List<CVT_VIEW_TransformacionDetalleSalidaSAP> ObtieneTransformacionDetalleSalida(int Id)
        {
            List<CVT_VIEW_TransformacionDetalleSalidaSAP> ret = new List<CVT_VIEW_TransformacionDetalleSalidaSAP>();
            ret = (from t in DBDesaint.CVT_VIEW_TransformacionDetalleSalidaSAP
                        where t.Transformacion_Id.Equals(Id)
                        select t).ToList<CVT_VIEW_TransformacionDetalleSalidaSAP>();

            return ret;
        }
        public List<CVT_VIEW_TransformacionDetalleSalLotesSAP> ObtieneTransformacionDetalleSalidaLote(int Id, int artid)
        {
            List<CVT_VIEW_TransformacionDetalleSalLotesSAP> ret = new List<CVT_VIEW_TransformacionDetalleSalLotesSAP>();
            ret = (from t in DBDesaint.CVT_VIEW_TransformacionDetalleSalLotesSAP
                        where t.Transformacion_Id.Equals(Id) && t.ArticleProvider_Id.Equals(artid)
                        select t).ToList<CVT_VIEW_TransformacionDetalleSalLotesSAP>();

            return ret;
        }
        public bool AgregaIdPackageTransformado(int iddet, int idpk)
        {
            bool ret = false;
            IQueryable<CVT_TransformacionDetalle> queryable = from t in this.DBDesaint.CVT_TransformacionDetalle
                                            where t.TransformacionDet_Id.Equals(iddet)
                                            select t;
            foreach (CVT_TransformacionDetalle tr in queryable)
            {
                tr.PackageDestiny_Id = idpk;
            }
            this.DBDesaint.SubmitChanges();
            return ret;
        }
        public bool AgregaDetalle(CVT_TransformacionDetalle nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_TransformacionDetalle.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public int ValidaPalletExiste(int transformacionId, int pkId)
        {
            int ret = 0;
            try
            {
                var temp = (from td in DBDesaint.CVT_TransformacionDetalle
                            where td.Transformacion_Id.Equals(transformacionId) && td.Package_Id.Equals(pkId)
                            select new { td.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Package_Id;
            }
            catch (Exception)
            {
                ret = 0;
               
            }
            return ret;
        }
        public bool CierraTransformacion(int transformacionId)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_Transformacion> queryable = from t in this.DBDesaint.CVT_Transformacion
                                                where t.Transformacion_Id.Equals(transformacionId)
                                                select t;
                foreach (CVT_Transformacion tr in queryable)
                {
                    tr.Estado = 2;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool AgregaPalletDestinoTransformacion(int transformacionId, int pkid, int pkdid)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_TransformacionDetalle> queryable = from t in this.DBDesaint.CVT_TransformacionDetalle
                                                           where t.Transformacion_Id.Equals(transformacionId) && t.Package_Id.Equals(pkid)
                                                           select t;
                foreach (CVT_TransformacionDetalle tr in queryable)
                {
                    tr.PackageDestiny_Id = pkdid;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int VerificaExpedicionTransformacion(int expedicion_id)
        {
            int ret = 0;
            try
            {
                var temp = (from e in DBDesaint.CVT_ExpedicionesTransformadas
                            where e.Expedicion_Id.Equals(expedicion_id)
                            select new { e.Expedicion_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Expedicion_Id;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public List<CVT_VW_ResumenExpedicionEncSalida> ObtieneResumenExpedicionEncSalida(int expId)
        {
            List<CVT_VW_ResumenExpedicionEncSalida> ret = new List<CVT_VW_ResumenExpedicionEncSalida>();
            try
            {
                ret = (from re in DBWMS.CVT_VW_ResumenExpedicionEncSalida
                       where re.Expedition_Id.Equals(expId)
                       select re).ToList<CVT_VW_ResumenExpedicionEncSalida>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_VW_ResumenExpedicionEncEntrada> ObtieneResumenExpedicionEncEntrada(int expId)
        {
            List<CVT_VW_ResumenExpedicionEncEntrada> ret = new List<CVT_VW_ResumenExpedicionEncEntrada>();
            try
            {
                ret = (from re in DBWMS.CVT_VW_ResumenExpedicionEncEntrada
                       where re.Expedition_Id.Equals(expId)
                       select re).ToList<CVT_VW_ResumenExpedicionEncEntrada>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_VW_ResumenExpedicion> ObtieneResumenExpedicionSalida(int expId, string codproducto)
        {
            List<CVT_VW_ResumenExpedicion> ret = new List<CVT_VW_ResumenExpedicion>();
            try
            {
                ret = (from re in DBWMS.CVT_VW_ResumenExpedicion
                       where re.Expedition_Id.Equals(expId) && re.ArticleProvider_CodClient.Equals(codproducto)
                       select re).ToList<CVT_VW_ResumenExpedicion>();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_VW_ResumenExpedicion> ObtieneResumenExpedicionEntrada(int expId, string codproducto)
        {
            List<CVT_VW_ResumenExpedicion> ret = new List<CVT_VW_ResumenExpedicion>();
            try
            {
                ret = (from re in DBWMS.CVT_VW_ResumenExpedicion
                       where re.Expedition_Id.Equals(expId) && re.CODUnitario.Equals(codproducto)
                       select re).ToList<CVT_VW_ResumenExpedicion>();
            }
            catch
            {
            }
            return ret;
        }
        public bool AgregaExpedicionTransformada(CVT_ExpedicionesTransformadas nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ExpedicionesTransformadas.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public DataTable SP_InfTransformacionesFull(DateTime fdesde,DateTime fhasta, int nTransform)

        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_SP_TRANSFORMACIONES_TODAS(fdesde,fhasta,nTransform));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int CuentaDetalleTransformacion(int IdTransformacion)
        {
            int ret = 0;
            try
            {
                var temp = (from td in DBDesaint.CVT_TransformacionDetalle
                            where td.Transformacion_Id.Equals(IdTransformacion)
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
        public bool CambiaEstadoTransformacion(int IdTransformacion, int Estado)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_Transformacion> queryable = from t in this.DBDesaint.CVT_Transformacion
                                                 where t.Transformacion_Id.Equals(IdTransformacion)
                                                 select t;
                foreach (CVT_Transformacion tr in queryable)
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

        public List<CVT_TransformacionDetalle> ObtieneDetalleTransformacion(int transforid)
        {
            List<CVT_TransformacionDetalle> ret = new List<CVT_TransformacionDetalle>();
            try
            {
                ret = (from td in DBDesaint.CVT_TransformacionDetalle
                       where td.Transformacion_Id.Equals(transforid)
                       select td).ToList<CVT_TransformacionDetalle>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool EliminaBultoTransformacion(int transforId, int packageid)
        {
            bool ret = false;
            try
            {
                var t = from td in DBDesaint.CVT_TransformacionDetalle
                        where td.Package_Id.Equals(packageid) && td.Transformacion_Id.Equals(transforId)
                        select td;
                foreach (var detail in t)
                {
                    DBDesaint.CVT_TransformacionDetalle.DeleteOnSubmit(detail);
                }
                DBDesaint.SubmitChanges();
             

                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

    }
}
