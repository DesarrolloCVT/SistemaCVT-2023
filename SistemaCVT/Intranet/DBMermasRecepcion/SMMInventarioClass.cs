using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class SMMInventarioClass
    {
        public SMMInventarioClass()
        { }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWms = new DBMLCVTWMSDataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();
        DBMLCVTWMSMETRODataContext dbWMSMe = new DBMLCVTWMSMETRODataContext();

        public string ValidaCodProducto(string  CodBarr)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBMmetro.MMetro_OITM
                            where p.CodeBars.Equals(CodBarr) && p.validFor.Equals("Y")
                            select new { p.ItemCode, p.ItemName}).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.ItemCode+' '+temp.ItemName);
            }
            catch
            {
            }
            return ret;
        }
        public string TraeCodProd(string CodBarr)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBMmetro.MMetro_OITM
                            where p.CodeBars.Equals(CodBarr)
                            select new { p.ItemCode }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.ItemCode);
            }
            catch
            {
            }
            return ret;
        }
        public int ValidaUbicacionSMM(string bod)
        {
            int ret = 0;
            try
            {
                var temp = (from l in dbWMSMe.SMM_Site
                            where l.Site_Description.Equals(bod)
                            select new { l.Site_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Site_Id);
                }
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaRegistroInventarioSMM(SMM_InventarioDetalle nuevo)
        {
            bool ret = false;
            try
            {
                dbWMSMe.SMM_InventarioDetalle.InsertOnSubmit(nuevo);
                dbWMSMe.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }
        public DataTable SP_StockSMM(int sitio, string codproducto, string lote)

        {
            if (codproducto == "")
                codproducto = "Todos";
            if (lote == "")
                lote = "Todos";
            DataTable ret = new DataTable();
            try
            {
                DBMmetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbWMSMe.STOCK_SMM(sitio, codproducto, lote));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_CompStockVsInventarioSMM(int fInventario)

        {
            DataTable ret = new DataTable();
            try
            {
                DBMmetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBMmetro.SMM_StockWmsSapVSInventarioDif(fInventario));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ComparativoStock()

        {
            DataTable ret = new DataTable();
            try
            {
                DBMmetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBMmetro.SMM_StockLWmsSapInventario());
            }
            catch (Exception)
            {

            }
            return ret;
        }
    }
}
