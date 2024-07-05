using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class MantencionClass
    {
        public MantencionClass()
        {
        }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        public bool RebajaStock(int artid, int cant)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_Articulo> queryable = from t in this.DBDesaint.CVT_Articulo
                                                               where t.Articulo_Id.Equals(artid)
                                                                select t;
                foreach (CVT_Articulo articulo in queryable)
                {
                    int stock = articulo.Articulo_Stock;
                    if (stock - cant >= 0)
                    {
                        articulo.Articulo_Stock = stock - cant;
                        ret = true;
                    }
                    else
                    {
                        ret = false;
                    }

                }
                this.DBDesaint.SubmitChanges();
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public bool AumentaStock(int artid, int cant)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_Articulo> queryable = from t in this.DBDesaint.CVT_Articulo
                                                               where t.Articulo_Id.Equals(artid)
                                                               select t;
                foreach (CVT_Articulo articulo in queryable)
                {
                    int stock = articulo.Articulo_Stock;
                    articulo.Articulo_Stock = stock + cant;
                    ret = true;
                    
                }
                this.DBDesaint.SubmitChanges();


            }
            catch (Exception)
            {

                
            }
            return ret;
        }
        public int ObtieneTipoMovimiento(int movid)
        {
            int ret = 0;
            try
            {
                var temp = (from m in DBDesaint.CVT_MovimientoMantencion
                            where m.Movimiento_Id.Equals(movid)
                            select new { m.TipoMovimiento }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.TipoMovimiento;
                }
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public int ObtieneDocMovimiento(int movid)
        {
            int ret = 0;
            try
            {
                var temp = (from m in DBDesaint.CVT_MovimientoMantencion
                            where m.Movimiento_Id.Equals(movid)
                            select new { m.NumeroDocumento }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (int)temp.NumeroDocumento;
                }
            }
            catch (Exception)
            {

                
            }
            return ret;
        }
        public int VerificaExisteDocArticulo(int doc, int art)
        {
            int ret = 0;
            try
            {
                var temp = (from m in DBDesaint.CVT_ArticuloDocumento
                            where m.Doc_Numero.Equals(doc) && m.Articulo_Id.Equals(art)
                            select new { m.Doc_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (int)temp.Doc_Id;
                }
            }
            catch (Exception)
            {

                
            }
            return ret;
        }

    }
}
