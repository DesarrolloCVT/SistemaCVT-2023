using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Microsoft.Web.Administration;


namespace DBMermasRecepcion
{
    public class SAPClass
    {
        public SAPClass()
        {
        }

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
                oCompany.LicenseServer = ServerLicence;//+ ":30000";
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

                reterror = err.Message.ToString();
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

        public bool InsertaRegistroMerma(string varDocEntryRec, string varLineNum, int varDocNumRec, int varNumOrdenC, string varItemCode, int varNumGuiaDesp, int varRecepWms, string Seguro, int MotMerma, int CantMerma, string Manifiesto, string Comentario)
        {
            bool ret = false;
            string id = string.Empty;
            int iError = 0;
            string sError = string.Empty;
            SAPbobsCOM.UserTable UTable;
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            //'Dim Registro As SAPbobsCOM.User
            //Cursor = System.Windows.Forms.Cursors.WaitCursor
            try
            {
                varLineNum = (Convert.ToInt32(varLineNum) - 1).ToString();
                UTable = oCmp.UserTables.Item("MERMARECEPCION");

                if (!UTable.GetByKey(varDocEntryRec + "-" + varLineNum))
                {
                    //Campos obligatorios proporcionados por SAP
                    UTable.Code = varDocEntryRec + "-" + varLineNum;
                    UTable.Name = "Rec:" + varDocEntryRec + " - Linea:" + varLineNum;
                    //Campos agregados
                    UTable.UserFields.Fields.Item("U_DocEntryRec").Value = varDocEntryRec;
                    UTable.UserFields.Fields.Item("U_DocNumRec").Value = varDocNumRec; // GridDetRecep.Rows(GridDetRecep.CurrentRow.Index).Cells(0).Value()
                    UTable.UserFields.Fields.Item("U_BaseNum").Value = varNumOrdenC;  //GridRecepciones.Rows(GridRecepciones.CurrentRow.Index).Cells(0).Value()
                    UTable.UserFields.Fields.Item("U_LineNumRec").Value = varLineNum;
                    UTable.UserFields.Fields.Item("U_ItemCode").Value = varItemCode;
                    UTable.UserFields.Fields.Item("U_NumGuiaDesp").Value = varNumGuiaDesp;//  'GridRecepciones.Rows(GridRecepciones.CurrentRow.Index).Cells(4).Value()
                    UTable.UserFields.Fields.Item("U_Reception_Id").Value = varRecepWms;//  'GridRecepciones.Rows(GridRecepciones.CurrentRow.Index).Cells(5).Value()

                    UTable.UserFields.Fields.Item("U_Ind_ReclamoSeguro").Value = Seguro;
                    UTable.UserFields.Fields.Item("U_TipoMerma").Value = MotMerma == 0 ? "" : MotMerma.ToString(); ;
                    UTable.UserFields.Fields.Item("U_Cant_Merma").Value = CantMerma;
                    UTable.UserFields.Fields.Item("U_Manifiesto").Value = Manifiesto;
                    UTable.UserFields.Fields.Item("U_Comentario").Value = Comentario;

                    iError = UTable.Add();
                    if (iError != 0)
                    {
                        oCmp.GetLastError(out iError, out sError);
                        //MsgBox(sError, MsgBoxStyle.Exclamation, Me.Text);
                        oCmp.Disconnect();
                    }
                    else
                    {
                        id = oCmp.GetNewObjectKey();
                        //Cursor = System.Windows.Forms.Cursors.Default;
                        //MsgBox("Documento Registrado con éxito", MsgBoxStyle.Information, Me.Text);
                    }
                }
                else
                {
                    UTable.UserFields.Fields.Item("U_Ind_ReclamoSeguro").Value = Seguro;
                    UTable.UserFields.Fields.Item("U_TipoMerma").Value = MotMerma == 0 ? "" : MotMerma.ToString();
                    UTable.UserFields.Fields.Item("U_Cant_Merma").Value = CantMerma;
                    UTable.UserFields.Fields.Item("U_Manifiesto").Value = Manifiesto;
                    UTable.UserFields.Fields.Item("U_Comentario").Value = Comentario;

                    iError = UTable.Update();
                    if (iError != 0)
                    {
                        oCmp.GetLastError(out iError, out sError);
                        //MsgBox(sError, MsgBoxStyle.Exclamation, Me.Text);
                        oCmp.Disconnect();
                    }
                    else
                    {
                        id = oCmp.GetNewObjectKey();
                        //Cursor = System.Windows.Forms.Cursors.Default;
                        //MsgBox("Documento Actualizado con éxito", MsgBoxStyle.Information, Me.Text);
                    }
                }
                //txtProducto.Text = "";
                //txtCantDetRec.Text = "";
                //chkReclamoSeguro.Checked = false;
                //cmbMotivoMerma.SelectedIndex = -1;
                //txtCantMerma.Text = "";
                //varFormUpdated = false;
            }
            catch (Exception ex)
            {
                string st = ex.Message;
            }
            oCmp.Disconnect();
            //varFormUpdated = false;
            //Call cmdBuscar_Click(sender, e);
            //Cursor = System.Windows.Forms.Cursors.Default;
            return ret;
        }

