using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class VentaPersonalClass
    {

        public VentaPersonalClass()
        {
         }

        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTWMSMETRODataContext DBWMSMetro = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext Mmtro = new DBMLCVTMMETRODataContext();

        public List<VW_LIST_CLIENTE_INTERNO> ListaclienteInterno(string RunCliente)
        {
            List<VW_LIST_CLIENTE_INTERNO> ret = new List<VW_LIST_CLIENTE_INTERNO>();
            try
            {
                ret = (from td in Mmtro.VW_LIST_CLIENTE_INTERNO
                       where td.Run.Equals(RunCliente)
                       select td).ToList<VW_LIST_CLIENTE_INTERNO>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int InsertaCabVentaPersonal(SMM_VentaPersonal nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_VentaPersonal.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = nuevo.Id_Venta;

            }
            catch
            {


            }
            return ret;

        }

        public int EliminaProductosVentaPer(int IdVenta)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_VentaPersonal_Detalle
                           where p.Id_Venta.Equals(IdVenta)
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_VentaPersonal_Detalle.DeleteOnSubmit(detail);
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

        public int EliminaVentaP(int IdVenta)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_VentaPersonal
                           where p.Id_Venta.Equals(IdVenta)
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_VentaPersonal.DeleteOnSubmit(detail);
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


        public List<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL> ConsultaProductoVentaPersonal(string CodBarra)
        {
            List<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL> ret = new List<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL>();
            try
            {
                ret = (from td in Mmtro.SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL
                       where td.BcdCode.Equals(CodBarra)
                       select td).ToList<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int validaProdRegistradoVentaPer(string itencode, int idPreventa, string Umed)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_VentaPersonal_Detalle
                            where s.Id_Venta.Equals(idPreventa) && s.Cod_Producto.Equals(itencode) && s.UniMedida.Equals(Umed)
                            select new { s.Id_Venta }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Id_Venta;
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int TraeNOrdenPrevPers(int idPreventa)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_VentaPersonal_Detalle
                            where s.Id_Venta.Equals(idPreventa)
                            select s.ByOrder).Max();

                ret = Convert.ToInt32(temp);

            }
            catch (Exception ex)
            {
                string ms = ex.Message;
            }
            return ret;
        }
        public bool InsertaVentaPerDetalle(SMM_VentaPersonal_Detalle nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_VentaPersonal_Detalle.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;

        }

        public bool ActualizaCantidadVentaPer(int IdPreventa, string ItemCode, int cantidad, string uniMed)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_VentaPersonal_Detalle> queryable = from t in this.DBWMSMetro.SMM_VentaPersonal_Detalle
                                                                  where t.Id_Venta.Equals(IdPreventa) && t.Cod_Producto.Equals(ItemCode) && t.UniMedida.Equals(uniMed)
                                                             select t;
                foreach (SMM_VentaPersonal_Detalle td in queryable)
                {

                    td.Cantidad = td.Cantidad + cantidad;

                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }



        public List<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL> BusquedaProductoSinDun(string CodProducto, string uniMed)
        {
            List<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL> ret = new List<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL>();
            try
            {
                ret = (from td in Mmtro.SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL
                       where td.ItemCode.Equals(CodProducto) && td.UomCode.Equals(uniMed)
                       select td).ToList<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int TraeTotalVenta(string idVentaPer)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_VentaPersonal
                            where s.Id_Venta.Equals(idVentaPer)
                            select new { s.TotalCompra }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.TotalCompra);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }



    }

}
