using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SAPbobsCOM;

namespace DBMermasRecepcion
{
    public class SyncClass
    {
        public SyncClass()
        {
        }
        public bool SyncPorCompras()
        {
            string cardCode = string.Empty;
            int receptionId = 0;
            int num2 = 0;
            string whs = string.Empty;
            try
            {
                SAPClass vSAP=new SAPClass();
                string error=string.Empty;
                SAPbobsCOM.Company oCompany = vSAP.CnxSAP(ref error);
                WMS_Entrada entrada = new WMS_Entrada(oCompany);
                DataTable table = entrada.ObtieneRecepcionEncabezado();
                foreach (DataRow row in table.Rows)
                {
                    //INV_0017_Common common2;
                    int? nullable;
                    cardCode = row["CID_Provider"].ToString();
                    receptionId = Convert.ToInt32(row["Reception_Id"].ToString());
                    num2 = ((row["Reception_U_NumDocSAP"].ToString() != null) && (row["Reception_U_NumDocSAP"].ToString() != "")) ? Convert.ToInt32(row["Reception_U_NumDocSAP"]) : 0;
                    whs = row["Site_ShortDescription"].ToString();
                    //if (SAP_SociodeNegocios.ExisteSociodeNegociosenSAP(cardCode))
                    //{
                        DataTable dtCabecera = new DataTable();
                        dtCabecera = table.Clone();
                        dtCabecera.ImportRow(row);
                        DataTable dt = entrada.ObtieneRecepcionDetalle(receptionId);
                        if (dt.Rows.Count > 0)
                        {
                            int docEntryRefSAP = num2;
                            if ((docEntryRefSAP > 0))
                            {
                                this.CreaEntradaSAP(receptionId, BoObjectTypes.oPurchaseOrders, docEntryRefSAP, dtCabecera, dt, whs, oCompany);
                            }
                            //common2 = new INV_0017_Common();
                            //nullable = null;
                            //common2.InsertaLOGError(2, 2, new int?(receptionId), 20, nullable, 'E', "Documento de Referencia no v\x00e1lido");
                        }
                        //else
                        //{
                        //    common2 = new INV_0017_Common();
                        //    nullable = null;
                        //    common2.InsertaLOGError(2, 2, new int?(receptionId), 20, nullable, 'E', "Recepci\x00f3n sin Detalle");
                        //}
                    //}
                    //else
                    //{
                    //    common2 = new INV_0017_Common();
                    //    nullable = null;
                    //    common2.InsertaLOGError(2, 2, new int?(receptionId), 20, nullable, 'E', "Socio de Negocios no creado en SAP C\x00f3digo:" + cardCode);
                    //}
                }
            }
            catch (Exception exception)
            {
               // new INV_0017_Common().InsertaLOGError(2, 2, new int?(receptionId), 20, null, 'E', exception.ToString());
            }
            return true;
        }

