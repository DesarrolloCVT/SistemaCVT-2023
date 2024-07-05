using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class BloqueoProductoClass
    {
        public BloqueoProductoClass() { }
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatoswms = new DBMLCVTWMSDataContext();

        public string insertaRegBloqueo(CVT_Producto_Bloqueado nuevo)
        {
            string ret = "-1";
            try
            {
                DBDESAINT.CVT_Producto_Bloqueado.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = "Creado";
            }
            catch (Exception ex)
            {
                ret = ex.Message;

            }
            return ret;
        }

        public List<CVT_VW_FiltroDetProdBloqueado> ObtieneFiltroBP(int nRecep, int Npallet, string CodPro, string Lote)
        {

            List<CVT_VW_FiltroDetProdBloqueado> ret = new List<CVT_VW_FiltroDetProdBloqueado>();
            try
            {

                ret = (from f in DBDESAINT.CVT_VW_FiltroDetProdBloqueado
                       where (f.NumRecepcion.Equals(nRecep) || nRecep == 0) &&
                             (f.CodProducto.Equals(CodPro) || CodPro == string.Empty) &&
                             (f.Lote.Equals(Lote) || Lote == string.Empty) &&
                             (f.NumPallet.Equals(Npallet) || Npallet == 0) orderby f.NumPallet ascending
                       select f).ToList<CVT_VW_FiltroDetProdBloqueado>();

            }
            catch (Exception)
            {


            }
            return ret;
        }

        public List<CVT_Producto_Bloqueado_Detalle> ObtieneListaProdDetalle(int ID_bloqueo)
        {

            List<CVT_Producto_Bloqueado_Detalle> ret = new List<CVT_Producto_Bloqueado_Detalle>();
            try
            {

                ret = (from f in DBDESAINT.CVT_Producto_Bloqueado_Detalle
                       where f.Id_ProdBloqueado.Equals(ID_bloqueo) && f.FechaLiberacion.Equals(null) 
                      
                       select f).ToList<CVT_Producto_Bloqueado_Detalle>();
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool AgregaBultoPBDetalle(int ID_PBloqueado, int TipoBloqueo, int packageid, string CliBloqueo, int idUsuBloqueo)
        {
            bool ret = false;
           try
            {
                CVT_Producto_Bloqueado_Detalle pbd = new CVT_Producto_Bloqueado_Detalle();
                pbd.Id_ProdBloqueado = ID_PBloqueado;
                pbd.Id_package = packageid;
                pbd.FechaBloqueo = DateTime.Now;
                pbd.ID_UsuarioBloqueo = idUsuBloqueo;
                DBDESAINT.CVT_Producto_Bloqueado_Detalle.InsertOnSubmit(pbd);
                DBDESAINT.SubmitChanges();

                IQueryable<Package> queryable = from t in this.DBDatoswms.Package
                                                where t.Package_Id.Equals(packageid)
                                                select t;
                foreach (Package package in queryable)
                {
                    package.Package_QualityStatus = 2;
                    package.ID_TipoBloqueo = TipoBloqueo;
                    package.CodBloqueoCliente = CliBloqueo;
                }
                this.DBDatoswms.SubmitChanges();


                //Reserve vRE = new Reserve();
                //vRE.Company_Id = 1;
                //vRE.Package_Id = packageid;
                //vRE.Layout_Id = layoutid;
                //vRE.ArticleProvider_Id = artId;
                //vRE.Lot = lote;
                //vRE.Reserve_Quantity = cantidad;
                //vRE.Reserve_Status = 1;
                //vRE.Reserve_Date = DateTime.Now;
                //vRE.Staff_Id = ObtieneIdStaff(username);
                //vRE.Transfer_Id = transferid;

                //DBDatos.Reserve.InsertOnSubmit(vRE);
                //DBDatos.SubmitChanges();
                ret = true;

            }
            catch (Exception er)
            {
                string error = er.Message;

            }
            return ret;
        }

        public int TraeTipoBloqueo(int idbloqueo)
        {
            int ret =0;
            try
            {
                var temp = (from td in DBDESAINT.CVT_Producto_Bloqueado
                            where td.Id_ProdBloqueado.Equals(idbloqueo)
                            select new { td.Id_TipoBloqueo }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Id_TipoBloqueo);
            }
            catch
            {
                return ret;
            }
            return ret;
        }

        public string TraeCodCliBloqueo(int idbloqueo)
        {
            string ret ="-1";
            try
            {
                var temp = (from td in DBDESAINT.CVT_Producto_Bloqueado
                            where td.Id_ProdBloqueado.Equals(idbloqueo)
                            select new { td.CodCliente }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.CodCliente);
            }
            catch
            {
                return ret;
            }
            return ret;
        }

        public List<CVT_Producto_Bloqueado_Detalle> ObtieneDetalleBloqueoProducto(int bpID)
        {
            List<CVT_Producto_Bloqueado_Detalle> ret = new List<CVT_Producto_Bloqueado_Detalle>();
            try
            {
                ret = (from td in DBDESAINT.CVT_Producto_Bloqueado_Detalle
                       where td.Id_ProdBloqueado.Equals(bpID)
                       select td).ToList<CVT_Producto_Bloqueado_Detalle>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool EliminaBultoDetableBloqueo(int bpID, int packageid)
        {
            bool ret = false;
            try
            {
                var t = from td in DBDESAINT.CVT_Producto_Bloqueado_Detalle
                        where td.Id_package.Equals(packageid) && td.Id_ProdBloqueado.Equals(bpID)
                        select td;
                foreach (var detail in t)
                {
                    DBDESAINT.CVT_Producto_Bloqueado_Detalle.DeleteOnSubmit(detail);
                }
                DBDESAINT.SubmitChanges();

                IQueryable<Package> queryable = from p in this.DBDatoswms.Package
                                                where p.Package_Id.Equals(packageid)
                                                select p;
                foreach (Package package in queryable)
                {
                    package.Package_QualityStatus = 1;
                    package.ID_TipoBloqueo = null;
                    package.CodBloqueoCliente = null;
                }
                this.DBDatoswms.SubmitChanges();


                //var reserve = from r in DBDatos.Reserve
                //              where r.Package_Id.Equals(packageid) && r.Transfer_Id.Equals(transferid)
                //              select r;
                //foreach (var detail in reserve)
                //{
                //    DBDatos.Reserve.DeleteOnSubmit(detail);
                //}
                //DBDatos.SubmitChanges();

                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool EliminaBultoBloqueo(int IdDetBloqueo, int packageid)
        {
            bool ret = false;
            try
            {
                var t = from td in DBDESAINT.CVT_Producto_Bloqueado_Detalle
                        where td.Id_package.Equals(packageid) && td.Id_ProdBloqDetalle.Equals(IdDetBloqueo)
                        select td;
                foreach (var detail in t)
                {
                    DBDESAINT.CVT_Producto_Bloqueado_Detalle.DeleteOnSubmit(detail);
                }
                DBDESAINT.SubmitChanges();

                IQueryable<Package> queryable = from p in this.DBDatoswms.Package
                                                where p.Package_Id.Equals(packageid)
                                                select p;
                foreach (Package package in queryable)
                {

                    package.Package_QualityStatus = 1;
                    package.ID_TipoBloqueo = null;
                    package.CodBloqueoCliente = null;
                }
                this.DBDatoswms.SubmitChanges();


                //var reserve = from r in DBDatos.Reserve
                //              where r.Package_Id.Equals(packageid) && r.Transfer_Id.Equals(transferid)
                //              select r;
                //foreach (var detail in reserve)
                //{
                //    DBDatos.Reserve.DeleteOnSubmit(detail);
                //}
                //DBDatos.SubmitChanges();

                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string TraeNombreTipoBloqueo(int idTipoBloq)
        {
            string ret = "";
            try
            {
                var temp = (from td in DBDESAINT.CVT_Producto_TipoBloqueo
                            where td.Id_TipoBloqueo.Equals(idTipoBloq)
                            select new { td.Descripcion }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Descripcion.ToString();
            }
            catch
            {
                return ret;
            }
            return ret;
        }

        public string LiberaBultoBloqueo(int IdDetBloqueo, int packageid,int IdBloqueo, int idUserLibera)
        {
            string ret = "-1";
            int CantBloq = 0;
            int idBloq = IdBloqueo;
            try
            {
                var t = from td in DBDESAINT.CVT_Producto_Bloqueado_Detalle
                        where td.Id_package.Equals(packageid) && td.Id_ProdBloqDetalle.Equals(IdDetBloqueo)
                        select td;
                foreach (var detail in t)
                {
                    detail.FechaLiberacion = DateTime.Now;
                    detail.ID_UsuarioLiberacion = idUserLibera;
                }
                DBDESAINT.SubmitChanges();

                IQueryable<Package> queryable = from p in this.DBDatoswms.Package
                                                where p.Package_Id.Equals(packageid)
                                                select p;
                foreach (Package package in queryable)
                {

                    package.Package_QualityStatus = 1;
                    package.ID_TipoBloqueo = null;
                    package.CodBloqueoCliente = null;
                }
                this.DBDatoswms.SubmitChanges();


                var temp = (from td in DBDESAINT.CVT_Producto_Bloqueado_Detalle
                            where td.Id_ProdBloqueado.Equals(IdBloqueo) && td.FechaLiberacion.Equals(null)
                            select td).Count();
                if (temp != null)
                {
                    CantBloq = Convert.ToInt32(temp);

                    if (CantBloq == 0)
                    {
                        IQueryable<CVT_Producto_Bloqueado> queryable2 = from prb in this.DBDESAINT.CVT_Producto_Bloqueado
                                                                        where prb.Id_ProdBloqueado.Equals(idBloq)
                                                                        select prb;
                        foreach (CVT_Producto_Bloqueado bloq in queryable2)
                        {
                            bloq.Estado = 2;
                            bloq.FechaTerminoBloqueo = DateTime.Now;
                            bloq.IdUsuarioLibera = idUserLibera;
                        }
                        this.DBDESAINT.SubmitChanges();
                    }
                }
                //var reserve = from r in DBDatos.Reserve
                //              where r.Package_Id.Equals(packageid) && r.Transfer_Id.Equals(transferid)
                //              select r;
                //foreach (var detail in reserve)
                //{
                //    DBDatos.Reserve.DeleteOnSubmit(detail);
                //}
                //DBDatos.SubmitChanges();

                ret = "0";
            }
            catch (Exception)
            {


            }
            return ret;
        }


        public int TraeIdLibera(int idBloqueo)
        {
            int ret = 0;
            try
            {
                var temp = (from td in DBDESAINT.CVT_Producto_Bloqueado_Detalle
                            where td.Id_ProdBloqDetalle.Equals(idBloqueo)
                            select new { td.ID_UsuarioLiberacion }).FirstOrDefault();
                if (temp != null)
                    ret =Convert.ToInt32(temp.ID_UsuarioLiberacion);
            }
            catch
            {
                return ret;
            }
            return ret;
        }


        public int TraeEstadoCabBloqueo(int idBloqueo)
        {
            int ret = 0;
            try
            {
                var temp = (from td in DBDESAINT.CVT_Producto_Bloqueado
                            where td.Id_ProdBloqueado.Equals(idBloqueo)
                            select new { td.Estado }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Estado);
            }
            catch
            {
                return ret;
            }
            return ret;
        }
    }
}
