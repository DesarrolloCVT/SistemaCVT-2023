using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class TomaInventarioFilmController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWms = new DBMLCVTWMSDataContext();

        [HttpGet]
        public int ValidaBobina(int numBobina)
        {
            int ret = 0;
            try
            {
                var temp = (from p in dbDsa.CVT_FILM_BOBINA
                            where p.NBobina.Equals(numBobina) && p.EstadoBobina.Equals(2)
                            select new { p.NBobina }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.NBobina);
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public List<VW_PRODUCTO_INVENARIO_FILM> ProductosTomainventarioFilm(int bobin)
        {
            List<VW_PRODUCTO_INVENARIO_FILM> ret = new List<VW_PRODUCTO_INVENARIO_FILM>();
            try
            {
                ret = (from t in dbDsa.VW_PRODUCTO_INVENARIO_FILM
                       where t.NBobina.Equals(bobin)
                       select t).ToList<VW_PRODUCTO_INVENARIO_FILM>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]
        public bool InsertaRegistroInventarioTest(string CodProducto, string Lote, string Cantidad, int Ubicacion, string Usuario, int NPallet, int Inventario_Id)
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
                vDi.Cantidad =Convert.ToDecimal(Cantidad);
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
    }
}