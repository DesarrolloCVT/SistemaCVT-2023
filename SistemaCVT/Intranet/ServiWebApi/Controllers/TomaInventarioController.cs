using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class TomaInventarioController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWms = new DBMLCVTWMSDataContext();

        [HttpGet]

        public IEnumerable<VW_FOLIOS_INVENTARIOS> Get()
        {
            var listadoFolio = dbDsa.VW_FOLIOS_INVENTARIOS.ToList();
            return listadoFolio;
        }
        [HttpGet]

        public int ValidaNPallet(int NumPallet)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWms.Package
                            where p.Package_SSCC.Equals(NumPallet) && p.Package_Quantity>0 && p.Package_Status!=7
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Package_Id);
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public int ValidaCodProducto(string CodProducto)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWms.ArticleProvider
                            where p.ArticleProvider_CodClient.Equals(CodProducto)
                            select new { p.ArticleProvider_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.ArticleProvider_Id);
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public int ValidaLote(string NumLote)
        {
            string lot = NumLote.Replace("¡", "+");
            int ret = 0;
            try
            {
                var temp = (from p in DBWms.Package
                            where p.Package_Lot.Equals(lot)
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Package_Id);
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public int ValidaUbicacion(int NumPosicion)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBWms.Layout
                            where l.Layout_Id.Equals(NumPosicion)
                            select new { l.Layout_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Layout_Id);
                }
            }
            catch
            {
            }
            return ret;
        }

        //[HttpGet]
        //public bool InsertaRegistroInventario(int Inventario_Id, int NPallet, string CodProducto, string Lote, int Cantidad, int Ubicacion, string Usuario)
        //{
        //    bool ret = false;
        //    string lot = Lote.Replace("¡", "+");

        //    //byte[] mybyte = System.Convert.FromBase64String(Lote);
        //    //string returntext = System.Text.Encoding.UTF8.GetString(mybyte);

        //    try
        //    {
        //        CVT_DetalleInventario vDi = new CVT_DetalleInventario();

        //        vDi.Inventario_Id = Inventario_Id;
        //        vDi.NPallet = NPallet;
        //        vDi.CodProducto = CodProducto;
        //        vDi.Cantidad = Cantidad;
        //        vDi.Ubicacion = Ubicacion;
        //        vDi.Lote = lot;
        //        vDi.Usuario = Usuario;
        //        vDi.FechaRegistro = DateTime.Now;

        //        dbDsa.CVT_DetalleInventario.InsertOnSubmit(vDi);
        //        dbDsa.SubmitChanges();
        //        ret = true;
        //    }
        //    catch
        //    {


        //    }
        //    return ret;
        //}

        [HttpGet]
        public int ValidaTestLot(string LoteCode)
        {


            //string lot = NumLote.Replace("¡", "+");

            byte[] mybyte = System.Convert.FromBase64String(LoteCode);
            string returntext = System.Text.Encoding.UTF8.GetString(mybyte);

            int ret = 0;
            try
            {
                var temp = (from p in DBWms.Package
                            where p.Package_Lot.Equals(returntext)
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Package_Id);
            }
            catch
            {
            }
            return ret;
        }


        [HttpGet]
        public bool InsertaRegistroInventarioTest(string CodProducto, string Lote, int Cantidad, int Ubicacion, string Usuario, int NPallet, int Inventario_Id)
        {
            bool ret = false;
            //string lot = Lote.Replace("¡", "+");

            byte[] mylote = System.Convert.FromBase64String(Lote);
            string loteDesc = System.Text.Encoding.UTF8.GetString(mylote);

            try
            {
                CVT_DetalleInventario vDi = new CVT_DetalleInventario();

                vDi.Inventario_Id = Inventario_Id;
                vDi.NPallet = NPallet;
                vDi.CodProducto = CodProducto;
                vDi.Cantidad = Cantidad;
                vDi.Ubicacion = Ubicacion;
                vDi.Lote = loteDesc;
                vDi.Usuario = Usuario;
                vDi.FechaRegistro = DateTime.Now;

                dbDsa.CVT_DetalleInventario.InsertOnSubmit(vDi);
                dbDsa.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }

        [HttpGet]
        public List<VW_PRODUCTOS_TOMAINVENTARIO_XAMARIN> ProductosTomainventario(int PalletInv)
        {
            List<VW_PRODUCTOS_TOMAINVENTARIO_XAMARIN> ret = new List<VW_PRODUCTOS_TOMAINVENTARIO_XAMARIN>();
            try
            {
                ret = (from t in DBWms.VW_PRODUCTOS_TOMAINVENTARIO_XAMARIN
                       where t.Package_SSCC.Equals(PalletInv)
                       select t).ToList<VW_PRODUCTOS_TOMAINVENTARIO_XAMARIN>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

    }
}