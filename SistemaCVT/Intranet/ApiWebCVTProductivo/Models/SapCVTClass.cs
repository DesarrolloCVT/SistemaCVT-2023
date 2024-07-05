using DBMermasRecepcion;
using Microsoft.Web.Administration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiWebCVTProductivo.Models
{
    public class SapCVTClass
    {
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTMMETRODataContext DBSMMSap = new DBMLCVTMMETRODataContext();
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();

        string SAPusername = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPusername"]);
        string SAPuserpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPuserpass"]);
        string SAPCompany = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPCompany"]);
        string DBServer = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBServer"]);
        string DBusername = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBusername"]);
        string DBuserpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBuserpass"]);
        string DBType = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBType"]);
        string ServerLicence = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["ServerLicence"]);
        public SapCVTClass()
        {
        }
        public SAPbobsCOM.Company CnxSAP(ref string reterror)
        {
            int _connected = 0;
            int _errcode = 0;
            string _messgcode = "";
            SAPbobsCOM.Company oCompany = new SAPbobsCOM.Company();

            try
            {

                if (DBType == "2000")
                    oCompany.DbServerType = SAPbobsCOM.BoDataServerTypes.dst_MSSQL;

                if (DBType == "2005")
                    oCompany.DbServerType = SAPbobsCOM.BoDataServerTypes.dst_MSSQL2005;

                if (DBType == "2008")
                    oCompany.DbServerType = SAPbobsCOM.BoDataServerTypes.dst_MSSQL2008;

                if (DBType == "2012")
                    oCompany.DbServerType = SAPbobsCOM.BoDataServerTypes.dst_MSSQL2012;
                if (DBType == "2019")
                    oCompany.DbServerType = SAPbobsCOM.BoDataServerTypes.dst_MSSQL2019;



                oCompany.Server = DBServer;
                oCompany.LicenseServer = ServerLicence;
                oCompany.DbUserName = DBusername;
                oCompany.DbPassword = DBuserpass;
                oCompany.CompanyDB = SAPCompany;
                oCompany.UserName = SAPusername;
                oCompany.Password = SAPuserpass;
                oCompany.language = SAPbobsCOM.BoSuppLangs.ln_Spanish_La;
                _connected = oCompany.Connect();
                if (_connected != 0)
                {
                    RecycleAppPool();
                    _connected = oCompany.Connect();
                    if (_connected != 0)
                    {
                        // este si es importante, para saber por que no se conecta
                        oCompany.GetLastError(out _errcode, out _messgcode);
                        //System.Diagnostics.EventLog.WriteEntry("Sync Solicitudes de Compra", "Error en Conexion: " + _errcode.ToString() + " " + _messgcode, System.Diagnostics.EventLogEntryType.Error);
                        reterror = _errcode + " " + _messgcode;
                        // el mensaje de error hacerlo persistir en un log para auditorias y revision o emitir mensajes
                    }
                }

            }
            catch (Exception err)
            {
                System.Diagnostics.EventLog.WriteEntry("SISTEMA CVT", "Error en Conexion: " + _errcode.ToString() + " " + _messgcode, System.Diagnostics.EventLogEntryType.Error);
            }

            return oCompany;

        }
        public static void RecycleAppPool()
        {
            ServerManager serverManager = new ServerManager();
            ApplicationPool appPool = serverManager.ApplicationPools["Sistemacvt"];
            if (appPool != null)
            {
                if (appPool.State == ObjectState.Stopped)
                {
                    appPool.Start();
                }
                else
                {
                    appPool.Recycle();
                }
            }
        }

        public List<RespSAPClass> CreaDocumentoVentaCVT(string NomUsuario, List<PedidoCVTOVClass> PedOV)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            List<RespSAPClass> ListRespuesta = new List<RespSAPClass>();


            try
            {

                int iError = 0;
                List<PedidoCVTOVClass> DtEnc = PedOV;
                //DtEnc = ObtieneEncabezadoPreventa(preventaId);
                foreach (var enc in DtEnc)
                {

                    if (validaNumRef(enc.NumAtCard) == "0")
                    {
                        SAPbobsCOM.Documents doc;
                        doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oOrders);
                        doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                        doc.DocDate = DateTime.Now;
                        doc.CardCode = enc.CardCode;
                        doc.UserFields.Fields.Item("U_TipoEntidad").Value = enc.TipoEntidad;
                        //doc.UserFields.Fields.Item("U_FolioEntidad").Value = enc.NumAtCard;
                        doc.SalesPersonCode = Convert.ToInt32(enc.SlpCode);
                        //doc.UserFields.Fields.Item("U_IdWms").Value = enc.NumAtCard;
                        doc.NumAtCard = enc.NumAtCard;
                        doc.ShipToCode = enc.BPLId;
                        //doc.PayToCode = enc.DireccionFact;

                        doc.DocDueDate = enc.DocDueDate;
                        doc.Comments = "Creado ITStone: " + enc.BPLId.ToString();

                        foreach (var det in DtEnc)
                        {
                            doc.Lines.WarehouseCode = "CV100";
                            doc.Lines.ItemCode = det.ItemCode;
                            doc.Lines.ShipDate = DateTime.Now;
                            doc.Lines.Quantity = (double)det.Quantity;
                            //doc.Lines.Price = det.Price;
                            doc.Lines.UnitPrice = det.Price;
                            //doc.Lines.UoMEntry = det.UomEntry;

                            doc.Lines.Add();
                        }


                        iError = doc.Add();

                        if (iError == 0)
                        {
                            List<RespSAPClass> rs = new List<RespSAPClass>();
                            RespSAPClass rsc = new RespSAPClass();

                            rsc.Codigo = 0;
                            rsc.NTransac = NDocumento(Convert.ToInt32(oCmp.GetNewObjectKey()), oCmp).ToString();
                            rsc.Mensaje = "Registrado Correctamente";
                            rs.Add(rsc);

                            ListRespuesta = rs;
                        }
                        else
                        {
                            List<RespSAPClass> rs = new List<RespSAPClass>();
                            RespSAPClass rsc = new RespSAPClass();



                            rsc.Codigo = -1;
                            rsc.NTransac = Convert.ToString(-1);
                            rsc.Mensaje = oCmp.GetLastErrorDescription();
                            rs.Add(rsc);

                            ListRespuesta = rs;


                        }
                        oCmp.Disconnect();
                        break;
                    }
                    else
                    {
                        List<RespSAPClass> rs = new List<RespSAPClass>();
                        RespSAPClass rsc = new RespSAPClass();

                        rsc.Codigo = -1;
                        rsc.NTransac = Convert.ToString(-1);
                        rsc.Mensaje = "N° de referencia de documento ya existe";
                        rs.Add(rsc);

                        ListRespuesta = rs;

                        oCmp.Disconnect();

                    }
                }
            }
            catch (Exception ex)
            {
                List<RespSAPClass> rs = new List<RespSAPClass>();
                RespSAPClass rsc = new RespSAPClass();

                rsc.Codigo = -1;
                rsc.NTransac = Convert.ToString(-1);
                rsc.Mensaje = ex.Message.ToString();
                rs.Add(rsc);

                ListRespuesta = rs;

                oCmp.Disconnect();
            }
            return ListRespuesta;
        }

        private int NDocumento(int ndoc, SAPbobsCOM.Company oCmp)
        {
            int res = 0;
            SAPbobsCOM.Documents doc;
            doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oOrders);
            doc.GetByKey(ndoc);
            res = doc.DocNum;
            return res;
        }

        private string validaNumRef(string nref)
        {
            string res = "0";

            try
            {
                var temp = (from t in DBSap.ORDR
                            where t.NumAtCard.Equals(nref)
                            select new { t.NumAtCard }).FirstOrDefault();
                if (temp != null)
                    res = temp.NumAtCard;
            }
            catch (Exception)
            {


            }


            return res;
        }
    }
}