        public bool CreaEntradaSAP(int ReceptionId, BoObjectTypes ObjRefSAP, int DocEntryRefSAP, DataTable dtCabecera, DataTable dtDetalle, string Whs, SAPbobsCOM.Company oCompany)
        {
            bool flag = false;
            bool flag2 = true;
            //SAP_Common common = new SAP_Common(ref this.oCompany);
            //INV_0017_Common common2 = new INV_0017_Common();
            Documents businessObject = oCompany.GetBusinessObject(BoObjectTypes.oPurchaseDeliveryNotes) as Documents;
            Documents o = oCompany.GetBusinessObject(ObjRefSAP) as Documents;
            try
            {
                int num;
                //int? nullable;
                string cardCode = dtCabecera.Rows[0]["CID_Provider"].ToString();
                if (DocEntryRefSAP > 0)
                {
                    o.GetByKey(DocEntryRefSAP);
                    businessObject.DocCurrency = o.DocCurrency;
                    businessObject.CardCode = o.CardCode;
                    businessObject.Comments = "Creado por Sincronizacion. Basado en Recepcion WMS Folio " + ReceptionId.ToString();
                    if (dtDetalle.Rows.Count > 0)
                    {
                        num = 0;
                        foreach (DataRow row in dtDetalle.Rows)
                        {
                            if (num > 0)
                            {
                                businessObject.Lines.Add();
                            }
                            int lineNum = 0;
                            int num4 = 0;
                            for (lineNum = 0; lineNum < o.Lines.Count; lineNum++)
                            {
                                o.Lines.SetCurrentLine(lineNum);
                                if (o.Lines.ItemCode == row["ItemCode"].ToString())
                                {
                                    num4 = o.Lines.LineNum;
                                    break;
                                }
                            }
                           
                                flag2 = true;
                                businessObject.Lines.BaseType = int.Parse(o.DocObjectCodeEx);
                                businessObject.Lines.BaseLine = o.Lines.LineNum;
                                businessObject.Lines.BaseEntry = o.Lines.DocEntry;
                                businessObject.Lines.Quantity = Convert.ToDouble(row["Quantity"]);
                                businessObject.Lines.ItemCode = row["ItemCode"].ToString();
                                businessObject.Lines.WarehouseCode = Whs;
                                if (Convert.ToInt32(row["MangBatch"]) == 1)
                                {
                                    LlenaLotesEntrada(ReceptionId, row["ItemCode"].ToString(), ref businessObject, oCompany);
                                }
                                
                           
                            num++;
                        }
                    }
                }
                else
                {
                    businessObject.CardCode = cardCode;
                    businessObject.Comments = "Creado por Sincronizacion. Basado en Recepcion WMS Folio " + ReceptionId.ToString();
                    if (dtDetalle.Rows.Count > 0)
                    {
                        num = 0;
                        foreach (DataRow row in dtDetalle.Rows)
                        {
                            if (num > 0)
                            {
                                businessObject.Lines.Add();
                            }
                            businessObject.Lines.Quantity = Convert.ToDouble(row["Quantity"]);
                            businessObject.Lines.ItemCode = row["ItemCode"].ToString();
                            businessObject.Lines.WarehouseCode = Whs;
                            if (Convert.ToInt32(row["MangBatch"]) == 1)
                            {
                                LlenaLotesEntrada(ReceptionId, row["ItemCode"].ToString(), ref businessObject, oCompany);
                            }
                            if (num == 0)
                            {
                                businessObject.Lines.Add();
                            }
                            num++;
                        }
                    }
                }
                if (flag2)
                {
                    int errCode = businessObject.Add();
                    if (errCode != 0)
                    {
                        string errMsg = "";
                        oCompany.GetLastError(out errCode, out errMsg);
                        //nullable = null;
                        //common2.InsertaLOGError(2, 2, new int?(ReceptionId), 20, nullable, 'E', errMsg.ToString());
                        return false;
                    }
                    new WMS_Entrada(oCompany).MarcaStatusRecepcionWMS(ReceptionId, 'S');
                    //common2.InsertaLOGError(2, 2, new int?(ReceptionId), 20, new int?(this.UltimaEntradaMercanciaPorSociodeNegociosenSAP(cardCode)), 'S', "");
                    return true;
                }
                //nullable = null;
                //common2.InsertaLOGError(2, 2, new int?(ReceptionId), 20, nullable, 'E', "No se puede superar la cantidad del documento base.");
                return flag;
            }
            catch (Exception exception)
            {
                //common2.InsertaLOGError(2, 2, new int?(ReceptionId), 20, null, 'E', exception.ToString());
                //flag = false;
            }
            finally
            {
                //Marshal.ReleaseComObject(businessObject);
                //Marshal.ReleaseComObject(o);
                //businessObject = null;
                //o = null;
                //GC.Collect();
            }
            return flag;
        }
        public void LlenaLotesEntrada(int ReceptionId, string ItemCode, ref Documents oDoc, SAPbobsCOM.Company oCompany)
        {
            //INV_0017_Common common = new INV_0017_Common();
            try
            {
                DataTable table = new WMS_Entrada(oCompany).ObtieneRecepcionLotes(ReceptionId, ItemCode);
                foreach (DataRow row in table.Rows)
                {
                    oDoc.Lines.BatchNumbers.Add();
                    oDoc.Lines.BatchNumbers.BatchNumber = row["Lote"].ToString();
                    oDoc.Lines.BatchNumbers.Quantity = Convert.ToInt32(row["Quantity"]);
                    oDoc.Lines.BatchNumbers.Notes = "Creado por Integracion";
                    oDoc.Lines.BatchNumbers.ManufacturingDate = Convert.ToDateTime(row["FechaProduccion"]);
                    oDoc.Lines.BatchNumbers.ExpiryDate = Convert.ToDateTime(row["FechaVencimiento"]);
                    //oDoc.Lines.BatchNumbers.Add();
                }
            }
            catch (Exception exception)
            {
                //int? nullable = null;
                //common.InsertaLOGError(1, 2, new int?(ReceptionId), nullable, null, 'E', exception.ToString());
            }
        }






     

 



    }
}
