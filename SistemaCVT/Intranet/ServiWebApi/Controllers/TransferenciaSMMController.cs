using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class TransferenciaSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public int ValidaFolioTransfer(int TransferID,int stado)
        {
            int ret = 0;
            try
            {
                var temp = (from l in wmsM.SMM_Transfer
                            where l.Transfer_Id.Equals(TransferID) && l.Status.Equals(stado)
                            select new { l.Transfer_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Transfer_Id);
                }
            }
            catch
            {
            }
            return ret;
        }


        [HttpGet]
        public IEnumerable<SMM_Site> ListaSitiosSMM()
        {
            var ListaSitios = wmsM.SMM_Site.ToList();
            return ListaSitios  ;
        }

        [HttpGet]
        public List<VW_SMM_FOLIOS_SOLICITUD_TRANSFERENCIAS> FoliosSolicitud(int Estado)
        {
            List<VW_SMM_FOLIOS_SOLICITUD_TRANSFERENCIAS> ret = new List<VW_SMM_FOLIOS_SOLICITUD_TRANSFERENCIAS>();
            try
            {
                ret = (from t in wmsM.VW_SMM_FOLIOS_SOLICITUD_TRANSFERENCIAS
                       where t.Estado.Equals(Estado)
                       select t).ToList<VW_SMM_FOLIOS_SOLICITUD_TRANSFERENCIAS>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]

        public int InsertaCabeceraTransferencia(int sOrigen,int sDestino,int idUser, int EntidadT, int FolioEnt, string Coment, int FolioSol)
        {
            int res = 0;

            SMM_Transfer tr = new SMM_Transfer();

            //List<MMETRO_OPOR> ls = new List<MMETRO_OPOR>();
            //ls = (from fd in DBMmetro.MMETRO_OPOR
            //      where fd.DocEntry.Equals(nOC)
            //      select fd).ToList<MMETRO_OPOR>();
          
                tr.Site_Id = sOrigen;
                tr.Site_Id_Destiny = sDestino;
                tr.IdUsuario = idUser;
                tr.Date =DateTime.Now;
                tr.Status =1;
                tr.Transfer_Entidad= EntidadT;
                tr.Transfer_Folio_Entidad = FolioEnt;
                tr.Transfer_Comentario = Coment;
                tr.FolioSolicitud = FolioSol;             

                wmsM.SMM_Transfer.InsertOnSubmit(tr);
                wmsM.SubmitChanges();
                res = tr.Transfer_Id;      

            return res;
        }

        [HttpGet]

        public List<CVT_VW_FiltroTransferenciasSMM> ObtieneFiltroTransferenciaSMM(int NPallet,int TransferId)
        {
            List<SMM_Transfer> transfer = new List<SMM_Transfer>();

            List<CVT_VW_FiltroTransferenciasSMM> ret = new List<CVT_VW_FiltroTransferenciasSMM>();
            try
            {
                transfer = (from t in wmsM.SMM_Transfer
                            where t.Transfer_Id.Equals(TransferId)
                            select t).ToList<SMM_Transfer>();
                foreach (var d in transfer)
                {
                    ret = (from f in wmsM.CVT_VW_FiltroTransferenciasSMM
                           where (f.Site_Id.Equals(d.Site_Id) &&                               
                                    f.Package_SSCC.Equals(NPallet))
                           select f).ToList<CVT_VW_FiltroTransferenciasSMM>();
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]
        public bool AgregaBultoTransferenciaSMM(int sitioid, int packageid, int layoutid, int IdUsuario, int transferid, string quantity)
        {
            bool ret = false;
            string artId = string.Empty;
            string lote = string.Empty;
            decimal cantidad = 0;
            try
            {
                SMM_Transfer_Detail vTD = new SMM_Transfer_Detail();
                vTD.Transfer_Id = transferid;
                vTD.Package_Quantity =Convert.ToDecimal(quantity);
                vTD.Status = 1;
                vTD.Site_Id = sitioid;
                vTD.Package_Id = packageid;
                vTD.Layout_Id_Actual = layoutid;
                vTD.Date = DateTime.Now;
                vTD.Package_Confirm = 0;
                wmsM.SMM_Transfer_Detail.InsertOnSubmit(vTD);
                wmsM.SubmitChanges();

                IQueryable<SMM_Package> queryable = from t in this.wmsM.SMM_Package
                                                    where t.Package_Id.Equals(packageid)
                                                    select t;
                foreach (SMM_Package package in queryable)
                {
                    lote = package.Package_Lot;
                    artId = package.ItemCode;
                    cantidad = Convert.ToDecimal(package.Package_Quantity);
                    package.Package_ReserveQuantity = package.Package_Quantity;

                }
                this.wmsM.SubmitChanges();

                ///
                SMM_Reserve vRE = new SMM_Reserve();
                vRE.Package_Id = packageid;
                vRE.Layout_Id = layoutid;
                vRE.ItemCode = artId;
                vRE.Lot = lote;
                vRE.Reserve_Quantity = cantidad;
                vRE.Reserve_Status = 1;
                vRE.Reserve_Date = DateTime.Now;
                vRE.IdUsuario = IdUsuario;
                vRE.Transfer_Id = transferid;

                wmsM.SMM_Reserve.InsertOnSubmit(vRE);
                wmsM.SubmitChanges();
                ret = true;

            }
            catch (Exception er)
            {
                string error = er.Message;

            }
            return ret;
        }


        [HttpGet]
        public DataTable BultosCargadosTransferencia(int folioTransferencia)
        {
            DataTable ret = new DataTable();
            try
            {
                wmsM.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(wmsM.SP_TRANSFERENCIA_DETALLE_SMM(folioTransferencia));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        [HttpGet]
        public int traepkID(int SSCCPallet)
        {
            int ret = 0;
            try
            {
                var temp = (from l in wmsM.SMM_Package
                            where l.Package_SSCC.Equals(SSCCPallet)
                            select new { l.Package_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Package_Id);
                }
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public bool EliminaBultoTransferenciaSMM(int transferid, int packageid)
        {
            bool ret = false;
            try
            {
                var t = from td in wmsM.SMM_Transfer_Detail
                        where td.Package_Id.Equals(packageid) && td.Transfer_Id.Equals(transferid)
                        select td;
                foreach (var detail in t)
                {
                    wmsM.SMM_Transfer_Detail.DeleteOnSubmit(detail);
                }
                wmsM.SubmitChanges();

                IQueryable<SMM_Package> queryable = from p in this.wmsM.SMM_Package
                                                    where p.Package_Id.Equals(packageid)
                                                    select p;
                foreach (SMM_Package package in queryable)
                {
                    package.Package_ReserveQuantity = 0;
                }
                this.wmsM.SubmitChanges();


                var reserve = from r in wmsM.SMM_Reserve
                              where r.Package_Id.Equals(packageid) && r.Transfer_Id.Equals(transferid)
                              select r;
                foreach (var detail in reserve)
                {
                    wmsM.SMM_Reserve.DeleteOnSubmit(detail);
                }
                wmsM.SubmitChanges();

                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }


    }
}