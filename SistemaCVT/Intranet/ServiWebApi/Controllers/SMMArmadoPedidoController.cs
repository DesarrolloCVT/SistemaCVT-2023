using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class SMMArmadoPedidoController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsMmetro = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext SBOMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public int ValidaOrdenVenta(int IdOrden)
        {
            int ret = 0;
            try
            {
                var temp = (from l in SBOMmetro.VW_Productos_ArmadoPedidos
                            where l.NOrden.Equals(IdOrden)
                            select new { l.NOrden }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.NOrden);
                }
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public List<VW_Productos_ArmadoPedidos> ListProdPedidos(int Orden,string bcdCode)
        {
            List<VW_Productos_ArmadoPedidos> ret = new List<VW_Productos_ArmadoPedidos>();
            try
            {
                ret = (from t in SBOMmetro.VW_Productos_ArmadoPedidos
                       where t.NOrden.Equals(Orden)&&t.CodBarra.Equals(bcdCode)
                       select t).ToList<VW_Productos_ArmadoPedidos>();
            }
            catch (Exception)
            {
            }
            return ret;
        }

        [HttpGet]
        public string InsertaRegArmadoPedido(int nOrden, string CodProducto,string CodBar, string Umedida,int Cant,string fechIng,int IdVeri,string cantC,string VenC,string EtiqC,string EnfC,string EstC,string CondPC)
        {
            String ret = "";
            try
            {
                SMM_MedicionArmadoPedido vMar = new SMM_MedicionArmadoPedido();
                vMar.NOrden = nOrden;
                vMar.CodProducto = CodProducto;
                vMar.CodBarras = CodBar;
                vMar.UniMedida = Umedida;
                vMar.Cantidad = Cant;
                vMar.FechaIngreso = Convert.ToDateTime(fechIng);
                vMar.IdVerificador = IdVeri;
                vMar.CantCorrecta = cantC;
                vMar.VencCorrecto = VenC;
                vMar.Etiqueta = EtiqC;
                vMar.Enfilado = EnfC;
                vMar.Estibado = EstC;
                vMar.CondPallet = CondPC;
                wmsMmetro.SMM_MedicionArmadoPedido.InsertOnSubmit(vMar);
                wmsMmetro.SubmitChanges();
                ret = vMar.Id_MedicionArmado.ToString();

            }
            catch (Exception ex)
            {
                ret = ex.Message;

            }
            return ret;
        }
    }
}