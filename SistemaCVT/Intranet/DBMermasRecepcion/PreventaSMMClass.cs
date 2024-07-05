using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
   public class PreventaSMMClass
    {
        public PreventaSMMClass()
        {
        }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTWMSMETRODataContext DBWMSMetro = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext Mmtro = new DBMLCVTMMETRODataContext();

        #region Preventa SMM

        public List<SMM_VW_DATO_BUSCAPROD_PREVENTA> ConsultaProductoPreventa(string CodBarra)
        {
            List<SMM_VW_DATO_BUSCAPROD_PREVENTA> ret = new List<SMM_VW_DATO_BUSCAPROD_PREVENTA>();
            try
            {
                ret = (from td in Mmtro.SMM_VW_DATO_BUSCAPROD_PREVENTA
                       where td.BcdCode.Equals(CodBarra)
                       select td).ToList<SMM_VW_DATO_BUSCAPROD_PREVENTA>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool InsertaPreventaDetalle(SMM_Preventa_Detalle nuevo)
        {
            bool ret = false;
            try
            {
                DBWMSMetro.SMM_Preventa_Detalle.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;

        }

        public int CuentaLineaProducto(int NPrev)
        {
            int ret = 0;
            try
            {
                ret = (from s in DBWMSMetro.SMM_Preventa_Detalle
                            where s.Preventa_ID.Equals(NPrev)
                            select new{ s.CodBarra }).Count();               
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int validaProdRegistradoPreVenta(string itencode, int idPreventa,string Umed)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Preventa_Detalle
                            where s.Preventa_ID.Equals(idPreventa) && s.CodProducto.Equals(itencode) && s.UniMedida.Equals(Umed)
                            select new { s.Preventa_ID }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Preventa_ID;
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }


        public bool ActualizaCantidadPreventa(int IdPreventa, string ItemCode, int cantidad,string uniMed)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Preventa_Detalle> queryable = from t in this.DBWMSMetro.SMM_Preventa_Detalle
                                                             where t.Preventa_ID.Equals(IdPreventa) && t.CodProducto.Equals(ItemCode) && t.UniMedida.Equals(uniMed)
                                                             select t;
                foreach (SMM_Preventa_Detalle td in queryable)
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

        public List<SMM_VW_INFO_CLIENTE_PREVENTA> ConsultaClientePreventa(string runCliente)
        {
            List<SMM_VW_INFO_CLIENTE_PREVENTA> ret = new List<SMM_VW_INFO_CLIENTE_PREVENTA>();
            try
            {
                ret = (from td in DBWMSMetro.SMM_VW_INFO_CLIENTE_PREVENTA
                       where td.RutCliente.Contains(runCliente) || td.NombreCliente.Contains(runCliente)
                       select td).ToList<SMM_VW_INFO_CLIENTE_PREVENTA>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int TraeGrupoCliente(string Codcliente)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_VW_INFO_CLIENTE_PREVENTA
                            where s.CodCliente.Equals(Codcliente)
                            select new { s.CodGrupCliente }).FirstOrDefault();
                if (temp != null)
                {
                    ret =Convert.ToInt32(temp.CodGrupCliente);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public string VerificaDireccionCliente(string Codcliente,string tipoDir)
        {
            string ret = "0";
            try
            {
                var temp = (from s in DBWMSMetro.VW_DIRECCIONES_CLIENTES_SAP
                            where s.CardCode.Equals(Codcliente)&&s.AdresType.Equals(tipoDir)
                            select new { s.CodDireccion }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.CodDireccion);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public List<SMM_VW_INFO_CLIENTE_PREVENTA> ConsultaClientePreventaNuevo(string runCliente)
        {
            List<SMM_VW_INFO_CLIENTE_PREVENTA> ret = new List<SMM_VW_INFO_CLIENTE_PREVENTA>();
            try
            {
                ret = (from td in DBWMSMetro.SMM_VW_INFO_CLIENTE_PREVENTA
                       where td.RutCliente.Equals(runCliente)
                       select td).ToList<SMM_VW_INFO_CLIENTE_PREVENTA>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int InsertaPreventaCabecera(SMM_Preventa nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_Preventa.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = nuevo.Preventa_ID;

            }
            catch
            {


            }
            return ret;

        }

        public List<SMM_VW_DATO_BUSCAPROD_PREVENTA> BusquedaProductoSinDun(string CodProducto, string uniMed)
        {
            List<SMM_VW_DATO_BUSCAPROD_PREVENTA> ret = new List<SMM_VW_DATO_BUSCAPROD_PREVENTA>();
            try
            {
                ret = (from td in Mmtro.SMM_VW_DATO_BUSCAPROD_PREVENTA
                       where td.ItemCode.Equals(CodProducto) && td.UomCode.Equals(uniMed)
                       select td).ToList<SMM_VW_DATO_BUSCAPROD_PREVENTA>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string InsertaNuevoCliente(SMM_Clientes nuevo)
        {
            string ret = "";
            try
            {
                DBWMSMetro.SMM_Clientes.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = nuevo.Rut;

            }
            catch
            {


            }
            return ret;

        }
        public int InsertaNuevoClienteContacto(SMM_Clientes_Contacto nuevo)
        {
            int ret = 0;
            try
            {
                DBWMSMetro.SMM_Clientes_Contacto.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = nuevo.IDContacto;

            }
            catch
            {


            }
            return ret;

        }
        public string InsertaDireccionCliente(SMM_Clientes_Direccion nuevo)
        {
            string ret = "";
            try
            {
                DBWMSMetro.SMM_Clientes_Direccion.InsertOnSubmit(nuevo);
                DBWMSMetro.SubmitChanges();
                ret = nuevo.CodCliente;

            }
            catch
            {


            }
            return ret;

        }

        public int EliminaProductosPreventa(int PreventaId)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_Preventa_Detalle
                           where p.Preventa_ID == PreventaId
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_Preventa_Detalle.DeleteOnSubmit(detail);
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

        public int EliminaPreventa(int PreventaId)
        {
            int ret = 0;
            try
            {
                var temp = from p in DBWMSMetro.SMM_Preventa
                           where p.Preventa_ID == PreventaId
                           select p;
                foreach (var detail in temp)
                {
                    DBWMSMetro.SMM_Preventa.DeleteOnSubmit(detail);
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

        public bool ActualizaEstadoPreventa(int PreventID, int estado)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Preventa> queryable = from t in this.DBWMSMetro.SMM_Preventa
                                                     where t.Preventa_ID.Equals(PreventID)
                                                     select t;
                foreach (SMM_Preventa td in queryable)
                {

                    td.Estado = estado;
                    td.FechaRegistro = DateTime.Now;
                   

                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaTipoVenta(int PreventID, string Tipo)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Preventa> queryable = from t in this.DBWMSMetro.SMM_Preventa
                                                     where t.Preventa_ID.Equals(PreventID)
                                                     select t;
                foreach (SMM_Preventa td in queryable)
                {

                    td.TipoVenta = Tipo;


                }
                this.DBWMSMetro.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaDescuentoPrev(int IdPreventa, string ItemCode,string uniMed,int desc)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Preventa_Detalle> queryable = from t in this.DBWMSMetro.SMM_Preventa_Detalle
                                                             where t.Preventa_ID.Equals(IdPreventa) && t.CodProducto.Equals(ItemCode) && t.UniMedida.Equals(uniMed)
                                                             select t;
                foreach (SMM_Preventa_Detalle td in queryable)
                {

                    td.Descuento =desc;

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


        public int TraeNOrdenPrev(int idPreventa)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Preventa_Detalle
                            where s.Preventa_ID.Equals(idPreventa)
                            select  s.ByOrder ).Max();

                ret =Convert.ToInt32(temp);
               
            }
            catch (Exception ex)
            {
                string ms = ex.Message;
            }
            return ret;
        }
        #endregion
        public DataTable SP_HistorialPreventas(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                DBWMSMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBWMSMetro.SP_HISTORIAL_PREVENTAS(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }


        public string TraeCodClientPromo(int NPrev)
        {
            string ret = "";
            try
            {
                var temp = (from s in DBWMSMetro.VW_SMM_ClientesDescPromo
                       where s.Preventa_ID.Equals(NPrev)
                       select new { s.CodigoCliente }).FirstOrDefault();

                if (temp != null)
                {
                    ret = Convert.ToString(temp.CodigoCliente);
                }
            }
            catch (Exception)
            {
                ret = "";
            }
            return ret;
        }


        //public bool InserteDatAjustDocument(SMM_AjusteDocumento nuevo)
        //{
        //    bool ret = false;
        //    try
        //    {
        //        DBWMSMetro.SMM_AjusteDocumento.InsertOnSubmit(nuevo);
        //        DBWMSMetro.SubmitChanges();
        //        ret = true;

        //    }
        //    catch
        //    {


        //    }
        //    return ret;

        //}

        public int VerificaDocAjustado(int NPrev)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_AjusteDocumento
                            where s.PreventaID.Equals(NPrev)
                            select new { s.PreventaID }).FirstOrDefault();

                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.PreventaID);
                }
            }
            catch (Exception)
            {
                ret = 0;
            }
            return ret;
        }


        public void InsertaDatAjustDocument(int idPrev,int idUser)

        {
           // DataTable ret = new DataTable();
            try
            {
                DBWMSMetro.CommandTimeout = 6000;
                DBWMSMetro.SP_GrabaAjusteDocumento(idPrev, idUser);
            }
            catch (Exception ex)
            {
                string ms = ex.Message;
            }
           // return ret;
        }




    }
}
