using DBMermasRecepcion;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TestApiEnvioAuto.Controllers
{
    [RoutePrefix("api/Integracion")]
    public class CvtIntegracionController : ApiController
    {
       

      [HttpGet]
        [Route("ActPrecioEntrega")]

        public HttpResponseMessage actualizaPrecioEntrega()
        {
            SqlConnection con = new SqlConnection("Data Source=alerce;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt.vdp22$");
            SqlCommand CMD = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
          


            #region variables
            //variables  
            int IndContinua =0;
            int PrecioEntrega=0;
            SAPbobsCOM.Company oCmp = new SAPbobsCOM.Company();
            string MsngFinal = "";

            #endregion
            #region Marca_inicio_de_proceso

            try
            {
                // verifica si existe precio de entrega , si es asi actualiza el estado a 1 e inicia el proceso
                con.Open();
                DataSet ds = new DataSet();
                CMD = new SqlCommand("CVT_SrvIntBuscaRegIntegracion", con);
                CMD.CommandType = CommandType.StoredProcedure;

                for (int c = 0; c <= CMD.Parameters.Count - 1; c++)
                    CMD.Parameters.Clear();
                
               

                CMD.Parameters.Add("@IndEstado", SqlDbType.SmallInt);
                CMD.Parameters["@IndEstado"].Direction = ParameterDirection.Output;

                CMD.Parameters.Add("@Int_PrecEntrega", SqlDbType.SmallInt);
                CMD.Parameters["@Int_PrecEntrega"].Direction = ParameterDirection.Output;

                CMD.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 255);
                CMD.Parameters["@Mensaje"].Direction = ParameterDirection.Output;
                CMD.Parameters["@Mensaje"].Value = " ";
                CMD.ExecuteNonQuery();

                IndContinua = Convert.ToInt32(CMD.Parameters["@IndEstado"].Value);
                PrecioEntrega = Convert.ToInt32(CMD.Parameters["@Int_PrecEntrega"].Value);

                if (CMD.Parameters["@Mensaje"].Value.ToString().Trim() != "")
                {
                    LogClass lg = new LogClass();

                    string DescError = "Error al marcar inicio de Proceso :" + CMD.Parameters["@Mensaje"].Value.ToString().Trim();
                    lg.LogPrecioEntrega(DescError,"Inicio Proceso");

                    string rest = JsonConvert.SerializeObject(DescError);
                    var respon = Request.CreateResponse(HttpStatusCode.Created);
                    respon.Content = new StringContent(rest, System.Text.Encoding.UTF8, "application/json");
                    return respon;
                }

                con.Close();

            }
            catch (Exception ex)
            {
                LogClass lg = new LogClass();

                string DescError = ex.Message;
                lg.LogPrecioEntrega(DescError,"Inicio Proceso");

                string rest = JsonConvert.SerializeObject(DescError);
                var respon = Request.CreateResponse(HttpStatusCode.Created);
                respon.Content = new StringContent(rest, System.Text.Encoding.UTF8, "application/json");
                return respon;
            }

            #endregion

            //verilfico si continua el proceso y si existe precio de entrega

            if (IndContinua == 0)
            {
                if(PrecioEntrega != 0)
                {
                    #region inicia proceso Actualizacion precio de entrega

                    SAPClass vSAP = new SAPClass();
                    string reterror = "-1";
                    oCmp = vSAP.CnxSAP(ref reterror);

                        SAPbobsCOM.LandedCostsService svrLandedCost = oCmp.GetCompanyService().GetBusinessService(SAPbobsCOM.ServiceTypes.LandedCostsService);
                        SAPbobsCOM.LandedCost oLandedCost = svrLandedCost.GetDataInterface(SAPbobsCOM.LandedCostsServiceDataInterfaces.lcsLandedCost);
                        long oLandedCostEntry = 0;
                        SAPbobsCOM.LandedCost_ItemLine oLandedCost_ItemLine;
                        SAPbobsCOM.LandedCost_CostLine oLandedCost_CostLine;
                        SAPbobsCOM.LandedCostParams oLandedCostParams = svrLandedCost.GetDataInterface(SAPbobsCOM.LandedCostsServiceDataInterfaces.lcsLandedCostParams);

                        DataSet Ds = new DataSet(), DsDet = new DataSet();
                        DataTable table, TableDet;
                        DataRow row, rowDet;
                        string mSg = "";
                        int varPedidoLinAnterior;
                        int DocNumEntrega;
                        int varNumOrdenC;
                        int IndReg_LineasRecepcion;
                        SAPbobsCOM.LandedCostAllocationByEnum varAllocationBy;

                    IndReg_LineasRecepcion = 0;
                    try
                    {
                        con.Close();
                    }
                    catch
                    { }

                    try
                    {
                        con.Open();
                        CMD = new SqlCommand("CVT_SrvIntPrecEntre_LeeEntregasWms", con);
                        CMD.CommandType = CommandType.StoredProcedure;

                        for (int c = 0; c <= CMD.Parameters.Count ; c++) //-1
                            CMD.Parameters.Clear();


                        CMD.Parameters.Add("@DocEntry_Entrega", SqlDbType.Int, 0);
                        CMD.Parameters["@DocEntry_Entrega"].Direction = ParameterDirection.Input;
                        CMD.Parameters["@DocEntry_Entrega"].Value = 0;

                        CMD.Parameters.Add("@IndEstado", SqlDbType.SmallInt, 0);
                        CMD.Parameters["@IndEstado"].Direction = ParameterDirection.Output;

                        CMD.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 255);
                        CMD.Parameters["@Mensaje"].Direction = ParameterDirection.Output;

                        CMD.ExecuteNonQuery();

                        if (Convert.ToInt32(CMD.Parameters["@IndEstado"].Value) == 1)
                        {
                            LogClass lg = new LogClass();

                            string DescError =  CMD.Parameters["@Mensaje"].Value.ToString().Trim();
                            lg.LogPrecioEntrega(DescError,"Proceso Actualizacion Precio");
                            //string rest = JsonConvert.SerializeObject(DescError);
                            //var respon = Request.CreateResponse(HttpStatusCode.Created);
                            //respon.Content = new StringContent(rest, System.Text.Encoding.UTF8, "application/json");
                            //return respon;

                            //if (DescError.Equals("Error, No se Encontraron Registros"))
                            //{

                            //}
                            //else { MsngFinal = DescError; }
                               MsngFinal = "";
                        }
                        else
                        {

                            SqlDataAdapter sqladp;
                            sqladp = new SqlDataAdapter(CMD);
                            sqladp.Fill(Ds);

                            table = Ds.Tables[0];
                            row = table.Rows[0];
                            varPedidoLinAnterior =Convert.ToInt32(row["DocEntryEntrada"]);
                            varNumOrdenC =Convert.ToInt32(row["OrdenC"]);

                            for (int k = 0; k <= table.Rows.Count - 1; k++)
                            {
                                row = table.Rows[k];

                                if (Convert.ToInt32(row["DocEntryEntrada"]) != varPedidoLinAnterior)
                                {
                                    Proc_IngPrecioEntrega(con, varPedidoLinAnterior);
                                }
                                varPedidoLinAnterior =Convert.ToInt32(row["DocEntryEntrada"]);

                                
                            }
                            Proc_IngPrecioEntrega(con, varPedidoLinAnterior);
                        }

                        con.Close();
                        MsngFinal = "";
                    }
                    
                    catch (Exception ex)
                    {

                        LogClass lg = new LogClass();

                        string DescError =ex.Message;
                        lg.LogPrecioEntrega(DescError, "Proceso Actualizacion Precio");

                        string rest = JsonConvert.SerializeObject(DescError);
                        var respon = Request.CreateResponse(HttpStatusCode.Created);
                        respon.Content = new StringContent(rest, System.Text.Encoding.UTF8, "application/json");
                        return respon;

                        //if(DescError.Equals("Error, No se Encontraron Registros"))
                        //{
                        //    MsngFinal = "";
                        //}
                        //else { MsngFinal = DescError; }

                        MsngFinal = "";

                    }
                    #endregion
                }
            }
            oCmp.Disconnect();
            MsngFinal = "";
            Proc_MarcacierreProceso(con,"");

            string respuesta = JsonConvert.SerializeObject(MsngFinal+"... Fin Proceso");
            var res = Request.CreateResponse(HttpStatusCode.Created);
            res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
            return res;

        }

        private void Proc_MarcacierreProceso(SqlConnection StrinCnx,string Mensaje)
        {
            try
            {
                StrinCnx.Close();
            }
            catch
            { }
            try
            {
                StrinCnx.Open();
                SqlCommand CMD = new SqlCommand();
                CMD = new SqlCommand("CVT_SrvIntMarcaCierreProcIntegra", StrinCnx);
                CMD.CommandType = CommandType.StoredProcedure;

                for (int c = 0; c <= CMD.Parameters.Count - 1; c++)
                    CMD.Parameters.Clear();
                CMD.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 255);
                CMD.Parameters["@Mensaje"].Direction = ParameterDirection.Output;
                CMD.Parameters["@Mensaje"].Value = Mensaje;
                CMD.ExecuteNonQuery();

                if(CMD.Parameters["@Mensaje"].Value.ToString().Trim()!="")
                {
                    LogClass lg = new LogClass();

                    string DescError = "Error Cierre Proc. Integración:" + Mensaje;
                    lg.LogPrecioEntrega(DescError, "MarcacierreProceso");
                }


            }
            catch (Exception ex)
            {
                LogClass lg = new LogClass();
               
                lg.LogPrecioEntrega(ex.Message, "MarcacierreProceso");
            }
           

            StrinCnx.Close();
        }
        private void Proc_IngPrecioEntrega(SqlConnection StrinCnx, int DocEntry_Recepcion)
        {

            SAPbobsCOM.Company oCmp = new SAPbobsCOM.Company();
            SAPClass vSAP = new SAPClass();
            string reterror = "-1";
            oCmp = vSAP.CnxSAP(ref reterror);
            SAPbobsCOM.LandedCostsService svrLandedCost = oCmp.GetCompanyService().GetBusinessService(SAPbobsCOM.ServiceTypes.LandedCostsService);
            SAPbobsCOM.LandedCost oLandedCost = svrLandedCost.GetDataInterface(SAPbobsCOM.LandedCostsServiceDataInterfaces.lcsLandedCost);
            long oLandedCostEntry = 0;
            SAPbobsCOM.LandedCost_ItemLine oLandedCost_ItemLine;
            SAPbobsCOM.LandedCost_CostLine oLandedCost_CostLine;
            SAPbobsCOM.LandedCostParams oLandedCostParams = svrLandedCost.GetDataInterface(SAPbobsCOM.LandedCostsServiceDataInterfaces.lcsLandedCostParams);

            DataSet Ds = new DataSet(), DsDet = new DataSet();
            DataTable table, TableDet;
            DataRow row, rowDet;
            string mSg = "";
            int varPedidoLinAnterior;
            int DocNumEntrega;
            int varNumOrdenC;
            int IndReg_LineasRecepcion;
            SAPbobsCOM.LandedCostAllocationByEnum varAllocationBy;

            IndReg_LineasRecepcion = 0;
            SqlCommand CMD = new SqlCommand();
            try
            {
                StrinCnx.Close();
            }
            catch
            { }
            try
            {
                
                StrinCnx.Open();
                CMD = new SqlCommand("CVT_SrvIntPrecEntre_LeeEntregasWms", StrinCnx);
                CMD.CommandType = CommandType.StoredProcedure;

                for (int c = 0; c <= CMD.Parameters.Count - 1; c++)
                    CMD.Parameters.Clear();

                CMD.Parameters.Add("@DocEntry_Entrega", SqlDbType.Int, 0);
                CMD.Parameters["@DocEntry_Entrega"].Direction = ParameterDirection.Input;
                CMD.Parameters["@DocEntry_Entrega"].Value = DocEntry_Recepcion;

                CMD.Parameters.Add("@IndEstado", SqlDbType.SmallInt, 0);
                CMD.Parameters["@IndEstado"].Direction = ParameterDirection.Output;

                CMD.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 255);
                CMD.Parameters["@Mensaje"].Direction = ParameterDirection.Output;

                CMD.ExecuteNonQuery();

                if(Convert.ToInt32(CMD.Parameters["@IndEstado"].Value) == 1)
                {
                    LogClass lg = new LogClass();

                    string DescError = CMD.Parameters["@Mensaje"].Value.ToString().Trim();
                    lg.LogPrecioEntrega(DescError, "Proc_IngPrecioEntrega");
                   
                }
                else {

                    SqlDataAdapter sqladp;
                    sqladp = new SqlDataAdapter(CMD);
                    sqladp.Fill(Ds);

                    table = Ds.Tables[0];
                    row = table.Rows[0];
                    varPedidoLinAnterior = Convert.ToInt32(row["DocEntryEntrada"]);
                    varNumOrdenC =Convert.ToInt32(row["OrdenC"]);

                    for (int k = 0; k <= table.Rows.Count - 1; k++)
                        
                    {
                        row = table.Rows[k];

                        if(Convert.ToInt32(row["DocEntryEntrada"]) != varPedidoLinAnterior)
                        {
                            try
                            {
                                oLandedCostParams = svrLandedCost.AddLandedCost(oLandedCost);
                                oLandedCostEntry = oLandedCostParams.LandedCostNumber;

                                if (oLandedCostEntry == 0)
                                {
                                    string MsgLog = "Error en ingreso P. Entrega Rec: " + DocEntry_Recepcion;
                                    Proc_MarcaRegEntrega(StrinCnx, DocEntry_Recepcion.ToString(), 0, MsgLog, 0);

                                    LogClass lg = new LogClass();

                                   
                                    lg.LogPrecioEntrega(MsgLog, "Proc_IngPrecioEntrega");
                                    oLandedCostEntry = 0;
                                    IndReg_LineasRecepcion = 0;

                                }
                                else {
                                    //Crear SP para recuperar DocNum de Entrega

                                    DocNumEntrega =Convert.ToInt32( oLandedCostEntry);

                                    string MsgLog = "Precio de Entrega Creado satisfactoriamente para Rec: " + DocEntry_Recepcion;
                                    LogClass lg = new LogClass();
                                    lg.LogPrecioEntrega(MsgLog, "Proc_IngPrecioEntrega"+ " Crear SP para recuperar DocNum de Entrega");

                                    Proc_MarcaRegEntrega(StrinCnx, DocEntry_Recepcion.ToString(), 1, MsgLog, Convert.ToInt32(oLandedCostEntry));
                                    IndReg_LineasRecepcion = 0;
                                }
                            }
                            catch (Exception ex)
                            {
                                mSg = ex.Message;
                                string MsgLog = "Error en Integración. Contactar Administrador. Rec: " + DocEntry_Recepcion + ". " + mSg;

                                LogClass lg = new LogClass();
                                lg.LogPrecioEntrega(MsgLog, "Proc_IngPrecioEntrega"+" Fin Catch");
                            }

                            oLandedCostEntry = 0;
                        }

                        // Enlace de Precio de Entrega a documento entrada

                        if (IndReg_LineasRecepcion == 0)
                        {
                            try
                            {
                                StrinCnx.Close();
                            }
                            catch
                            { }
                            try
                            {
                                StrinCnx.Open();

                                CMD = new SqlCommand("CVT_SrvIntPrecEntre_LeeDetRecepcion", StrinCnx);
                                CMD.CommandType = CommandType.StoredProcedure;

                                for (int c = 0; c <= CMD.Parameters.Count - 1; c++)
                                    CMD.Parameters.Clear();


                                CMD.Parameters.Add("@DocEntry_Entrega", SqlDbType.Int, 0);
                                CMD.Parameters["@DocEntry_Entrega"].Direction = ParameterDirection.Input;
                                CMD.Parameters["@DocEntry_Entrega"].Value = row["DocEntryEntrada"];

                                CMD.Parameters.Add("@Mensaje", SqlDbType.NVarChar, 255);
                                CMD.Parameters["@Mensaje"].Direction = ParameterDirection.Output;

                                CMD.ExecuteNonQuery();

                                if(CMD.Parameters["@Mensaje"].Value.ToString() != " ")
                                {
                                    LogClass lg = new LogClass();

                                    string DescError = CMD.Parameters["@Mensaje"].Value.ToString().Trim();
                                    lg.LogPrecioEntrega(DescError, " Enlace de Precio de Entrega a documento entrada");
                                }
                                else {

                                    SqlDataAdapter sqladp_Det;
                                    sqladp_Det = new SqlDataAdapter(CMD);
                                    sqladp_Det.Fill(DsDet);

                                    TableDet = DsDet.Tables[0];
                                    rowDet = TableDet.Rows[0];

                                    for (int z = 0; z <= TableDet.Rows.Count - 1; z++)
                                    {
                                        rowDet = TableDet.Rows[z]; 

                                        oLandedCost_ItemLine = oLandedCost.LandedCost_ItemLines.Add();
                                        oLandedCost_ItemLine.BaseDocumentType = SAPbobsCOM.LandedCostBaseDocumentTypeEnum.asGoodsReceiptPO;
                                        oLandedCost_ItemLine.BaseEntry =Convert.ToInt32(rowDet["DocEntry"]);
                                        oLandedCost_ItemLine.BaseLine = Convert.ToInt32(rowDet["LineNum"]);
                                    }

                                }
                            }
                            catch (Exception ex)
                            {

                                mSg = ex.Message;
                                string MsgLog = "Error: " + mSg + " @ " + ex.Message;

                                LogClass lg = new LogClass();
                                lg.LogPrecioEntrega(MsgLog, " Enlace de Precio de Entrega a documento entrada");
                            }

                            IndReg_LineasRecepcion = 1;
                        }
                        oLandedCost_CostLine = oLandedCost.LandedCost_CostLines.Add();
                        oLandedCost_CostLine.LandedCostCode = row["U_ItemCosto"].ToString();

                        //'Suppose the vendor currency is Foreign Currency, if in local currency should set 'oLandedCost_CostLine.amount

                        oLandedCost_CostLine.CostType = SAPbobsCOM.LCCostTypeEnum.asFixedCosts;
                        //varAllocationBy = row["Imputacion"] == "W"?SAPbobsCOM.LandedCostAllocationByEnum.asWeight: SAPbobsCOM.LandedCostAllocationByEnum.asQuantity;
                        //if (row["Imputacion"] == "W")
                            oLandedCost_CostLine.AllocationBy = SAPbobsCOM.LandedCostAllocationByEnum.asWeight;
                        //else
                        //    oLandedCost_CostLine.AllocationBy = SAPbobsCOM.LandedCostAllocationByEnum.asQuantity;

                        oLandedCost_CostLine.amount =Convert.ToDouble( row["MontoEntregaItem"]);
                        oLandedCost.Remarks = "OC: " + row["OrdenC"] + " Proveedor: " + row["NombProveedor"] + ". Integración CVT";
                        oLandedCost.JournalRemarks =Convert.ToString(row["NumRef"]);
                        
                        varNumOrdenC =Convert.ToInt32(row["OrdenC"]);
                        varPedidoLinAnterior =Convert.ToInt32(row["DocEntryEntrada"]);
                    }

                    try
                    {
                        oLandedCostParams = svrLandedCost.AddLandedCost(oLandedCost);
                        oLandedCostEntry = oLandedCostParams.LandedCostNumber;

                        if(oLandedCostEntry == 0)
                        {
                            string MsgLog = "Error en ingreso P. Entrega Rec: " + DocEntry_Recepcion;

                            LogClass lg = new LogClass();
                            lg.LogPrecioEntrega(MsgLog, " Enlace de Precio de Entrega a documento entrada");

                            oLandedCostEntry = 0;
                            IndReg_LineasRecepcion = 0;
                        }
                        else {

                            //Crear SP para recuperar DocNum de Entrega

                            DocNumEntrega =Convert.ToInt32(oLandedCostEntry);

                            string MsgLog = "Precio de Entrega Creado satisfactoriamente para Rec: " + DocEntry_Recepcion;
                             LogClass lg = new LogClass();
                            lg.LogPrecioEntrega(MsgLog, " Crear SP para recuperar DocNum de Entrega");

                            Proc_MarcaRegEntrega(StrinCnx, varPedidoLinAnterior.ToString(), 1, MsgLog, Convert.ToInt32(oLandedCostEntry));
                        }
                    }
                    catch (Exception ex)
                    {
                        mSg = ex.Message;
                        string MsgLog = "Error en Integración. Contactar Administrador. Rec: " + DocEntry_Recepcion + ". " + mSg;

                        LogClass lg = new LogClass();
                        lg.LogPrecioEntrega(MsgLog, " Crear SP para recuperar DocNum de Entrega");
                    }

                }

                StrinCnx.Close();

            }
            catch (Exception ex)
            {

                string MsgLog = "Error FINAL: " + ex.Message;
                LogClass lg = new LogClass();
                lg.LogPrecioEntrega(MsgLog, " Proc_IngPrecioEntrega");
            }
            oCmp.Disconnect();
            StrinCnx.Close();
        }

        private void Proc_MarcaRegEntrega(SqlConnection StrinCnx,string DocEntryEntrega,int IndAccion,string Mensaje,int DocEntryPrEntrega)
        {
            SAPbobsCOM.Documents Entrega;
            int EstadoUpd;
            long GetDocNum;
            SqlConnection conn = new SqlConnection();
            string mSg = "";
            SAPbobsCOM.Company oCmp = new SAPbobsCOM.Company();
            SAPClass vSAP = new SAPClass();
            string reterror = "-1";
            oCmp = vSAP.CnxSAP(ref reterror);
            conn = StrinCnx;

           
            try
            {
                Entrega = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oPurchaseDeliveryNotes);
                Entrega.GetByKey(Convert.ToInt32(DocEntryEntrega.Trim()));
                Entrega.UserFields.Fields.Item("U_IndPrecioEntrega").Value = 1;

                EstadoUpd = Entrega.Update();

                if(EstadoUpd !=0)
                {
                    oCmp.GetLastError(out EstadoUpd,out mSg);
                    string MsgLog = "Error, actualizando Ind Precio de Entrega para" + DocEntryEntrega + ":" + mSg;
                    LogClass lg = new LogClass();
                    lg.LogPrecioEntrega(MsgLog, " Proc_MarcaRegEntrega");

                    Entrega.Cancel();
                }
                else
                {

                    GetDocNum = Convert.ToInt64( oCmp.GetNewObjectKey());
                    EstadoUpd = Convert.ToInt32(GetDocNum);
                }

            }
            catch (Exception ex)
            {
                string MsgLog = ex.Message;
                LogClass lg = new LogClass();
                lg.LogPrecioEntrega(MsgLog, " Proc_MarcaRegEntrega");
            }
            oCmp.Disconnect();
            conn.Close();
        }
    }
}