using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Web.Administration;

namespace DBMermasRecepcion
{
    public class SAPSMM
    {
        DBMLCVTMMETRODataContext DBSMMSap = new DBMLCVTMMETRODataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
        string SAPusername = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPusername"]);
        string SAPuserpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPuserpass"]);
        string SAPCompany =  Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SMMCompany"]);// "ZBO_MMETRO"; //////
        string DBServer = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBServer"]);
        string DBusername = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBusername"]);
        string DBuserpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBuserpass"]);
        string DBType = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBType"]);
        string ServerLicence = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["ServerLicence"]);
        public SAPSMM()
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
                oCompany.LicenseServer = ServerLicence; //+ ":30000";
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
        public  void RecycleAppPool()
        {
            ServerManager serverManager = new ServerManager();
            ApplicationPool appPool = serverManager.ApplicationPools["bmas"];
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
        public int ObtieneDocEntryOC(int oc, string codprod)
        {
            int ret = 0;
            try
            {
                //var temp = (from p1 in DBSap.PCH1
                //            where p1.BaseEntry == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                //            select new { p1.DocEntry }).FirstOrDefault();
                var temp = (from p1 in DBSMMSap.MMETRO_POR1
                            join p in DBSMMSap.MMETRO_OPOR on p1.DocEntry equals p.DocEntry
                            where p.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                            select new { p1.DocEntry }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocEntry);
                }
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneLinenumOC(int oc, string codprod, int uom )
        {
            int ret = 0;
            try
            {
                //var temp = (from p1 in DBSap.PCH1
                //           where p1.BaseEntry == oc && p1.ItemCode == codprod && p1.LineStatus=='O'
                //           select new { p1.LineNum }).FirstOrDefault();
                var temp = (from p1 in DBSMMSap.MMETRO_POR1
                            join p in DBSMMSap.MMETRO_OPOR on p1.DocEntry equals p.DocEntry
                            where p.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O' && p1.UomEntry== uom
                            select new { p1.LineNum }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.LineNum);
                }
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneDocNumRecepcionSAP(int RecepId)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSMMSap.MMETRO_OPDN
                            where t.U_IdWms.Equals(RecepId)
                            select new { t.DocNum }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocNum);
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public int ObtieneDocNumAjusteSAP(int RecepId)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSMMSap.MMETRO_OIGN
                            where t.U_IdWms.Equals(RecepId)
                            select new { t.DocNum }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocNum);
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public int ObtieneDocNumDevolucionSAP(int RecepId)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSMMSap.MMETRO_ORDN
                            where t.U_IdWms.Equals(RecepId)
                            select new { t.DocNum }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocNum);
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public int ObtieneDocNumTransferenciaSAP(int RecepId)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSMMSap.MMETRO_OWTR
                            where t.U_IdWms.Equals(RecepId)
                            select new { t.DocNum }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocNum);
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }

        //public string CreaEntradaOCRecepcion(int RecpecionId, string usuario)
        //{
        //    string ret = "-1";
        //    SAPbobsCOM.Company oCmp;
        //    string reterror = string.Empty;
        //    oCmp = CnxSAP(ref reterror);
        //    try
        //    {
        //        int iError = 0;

        //        DateTime fechadoc = new DateTime(2019, 1, 3);
        //        SAPbobsCOM.Documents doc;
        //        doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oPurchaseDeliveryNotes);
        //        doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
        //        doc.DocDate = DateTime.Now;      
        //        doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
        //        doc.UserFields.Fields.Item("U_IdWms").Value = RecpecionId;
        //        doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
              
        //        CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
        //        List<SMM_VW_RecepcionDetalle> dt = new List<SMM_VW_RecepcionDetalle>();
        //        dt = vWMS.ObtieneDetalleRecepcionSMM(RecpecionId);
        //        foreach (var d in dt)
        //        {
        //            doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.Reception_DocNumber;
        //            doc.Comments = d.Reception_Note;
        //            doc.CardCode = d.CardCode;
        //            doc.Lines.WarehouseCode = d.Site_Description;
        //            doc.Lines.ItemCode = d.ItemCode;
        //            doc.Lines.BaseEntry = ObtieneDocEntryOC(Convert.ToInt32(d.NumDocSAP), d.ItemCode);
        //            doc.Lines.BaseType = 22;
        //            doc.Lines.BaseLine = ObtieneLinenumOC(Convert.ToInt32(d.NumDocSAP), d.ItemCode);
        //            doc.Lines.ShipDate = DateTime.Now;
                    
        //            doc.Lines.Quantity = (double)d.Quantity;                    

        //            doc.Lines.Add();
        //        }

        //        iError = doc.Add();
        //        if (iError == 0)
        //        {
        //            ret = "0";
        //        }
        //        else
        //        {
        //            ret = oCmp.GetLastErrorDescription();
        //        }
        //        oCmp.Disconnect();
        //    }
        //    catch (Exception)
        //    {
        //        oCmp.Disconnect();

        //    }
        //    return ret;
        //}


        public string CreaEntradaRecepcionOC(int RecpecionId, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;

                //DateTime fechadoc = new DateTime(2019, 1, 3);

                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oPurchaseDeliveryNotes);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = RecpecionId;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;

                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                List<SMM_VW_DetalleRecepcion> dt = new List<SMM_VW_DetalleRecepcion>();
                dt = vWMS.ObtieneDetalleRecepcionSMM(RecpecionId);
                foreach (var d in dt)
                {
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.Reception_DocNumber;
                    doc.Comments = d.Reception_Note;
                    doc.CardCode = d.CardCode;
                    doc.Lines.WarehouseCode = d.Site_Description;
                    doc.Lines.ItemCode = d.ItemCode;
                    doc.Lines.BaseEntry = ObtieneDocEntryOC(Convert.ToInt32(d.NumDocSAP), d.ItemCode);
                    doc.Lines.BaseType = 22;
                    doc.Lines.BaseLine = ObtieneLinenumOC(Convert.ToInt32(d.NumDocSAP), d.ItemCode,Convert.ToInt32(d.UomEntry));
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.UoMEntry =Convert.ToInt32(d.UomEntry);
                    doc.Lines.Quantity = (double)d.Quantity;

                    doc.Lines.Add();
                }

                iError = doc.Add();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch (Exception ex)
            {

                string err = ex.Message;
                oCmp.Disconnect();

            }
            return ret;
        }
        public double ObtienePrecioPromedioProducto(string CodProducto)
        {
            double ret = 0;
            try
            {
                var temp = (from pp in DBSMMSap.MMetro_OITM
                            where pp.ItemCode.Equals(CodProducto)
                            select new { pp.AvgPrice }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (double)temp.AvgPrice;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string CreaEntradaRecepcionAjuste(int RecpecionId, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;


                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oInventoryGenEntry);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = RecpecionId;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                List<SMM_VW_DetalleRecepcion> dt = new List<SMM_VW_DetalleRecepcion>();
                dt = vWMS.ObtieneDetalleRecepcionSMM(RecpecionId);
                foreach (var d in dt)
                {
                    doc.Comments = d.Reception_Note;
                    doc.Lines.WarehouseCode = d.Site_Description;
                    doc.Lines.ItemCode = d.ItemCode;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Quantity;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ItemCode);

                    doc.Lines.Add();
                }

                iError = doc.Add();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch (Exception)
            {
                oCmp.Disconnect();

            }
            return ret;
        }

        public double ObtienePrecioFacturaProducto(string CodProducto, int Factura)
        {
            double ret = 0;
            try
            {
                var temp = (from pp in DBSMMSap.MMETRO_OINV
                            join pd in DBSMMSap.MMETRO_INV1 on pp.DocEntry equals pd.DocEntry
                            where pd.ItemCode.Equals(CodProducto) && pp.FolioNum.Equals(Factura)
                            select new { pd.Price }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (double)temp.Price;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string CreaDevolucion(int RecpecionId, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;


                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oReturns);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = RecpecionId;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                List<SMM_VW_DetalleRecepcion> dt = new List<SMM_VW_DetalleRecepcion>();
                dt = vWMS.ObtieneDetalleRecepcionSMM(RecpecionId);
                foreach (var d in dt)
                {
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.Reception_DocNumber;
                    doc.UserFields.Fields.Item("U_FolioRef").Value = d.Reception_DocNumber.ToString();
                    doc.Comments = d.Reception_Note;
                    doc.CardCode = d.CardCode;
                    
                    doc.Comments = d.Reception_Note;
                    doc.Lines.WarehouseCode = d.Site_Description;
                    doc.Lines.ItemCode = d.ItemCode;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Quantity;
                    doc.Lines.UnitPrice = ObtienePrecioFacturaProducto(d.ItemCode, d.Reception_DocNumber);

                    doc.Lines.Add();
                }

                iError = doc.Add();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch (Exception)
            {
                oCmp.Disconnect();

            }
            return ret;
        }
        public string CreaTransferenciaRecepcion(int RecepId, string usuario)
        {


            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                List<SMM_VW_DetalleRecepcion_Transferencia> dt = new List<SMM_VW_DetalleRecepcion_Transferencia>();
                dt = vWMS.ObtieneDetalleRecepcionSMMTransferencia(RecepId);

                SAPbobsCOM.StockTransfer doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oStockTransfer);
                doc.FromWarehouse = "01";
                
                doc.DocDate = DateTime.Now;
                doc.Comments = "Transferencia  " + RecepId.ToString() + "  Sistema CVT";
                doc.PriceList = -2;
                doc.UserFields.Fields.Item("U_IdWms").Value = RecepId;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;

                foreach (var r in dt)
                {
                    doc.ToWarehouse = r.Site_Description;
                    doc.Lines.ItemCode = r.ItemCode;
                    doc.Lines.Quantity = (double)r.Quantity;
                    doc.Lines.Add();
                }


                //doc.Lines.ItemCode = articulo;
                //doc.Lines.ShipDate = DateTime.Now;
                //doc.Lines.Quantity = (double)cantidad;
                //doc.Lines.UserFields.Fields.Item("U_TipoDocRel").Value = 202;
                //doc.Lines.UserFields.Fields.Item("U_FolioDocRel").Value = OF;

                // doc.Lines.Add();
                iError = doc.Add();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch (Exception)
            {
                oCmp.Disconnect();

            }
            return ret;

        }
        public string CreaTransferencia(int transferid, string bOrigen, string bDestino, string usuario)
        {


            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;
                List<SMM_VW_TransferDetail> dt = new List<SMM_VW_TransferDetail>();
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                dt = vWMS.ObtieneVWDetalleTransferencia(transferid);

                SAPbobsCOM.StockTransfer doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oStockTransfer);
                doc.FromWarehouse = bOrigen;
                doc.ToWarehouse = bDestino;
                doc.DocDate = DateTime.Now;
                doc.Comments = "Transferencia  " + transferid.ToString() + "  Sistema CVT";
                doc.PriceList = -2;
                doc.UserFields.Fields.Item("U_IdWms").Value = transferid;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;

                foreach (var r in dt)
                {
                    doc.Lines.ItemCode = r.ItemCode;
                    doc.Lines.Quantity = (double)r.Quantity;
                    //doc.Lines.UoMEntry=Convert.ToInt32(r.UomEntry);
                    doc.Lines.Add();
                }
                
                iError = doc.Add();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch (Exception ex)
            {
                oCmp.Disconnect();
                string err = ex.Message;

            }
            return ret;

        }
        public int ObtieneDocEntryOF(int OF)
        {
            int ret = 0;
            try
            {
                var temp = (from o in DBSMMSap.MMETRO_OWOR
                            where o.DocNum.Equals(OF)
                            select new { o.DocEntry }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocEntry);
                }
            }
            catch
            {
            }
            return ret;
        }
        public string CreaReciboPorduccionSMM(int OF, string Lote, DateTime vencimiento, int cantidad)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;

                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oInventoryGenEntry);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.Comments = "Recibo PT Automatizado OF ";
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                //doc.PaymentGroupCode = -2;
                //doc.UserFields
                doc.Lines.BaseType = 202;
                doc.Lines.BaseEntry = ObtieneDocEntryOF(OF);

                //doc.Lines.WarehouseCode = BodegaDflt   'Bodega por defecto de Producto
                doc.Lines.BatchNumbers.BatchNumber = Lote;
                doc.Lines.BatchNumbers.ManufacturingDate = DateTime.Now;
                doc.Lines.BatchNumbers.ExpiryDate = vencimiento;
                doc.Lines.BatchNumbers.Quantity = cantidad;
                doc.Lines.BatchNumbers.Add();

                doc.Lines.ShipDate = DateTime.Now;
                doc.Lines.Quantity = cantidad;

                doc.Lines.Add();
                iError = doc.Add();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch (Exception)
            {
                oCmp.Disconnect();

            }
            return ret;
        }

        public string CreaSalidaExpedicionRapida(int ExpeditionId, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;
                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oInventoryGenExit);
                doc.DocDate = DateTime.Now;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = ExpeditionId;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                doc.UserFields.Fields.Item("U_TipoAjuste").Value = 3;
                doc.Comments = "Salida Desecho";
                doc.JournalMemo = "Salida Desecho";
                doc.PaymentGroupCode = -2;
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();

                List<SMM_VW_ExpedicionDetalle> dt = vWMS.ObtieneExpedicionDetalleSMM(ExpeditionId);
                foreach (var d in dt)
                {
                    doc.Lines.WarehouseCode = d.Site_Description;
                    doc.Lines.ItemCode = d.ItemCode;
                    doc.Lines.UnitPrice = (double)d.AvgPrice;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.AccountCode = d.SaleCostAc;
                    doc.Lines.Quantity = (double)d.Quantity;
                    //doc.Lines.CostingCode4 = d.Expedition_Motivo.ToString();
                    doc.Lines.Add();
                }
                iError = doc.Add();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch (Exception)
            {
                oCmp.Disconnect();

            }
            return ret;
        }

        public string ObtieneNombreProducto(string itemCod)
        {
            string ret = "";
            try
            {
                var temp = (from t in DBSMMSap.MMetro_OITM
                            where t.ItemCode.Equals(itemCod)
                            select new { t.ItemName }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.ItemName);
                }
            }
            catch
            {
                ret = "";
            }
            return ret;
        }

        public List<VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS> ListaProductosOrdenVenta(string Codpro)
        {
            List<VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS> ret = new List<VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS>();
            try
            {
                DBDesaint.CommandTimeout = 3600;
                ret = (from t in DBSMMSap.VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS
                       where t.Codproducto.Equals(Codpro)
                       select t).ToList();
            }
            catch (Exception ex)
            {
                throw new Exception("Mensaje.", ex);
            }
            return ret;
        }

        public string ObtieneNombreDireccionCliente(string CodCliente,string TipoDirec)
        {
            string ret = "";
            try
            {
                var temp = (from t in DBSMMSap.MMETRO_CRD1
                            where t.CardCode.Equals(CodCliente) && t.AdresType.Equals(TipoDirec)
                            select new { t.Street,t.County,t.City }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Street + ", "+temp.County+", "+temp.City;
                }
            }
            catch
            {
                ret = "";
            }
            return ret;
        }


        public string CreaEntradaAjusteDocumentoElectronico(int PreventaID, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;


                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oInventoryGenEntry);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = PreventaID;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                //doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                List<SMM_Ajuste_Documento_Electronico> dt = new List<SMM_Ajuste_Documento_Electronico>();
                dt = vWMS.ObtieneDetosAjusteDocElectronico(PreventaID);
                foreach (var d in dt)
                {
                    doc.Comments = "Ajuste Preventa"+PreventaID;
                    doc.Lines.WarehouseCode = "01";
                    doc.Lines.ItemCode = d.ItemCode;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Faltante;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ItemCode);

                    doc.Lines.Add();
                }

                iError = doc.Add();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch (Exception)
            {
                oCmp.Disconnect();

            }
            return ret;
        }
    }
}
