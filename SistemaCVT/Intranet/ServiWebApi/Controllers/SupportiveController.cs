using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class SupportiveController : ApiController
    {

        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DbWms = new DBMLCVTWMSDataContext();


        [HttpGet]
        public IEnumerable<VW_TIPO_PALLET_XAMARIN> Get()
        {
            var ListadoTipoPallet = dbDsa.VW_TIPO_PALLET_XAMARIN.ToList();
            return ListadoTipoPallet;
        }

        [HttpGet]
        public int ObtiendeIdTipoPallet(string Desc)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DbWms.Supportive
                            where s.Supportive_Description.Equals(Desc)
                            select new { s.Supportive_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Supportive_Id;
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        [HttpGet]
        public bool ActualizaTipoPallet(int nPallet, int TipoPallet)
        {
            WMSClass wms = new WMSClass();

            var rest = wms.ActualizaTipoPallet(nPallet, TipoPallet);
            return rest;
        }

        [HttpGet]
        public string TraeNombrePalletPackage(int Pk)
        {
            InventarioClass inv = new InventarioClass();

            var rest = inv.TraeNombrePalletPackage(Pk);
            return rest;
        }

    }
}