        public bool InsertaRegistroSeguro(string varDocEntryRec, string varLineNum, DateTime FechaRecl, string NPoliza, int CantRecl, double MontoSiniestro, int PorcDeducible, double MontoDeducible, double MontoPagoSin, DateTime FechaPagoSin, string Comentario)
        {
            bool ret = false;
            string id = string.Empty;
            int iError = 0;
            string sError = string.Empty;
            SAPbobsCOM.UserTable UTable;
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            //'Dim Registro As SAPbobsCOM.User
            //Cursor = System.Windows.Forms.Cursors.WaitCursor
            try
            {
                varLineNum = (Convert.ToInt32(varLineNum) - 1).ToString();
                UTable = oCmp.UserTables.Item("MERMARECEPCION");

                if (UTable.GetByKey(varDocEntryRec + "-" + varLineNum))
                {

                    UTable.UserFields.Fields.Item("U_FechaReclamo").Value = FechaRecl;
                    UTable.UserFields.Fields.Item("U_NumPoliza").Value = NPoliza;
                    UTable.UserFields.Fields.Item("U_Cant_Reclamo").Value = CantRecl;
                    UTable.UserFields.Fields.Item("U_MontoSiniestro").Value = MontoSiniestro;
                    UTable.UserFields.Fields.Item("U_PorcDeducible").Value = PorcDeducible;
                    UTable.UserFields.Fields.Item("U_MontoDeducible").Value = MontoDeducible;
                    UTable.UserFields.Fields.Item("U_MontoPagoSin").Value = MontoPagoSin;
                    UTable.UserFields.Fields.Item("U_FechaPagoSin").Value = FechaPagoSin;
                    UTable.UserFields.Fields.Item("U_Comen_Siniestro").Value = Comentario;

                    iError = UTable.Update();
                    if (iError != 0)
                    {
                        oCmp.GetLastError(out iError, out sError);
                        //MsgBox(sError, MsgBoxStyle.Exclamation, Me.Text);
                        oCmp.Disconnect();
                    }
                    else
                    {
                        id = oCmp.GetNewObjectKey();
                        //Cursor = System.Windows.Forms.Cursors.Default;
                        //MsgBox("Documento Actualizado con éxito", MsgBoxStyle.Information, Me.Text);
                    }
                }
                //txtProducto.Text = "";
                //txtCantDetRec.Text = "";
                //chkReclamoSeguro.Checked = false;
                //cmbMotivoMerma.SelectedIndex = -1;
                //txtCantMerma.Text = "";
                //varFormUpdated = false;
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
            }
            oCmp.Disconnect();
            //varFormUpdated = false;
            //Call cmdBuscar_Click(sender, e);
            //Cursor = System.Windows.Forms.Cursors.Default;
            return ret;
        }
        public List<_MERMARECEPCION> ObtieneDatosMermas(string docentry, string linenum)
        {
            List<_MERMARECEPCION> ret = new List<_MERMARECEPCION>();
            try
            {
                ret = (from m in DBSap._MERMARECEPCION
                       where m.Code.Equals(docentry.ToString() + "-" + linenum.ToString())
                       select m).ToList<_MERMARECEPCION>();
            }
            catch
            {
            }
            return ret;
        }
        public bool ActualizaTipoCambio(DataTable dt, string Moneda)
        {
            bool ret = false;
            try
            {
                SAPbobsCOM.Company oCmp;
                SAPbobsCOM.SBObob oSBObob;
                string reterror = string.Empty;
                oCmp = CnxSAP(ref reterror);
                oSBObob = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.BoBridge);
                double UltValor = 0;
                foreach (DataRow rw in dt.Rows)
                {
                    if (rw["Valor"].ToString() != "NeuN")
                    {
                        oSBObob.SetCurrencyRate(Moneda, Convert.ToDateTime(rw["Fecha"]), Convert.ToDouble(rw["Valor"]), true);
                        UltValor = Convert.ToDouble(rw["Valor"]);
                    }
                    if (rw["Valor"] == "NeuN" && UltValor != 0)
                    {
                        oSBObob.SetCurrencyRate(Moneda, Convert.ToDateTime(rw["Fecha"]), UltValor, true);
                    }
                }
            }
            catch
            {
            }
            return ret;
        }
        public DataTable ObtieneListaCobranza(int CodVendedor, string Cliente, DateTime Fecha)
        {
            DBSap.CommandTimeout = 300;
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            try
            {
                dt = Utilidades.LINQToDataTable(DBSap.CVT_RPT_ListaCobranza1(CodVendedor, Cliente, Fecha, true));
                DataView dv = new DataView(dt);
                dv.RowFilter = "Saldo<>0";
                dt = dv.Table;
                dt1 = dv.ToTable();
            }
            catch (Exception)
            {


            }
            return dt1;
        }
        public string ObtieneCodProductoOF(int DocNum)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from vo in DBSap.CVT_ListaOFLiberadas
                            where vo.OF.Equals(DocNum)
                            select new { vo.CodProducto }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CodProducto.ToString();
                }
            }
            catch
            {
            }
            return ret;
        }
        public decimal ObtienePesoProducto(string codarticulo)
        {
            decimal ret = 1;
            try
            {
                var temp = (from o in DBSap.OITM
                            where o.ItemCode.Equals(codarticulo)
                            select new { o.BWeight1 }).First();
                if (temp != null)
                    ret = (decimal)temp.BWeight1;
            }
            catch (Exception)
            {
                ret = 1;
            }
            return ret;
        }
        public string ObtieneCodProductoReproceso(string CodProducto)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from vo in DBSap.OITM
                            where vo.ItemCode.Equals(CodProducto)
                            select new { vo.U_ItemCodeRep }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.U_ItemCodeRep.ToString();
                }
            }
            catch
            {
            }
            return ret;
        }
        public string ObtieneCodProductoBarrido(string CodProducto)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from vo in DBSap.OITM
                            where vo.ItemCode.Equals(CodProducto)
                            select new { vo.U_ItemCodeDes }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.U_ItemCodeDes.ToString();
                }
            }
            catch
            {
            }
            return ret;
        }
        public string ObtieneProductoOF(int DocNum)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from vo in DBDesaint.CVT_LISTADO_OF_DETENCION
                            where vo.OF.Equals(DocNum)
                            select new { vo.Producto }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Producto.ToString();
                }
            }
            catch
            {
            }
            return ret;
        }
        public string CreaReciboPorduccion(int OF, string Lote, DateTime vencimiento, int cantidad)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            if (reterror != "0")
            {
                try
                {
                    int iError = 0;

                    SAPbobsCOM.Documents doc;
                    doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oInventoryGenEntry);
                    doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                    doc.DocDate = DateTime.Now;
                    doc.Comments = "Recibo PT Automatizado OF ";
                    doc.JournalMemo = "Recibo PT Aut OF " + OF.ToString();
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
            else
            {
                return reterror;
            }
        }

        public string CreaReciboPorduccionRB(int OF, string Lote, decimal cantidad, int barrido, int reproceso)
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
                doc.JournalMemo = "Recibo PT Automatizado OF " + OF.ToString();
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_TipoRecibo").Value = 1;
                //doc.PaymentGroupCode = -2;
                //doc.UserFields
                doc.Lines.BaseType = 202;
                doc.Lines.BaseEntry = ObtieneDocEntryOF(OF);
                doc.Lines.WarehouseCode = "CV300";
                //doc.Lines.WarehouseCode = BodegaDflt   'Bodega por defecto de Producto
                doc.Lines.BatchNumbers.BatchNumber = Lote;
                //doc.Lines.BatchNumbers.ManufacturingDate = DateTime.Now;
                //doc.Lines.BatchNumbers.ExpiryDate = vencimiento;
                doc.Lines.BatchNumbers.Quantity = (double)cantidad;
                doc.Lines.BatchNumbers.Add();

                doc.Lines.ShipDate = DateTime.Now;
                doc.Lines.Quantity = (double)cantidad;
                doc.Lines.UserFields.Fields.Item("U_CantRep").Value = reproceso;
                doc.Lines.UserFields.Fields.Item("U_CantBar").Value = barrido;

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
        public int ObtieneDocEntryOF(int OF)
        {
            int ret = 0;
            try
            {
                var temp = (from o in DBSap.OWOR
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
        public string CreaSalidaMercaderiaRB(int OF, string Lote, decimal cantidad, string articulo)
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
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.Comments = "OF " + OF.ToString() + " Salida Automatica Sistema CVT";
                doc.JournalMemo = "OF " + OF + " Salida GA CVT";
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 1;
                doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;

                doc.Lines.WarehouseCode = "CV300";
                doc.Lines.BatchNumbers.BatchNumber = Lote;
                //doc.Lines.BatchNumbers.ManufacturingDate = DateTime.Now;
                //doc.Lines.BatchNumbers.ExpiryDate = vencimiento;
                doc.Lines.BatchNumbers.Quantity = (double)cantidad;
                doc.Lines.BatchNumbers.Add();
                doc.Lines.ItemCode = articulo;
                doc.Lines.ShipDate = DateTime.Now;
                doc.Lines.Quantity = (double)cantidad;
                doc.Lines.UserFields.Fields.Item("U_TipoDocRel").Value = 202;
                doc.Lines.UserFields.Fields.Item("U_FolioDocRel").Value = OF;

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
        public string CreaEntradaMercaderiaRB(int OF, string Lote, int cantidadReproceso, int canttidadBarrido, string articuloBarrido, string articuloReproceso)
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
                doc.Comments = "OF " + OF + " Entrada Generada automaticamente Sistema CVT";
                doc.JournalMemo = "OF " + OF + " Entrada GA CVT";
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                if (canttidadBarrido != 0)
                {
                    doc.Lines.ItemCode = articuloBarrido;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = canttidadBarrido;
                    doc.Lines.WarehouseCode = "CV300";
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(articuloBarrido);
                    doc.Lines.UserFields.Fields.Item("U_TipoDocRel").Value = 202;
                    doc.Lines.UserFields.Fields.Item("U_FolioDocRel").Value = OF;

                    doc.Lines.BatchNumbers.BatchNumber = Lote;
                    doc.Lines.BatchNumbers.Quantity = canttidadBarrido;
                    doc.Lines.BatchNumbers.Add();


                    doc.Lines.Add();
                }
                if (cantidadReproceso != 0)
                {
                    doc.Lines.ItemCode = articuloReproceso;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = cantidadReproceso;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(articuloReproceso);
                    doc.Lines.WarehouseCode = "CV101";
                    doc.Lines.UserFields.Fields.Item("U_TipoDocRel").Value = 202;
                    doc.Lines.UserFields.Fields.Item("U_FolioDocRel").Value = OF;

                    doc.Lines.BatchNumbers.BatchNumber = Lote;
                    doc.Lines.BatchNumbers.Quantity = cantidadReproceso;
                    doc.Lines.BatchNumbers.Add();


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
        public string CreaTransferencia(int transferid, string bOrigen, string bDestino, string usuario)
        {


            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;
                List<CVT_VW_TranferenciaSAP> dt = new List<CVT_VW_TranferenciaSAP>();
                WMSClass vWMS = new WMSClass();
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
                    doc.Lines.ItemCode = r.ArticleProvider_CodClient;
                    doc.Lines.Quantity = (double)r.Quantity;
                    List<CVT_VW_TranferSAPLotes> dl = new List<CVT_VW_TranferSAPLotes>();
                    dl = vWMS.ObtieneVWDetalleTransferenciaLotes(transferid, r.ArticleProvider_CodClient);
                    foreach (var l in dl)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (double)l.Quantity;
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
            catch (Exception ex)
            {
                oCmp.Disconnect();
                string men = ex.Message;

            }
            return ret;

        }
        public string CreaSalidaTransformacion(int transformacionid, string usuario)
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
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.Comments = "Transformacion " + transformacionid + " Salida Generada automaticamente Sistema CVT";
                doc.JournalMemo = "Transformacion " + transformacionid + " Salida GA CVT";
                doc.UserFields.Fields.Item("U_IdWms").Value = transformacionid;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                doc.UserFields.Fields.Item("U_TipoEntidad").Value = 22;
                doc.UserFields.Fields.Item("U_FolioEntidad").Value = transformacionid;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                TransformacionesClass vT = new TransformacionesClass();
                List<CVT_VIEW_TransformacionDetalleSalidaSAP> dt = new List<CVT_VIEW_TransformacionDetalleSalidaSAP>();
                dt = vT.ObtieneTransformacionDetalleSalida(transformacionid);
                foreach (var d in dt)
                {
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Quantity;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
                    doc.Lines.CostingCode = "COMERCIA";
                    doc.Lines.CostingCode2 = "PLANTA";
                    doc.Lines.CostingCode3 = "MERMAS";
                    doc.Lines.CostingCode4 = "301030";
                    List<CVT_VIEW_TransformacionDetalleSalLotesSAP> lt = new List<CVT_VIEW_TransformacionDetalleSalLotesSAP>();
                    lt = vT.ObtieneTransformacionDetalleSalidaLote(transformacionid, (int)d.ArticleProvider_Id);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)l.Quantity;
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
        public int ExisteEntradaTransformacion(int transformacionid)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBSap.OIGN
                            where r.U_TipoEntidad.Equals(22) && r.U_FolioEntidad.Equals(transformacionid)
                            select new { r.DocEntry }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocEntry);
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;

        }
        public int ExisteSalidaTransformacion(int transformacionid)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBSap.OIGE
                            where r.U_TipoEntidad.Equals(22) && r.U_FolioEntidad.Equals(transformacionid)
                            select new { r.DocEntry }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocEntry);
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;

        }
        public string CreaEntradaTransformacion(int transformacionid, string usuario)
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
                doc.Comments = "Transformacion " + transformacionid + " Entrada Generada automaticamente Sistema CVT";
                doc.JournalMemo = "Transformacion " + transformacionid + " Entrada GA CVT";
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = transformacionid;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                doc.UserFields.Fields.Item("U_TipoEntidad").Value = 22;
                doc.UserFields.Fields.Item("U_FolioEntidad").Value = transformacionid;
                doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                TransformacionesClass vT = new TransformacionesClass();
                List<CVT_VIEW_transformacionDetalleEntradaSAP> dt = new List<CVT_VIEW_transformacionDetalleEntradaSAP>();
                dt = vT.ObtieneTransformacionDetalleEntrada(transformacionid);
                foreach (var d in dt)
                {
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Quantity;
                    //if (d.ArticleProvider_CodClient == "M-ARRKG510" ||
                    //    d.ArticleProvider_CodClient == "M-ARRKG511" ||
                    //    d.ArticleProvider_CodClient == "M-ARRKG512" ||
                    //    d.ArticleProvider_CodClient == "M-ARVKG510" ||
                    //    d.ArticleProvider_CodClient == "M-AZUKG510" ||
                    //    d.ArticleProvider_CodClient == "M-GARKG510" ||
                    //    d.ArticleProvider_CodClient == "M-LENKG510" ||
                    //    d.ArticleProvider_CodClient == "M-PASKG510" ||
                    //    d.ArticleProvider_CodClient == "M-PASKG511" ||
                    //    d.ArticleProvider_CodClient == "M-PORKG510" ||
                    //    d.ArticleProvider_CodClient == "M-REPARR02" ||
                    //    d.ArticleProvider_CodClient == "M-REPARRPAR" ||
                    //    d.ArticleProvider_CodClient == "M-REPARV01" ||
                    //    d.ArticleProvider_CodClient == "M-REPAZU02" ||
                    //    d.ArticleProvider_CodClient == "M-REPGAR01" ||
                    //    d.ArticleProvider_CodClient == "M-REPGAR03" ||
                    //    d.ArticleProvider_CodClient == "M-REPLEN01" ||
                    //    d.ArticleProvider_CodClient == "M-REPPOR01" ||
                    //    d.ArticleProvider_CodClient == "M-PASKG500" ||
                    //    d.ArticleProvider_CodClient == "M-PASKG501" ||
                    //    d.ArticleProvider_CodClient == "M-PASKG502" ||
                    //    d.ArticleProvider_CodClient == "M-PASKG503" ||
                    //    d.ArticleProvider_CodClient == "M-VARLEG01" ||
                    //    d.ArticleProvider_CodClient == "M-YERKG500" ||
                    //    d.ArticleProvider_CodClient == "M-REPPOR02" ||
                    //    d.ArticleProvider_CodClient== "M-REPAZU03")
                    //{
                        double precioPadre= ObtienePrecioPromedioProducto(d.Origen);
                        precioPadre = precioPadre * (double)d.OrigenCantidad;
                        precioPadre = precioPadre / (double)d.Quantity;

                        doc.Lines.UnitPrice = precioPadre;
                    //}
                    //else
                    //{
                    //    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
                    //}
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;


                    doc.Lines.CostingCode = "COMERCIA";
                    doc.Lines.CostingCode2 = "PLANTA";
                    doc.Lines.CostingCode3 = "MERMAS";
                    doc.Lines.CostingCode4 = "301030";
                    List<CVT_VIEW_TransformacionDetalleEntradaLotesSAP> lt = new List<CVT_VIEW_TransformacionDetalleEntradaLotesSAP>();
                    lt = vT.ObtieneTransformacionDetalleEntradaLotes(transformacionid, (int)d.ArticleProviderDestiny_Id,d.Origen,d.Package_SSCC);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)l.Quantity;
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
        //public string CreaDevolucion(int RecpecionId, string usuario)
        //{
        //    string ret = "-1";
        //    SAPbobsCOM.Company oCmp;
        //    string reterror = string.Empty;
        //    oCmp = CnxSAP(ref reterror);
        //    try
        //    {
        //        int iError = 0;


        //        SAPbobsCOM.Documents doc;
        //        doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oDeliveryNotes);
        //        doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
        //        doc.DocDate = DateTime.Now;
        //        doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
        //        doc.UserFields.Fields.Item("U_IdWms").Value = RecpecionId;
        //        doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
        //        //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
        //        doc.PaymentGroupCode = -2;
        //        //doc.UserFields
        //        //doc.Lines.BaseType = 202;
        //        //doc.Lines.BaseEntry = OF;
        //        WMSClass vWMS = new WMSClass();
        //        List<CVT_VW_RecepcionDetalle> dt = new List<CVT_VW_RecepcionDetalle>();
        //        dt = vWMS.ObtieneDetalleRecepcion(RecpecionId);
        //        foreach (var d in dt)
        //        {

        //            doc.Comments = d.Reception_Note;
        //            doc.Lines.WarehouseCode = d.Site_ShortDescription;
        //            doc.Lines.ItemCode = d.ArticleProvider_CodClient;
        //            doc.Lines.ShipDate = DateTime.Now;
        //            doc.Lines.Quantity = (double)d.Cantidad;
        //            doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
        //            doc.Lines.WarehouseCode = d.Site_ShortDescription;
        //            List<CVT_VW_RecepcionDetalleLote> lt = new List<CVT_VW_RecepcionDetalleLote>();
        //            lt = vWMS.ObtieneDetalleLoteRecepcion(RecpecionId, d.ArticleProvider_CodClient);
        //            foreach (var l in lt)
        //            {
        //                doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
        //                doc.Lines.BatchNumbers.Quantity = (int)l.Cantidad;
        //                doc.Lines.BatchNumbers.Add();
        //            }

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
        //        
        //    }
        //    return ret;
        //}
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
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                //doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_RecepcionDetalle> dt = new List<CVT_VW_RecepcionDetalle>();
                dt = vWMS.ObtieneDetalleRecepcion(RecpecionId);
                foreach (var d in dt)
                {
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.Reception_DocNumber;
                    doc.UserFields.Fields.Item("U_FolioRef").Value = d.Reception_DocNumber.ToString();
                    doc.UserFields.Fields.Item("U_FchRef").Value = d.Reception_U_FchRef;
                    doc.UserFields.Fields.Item("U_RazonRef").Value = d.Reception_U_RazonRef;
                    doc.Comments = d.Reception_Note;
                    doc.CardCode = d.Business_Partner_Provider;
                    //doc.UserFields.Fields.Item("U_SELLO").Value = d.Sello != null ? d.Sello : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloAduana").Value = d.SelloAduana != null ? d.SelloAduana : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloSAG").Value = d.SelloSAG != null ? d.SelloSAG : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.NoContenedor != null ? d.NoContenedor : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_DI_Despacho").Value = d.NoDIDespacho != null ? d.NoDIDespacho : string.Empty;
                    doc.UserFields.Fields.Item("U_TipoDescarga").Value = d.TipoDescarga != null ? d.TipoDescarga : 0;
                    //doc.UserFields.Fields.Item("U_TipoContenedor").Value = d.TipoContenedor != null ? d.TipoContenedor : 0;
                    doc.UserFields.Fields.Item("U_HORAINICIO").Value = d.HoraInicio != null ? Convert.ToInt32(d.HoraInicio) : 0;
                    doc.UserFields.Fields.Item("U_HORATERMINO").Value = d.HoraTermino != null ? Convert.ToInt32(d.HoraTermino) : 0;
                    doc.Comments = d.Reception_Note;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    //doc.Lines.BaseEntry = ObtieneDocEntryEntrega(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    //doc.Lines.BaseLine = ObtieneLinenumEntrega(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    //doc.Lines.BaseType = 15;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Cantidad;
                    doc.Lines.UnitPrice = ObtienePrecioFacturaProducto(d.ArticleProvider_CodClient, d.Reception_DocNumber);
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.UserFields.Fields.Item("U_MotivoAnula").Value = d.DevolucionMotivo_Id;
                    List<CVT_VW_RecepcionDetalleLote> lt = new List<CVT_VW_RecepcionDetalleLote>();
                    lt = vWMS.ObtieneDetalleLoteRecepcion(RecpecionId, d.ArticleProvider_CodClient, d.DevolucionMotivo_Id);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)l.Cantidad;
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
            catch (Exception ex)
            {
                string err = ex.Message;
                oCmp.Disconnect();

            }
            return ret;
        }

        public string CreaDevolucionProveedor(int expID, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;


                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oPurchaseReturns);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = expID;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                //doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                WMSClass vWMS = new WMSClass();


                List<VW_EXPEDICION_FILM_DETALLE> dt = new List<VW_EXPEDICION_FILM_DETALLE>();
                dt = vWMS.ObtieneDetalleExpedicionfilm(expID);



                foreach (var d in dt)
                {
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.ExpFilm_NumDocSap;
                    doc.UserFields.Fields.Item("U_FolioRef").Value = d.ExpFilm_NumDocSap.ToString();
                    doc.UserFields.Fields.Item("U_FchRef").Value = d.ExpFilm_DateIn;
                    //doc.UserFields.Fields.Item("U_RazonRef").Value = d.Reception_U_RazonRef;
                    doc.Comments = d.ExpFilm_Note;
                    doc.CardCode = d.CardCode;
                    //doc.UserFields.Fields.Item("U_SELLO").Value = d.Sello != null ? d.Sello : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloAduana").Value = d.SelloAduana != null ? d.SelloAduana : string.Empty;
                    //doc.UserFields.Fields.Item("U_SelloSAG").Value = d.SelloSAG != null ? d.SelloSAG : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.NoContenedor != null ? d.NoContenedor : string.Empty;
                    //doc.UserFields.Fields.Item("U_No_DI_Despacho").Value = d.NoDIDespacho != null ? d.NoDIDespacho : string.Empty;
                    //doc.UserFields.Fields.Item("U_TipoDescarga").Value = d.TipoDescarga != null ? d.TipoDescarga : 0;
                    ////doc.UserFields.Fields.Item("U_TipoContenedor").Value = d.TipoContenedor != null ? d.TipoContenedor : 0;
                    //doc.UserFields.Fields.Item("U_HORAINICIO").Value = d.HoraInicio != null ? Convert.ToInt32(d.HoraInicio) : 0;
                    //doc.UserFields.Fields.Item("U_HORATERMINO").Value = d.HoraTermino != null ? Convert.ToInt32(d.HoraTermino) : 0;
                    doc.Comments = d.ExpFilm_Note;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.Producto;
                    //doc.Lines.BaseEntry = ObtieneDocEntryEntrega(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    //doc.Lines.BaseLine = ObtieneLinenumEntrega(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    //doc.Lines.BaseType = 15;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Cantidad;
                    //doc.Lines.UnitPrice = ObtienePrecioFacturaProducto(d.ArticleProvider_CodClient, d.Reception_DocNumber);
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    //doc.Lines.UserFields.Fields.Item("U_MotivoAnula").Value = d.DevolucionMotivo_Id;


                    List<VW_EXPEDICION_FILM_DETALLE_LOTE> lt = new List<VW_EXPEDICION_FILM_DETALLE_LOTE>();
                    lt = vWMS.ObtieneDetalleLoteExpedicionFilm(expID, d.Producto); //, d.DevolucionMotivo_Id);



                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.ExpFilm_Lote;
                        doc.Lines.BatchNumbers.Quantity = (double)l.Cantidad;
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
        public string CreaEntradaRecepcion(int RecpecionId, string usuario)
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
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_RecepcionDetalle> dt = new List<CVT_VW_RecepcionDetalle>();
                dt = vWMS.ObtieneDetalleRecepcion(RecpecionId);
                foreach (var d in dt)
                {
                    doc.Comments = d.Reception_Note;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Cantidad;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    List<CVT_VW_RecepcionDetalleLote> lt = new List<CVT_VW_RecepcionDetalleLote>();
                    lt = vWMS.ObtieneDetalleLoteRecepcion(RecpecionId, d.ArticleProvider_CodClient);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)l.Cantidad;
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
        public string ObtieneCuenta(string codprod)
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
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_ExpeditionDetailSync1> dt = vWMS.ObtieneExpedicionDetalle(ExpeditionId);
                foreach (var d in dt)
                {
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.UnitPrice = (double)d.AvgPrice;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.AccountCode = d.SaleCostAc;
                    doc.Lines.Quantity = (double)d.Quantity;
                    doc.Lines.CostingCode = d.Division;
                    doc.Lines.CostingCode2 = d.UAdm;
                    doc.Lines.CostingCode3 = d.CCosto;
                    doc.Lines.CostingCode4 = d.Item.ToString();
                    List<CVT_VW_ExpeditionDetailLotSync> lt = vWMS.ObtieneExpedicionDetalleLote(ExpeditionId, d.ArticleProvider_CodClient);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.package_lot;
                        doc.Lines.BatchNumbers.Quantity = (double)l.Quantity;
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
        public string CreaEntradaRecepcionExcesos(int RecpecionId, string usuario, int oc, string codprod, int cantidad, SAPbobsCOM.Company Comp)
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
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_RecepcionDetalle> dt = new List<CVT_VW_RecepcionDetalle>();
                dt = vWMS.ObtieneDetalleRecepcionExceso(RecpecionId, codprod);
                foreach (var d in dt)
                {
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.Reception_DocNumber;
                    doc.Comments = d.Reception_Note;
                    // doc.CardCode = d.Business_Partner_Provider;
                    doc.UserFields.Fields.Item("U_SELLO").Value = d.Sello != null ? d.Sello : string.Empty;
                    doc.UserFields.Fields.Item("U_SelloAduana").Value = d.SelloAduana != null ? d.SelloAduana : string.Empty;
                    doc.UserFields.Fields.Item("U_SelloSAG").Value = d.SelloSAG != null ? d.SelloSAG : string.Empty;
                    doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.NoContenedor != null ? d.NoContenedor : string.Empty;
                    doc.UserFields.Fields.Item("U_No_DI_Despacho").Value = d.NoDIDespacho != null ? d.NoDIDespacho : string.Empty;
                    doc.UserFields.Fields.Item("U_TipoDescarga").Value = d.TipoDescarga != null ? d.TipoDescarga : 0;
                    doc.UserFields.Fields.Item("U_TipoContenedor").Value = d.TipoContenedor != null ? d.TipoContenedor : 0;
                    doc.UserFields.Fields.Item("U_HORAINICIO").Value = d.HoraInicio != null ? Convert.ToInt32(d.HoraInicio) : 0;
                    doc.UserFields.Fields.Item("U_HORATERMINO").Value = d.HoraTermino != null ? Convert.ToInt32(d.HoraTermino) : 0;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.UserFields.Fields.Item("U_TipoDocRel").Value = 22;
                    doc.Lines.UserFields.Fields.Item("U_FolioDocRel").Value = oc;
                    doc.Lines.AccountCode = ObtieneCuenta(d.ArticleProvider_CodClient);
                    doc.Lines.Quantity = (double)cantidad;
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    List<CVT_VW_RecepcionDetalleLote> lt = new List<CVT_VW_RecepcionDetalleLote>();
                    lt = vWMS.ObtieneDetalleLoteRecepcion(RecpecionId, d.ArticleProvider_CodClient);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)cantidad;
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
        public string CreaEntradaFRRecepcion(int RecpecionId, string usuario)
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
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_RecepcionDetalle> dt = new List<CVT_VW_RecepcionDetalle>();
                dt = vWMS.ObtieneDetalleRecepcion(RecpecionId);
                foreach (var d in dt)
                {
                    int cantidadPendiente = ObtieneCantPendienteProducto(Convert.ToInt32(d.Reception_U_NumDocSAP), 1, d.ArticleProvider_CodClient);
                    if (cantidadPendiente == 0)
                    {
                        if (ObtieneDocNumEntradaAjuste(RecpecionId) == 0)
                        {
                            CreaEntradaRecepcionExcesos(RecpecionId, usuario, Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient, Convert.ToInt32(d.Cantidad) - cantidadPendiente, oCmp);
                            break;
                        }
                    }
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.Reception_DocNumber;
                    doc.Comments = d.Reception_Note;
                    doc.CardCode = d.Business_Partner_Provider;
                    doc.UserFields.Fields.Item("U_SELLO").Value = d.Sello != null ? d.Sello : string.Empty;
                    doc.UserFields.Fields.Item("U_SelloAduana").Value = d.SelloAduana != null ? d.SelloAduana : string.Empty;
                    doc.UserFields.Fields.Item("U_SelloSAG").Value = d.SelloSAG != null ? d.SelloSAG : string.Empty;
                    doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.NoContenedor != null ? d.NoContenedor : string.Empty;
                    doc.UserFields.Fields.Item("U_No_DI_Despacho").Value = d.NoDIDespacho != null ? d.NoDIDespacho : string.Empty;
                    doc.UserFields.Fields.Item("U_TipoDescarga").Value = d.TipoDescarga != null ? d.TipoDescarga : 0;
                    doc.UserFields.Fields.Item("U_TipoContenedor").Value = d.TipoContenedor != null ? d.TipoContenedor : 0;
                    doc.UserFields.Fields.Item("U_HORAINICIO").Value = d.HoraInicio != null ? Convert.ToInt32(d.HoraInicio) : 0;
                    doc.UserFields.Fields.Item("U_HORATERMINO").Value = d.HoraTermino != null ? Convert.ToInt32(d.HoraTermino) : 0;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.BaseEntry = ObtieneDocEntryFR(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    doc.Lines.BaseType = 18;
                    doc.Lines.BaseLine = ObtieneLinenumFR(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
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
                    List<CVT_VW_RecepcionDetalleLote> lt = new List<CVT_VW_RecepcionDetalleLote>();
                    lt = vWMS.ObtieneDetalleLoteRecepcion(RecpecionId, d.ArticleProvider_CodClient);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        if (cantidadPendiente >= d.Cantidad)
                        {
                            doc.Lines.BatchNumbers.Quantity = (int)l.Cantidad;
                        }
                        else
                        {
                            doc.Lines.BatchNumbers.Quantity = cantidadPendiente;
                            CreaEntradaRecepcionExcesos(RecpecionId, usuario, Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient, Convert.ToInt32(d.Cantidad) - cantidadPendiente, oCmp);
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
        public int ObtieneDocNumEntradaAjuste(int idrecepcion)
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
        public string CreaEntradaOCRecepcion(int RecpecionId, string usuario)
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
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_RecepcionDetalle> dt = new List<CVT_VW_RecepcionDetalle>();
                dt = vWMS.ObtieneDetalleRecepcion(RecpecionId);
                foreach (var d in dt)
                {
                    doc.UserFields.Fields.Item("U_Folio_Guia").Value = d.Reception_DocNumber;
                    doc.Comments = d.Reception_Note;
                    doc.CardCode = d.Business_Partner_Provider;
                    doc.UserFields.Fields.Item("U_SELLO").Value = d.Sello != null ? d.Sello : string.Empty;
                    doc.UserFields.Fields.Item("U_SelloAduana").Value = d.SelloAduana != null ? d.SelloAduana : string.Empty;
                    doc.UserFields.Fields.Item("U_SelloSAG").Value = d.SelloSAG != null ? d.SelloSAG : string.Empty;
                    doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.NoContenedor != null ? d.NoContenedor : string.Empty;
                    doc.UserFields.Fields.Item("U_No_DI_Despacho").Value = d.NoDIDespacho != null ? d.NoDIDespacho : string.Empty;
                    doc.UserFields.Fields.Item("U_TipoDescarga").Value = d.TipoDescarga != null ? d.TipoDescarga : 0;
                    doc.UserFields.Fields.Item("U_TipoContenedor").Value = d.TipoContenedor != null ? d.TipoContenedor : 0;
                    doc.UserFields.Fields.Item("U_HORAINICIO").Value = d.HoraInicio != null ? Convert.ToInt32(d.HoraInicio) : 0;
                    doc.UserFields.Fields.Item("U_HORATERMINO").Value = d.HoraTermino != null ? Convert.ToInt32(d.HoraTermino) : 0;
                    doc.Lines.WarehouseCode = d.Site_ShortDescription;
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.BaseEntry = ObtieneDocEntryOC(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    doc.Lines.BaseType = 22;
                    doc.Lines.BaseLine = ObtieneLinenumOC(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    doc.DocCurrency = ObtieneCurrencyOC(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
                    doc.DocRate = (double)ObtieneRateOC(Convert.ToInt32(d.Reception_U_NumDocSAP), d.ArticleProvider_CodClient);
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
                    List<CVT_VW_RecepcionDetalleLote> lt = new List<CVT_VW_RecepcionDetalleLote>();
                    lt = vWMS.ObtieneDetalleLoteRecepcion(RecpecionId, d.ArticleProvider_CodClient);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        //if (cantidadPendiente >= d.Cantidad)
                        //{
                        doc.Lines.BatchNumbers.Quantity = (int)l.Cantidad;
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
        public int ValidaExcesoRecepcion(int OC, int RecepcionId)
        {
            int ret = 0;
            try
            {
                var temp = (from vv in DBSap.CVT_VW_VALIDA_PORC_EXCESO_RECEPCION
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
        public int ObtieneCantPendienteProducto(int oc, int tipo, string codprod)
        {
            int ret = 0;
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
                        ret = Convert.ToInt32(temp.OpenQty);
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
                        ret = Convert.ToInt32(temp.OpenQty);
                    }
                }
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneLinenumFR(int oc, string codprod)
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
        public int ObtieneLinenumOC(int oc, string codprod)
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
        public int ObtieneLinenumEntrega(int oc, string codprod)
        {
            int ret = 0;
            try
            {
                //var temp = (from p1 in DBSap.PCH1
                //           where p1.BaseEntry == oc && p1.ItemCode == codprod && p1.LineStatus=='O'
                //           select new { p1.LineNum }).FirstOrDefault();
                var temp = (from p1 in DBSap.DLN1
                            join p in DBSap.ODLN on p1.DocEntry equals p.DocEntry
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
        public string ObtieneCurrencyOC(int oc, string codprod)
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
        public decimal ObtieneRateOC(int oc, string codprod)
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
        public string ObtieneCurrencyFR(int oc, string codprod)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from p1 in DBSap.PCH1
                            join po1 in DBSap.POR1 on p1.BaseEntry equals po1.DocEntry
                            join o in DBSap.OPOR on po1.DocEntry equals o.DocEntry
                            where o.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                            select new { o.DocCur }).FirstOrDefault();
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
        public decimal ObtieneRateFR(int oc, string codprod)
        {
            decimal ret = 0;
            try
            {
                var temp = (from p1 in DBSap.PCH1
                            join po1 in DBSap.POR1 on p1.BaseEntry equals po1.DocEntry
                            join o in DBSap.OPOR on po1.DocEntry equals o.DocEntry
                            where o.DocNum == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                            select new { o.DocRate }).FirstOrDefault();
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
        public int ObtieneDocEntryOC(int oc, string codprod)
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
        public int ObtieneDocEntryFR(int oc, string codprod)
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
        public int ObtieneDocEntryEntrega(int entrega, string codprod)
        {
            int ret = 0;
            try
            {
                //var temp = (from p1 in DBSap.PCH1
                //            where p1.BaseEntry == oc && p1.ItemCode == codprod && p1.LineStatus == 'O'
                //            select new { p1.DocEntry }).FirstOrDefault();
                var temp = (from p1 in DBSap.DLN1
                            join p in DBSap.ODLN on p1.DocEntry equals p.DocEntry
                            where p.DocNum == entrega && p1.ItemCode == codprod && p1.LineStatus == 'O'
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
        public int ObtieneDocNumTransferenciaSAP(int TransferID)
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
        public int ObtieneDocNumRecepcionSAP(int TransferID)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSap.OPDN
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
        public int ObtieneDocNumDevolucionSAP(int TransferID)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSap.ORDN
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
        public int ObtieneDocNumRecepcionAjusteSAP(int TransferID)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSap.OIGN
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
        public int ObtieneDocNumPedidoSAP(int TransferID)
        {
            int ret = 0;
            try
            {
                var temp = (from t in DBSap.ODLN
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
        public List<OPOR> ObtieneDatosOC(int id)
        {
            List<OPOR> ret = new List<OPOR>();
            try
            {
                ret = (from oc in DBSap.OPOR
                       where oc.DocEntry.Equals(id)
                       select oc).ToList<OPOR>();
            }
            catch
            {
            }
            return ret;
        }
        public string CreaSalidaTransformacionExpedicion(int ExpID, string Usuario)
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
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.Comments = "Transformacion de expedicion " + ExpID + " Salida Generada automaticamente Sistema CVT";
                doc.UserFields.Fields.Item("U_IdWms").Value = ExpID;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = Usuario;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                doc.PaymentGroupCode = -2;

                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                TransformacionesClass vT = new TransformacionesClass();
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_ResumenExpedicionEncSalida> dt = new List<CVT_VW_ResumenExpedicionEncSalida>();
                dt = vT.ObtieneResumenExpedicionEncSalida(ExpID);
                foreach (var d in dt)
                {
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Cantidad;
                    doc.Lines.WarehouseCode = vWMS.ObtieneSiteExpedicion(ExpID);
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.ArticleProvider_CodClient);
                    List<CVT_VW_ResumenExpedicion> lt = new List<CVT_VW_ResumenExpedicion>();
                    lt = vT.ObtieneResumenExpedicionSalida(ExpID, d.ArticleProvider_CodClient);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)l.Cantidad;
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
        public string CreaEntradaTransformacionExpedicion(int ExpID, string Usuario)
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
                doc.Comments = "Transformacion de expedicion " + ExpID + " Entrada Generada automaticamente Sistema CVT";
                doc.UserFields.Fields.Item("U_IdWms").Value = ExpID;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = Usuario;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                //doc.UserFields.Fields.Item("U_TipoRecibo").Value = 0;
                doc.PaymentGroupCode = -2;
                //doc.UserFields
                //doc.Lines.BaseType = 202;
                //doc.Lines.BaseEntry = OF;
                TransformacionesClass vT = new TransformacionesClass();
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_ResumenExpedicionEncEntrada> dt = new List<CVT_VW_ResumenExpedicionEncEntrada>();
                dt = vT.ObtieneResumenExpedicionEncEntrada(ExpID);
                foreach (var d in dt)
                {
                    doc.Lines.ItemCode = d.CODUnitario;
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.Cantidad;
                    doc.Lines.WarehouseCode = vWMS.ObtieneSiteExpedicion(ExpID);
                    doc.Lines.UnitPrice = ObtienePrecioPromedioProducto(d.CODUnitario);
                    List<CVT_VW_ResumenExpedicion> lt = new List<CVT_VW_ResumenExpedicion>();
                    lt = vT.ObtieneResumenExpedicionEntrada(ExpID, d.CODUnitario);
                    foreach (var l in lt)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)l.CantidadTransformar;
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
            catch (Exception ex)
            {
                oCmp.Disconnect();
                string err = ex.Message;

            }
            return ret;
        }
        public double ObtienePrecioPromedioProducto(string CodProducto)
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
        public double ObtienePrecioFacturaProducto(string CodProducto, int Factura)
        {
            double ret = 0;
            try
            {
                var temp = (from pp in DBSap.OINV
                            join pd in DBSap.INV1 on pp.DocEntry equals pd.DocEntry
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
        public string ObtieneWHSDefectoProducto(string itemcode)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from o in DBSap.OITM
                            where o.ItemCode.Equals(itemcode)
                            select new { o.DfltWH }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.DfltWH;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public string CreaEntrega(int PedidoId, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;


                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oDeliveryNotes);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.Comments = "Entrega Pedido:" + PedidoId.ToString();
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = PedidoId;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                WMSClass vWMS = new WMSClass();
                List<CVT_VW_ResumenPedidoEnc> dt = new List<CVT_VW_ResumenPedidoEnc>();
                dt = vWMS.ObtieneEncPedido(PedidoId);
                foreach (var d in dt)
                {
                    doc.CardCode = d.Order_BusinessPartnerDestiny;
                    doc.Lines.ItemCode = d.ArticleProvider_CodClient;
                    doc.Lines.Quantity = (double)d.Quantity;
                    doc.Lines.BaseType = (int)d.Order_U_TipoDocSAP;
                    doc.Lines.BaseEntry = (int)d.DocEntry;
                    doc.Lines.BaseLine = (int)d.LineNum;
                    List<CVT_VW_ResumenPedidoLote> dl = new List<CVT_VW_ResumenPedidoLote>();
                    dl = vWMS.ObtieneEncPedido(PedidoId, d.ArticleProvider_CodClient);
                    foreach (var l in dl)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)l.Quantity;
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
            catch (Exception ex)
            {
                string lr = ex.Message;
            }
            return ret;
        }
        public string CreaEntregaReclamos(int ReclamoID, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;


                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oDeliveryNotes);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.Comments = "Reclamo:" + ReclamoID.ToString();
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = ReclamoID;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                ReclamosClass rc = new ReclamosClass();
                List<VW_Resumen_Reclamo_Cab> dt = new List<VW_Resumen_Reclamo_Cab>();
                dt = rc.ObtieneEncReclamo(ReclamoID);
                foreach (var d in dt)
                {
                    doc.CardCode = "C99510860-7";
                    doc.Lines.ItemCode = d.CodProducto;
                    doc.Lines.Quantity = (double)d.Cantidad;
                    //doc.Lines.BaseType = (int)d.Order_U_TipoDocSAP;
                    ////doc.Lines.BaseEntry = (int)d.DocEntry;
                    //doc.Lines.BaseLine = (int)d.LineNum;
                    List<VW_Resumen_Reclamo_Lotes> dl = new List<VW_Resumen_Reclamo_Lotes>();
                    dl = rc.ObtieneEncReclamoLotes(ReclamoID, d.CodProducto);
                    foreach (var l in dl)
                    {
                        doc.Lines.BatchNumbers.BatchNumber = l.Package_Lot;
                        doc.Lines.BatchNumbers.Quantity = (int)l.Cantidad;
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
            catch (Exception ex)
            {
                string lr = ex.Message;
            }
            return ret;
        }
        public int ExisteEntregaPedido(int PedidoId)
        {
            int ret = 0;
            try
            {
                var temp = (from e in DBSap.ODLN
                            where e.U_IdWms.Equals(PedidoId)
                            select new { e.DocNum }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocNum);
                }
            }
            catch
            {

            }
            return ret;
        }
        public int ExisteSalidaExpedicionKIT(int expid)
        {
            int ret = 0;
            try
            {
                var temp = (from e in DBSap.OIGE
                            where e.U_IdWms.Equals(expid)
                            select new { e.DocNum }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.DocNum);
                }
            }
            catch
            {

            }
            return ret;
        }

        public bool ActualizaPedidoWMS(int DocNum, int SiteId)
        {
            bool ret = false;
            try
            {
                List<RDR1> dt = new List<RDR1>();
                dt = (from d in DBSap.RDR1
                      join o in DBSap.ORDR on d.DocEntry equals o.DocEntry
                      where o.DocNum == DocNum
                      select d).ToList<RDR1>();
                int PedidoWms = 0;
                var temp = (from p in DBWMS.Order
                            where p.Order_U_NumDocSAP == DocNum
                            select new { p.Order_Id }).FirstOrDefault();
                if (temp != null)
                {
                    PedidoWms = Convert.ToInt32(temp.Order_Id);
                }
                if (PedidoWms != 0)
                {
                    var borrar = from p in DBWMS.OrderProForm
                                 where p.Order_Id == PedidoWms
                                 select p;
                    DBWMS.OrderProForm.DeleteAllOnSubmit(borrar.ToList());
                    DBWMS.SubmitChanges();
                    WMSClass vWMS = new WMSClass();
                    foreach (var s in dt)
                    {
                        OrderProForm vNuevo = new OrderProForm();
                        vNuevo.Company_Id = 1;
                        vNuevo.Order_Id = PedidoWms;
                        vNuevo.Site_Id = SiteId;
                        vNuevo.ArticleProvider_Id = vWMS.ObtieneIdProduct(s.ItemCode);
                        vNuevo.OrderProForm_Quantity = Convert.ToInt32(s.Quantity);
                        DBWMS.OrderProForm.InsertOnSubmit(vNuevo);
                        DBWMS.SubmitChanges();
                    }
                }
            }
            catch
            {


            }
            return ret;
        }
        public string CreAsientoAjuste(int IdTrans)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                List<CVT_VW_TransformacionesAsientoConDiferencia> dt = new List<CVT_VW_TransformacionesAsientoConDiferencia>();
                dt = (from t in DBSap.CVT_VW_TransformacionesAsientoConDiferencia
                      where t.U_IdWms.Equals(IdTrans)
                      select t).ToList<CVT_VW_TransformacionesAsientoConDiferencia>();
                SAPbobsCOM.JournalEntries doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oJournalEntries);
                foreach (var d in dt)
                {

                    //doc.TaxDate = (DateTime)d.DocDate;
                    //doc.Memo = "Asiento Regularizaacion Transformacion";
                    //doc.Reference = d.U_IdWms.ToString();
                    //doc.Lines.AccountCode = d.Account;
                    //doc.Lines.Credit = Convert.ToDouble(d.Diff);

                }

                ret = "0";
            }
            catch
            {
            }
            return ret;
        }

        public string ObtieneNombreProducto(string itemCod)
        {
            string ret = "";
            try
            {
                var temp = (from t in DBSap.OITM
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
        public string ObtieneNombreProveedorFilm(string CodPro)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from vo in DBSap.OCRD
                            where vo.CardCode.Equals(CodPro)
                            select new { vo.CardName }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CardName.ToString();
                }
            }
            catch
            {
            }
            return ret;
        }
        public DataTable ObtieneMensaje()
        {
            DataTable ret = new DataTable();
            try
            {
                DBWMS.CommandTimeout = 120000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_SendInfVentasDiario_Manual());
            }
            catch (Exception ex)
            {
                string A = ex.Message;
            }
            return ret;
        }

        public List<VW_ComicionProductos_CVT> ObtieneDatosProdComiCVT(string CodPro)
        {
            List<VW_ComicionProductos_CVT> ret = new List<VW_ComicionProductos_CVT>();
            try
            {
                ret = (from r in DBSap.VW_ComicionProductos_CVT
                       where r.ItemCode.Equals(CodPro)
                       select r).ToList<VW_ComicionProductos_CVT>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }
        public List<CVT_ComisionVendedor> verificaRegistroComiCVT(string CodPro)
        {
            List<CVT_ComisionVendedor> ret = new List<CVT_ComisionVendedor>();
            try
            {
                ret = (from r in DBDesaint.CVT_ComisionVendedor
                       where r.ItemCode.Equals(CodPro)
                       select r).ToList<CVT_ComisionVendedor>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }

        public int InsertaNuevoComisionProd(CVT_ComisionVendedor nuevo)
        {
            int ret = 0;
            try
            {
                DBDesaint.CVT_ComisionVendedor.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = 1;
            }
            catch
            {
                return ret;

            }
            return ret;
        }
        public string ObtieneCodigoUnidad(string codigo)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from p in DBSap.OITM
                            where p.ItemCode.Equals(codigo)
                            select new { p.U_ItemCodeUnidad }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.U_ItemCodeUnidad;
                }
            }
            catch (Exception ex)
            {
                ret = ex.Message;
            }
            return ret;
        }
        public int ObtieneCantidadUnidades(string codigo)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBSap.OITM
                            where p.ItemCode.Equals(codigo)
                            select new { p.PurPackUn }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.PurPackUn);
                }
            }
            catch (Exception ex)
            {
                ret = -1;
            }
            return ret;
        }
        public string ObtieneNombreUnidad (string codigo)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from p in DBSap.OITM
                            where p.ItemCode.Equals(codigo)
                            select new { p.ItemName }).FirstOrDefault();
                if(temp!=null)
                {
                    ret = temp.ItemName;
                }
            }
            catch (Exception ex)
            {
                ret = ex.Message;
            }
            return ret;
        }
        public int CreaOFEspecial(ref string Error, string itemCode, string usuario)
        {
            int ret = -1;
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            int iError = 0;
            try
            {
                SAPbobsCOM.ProductionOrders doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oProductionOrders);
                doc.ProductionOrderType = SAPbobsCOM.BoProductionOrderTypeEnum.bopotSpecial;
                doc.ItemNo = itemCode;
                doc.StartDate = DateTime.Now;
                doc.ProductionOrderStatus = SAPbobsCOM.BoProductionOrderStatusEnum.boposReleased;
                doc.Warehouse = "CV201";
                doc.Remarks = "OF generada automaticamente por Sistema CVT";
                doc.UserFields.Fields.Item("U_Turno").Value = "CV201";
                doc.UserFields.Fields.Item("U_Abocador").Value = usuario;



                //Agrega Receta

                //Agrega Unidades
                string UnidadProductoPadre = string.Empty;
                int CxP = 10;

                doc.Lines.ItemNo = UnidadProductoPadre;
                doc.Lines.PlannedQuantity = CxP;
                doc.Lines.Warehouse = "CV201";
                doc.Lines.Add();

                //Agrega Insumos
                doc.Lines.ItemNo = "FILMKG0906"; //producto debe variar entre caja o bolsa
                doc.Lines.PlannedQuantity = 1;
                doc.Lines.Warehouse = "CV201";
                doc.Lines.Add(); 



                //Agrega MO
                doc.Lines.ItemNo = "W-MO";
                doc.Lines.PlannedQuantity = 1;
                doc.Lines.Warehouse = "CV100";
                doc.Lines.Add();


                iError = doc.Add();
                if (iError == 0)
                {
                    ret = doc.DocumentNumber;
                }
                else
                {
                    ret = -1;
                    Error = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();



            }
            catch (Exception ex)
            {
                ret = -1;
                Error = ex.Message;
            }
            return ret;
        }
        public bool ActualizaFechaDespachoOrdenVenta(int DocEntry, DateTime Fecha, string Hora, string Agendamiento)
        {
            bool ret = false;
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            int iError = 0;
            if (reterror == string.Empty)
            {
                try
                {
                    SAPbobsCOM.Documents doc;
                    doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oOrders);
                    doc.GetByKey(DocEntry);
                    doc.UserFields.Fields.Item("U_Fecha_Despacho").Value = Fecha;
                    if (Agendamiento != "")
                        doc.UserFields.Fields.Item("U_Agendamiento").Value = Agendamiento;
                    if(Hora!="")
                        doc.UserFields.Fields.Item("U_Hora_entrega").Value = Hora;
                    iError = doc.Update();
                    if (iError == 0) 
                        ret= true;
                    else ret= false;
                }
                catch (Exception Ex)
                {
                    ret = false;

                }
                finally { oCmp.Disconnect(); }
            }
            return ret;
        }

        public string CreaEntradaOCInsumos(int EntradaInsumosID, string usuario)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            oCmp = CnxSAP(ref reterror);
            try
            {
                int iError = 0;

                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oPurchaseDeliveryNotes);
                doc.DocType = SAPbobsCOM.BoDocumentTypes.dDocument_Items;
                doc.DocDate = DateTime.Now;
                doc.HandWritten = SAPbobsCOM.BoYesNoEnum.tNO;
                doc.UserFields.Fields.Item("U_IdWms").Value = EntradaInsumosID;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                InventarioClass vInv = new InventarioClass();

                List<CVT_EntradaInsumosDetalle> dt = new List<CVT_EntradaInsumosDetalle>();
                dt = vInv.ObtieneEntradaInsumos(EntradaInsumosID);
                foreach (var d in dt)
                {

                    doc.Comments = "Entrada Creada por Intranet";
                    doc.CardCode = d.CardCode;
                   
                    doc.Lines.WarehouseCode = d.Bodega;
                    doc.Lines.ItemCode = d.ItemCode;
                    doc.Lines.BaseEntry = d.DocEntry;
                    doc.Lines.BaseType = 22;
                    doc.Lines.BaseLine = d.LineNum;         
                    doc.Lines.ShipDate = DateTime.Now;
                    doc.Lines.Quantity = (double)d.CantRecepcionar;
                    
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

        public string CreaSalidaInsumos(int SalidaInsumosID, string usuario)
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
                doc.UserFields.Fields.Item("U_IdWms").Value = SalidaInsumosID;
                doc.UserFields.Fields.Item("U_UsuarioWms").Value = usuario;
                InventarioClass vInv = new InventarioClass();

                List<CVT_SalidaInsumosDetalle> dt = new List<CVT_SalidaInsumosDetalle>();
                dt = vInv.ObtieneDetalleSalidaInsumos(SalidaInsumosID);
                List<CVT_SalidaInsumos> dtEnc = new List<CVT_SalidaInsumos>();
                dtEnc = vInv.ObtieneSalidaInsumos(SalidaInsumosID);
                foreach (var d in dtEnc)
                {
                    doc.Comments = "Salida Creada por Intranet";
                    doc.UserFields.Fields.Item("U_No_Contenedor").Value = d.Responsable;
                    foreach (var c in dt)
                    {
                        

                        doc.Lines.WarehouseCode = d.Bodega;
                        doc.Lines.ItemCode = c.ItemCode;
                        doc.Lines.Quantity = (double)c.Cantidad;
                        doc.Lines.CostingCode = c.Division;
                        doc.Lines.CostingCode2 = c.UAdm;
                        doc.Lines.CostingCode3 = c.CCosto;
                        doc.Lines.CostingCode4 = c.Item;

                        doc.Lines.Add();
                    }
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
