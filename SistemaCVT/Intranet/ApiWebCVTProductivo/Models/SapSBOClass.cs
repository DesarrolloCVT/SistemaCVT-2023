using DBMermasRecepcion;
using System;
using Microsoft.Web.Administration;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiWebCVTProductivo.Models
{
    public class SapSBOClass
    {


        #region Conec SAPSMM
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTMMETRODataContext DBSMMSap = new DBMLCVTMMETRODataContext();
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();

        string SAPusername = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPusername"]);
        string SAPuserpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPuserpass"]);
        string SAPCompany = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SMMCompany"]);
        string DBServer = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBServer"]);
        string DBusername = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBusername"]);
        string DBuserpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBuserpass"]);
        string DBType = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBType"]);
        string ServerLicence = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["ServerLicence"]);
        public SapSBOClass()
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
        #endregion
        #region DocumentoVenta
        public List<RespSAPClass> CreaDocumentoVenta(string NomUsuario, List<PedidoOVClass> PedOV)
        {

            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            List<RespSAPClass> ListRespuesta = new List<RespSAPClass>();
            try
            {
                int iError = 0;
                List<PedidoOVClass> DtEnc = PedOV;
                //DtEnc = ObtieneEncabezadoPreventa(preventaId);
                foreach (var enc in DtEnc)
                {
                    SAPbobsCOM.Documents doc;
                    doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oOrders);
                    doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                    doc.DocDate = DateTime.Now;
                    doc.CardCode = enc.CardCode;
                    doc.UserFields.Fields.Item("U_TipoEntidad").Value = enc.TipoEntidad;
                    doc.UserFields.Fields.Item("U_FolioEntidad").Value = enc.NumAtCard;
                    doc.SalesPersonCode = Convert.ToInt32(enc.SlpCode);
                    doc.NumAtCard = enc.NumAtCard;
                    //doc.UserFields.Fields.Item("U_IdWms").Value = enc.NumAtCard;
                    doc.ShipToCode = enc.BPLId;
                    //doc.PayToCode = enc.DireccionFact;

                    doc.DocDueDate = enc.DocDueDate;
                    doc.Comments = "Creado ITStone: " + enc.BPLId.ToString();

                    foreach (var det in DtEnc)
                    {
                        doc.Lines.WarehouseCode = "01";
                        doc.Lines.ItemCode = det.ItemCode;
                        doc.Lines.ShipDate = DateTime.Now;
                        doc.Lines.Quantity = (double)det.Quantity;
                        doc.Lines.Price = det.Price;
                        doc.Lines.UoMEntry = det.UomEntry;
                        doc.Lines.DiscountPercent = (double)det.Descuento;

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
                        //SMM_LogCaja lg = new SMM_LogCaja();
                        //PreventaCajaSMM pvc = new PreventaCajaSMM();

                        //lg.Preventa_ID = preventaId;
                        //lg.FecharError = DateTime.Now;
                        //lg.Error = ret;
                        //pvc.InsertaLog(lg);

                    }
                    oCmp.Disconnect();
                    break;
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


        #endregion
        #region CreaC Scocio Negocio
        public List<RespSAPClass> CreaSocioNegocio(ClienteClass cli)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            List<RespSAPClass> ListRespuesta = new List<RespSAPClass>();
            try
            {
                int iError = 0;
                SAPbobsCOM.BusinessPartners oBP;
                oBP = (SAPbobsCOM.BusinessPartners)oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oBusinessPartners);
                //List<SMM_ObtieneDatosCliente> dt = ObtieneDatosCliente(codcliente);
                //foreach (var a in dt)
                //{
                string codCliente = "C" + cli.Rut;
                oBP.CardCode = codCliente;
                oBP.CardName = cli.Nombre;
                oBP.GroupCode = 116;
                oBP.CardType = SAPbobsCOM.BoCardTypes.cCustomer;
                oBP.FederalTaxID = cli.Rut;
                oBP.Phone1 = cli.Telefono;
                oBP.EmailAddress = cli.Email;
                oBP.SalesPersonCode = Convert.ToInt32(cli.IDVendAsignado);
                //oBP.UserFields.Fields.Item("U_GIRO").Value = a.Giro.ToString();
                //List<SMM_ObtieneDatosDirecciones> dtd = ObtieneDatosDirecciones(codcliente);
                //foreach (var b in dtd)
                //{
                oBP.Addresses.AddressName = cli.Direccion;
                oBP.Addresses.Street = cli.Direccion;
                oBP.Addresses.Block = cli.Comuna;
                oBP.Addresses.County = cli.Comuna;
                oBP.Addresses.City = cli.Ciudad;
                oBP.Addresses.State = cli.Region.ToString();
                oBP.Addresses.Country = "CL";
                oBP.Addresses.AddressType = SAPbobsCOM.BoAddressType.bo_BillTo;
                // oBP.Addresses.AddressType = cli.TipoDireccion == "B" ? SAPbobsCOM.BoAddressType.bo_BillTo : SAPbobsCOM.BoAddressType.bo_ShipTo;
                oBP.Addresses.Add();

                oBP.Addresses.AddressName = cli.Direccion;
                oBP.Addresses.Street = cli.Direccion;
                oBP.Addresses.Block = cli.Comuna;
                oBP.Addresses.County = cli.Comuna;
                oBP.Addresses.City = cli.Ciudad;
                oBP.Addresses.State = cli.Region.ToString();
                oBP.Addresses.Country = "CL";
                oBP.Addresses.AddressType = SAPbobsCOM.BoAddressType.bo_ShipTo;
                //oBP.Addresses.AddressType = cli.TipoDireccion == "B" ? SAPbobsCOM.BoAddressType.bo_BillTo : SAPbobsCOM.BoAddressType.bo_ShipTo;

                oBP.Addresses.Add();
                //}

                iError = oBP.Add();
                if (iError == 0)
                {
                    ret = "0";
                    oBP.GetByKey(codCliente);
                    oBP.UserFields.Fields.Item("U_GIRO").Value = cli.Giro.ToString();
                    oBP.Update();

                    List<RespSAPClass> rs = new List<RespSAPClass>();
                    RespSAPClass rsc = new RespSAPClass();

                    rsc.Codigo = 0;
                    rsc.NTransac = codCliente;
                    rsc.Mensaje = "Registrado Correctamente";
                    rs.Add(rsc);

                    ListRespuesta = rs;
                }
                else
                {
                    //ret = oCmp.GetLastErrorDescription();

                    List<RespSAPClass> rs = new List<RespSAPClass>();
                    RespSAPClass rsc = new RespSAPClass();

                    rsc.Codigo = -1;
                    rsc.NTransac = Convert.ToString(-1);
                    rsc.Mensaje = oCmp.GetLastErrorDescription();
                    rs.Add(rsc);

                    ListRespuesta = rs;
                }
                oCmp.Disconnect();
                //}
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

        public List<RespSAPClass> AgregaDireccionesSocioNegocio(DireccionClass diCli)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            List<RespSAPClass> ListRespuesta = new List<RespSAPClass>();
            try
            {
                int iError = 0;
                SAPbobsCOM.BusinessPartners oBP;
                oBP = (SAPbobsCOM.BusinessPartners)oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oBusinessPartners);
                oBP.GetByKey(diCli.CodCliente);
                oBP.Addresses.Add();
                oBP.Addresses.AddressName = diCli.Direccion;
                oBP.Addresses.Street = diCli.Direccion;
                oBP.Addresses.Block = diCli.Comuna;
                oBP.Addresses.County = diCli.Comuna;
                oBP.Addresses.City = diCli.Ciudad;
                oBP.Addresses.State = diCli.Region.ToString();
                oBP.Addresses.Country = "CL";
                oBP.Addresses.AddressType = SAPbobsCOM.BoAddressType.bo_ShipTo;
                // oBP.Addresses.AddressType = cli.TipoDireccion == "B" ? SAPbobsCOM.BoAddressType.bo_BillTo : SAPbobsCOM.BoAddressType.bo_ShipTo;
                oBP.Addresses.Add();



                iError = oBP.Update();
                if (iError == 0)
                {
                    List<RespSAPClass> rs = new List<RespSAPClass>();
                    RespSAPClass rsc = new RespSAPClass();

                    rsc.Codigo = 0;
                    rsc.NTransac = diCli.CodCliente;
                    rsc.Mensaje = "Registrado Correctamente";
                    rs.Add(rsc);

                    ListRespuesta = rs;
                }
                else
                {
                    //ret = oCmp.GetLastErrorDescription();

                    List<RespSAPClass> rs = new List<RespSAPClass>();
                    RespSAPClass rsc = new RespSAPClass();

                    rsc.Codigo = -1;
                    rsc.NTransac = Convert.ToString(-1);
                    rsc.Mensaje = oCmp.GetLastErrorDescription();
                    rs.Add(rsc);

                    ListRespuesta = rs;
                }
                oCmp.Disconnect();
                //}
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

        public int ObtieneCantDirecciones()
        {
            int ret = 0;
            try
            {
                ret = (from t in DBSMMSap.MMETRO_CRD1
                       select new { t.Address }).Count();
            }
            catch
            {
                ret = 0;
            }
            return ret+1;
        }
        #endregion
    }
}