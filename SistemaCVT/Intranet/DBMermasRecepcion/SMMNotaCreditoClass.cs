using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class SMMNotaCreditoClass
    {
        public SMMNotaCreditoClass() { }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTWMSMETRODataContext DBWMSMetro = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext Mmtro = new DBMLCVTMMETRODataContext();


        public bool ActualizaTipoNC(int NCID)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_NotaCredito_DatoCliente> queryable = from t in this.DBWMSMetro.SMM_NotaCredito_DatoCliente
                                                     where t.ID_NotaCredito.Equals(NCID)
                                                     select t;
                foreach (SMM_NotaCredito_DatoCliente td in queryable)
                {

                    td.TipoNC = 3;


                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public List<VW_SMM_DATO_CLIENTES_NOTACREDITO> ListaDatoCliente(int FolioNota,string tipoDocumento)
        {
            List<VW_SMM_DATO_CLIENTES_NOTACREDITO> ret = new List<VW_SMM_DATO_CLIENTES_NOTACREDITO>();
            try
            {
                ret = (from td in DBWMSMetro.VW_SMM_DATO_CLIENTES_NOTACREDITO
                       where td.FolioNum.Equals(FolioNota) && td.DocSubType.Equals(tipoDocumento)
                       select td).ToList<VW_SMM_DATO_CLIENTES_NOTACREDITO>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public List<VW_SMM_DATO_PRODUCTOS_NOTACREDITO> ListaDatoProductos(int idVenta)
        {
            List<VW_SMM_DATO_PRODUCTOS_NOTACREDITO> ret = new List<VW_SMM_DATO_PRODUCTOS_NOTACREDITO>();
            try
            {
                ret = (from td in DBWMSMetro.VW_SMM_DATO_PRODUCTOS_NOTACREDITO
                       where td.DocEntry.Equals(idVenta) 
                       select td).ToList<VW_SMM_DATO_PRODUCTOS_NOTACREDITO>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int InsertaDatosClienteNota(SMM_NotaCredito_DatoCliente nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_NotaCredito_DatoCliente.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = nuevo.ID_NotaCredito;
            }
            catch
            {
            }
            return ret;
        }
        public int InsertaDatoCompra(SMM_NotaCredito_DatoCompra nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_NotaCredito_DatoCompra.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = nuevo.ID_NotaCredito;
            }
            catch
            {
            }
            return ret;
        }
        public int InsertaDatoPago(SMM_NotaCredito_DetallePago nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_NotaCredito_DetallePago.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret =Convert.ToInt32(nuevo.ID_Detalle_PagoNota);
            }
            catch
            {
            }
            return ret;
        }

        public string TraeMontoCompra(int IdNotaCre)
        {
            string ret = "0";
            try
            {
                var temp = (from s in DBWMSMetro.VW_MONTO_NOTACREDITO
                            where s.ID_NotaCredito.Equals(IdNotaCre)
                            select new { s.MontoCompra }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.MontoCompra.ToString();
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int EliminaDatoCliente(int NotaID)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_NotaCredito_DatoCliente
                           where p.ID_NotaCredito.Equals(NotaID)
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_NotaCredito_DatoCliente.DeleteOnSubmit(detail);
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

        public int EliminaDatoCompra(int NotaID)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_NotaCredito_DatoCompra
                           where p.ID_NotaCredito.Equals(NotaID)
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_NotaCredito_DatoCompra.DeleteOnSubmit(detail);
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
    }
}
