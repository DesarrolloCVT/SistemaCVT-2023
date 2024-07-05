using Microsoft.Web.Administration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class SAPFilmClass
    {
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();

        string SAPusername = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPusername"]);
        string SAPuserpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPuserpass"]);
        string SAPCompany = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["SAPCompany"]);
        string DBServer = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBServer"]);
        string DBusername = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBusername"]);
        string DBuserpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBuserpass"]);
        string DBType = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["DBType"]);
        string ServerLicence = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["ServerLicence"]);

        public SAPFilmClass()
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

        public int ObtieneDocEntryOCFilm(int oc, string codprod)
        {
            int ret = 0;
            try
            {
                //var temp = (from p1 in DBSap.PCH1
                //            where p1.BaseEntry == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                //            select new { p1.DocEntry }).FirstOrDefault();
                var temp = (from p1 in DBSap.POR1
                            join p in DBSap.OPOR on p1.DocEntry equals p.DocEntry
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
        public int ObtieneLinenumOCFilm(int oc, string codprod)
        {
            int ret = 0;
            try
            {
                //var temp = (from p1 in DBSap.PCH1
                //           where p1.BaseEntry == oc && p1.ItemCode == codprod && p1.LineStatus=='O'
                //           select new { p1.LineNum }).FirstOrDefault();
                var temp = (from p1 in DBSap.POR1
                            join p in DBSap.OPOR on p1.DocEntry equals p.DocEntry
                            where p.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
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

        public string ObtieneCurrencyOCFilm(int oc, string codprod)
        {
            string ret = string.Empty;
            try
            {
                //var temp = (from p1 in DBSap.PCH1
                //           where p1.BaseEntry == oc && p1.ItemCode == codprod && p1.LineStatus=='O'
                //           select new { p1.LineNum }).FirstOrDefault();
                var temp = (from p1 in DBSap.POR1
                            join p in DBSap.OPOR on p1.DocEntry equals p.DocEntry
                            where p.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                            select new { p.DocCur }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.DocCur.ToString();
                }
            }
            catch
            {
            }
            return ret;
        }

        public decimal ObtieneRateOCFilm(int oc, string codprod)
        {
            decimal ret = 0;
            try
            {
                //var temp = (from p1 in DBSap.PCH1
                //           where p1.BaseEntry == oc && p1.ItemCode == codprod && p1.LineStatus=='O'
                //           select new { p1.LineNum }).FirstOrDefault();
                var temp = (from p1 in DBSap.POR1
                            join p in DBSap.OPOR on p1.DocEntry equals p.DocEntry
                            where p.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                            select new { p.DocRate }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToDecimal(temp.DocRate);
                }
            }
            catch
            {
            }
            return ret;
        }

        public string CreaEntradaOCRecepcionFilm(int RecpecionId, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;

                DateTime fechadoc = new DateTime(2019, 1, 3);
                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oPurchaseDeliveryNotes);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                //doc.TaxDate = fechadoc;
                //doc.DocDueDate = fechadoc;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = RecpecionId;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                //doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;             
                ControlFilmClass cC = new ControlFilmClass();

                List<VW_DetalleRecepcion_Film> dt = new List<VW_DetalleRecepcion_Film>();
                dt = cC.ObtieneDetalleRecepcionFilm(RecpecionId);
                foreach (var d in dt)
                {
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.NumeroDoc;
                    doc.Comments =d.Comentario;
                    doc.CardCode = d.Proveedor;
                    //doc.UserFields.Fields.Item("U_SELLO").Value = d.Sello != null ? d.Sello : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloAduana").Value = d.SelloAduana != null ? d.SelloAduana : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloSAG").Value = d.SelloSAG != null ? d.SelloSAG : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.NoContenedor != null ? d.NoContenedor : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_DI_Despacho").Value = d.NoDIDespacho != null ? d.NoDIDespacho : string.Empty;
                    //doc.UserFields.Fields.Item("U_TipoDescarga").Value = d.TipoDescarga != null ? d.TipoDescarga : 0;
                    //doc.UserFields.Fields.Item("U_TipoContenedor").Value = d.TipoContenedor != null ? d.TipoContenedor : 0;
                    //doc.UserFields.Fields.Item("U_HORAINICIO").Value = d.HoraInicio != null ? Convert.ToInt32(d.HoraInicio) : 0;
                    //doc.UserFields.Fields.Item("U_HORATERMINO").Value = d.HoraTermino != null ? Convert.ToInt32(d.HoraTermino) : 0;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.Producto;
                    doc.Lines.BaseEntry = ObtieneDocEntryOCFilm(Convert.ToInt32(d.NumeroDocSAp), d.Producto);
                    doc.Lines.BaseType = 22;
                    doc.Lines.BaseLine = ObtieneLinenumOCFilm(Convert.ToInt32(d.NumeroDocSAp), d.Producto);
                    doc.DocCurrency = ObtieneCurrencyOCFilm(Convert.ToInt32(d.NumeroDocSAp), d.Producto);
                    doc.DocRate = (double)ObtieneRateOCFilm(Convert.ToInt32(d.NumeroDocSAp), d.Producto);
                    doc.Lines.ShipDate = DateTime.Now;
                    //int cantidadPendiente = ObtieneCantPendienteProducto(Convert.ToInt32(d.Reception_U_NumDocSAP), 2, d.ArticleProvider_CodClient);
                    //if (cantidadPendiente >= d.Cantidad)
                    //{
                    doc.Lines.Quantity = (double)d.Cantidad;
                    //}
                    //else
                    //{
                    //    doc.Lines.Quantity = (double)cantidadPendiente;

                    //}
                    //doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
                    List<VW_DetalleRecepcion_Film_lotes> lt = new List<VW_DetalleRecepcion_Film_lotes>();
                    lt = cC.ObtieneDetalleLoteRecepcionFilm(RecpecionId, d.Producto);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.LoteInterno;
                        //if (cantidadPendiente >= d.Cantidad)
                        //{
                        doc.Lines.BatchNumbers.Quantity = (double)l.Cantidad;
                        //}
                        //else
                        //{
                        //    doc.Lines.BatchNumbers.Quantity = cantidadPendiente;
                        //    CreaEntradaRecepcionExcesos(RecpecionId, usuario, Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient, Convert.ToInt32(d.Cantidad) - cantidadPendiente, oCmp);
                        //}
                        doc.Lines.BatchNumbers.Add();
                    }

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

        public int ValidaExcesoRecepcionFilm(int OC, int RecepcionId)
        {
            int ret = 0;
            try
            {
                var temp = (from vv in DBSap.CVT_VW_VALIDA_PORC_EXCESO_RECEPCION_FILM
                            where vv.Reception_Id.Equals(RecepcionId) && vv.OC.Equals(OC)
                            select new { vv.Reception_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (int)temp.Reception_Id;
                }
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }

        public decimal ObtieneCantPendienteProductoFilm(int oc, int tipo, string codprod)
        {
            decimal ret = 0;
            try
            {
                if (tipo == 1)
                {
                    var temp = (from p1 in DBSap.PCH1
                                join po1 in DBSap.POR1 on p1.BaseEntry equals po1.DocEntry
                                join o in DBSap.OPOR on po1.DocEntry equals o.DocEntry
                                where o.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                                select new { p1.OpenQty }).FirstOrDefault();
                    if (temp != null)
                    {
                        ret = Convert.ToDecimal(temp.OpenQty);
                    }
                }
                if (tipo == 2)
                {
                    var temp = (from p1 in DBSap.POR1
                                join p in DBSap.OPOR on p1.DocEntry equals p.DocEntry
                                where p.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                                select new { p1.OpenQty }).FirstOrDefault();
                    if (temp != null)
                    {
                        ret = Convert.ToDecimal(temp.OpenQty);
                    }
                }
            }
            catch
            {
            }
            return ret;
        }

        public int ObtieneDocNumEntradaAjusteFilm(int idrecepcion)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSap.OIGN
                            where t.U_IdWms.Equals(idrecepcion)
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
        public double ObtienePrecioPromedioProductoFilm(string CodProducto)
        {
            double ret = 0;
            try
            {
                var temp = (from pp in DBSap.CVT_VW_PrecioPromedioProducto
                            where pp.ItemCode.Equals(CodProducto)
                            select new { pp.Precio }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (double)temp.Precio;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string ObtieneCuentaFilm(string codprod)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from a in DBDesaint.CVT_VW_LeeCuentaExistenciasxProducto
                            where a.ItemCode.Equals(codprod)
                            select new { a.BalInvntAc }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.BalInvntAc;
                }
            }
            catch
            {
            }
            return ret;
        }
    

        public string CreaEntradaRecepcionExcesos(int RecpecionId, string usuario, int oc, string codprod, decimal cantidad, SAPbobsCOM.Company Comp)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp = Comp;
            string reterror = string.Empty;
            //oCmp = CnxSAP(ref reterror);
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
                //WMSClass vWMS = new WMSClass();

                ControlFilmClass cC = new ControlFilmClass();
                List<VW_DetalleRecepcion_Film> dt = new List<VW_DetalleRecepcion_Film>();
                dt = cC.ObtieneDetalleRecepcionExcesoFilm(RecpecionId, codprod);
                foreach (var d in dt)
                {
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.NumeroDoc;
                    doc.Comments = "";
                    // doc.CardCode = d.Business_Partner_Provider;
                    //doc.UserFields.Fields.Item("U_SELLO").Value = d.Sello != null ? d.Sello : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloAduana").Value = d.SelloAduana != null ? d.SelloAduana : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloSAG").Value = d.SelloSAG != null ? d.SelloSAG : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.NoContenedor != null ? d.NoContenedor : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_DI_Despacho").Value = d.NoDIDespacho != null ? d.NoDIDespacho : string.Empty;
                    //doc.UserFields.Fields.Item("U_TipoDescarga").Value = d.TipoDescarga != null ? d.TipoDescarga : 0;
                    //doc.UserFields.Fields.Item("U_TipoContenedor").Value = d.TipoContenedor != null ? d.TipoContenedor : 0;
                    //doc.UserFields.Fields.Item("U_HORAINICIO").Value = d.HoraInicio != null ? Convert.ToInt32(d.HoraInicio) : 0;
                    //doc.UserFields.Fields.Item("U_HORATERMINO").Value = d.HoraTermino != null ? Convert.ToInt32(d.HoraTermino) : 0;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.Producto;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProductoFilm(d.Producto);
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.UserFields.Fields.Item("U_TipoDocRel").Value = 22;
                    doc.Lines.UserFields.Fields.Item("U_FolioDocRel").Value = oc;
                    doc.Lines.AccountCode = ObtieneCuentaFilm(d.Producto);
                    doc.Lines.Quantity = (double)cantidad;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProductoFilm(d.Producto);
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    List<VW_DetalleRecepcion_Film_lotes> lt = new List<VW_DetalleRecepcion_Film_lotes>();
                    lt = cC.ObtieneDetalleLoteRecepcionFilm(RecpecionId, d.Producto);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.LoteInterno;
                        doc.Lines.BatchNumbers.Quantity = (double)cantidad;
                        doc.Lines.BatchNumbers.Add();
                    }

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
                //oCmp.Disconnect();
            }
            catch (Exception)
            {
                // oCmp.Disconnect();
                // 
            }
            return ret;
        }

        public int ObtieneDocEntryFRFilm(int oc, string codprod)
        {
            int ret = 0;
            try
            {
                var temp = (from p1 in DBSap.PCH1
                            join po1 in DBSap.POR1 on p1.BaseEntry equals po1.DocEntry
                            join o in DBSap.OPOR on po1.DocEntry equals o.DocEntry
                            where o.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
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

        public int ObtieneLinenumFRFilm(int oc, string codprod)
        {
            int ret = 0;
            try
            {
                var temp = (from p1 in DBSap.PCH1
                            join po1 in DBSap.POR1 on p1.BaseEntry equals po1.DocEntry
                            join o in DBSap.OPOR on po1.DocEntry equals o.DocEntry
                            where o.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                            select new { p1.LineNum }).FirstOrDefault();
                //var temp = (from p1 in DBSap.POR1
                //            join p in DBSap.OPOR on p1.DocEntry equals p.DocEntry
                //            where p.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                //            select new { p1.LineNum }).FirstOrDefault();
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
        public string CreaEntradaFRRecepcionFilm(int RecpecionId, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;

                DateTime fechadoc = new DateTime(2018, 12, 29);
                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oPurchaseDeliveryNotes);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                //doc.TaxDate = fechadoc;
                //doc.DocDueDate = fechadoc;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = RecpecionId;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                //doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                //WMSClass vWMS = new WMSClass();
                ControlFilmClass cC = new ControlFilmClass();
                List<VW_DetalleRecepcion_Film> dt = new List<VW_DetalleRecepcion_Film>();
                dt = cC.ObtieneDetalleRecepcionFilm(RecpecionId);
                foreach (var d in dt)
                {
                    decimal cantidadPendiente = ObtieneCantPendienteProductoFilm(Convert.ToInt32(d.NumeroDocSAp), 1, d.Producto);
                    if (cantidadPendiente == 0)
                    {
                        if (ObtieneDocNumEntradaAjusteFilm(RecpecionId) == 0)
                        {
                            CreaEntradaRecepcionExcesos(RecpecionId, usuario, Convert.ToInt32(d.NumeroDocSAp), d.Producto, Convert.ToDecimal(d.Cantidad) - cantidadPendiente, oCmp);
                            break;
                        }
                    }
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.NumeroDoc;
                    doc.Comments = "";
                    doc.CardCode = d.Proveedor;
                    //doc.UserFields.Fields.Item("U_SELLO").Value = d.Sello != null ? d.Sello : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloAduana").Value = d.SelloAduana != null ? d.SelloAduana : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloSAG").Value = d.SelloSAG != null ? d.SelloSAG : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.NoContenedor != null ? d.NoContenedor : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_DI_Despacho").Value = d.NoDIDespacho != null ? d.NoDIDespacho : string.Empty;
                    //doc.UserFields.Fields.Item("U_TipoDescarga").Value = d.TipoDescarga != null ? d.TipoDescarga : 0;
                    //doc.UserFields.Fields.Item("U_TipoContenedor").Value = d.TipoContenedor != null ? d.TipoContenedor : 0;
                    //doc.UserFields.Fields.Item("U_HORAINICIO").Value = d.HoraInicio != null ? Convert.ToInt32(d.HoraInicio) : 0;
                    //doc.UserFields.Fields.Item("U_HORATERMINO").Value = d.HoraTermino != null ? Convert.ToInt32(d.HoraTermino) : 0;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.Producto;
                    doc.Lines.BaseEntry = ObtieneDocEntryFRFilm(Convert.ToInt32(d.NumeroDocSAp), d.Producto);
                    doc.Lines.BaseType = 18;
                    doc.Lines.BaseLine = ObtieneLinenumFRFilm(Convert.ToInt32(d.NumeroDocSAp), d.Producto);
                    //doc.DocCurrency = ObtieneCurrencyFR(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    //doc.DocRate = (double)ObtieneRateFR(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    doc.Lines.ShipDate = DateTime.Now;

                    if (cantidadPendiente >= d.Cantidad)
                    {
                        doc.Lines.Quantity = (double)d.Cantidad;
                    }
                    else
                    {
                        doc.Lines.Quantity = (double)cantidadPendiente;

                    }
                    //doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
                    List<VW_DetalleRecepcion_Film_lotes> lt = new List<VW_DetalleRecepcion_Film_lotes>();
                    lt = cC.ObtieneDetalleLoteRecepcionFilm(RecpecionId, d.Producto);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.LoteInterno;
                        if (cantidadPendiente >= d.Cantidad)
                        {
                            doc.Lines.BatchNumbers.Quantity = (int)l.Cantidad;
                        }
                        else
                        {
                            doc.Lines.BatchNumbers.Quantity = (double)cantidadPendiente;
                            CreaEntradaRecepcionExcesos(RecpecionId, usuario, Convert.ToInt32(d.NumeroDocSAp), d.Producto, Convert.ToDecimal(d.Cantidad) - cantidadPendiente, oCmp);
                        }
                        doc.Lines.BatchNumbers.Add();
                    }

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


        public int ObtieneDocNumTransferenciaSAPFilm(int TransferID)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSap.OWTR
                            where t.U_IdWms.Equals(TransferID)
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

        public string CreaTransferenciaFilm(int transferid, string bOrigen, string bDestino, string usuario)
        {


            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;
                List<VW_TranferenciaSAP_Film> dt = new List<VW_TranferenciaSAP_Film>();
                WMSClass vWMS = new WMSClass();

                ControlFilmClass cC = new ControlFilmClass();
                dt = cC.ObtieneVWDetalleTransferenciaFilm(transferid);

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
                    doc.Lines.ItemCode = r.Producto;
                    doc.Lines.Quantity = (double)r.Cantidad;
                    List<VW_TranferSAPLotes_Film> dl = new List<VW_TranferSAPLotes_Film>();
                    dl = cC.ObtieneVWDetalleTransferenciaLotesFilm(transferid, r.Producto);
                    foreach (var l in dl)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.LoteInterno;
                        doc.Lines.BatchNumbers.Quantity = (double)l.Cantidad;
                        doc.Lines.BatchNumbers.Add();
                    }
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
    }
}
