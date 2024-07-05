using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class ConfirmaPalletTransferenciaSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public int ValidaFolioTransfer(int TransferID)
        {
            int ret = 0;
            try
            {
                var temp = (from l in wmsM.SMM_Transfer
                            where l.Transfer_Id.Equals(TransferID) && l.Status.Equals(3)
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
        public int VerificaPalletEnDetalleTransferecia(int TransferID,int idBulto)
        {
            int ret = 0;
            try
            {
                var temp = (from l in wmsM.SMM_Transfer_Detail
                            where l.Transfer_Id.Equals(TransferID) && l.Package_Id.Equals(idBulto) 
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
        public int ActualizaConfirma(int PackageId, int transfer)
        {
            int flag = 0;
            try
            {
                IQueryable<SMM_Transfer_Detail> queryable = from t in this.wmsM.SMM_Transfer_Detail
                                                    where t.Package_Id.Equals(PackageId) && t.Transfer_Id.Equals(transfer)
                                                    select t;
                foreach (SMM_Transfer_Detail package in queryable)
                {
                    package.Package_Confirm = 1;                

                }
                this.wmsM.SubmitChanges();
                flag = 1;
            }
            catch
            {
                flag = 0;
            }
            return flag;
        }



    }
}