using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class ComexClass
    {
        public ComexClass()
        {
        }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        public bool InsertaDetalleCostos(CVT_DetalleCostosImportacion nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_DetalleCostosImportacion.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public int ValidaExistenPreciosEntrega(int OC)
        {
            int ret = 0;
            try
            {
                var temp = (from o in DBSap.OIPF
                            join i in DBSap.IPF1 on o.DocEntry equals i.DocEntry
                            join p in DBSap.PDN1
                                  on new { BaseType = Convert.ToInt32(i.BaseType), BaseEntry = Convert.ToInt32(i.BaseEntry) }
                              equals new { BaseType = Convert.ToInt32(p.ObjType), BaseEntry = p.DocEntry }
                            join f in DBSap.PCH1
                             on new { BaseType = Convert.ToInt32(p.BaseType), BaseEntry = Convert.ToInt32(p.BaseEntry) }
                              equals new { BaseType = Convert.ToInt32(f.ObjType), BaseEntry = f.DocEntry }
                            where f.BaseEntry == OC
                            select new
                            {
                                o.DocNum
                            }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocNum);
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public int InsertaPreRecepcion(CVT_PreRecepcion nuevo)
        {
            int ret = 0;
            try
            {
                DBDesaint.CVT_PreRecepcion.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = nuevo.PreRecepcion_Id;
            }
            catch
            {
            }
            return ret;
        }

        public DataTable SP_ComprasinternacionalesProgramaSemanal(DateTime Fini, DateTime Fterm)

        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSap.CVT_COMPRAS_INFORMEPROGRAMASEMANA(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ComprasEmbarquesMaritimos(DateTime Fini, DateTime Fterm)

        {
            DataTable ret = new DataTable();
            try
            {

                ret = Utilidades.LINQToDataTable(DBSap.CVT_COMPRAS_EMBARQUESMARITIMOS(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ComprasLlegados(DateTime Fini, DateTime Fterm)

        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSap.CVT_COMPRAS_INFORMELLEGADOS(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_Informe40(DateTime Fini, DateTime Fterm)

        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSap.CVT_COMPRAS_INFORME40(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int BuscaOC(string Ref)
        {
            int ret = 0;
            try
            {
                var temp = (from c in DBSap.OPOR
                            where c.NumAtCard.Equals(Ref)
                            select new { c.DocNum }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocNum);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int BuscaDocEntry(string Ref)
        {
            int ret = 0;
            try
            {
                var temp = (from c in DBSap.OPOR
                            where c.NumAtCard.Equals(Ref)
                            select new { c.DocEntry }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocEntry);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int BuscaNCamiones(string Ref)
        {
            int ret = 0;
            try
            {
                var temp = (from c in DBSap.OPOR
                            where c.NumAtCard.Equals(Ref)
                            select new { c.U_CantCamiones }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.U_CantCamiones);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string BuscaProducto(int NumDoc)
        {
            string ret = "";
            try
            {
                var temp = (from c in DBSap.POR1
                            where c.DocEntry.Equals(NumDoc)
                            select new { c.ItemCode }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.ItemCode);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string BuscaTraeProveedor(string Ref)
        {
            string ret = "";
            try
            {
                var temp = (from c in DBSap.OPOR
                            where c.NumAtCard.Equals(Ref)
                            select new { c.CardCode }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.CardCode);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string TraeNombreProveedor(string Ref)
        {
            string ret = "";
            try
            {
                var temp = (from c in DBSap.OPOR
                            where c.NumAtCard.Equals(Ref)
                            select new { c.CardName }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.CardName);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string TraeNombreProducto(int NumDoc)
        {
            string ret = "";
            try
            {
                var temp = (from c in DBSap.POR1
                            where c.DocEntry.Equals(NumDoc)
                            select new { c.Dscription }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Dscription);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool InsertaRegCamionCruzado(CVT_RegEstadoCamionesCruzados nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_RegEstadoCamionesCruzados.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }


    }
}
