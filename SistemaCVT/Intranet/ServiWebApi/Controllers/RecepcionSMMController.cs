using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class RecepcionSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]

        public IEnumerable<VW_OC_ABIERTASSMM> Get()
        {
            var listadoOc = DBMmetro.VW_OC_ABIERTASSMM.ToList();
            return listadoOc;
        }

        [HttpGet]

        public int CreaNuevaCabeceraRecepcionSMM(int nOC, int Fac,int idUser, int Bod,string Coment)
        {
            int ret = 0;

            SMM_Reception rp = new SMM_Reception();

            List<MMETRO_OPOR> ls = new List<MMETRO_OPOR>();
            ls = (from fd in DBMmetro.MMETRO_OPOR
                   where fd.DocEntry.Equals(nOC)
                   select fd).ToList<MMETRO_OPOR>();

            foreach (var t in ls)
            {
                rp.Site_Id = Bod;
                rp.CardCode = t.CardCode;
                rp.IdUsuario = idUser;
                rp.DocType = "FAC";
                rp.Reception_DocNumber = Fac;
                rp.Reception_DateIn = DateTime.Now;
                rp.Reception_Status = 1;
                rp.Reception_Type = 1;
                rp.TipoDocSAP = 1;
                rp.NumDocSAP = nOC;
                rp.Reception_Note = Coment;

                wmsM.SMM_Reception.InsertOnSubmit(rp);
                wmsM.SubmitChanges();
                ret = rp.Reception_Id;
            }

            return ret;
        }

        [HttpGet]
        public int ValidaRecepcionSMM(int FoliRec)
        {
            int ret = 0;
            try
            {
                var temp = (from l in wmsM.SMM_Reception
                            where l.Reception_Id.Equals(FoliRec)&& l.Reception_Status.Equals(1)
                            select new { l.Reception_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Reception_Id);
                }
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]

        public List<VW_DATOS_OC_XAMARIN> DatosProductosEnOC(int OC, string codigo)
        {
            List<VW_DATOS_OC_XAMARIN> ret = new List<VW_DATOS_OC_XAMARIN>();
            try
            {
                ret = (from p in DBMmetro.VW_DATOS_OC_XAMARIN
                       where p.DocEntry.Equals(OC) && p.CodeBars.Equals(codigo)
                       select p).ToList<VW_DATOS_OC_XAMARIN>();
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]

        public List<VW_PRODUCTOS_RECEPCION_XAMARIN> DatosProductosRecepcionXam(string CodBarraProd,int nOrden)
        {
            List<VW_PRODUCTOS_RECEPCION_XAMARIN> ret = new List<VW_PRODUCTOS_RECEPCION_XAMARIN>();
            try
            {
                ret = (from p in DBMmetro.VW_PRODUCTOS_RECEPCION_XAMARIN
                       where p.NOrden.Equals(nOrden) && p.CodBarra.Equals(CodBarraProd)
                       select p).ToList<VW_PRODUCTOS_RECEPCION_XAMARIN>();
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]

        public int TraeOCRecepcion(int idRecep)
        {
            int ret = 0;
            try
            {
                var temp = (from l in wmsM.SMM_Reception
                            where l.Reception_Id.Equals(idRecep) && l.Reception_Status.Equals(1)
                            select new { l.NumDocSAP }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.NumDocSAP);
                }
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]

        public int CreaPackageSMM(int recepID,int OC,string CodProducto,string Cantidad,string CodProveedor,DateTime FVenc,DateTime FProd,string NumProd)
        {
            int res = 0;
            CVTWMSMetroClass cwmsM = new CVTWMSMetroClass();
            int bodegaRese = cwmsM.obtieneBodegaRecepcion(recepID);


            if (bodegaRese == 1)
            {
                List<SMM_VW_DATO_PROD_RECEPCION> ret = cwmsM.ObtieneDetosProdRecepcion(CodProducto, NumProd);

                try
                {
                    SMM_Package vNuevo = new SMM_Package();
                    MMetroClass mmC = new MMetroClass();
                    CVTWMSMetroClass mmCls = new CVTWMSMetroClass();

                    string sigla = mmC.ObtieneSiglaProveedor(CodProveedor);

                    string LotePro = sigla + "0000" + OC;

                    foreach (var t in ret)
                    {
                        vNuevo.UnMedida = t.UgpName;
                        vNuevo.BaseUnMed = Convert.ToInt32(t.BaseQty);
                        vNuevo.UgpEntry = t.UgpEntry;
                        vNuevo.UomEntry = t.UomEntry;
                        vNuevo.UomCode = t.UomCode;
                    }
                    vNuevo.Reception_Id = recepID;
                    vNuevo.ItemCode = CodProducto;
                    vNuevo.Package_QuantityInitial = Convert.ToDecimal(Cantidad);
                    vNuevo.Package_Quantity = Convert.ToDecimal(Cantidad);
                    vNuevo.Package_Lot = LotePro;
                    vNuevo.Package_ExpiresDate = FVenc;
                    vNuevo.Package_ProductionDate = FProd;
                    vNuevo.Package_InDate = DateTime.Now;
                    vNuevo.Package_SN = NumProd;
                    vNuevo.Package_Data1 = "1";
                    vNuevo.Package_Data2 = "";
                    //vNuevo.Package_SSCC = mmCls.CreaNewCorrelativo().ToString();
                    vNuevo.Package_Status = 1;


                    wmsM.SMM_Package.InsertOnSubmit(vNuevo);
                    wmsM.SubmitChanges();
                    res = vNuevo.Package_Id;

                }
                catch
                {
                    return res;
                }

            }
            else {

                List<SMM_VW_DATO_PROD_RECEPCION> ret = cwmsM.ObtieneDetosProdRecepcion(CodProducto, NumProd);

                try
                {
                    SMM_Package vNuevo = new SMM_Package();
                    MMetroClass mmC = new MMetroClass();
                    CVTWMSMetroClass mmCls = new CVTWMSMetroClass();

                    string sigla = mmC.ObtieneSiglaProveedor(CodProveedor);

                    string LotePro = sigla + "0000" + OC;

                    foreach (var t in ret)
                    {
                        vNuevo.UnMedida = t.UgpName;
                        vNuevo.BaseUnMed = Convert.ToInt32(t.BaseQty);
                        vNuevo.UgpEntry = t.UgpEntry;
                        vNuevo.UomEntry = t.UomEntry;
                        vNuevo.UomCode = t.UomCode;
                    }
                    vNuevo.Reception_Id = recepID;
                    vNuevo.ItemCode = CodProducto;
                    vNuevo.Package_QuantityInitial = Convert.ToDecimal(Cantidad);
                    vNuevo.Package_Quantity = Convert.ToDecimal(Cantidad);
                    vNuevo.Package_Lot = LotePro;
                    vNuevo.Package_ExpiresDate = FVenc;
                    vNuevo.Package_ProductionDate = FProd;
                    vNuevo.Package_InDate = DateTime.Now;
                    vNuevo.Package_SN = NumProd;
                    vNuevo.Package_Data1 = "1";
                    vNuevo.Package_Data2 = "";
                    vNuevo.Package_SSCC = mmCls.CreaNewCorrelativo().ToString();
                    vNuevo.Package_Status = 1;


                    wmsM.SMM_Package.InsertOnSubmit(vNuevo);
                    wmsM.SubmitChanges();
                    res = vNuevo.Package_Id;

                }
                catch
                {
                    return res;
                }

            }       
            return res;
            
        }

        [HttpGet]
        public int TraeDiasUtil(string CodProds)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBMmetro.VW_DIAS_VIDA_UTIL
                            where l.CodProducto.Equals(CodProds)
                            select new { l.DiasAcep }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DiasAcep);
                }
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public int TraeTotalDiasUtil(string CodigoProductoEva)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBMmetro.VW_DIAS_VIDA_UTIL
                            where l.CodProducto.Equals(CodigoProductoEva)
                            select new { l.Dias }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Dias);
                }
            }
            catch
            {
            }
            return ret;
        }
    }
}