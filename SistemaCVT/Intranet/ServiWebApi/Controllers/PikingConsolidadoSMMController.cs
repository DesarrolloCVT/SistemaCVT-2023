using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class PikingConsolidadoSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext WmsSMM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext SapMetro = new DBMLCVTMMETRODataContext();


        [HttpGet]
        public int InsertaNuevoRegistro(DateTime FConsolidado,string CodProducto,int Cantidad,int idUser,string Depto)
        {
            int ret = 0;
            //string lot = Lote.Replace("¡", "+");        

            try
            {
                SMM_PickingConsolidado rs = new SMM_PickingConsolidado();

                rs.Fecha_Consolidado = FConsolidado;
                rs.Producto =CodProducto;
                rs.CantidadPikeada =Cantidad;
                rs.Fecha_Pickeada =DateTime.Now;
                rs.Id_Usuario = idUser;
                rs.DeptoVentas = Depto;
                WmsSMM.SMM_PickingConsolidado.InsertOnSubmit(rs);
                WmsSMM.SubmitChanges();

                ret = rs.Id_PickingSMM;
            }
            catch
            {


            }
            return ret;
        }

        [HttpGet]
        public int ValidaProductoEnConsolidado(string CodProducto,DateTime fechaCons)
        {
            int ret = 0;
            try
            {
                var temp = (from l in WmsSMM.SMM_VW_PICKING_CONSOLIDADO
                            where l.FechaEntrega.Equals(fechaCons) && l.CodProducto.Equals(CodProducto)
                            select new { l.CantidadPikear }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.CantidadPikear);
                }
            }
            catch
            {
            }
            return ret;
        }


        [HttpGet]
        public IEnumerable<SMM_VW_DeptoVentas> Get()
        {
            var ListadoDeptos = WmsSMM.SMM_VW_DeptoVentas.ToList();
            return ListadoDeptos;
        }

         [HttpGet]
        public List<SMM_VW_PICKING_CONSOLIDADO> ListaPickingConsolidado(string fecha,string dpto)
        {
            List<SMM_VW_PICKING_CONSOLIDADO> ret = new List<SMM_VW_PICKING_CONSOLIDADO>();
            try
            {
                ret = (from t in WmsSMM.SMM_VW_PICKING_CONSOLIDADO
                       where t.DeptoVentas.Equals(dpto) && t.FechaEntrega.Equals(fecha)
                       orderby t.FechaEntrega descending
                       select t
                       ).ToList<SMM_VW_PICKING_CONSOLIDADO>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
    }
}