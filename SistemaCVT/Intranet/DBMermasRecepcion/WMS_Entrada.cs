using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using SAPbobsCOM;
using System.Configuration;
using System.Data.SqlClient;

namespace DBMermasRecepcion
{
    public class WMS_Entrada
    {
        // Fields
        private int CompanyId = Convert.ToInt32(ConfigurationManager.AppSettings["WMSCompanyId"].ToString());
        private int Def_SiteId = Convert.ToInt32(ConfigurationManager.AppSettings["SiteId_Default"].ToString());
        private int Dev_DocTypeId = Convert.ToInt32(ConfigurationManager.AppSettings["DocTypeId_Devolucion"].ToString());
        private int Dev_SiteId = Convert.ToInt32(ConfigurationManager.AppSettings["SiteId_Devolucion"].ToString());
        private Company oCompany = null;
        private int Prod_DocTypeId = Convert.ToInt32(ConfigurationManager.AppSettings["DocTypeId_Produccion"].ToString());
        private int StaffId = Convert.ToInt32(ConfigurationManager.AppSettings["WMSDefaultStaffId"].ToString());
        private string strcnx = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
        private int Tras_DocTypeId = Convert.ToInt32(ConfigurationManager.AppSettings["DocTypeId_Traspaso"].ToString());
        private int Vpackagestate = Convert.ToInt32(ConfigurationManager.AppSettings["PackageStateId"].ToString());
        private int Vworktype = Convert.ToInt32(ConfigurationManager.AppSettings["WorkTypeId"].ToString());

        // Methods
        public WMS_Entrada(Company oComp)
        {
            this.oCompany = oComp;
        }

        public void CamposPersonalizadosRecepcion(int id, int docType, int docNumber)
        {
            try
            {
                string str = " UPDATE ";
                str = str + " Reception SET Reception_U_TipoDocSAP=@docType, Reception_U_NumDocSAP=@docNumber " + " WHERE  Reception_Id=@id";
                SqlConnection connection = new SqlConnection();
                SqlCommand command = new SqlCommand();
                DataTable table = new DataTable();
                connection.ConnectionString = this.strcnx;
                command = connection.CreateCommand();
                command.CommandText = str;
                command.Parameters.Add("@id", SqlDbType.Int);
                command.Parameters["@id"].Value = id;
                command.Parameters.Add("@docType", SqlDbType.Int);
                command.Parameters["@docType"].Value = docType;
                command.Parameters.Add("@docNumber", SqlDbType.Int);
                command.Parameters["@docNumber"].Value = docNumber;
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception exception)
            {
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //common.InsertaLOGError(1, 2, new int?(id), nullable, null, 'E', exception.Message.ToString());
            }
        }

        
        public static bool ExisteSociodeNegociosenWMS(string CId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            bool flag = false;
            int num = 0;
            string cmdText = "SELECT COUNT(*) FROM  dbo.Business_Partner WHERE  (Business_Partner_CId = @CId)";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(cmdText, connection);
                command.Parameters.Add("@CId", SqlDbType.VarChar);
                command.Parameters["@CId"].Value = CId;
                try
                {
                    connection.Open();
                    num = (int)command.ExecuteScalar();
                    if (num != 0)
                    {
                        flag = true;
                    }
                }
                catch (Exception exception)
                {
                    flag = false;
                    //INV_0017_Common common = new INV_0017_Common();
                    //int? nullable = null;
                    //common.InsertaLOGError(1, 6, nullable, 2, null, 'E', CId + ":" + exception.Message.ToString());
                }
            }
            return flag;
        }

      

        public void MarcaStatusRecepcionWMS(int id, char Status)
        {
            try
            {
                string str = " UPDATE ";
                str = str + " Reception SET INV_0010_SyncStat=@Status, INV_0010_UpdFrom='D' " + " WHERE  Reception_Id=@id";
                SqlConnection connection = new SqlConnection();
                SqlCommand command = new SqlCommand();
                DataTable table = new DataTable();
                connection.ConnectionString = this.strcnx;
                command = connection.CreateCommand();
                command.CommandText = str;
                command.Parameters.Add("@id", SqlDbType.Int);
                command.Parameters["@id"].Value = id;
                command.Parameters.Add("@Status", SqlDbType.Char);
                command.Parameters["@Status"].Value = Status;
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
            catch (Exception exception)
            {
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //common.InsertaLOGError(1, 2, new int?(id), nullable, null, 'E', exception.Message.ToString());
            }
        }

        public DataTable ObtieneRecepcionDetalle(int ReceptionId)
        {
            int num = Convert.ToInt32(ConfigurationManager.AppSettings["DocTypeId_Default"].ToString());
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            DataTable dataTable = new DataTable();
            string cmdText = "SELECT     dbo.ArticleProvider.ArticleProvider_CodClient AS ItemCode, SUM(dbo.Package.Package_QuantityInitial) AS Quantity, ";
            cmdText = ((cmdText + "   dbo.ArticleProvider.ArticleProvider_ControlLT AS MangBatch, dbo.ArticleProvider.ArticleProvider_ControlSN AS MangSerial" + "  FROM dbo.Reception INNER JOIN") + "  dbo.Package ON dbo.Reception.Reception_Id = dbo.Package.Reception_Id INNER JOIN" + "  dbo.ArticleProvider ON dbo.Package.ArticleProvider_Id = dbo.ArticleProvider.ArticleProvider_Id") + "  WHERE  (dbo.Reception.Reception_Id = @ReceptionId)" + "  GROUP BY dbo.ArticleProvider.ArticleProvider_CodClient, dbo.ArticleProvider.ArticleProvider_ControlLT, dbo.ArticleProvider.ArticleProvider_ControlSN";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand selectCommand = new SqlCommand(cmdText, connection);
            selectCommand.Parameters.Add("@ReceptionId", SqlDbType.Int);
            selectCommand.Parameters["@ReceptionId"].Value = ReceptionId;
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            try
            {
                adapter.Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            string str2 = ConfigurationManager.AppSettings["SiteId_Default"].ToString();
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            object obj2 = (("SELECT     TOP (100) PERCENT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn,  " + "   dbo.Reception.Reception_DocNumber, dbo.Reception.Reception_U_NumDocSAP, dbo.Reception.Site_Id, dbo.Site.Site_ShortDescription " + "   FROM         dbo.Reception INNER JOIN ") + "   dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND   " + "   dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id INNER JOIN  ") + "   dbo.Site ON dbo.Reception.Site_Id = dbo.Site.Site_Id  " + "   WHERE     (dbo.Reception.INV_0010_SyncStat = 'U') AND (dbo.Reception.DocType_Id <> 11) AND (dbo.Reception.Reception_U_TipoDocSAP = 22)  ";
            string cmdText = string.Concat(new object[] { obj2, "  AND (dbo.Reception.Reception_Status  = ", 2, ") " }) + "  ORDER BY dbo.Reception.Reception_Id DESC  ";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_CV100(int Site_Id)
        {
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(this.strcnx);
            object obj2 = ((" SELECT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn," + " dbo.Reception.Reception_DocNumber,dbo.Reception.Reception_U_NumDocSAP , dbo.Reception.Site_Id" + " FROM   dbo.Reception INNER JOIN") + " dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND" + " dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id") + " WHERE" + " (dbo.Reception.DocType_Id = 11) AND (dbo.Reception.INV_0010_SyncStat <> 'S') AND";
            string cmdText = (string.Concat(new object[] { obj2, " (dbo.Reception.Reception_Status  = ", 2, ") AND" }) + " (dbo.Reception.Site_Id = " + Site_Id.ToString() + ")") + "   Order By dbo.Reception.Reception_Id Desc";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(2, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_DevolucionFactura()
        {
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(this.strcnx);
            object obj2 = ((("SELECT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn, " + "   ISNULL(dbo.Reception.Reception_DocNumber,0) as Reception_DocNumber, ISNULL(dbo.Reception.Reception_U_NumDocSAP,0) as Reception_U_NumDocSAP") + "   FROM dbo.Reception INNER JOIN" + "   dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND ") + "   dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id" + "   WHERE") + "   (dbo.Reception.INV_0010_SyncStat = 'U') AND " + "   (dbo.Reception.Reception_U_TipoDocSAP = 13) AND ";
            string cmdText = ((string.Concat(new object[] { obj2, "   (dbo.Reception.Reception_Status  = ", 2, ")   AND " }) + "   (dbo.Reception.Site_Id = " + this.Dev_SiteId.ToString() + ") AND ") + "   (dbo.Reception.DocType_Id  = " + this.Dev_DocTypeId.ToString() + ")") + "   Order By dbo.Reception.Reception_Id Desc";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_DevolucionGuia()
        {
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(this.strcnx);
            object obj2 = ((("SELECT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn, " + "   ISNULL(dbo.Reception.Reception_DocNumber,0) as Reception_DocNumber, ISNULL(dbo.Reception.Reception_U_NumDocSAP,0) as Reception_U_NumDocSAP") + "   FROM dbo.Reception INNER JOIN" + "   dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND ") + "   dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id" + "   WHERE") + "   (dbo.Reception.INV_0010_SyncStat = 'U') AND " + "   (dbo.Reception.Reception_U_TipoDocSAP = 15) AND ";
            string cmdText = ((string.Concat(new object[] { obj2, "   (dbo.Reception.Reception_Status  = ", 2, ")   AND " }) + "   (dbo.Reception.Site_Id = " + this.Dev_SiteId.ToString() + ") AND ") + "   (dbo.Reception.DocType_Id  = " + this.Dev_DocTypeId.ToString() + ")") + "   Order By dbo.Reception.Reception_Id Desc";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_DevolucionPorTransferencia()
        {
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(this.strcnx);
            object obj2 = (("SELECT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn, " + "  dbo.Reception.Reception_DocNumber,dbo.Reception.Reception_U_NumDocSAP" + " FROM dbo.Reception INNER JOIN") + "  dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND " + "  dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id") + " WHERE" + "  (dbo.Reception.INV_0010_SyncStat = 'U') AND ";
            string cmdText = (((string.Concat(new object[] { obj2, "  (dbo.Reception.Reception_Status  = ", 2, ")   AND " }) + "  (dbo.Reception.Reception_Origin  = 1)  AND ") + "  (dbo.Reception.Site_Id = " + this.Def_SiteId.ToString() + ") AND ") + "  (dbo.Reception.DocType_Id  = " + this.Tras_DocTypeId.ToString() + ")") + "   Order By dbo.Reception.Reception_Id Desc";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_Inventario()
        {
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(this.strcnx);
            object obj2 = (((("SELECT   dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn, dbo.Reception.Reception_DocNumber, " + "  dbo.Reception.Reception_U_NumDocSAP, dbo.Reception.Site_Id") + "  FROM  dbo.Reception INNER JOIN" + "  dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND ") + "  dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id INNER JOIN" + "  dbo.Package ON dbo.Reception.Reception_Id = dbo.Package.Reception_Id") + "  WHERE     (dbo.Reception.INV_0010_SyncStat = 'U') AND (dbo.Reception.Reception_Status = 2) AND (dbo.Reception.Reception_U_TipoDocSAP IS NULL) AND " + "  (dbo.Reception.Reception_Origin = 1)") + "  GROUP BY dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId, dbo.Reception.Reception_DateIn, dbo.Reception.Reception_DocNumber, " + "  dbo.Reception.Reception_U_NumDocSAP, dbo.Reception.Site_Id, dbo.Package.EntryType";
            string cmdText = string.Concat(new object[] { obj2, "  HAVING  (dbo.Package.EntryType = ", 3, ")" });
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_Nacional_PorCargaDeInventario()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            string cmdText = "SELECT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn, ";
            cmdText = ((((cmdText + "   dbo.Reception.Reception_DocNumber,dbo.Reception.Reception_U_NumDocSAP,dbo.Reception.Site_Id") + "   FROM   dbo.Reception INNER JOIN" + "   dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND ") + "   dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id" + "   WHERE ") + "   (dbo.Reception.Reception_Note  = 'Generada Automaticamente por Carga de Inventario') AND " + "   (dbo.Reception.INV_0010_SyncStat <> 'S') AND (dbo.Reception.DocType_Id <> 11) AND") + "   (dbo.Reception.Reception_Status  = 2)" + "   Order By dbo.Reception.Reception_Id Desc";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_PtoRetenido()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            string str2 = ConfigurationManager.AppSettings["SiteId_Retenido"].ToString();
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            object obj2 = (("SELECT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn, " + "   dbo.Reception.Reception_DocNumber,dbo.Reception.Reception_U_NumDocSAP,dbo.Reception.Site_Id" + "   FROM   dbo.Reception INNER JOIN") + "   dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND " + "   dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id") + "   WHERE" + "   (dbo.Reception.INV_0010_SyncStat = 'U') AND (dbo.Reception.DocType_Id <> 11) AND";
            string cmdText = ((string.Concat(new object[] { obj2, "   (dbo.Reception.Reception_Status  = ", 2, ")   AND " }) + "   (dbo.Reception.Reception_U_TipoDocSAP = 22) AND") + "   (dbo.Reception.Site_Id =" + str2 + ") ") + "   Order By dbo.Reception.Reception_Id Desc";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_PtoTerminado()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            string str2 = ConfigurationManager.AppSettings["SiteId_Default"].ToString();
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            object obj2 = (("SELECT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn, " + "   dbo.Reception.Reception_DocNumber,dbo.Reception.Reception_U_NumDocSAP,dbo.Reception.Site_Id" + "   FROM   dbo.Reception INNER JOIN") + "   dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND " + "   dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id") + "   WHERE" + "   (dbo.Reception.INV_0010_SyncStat = 'U') AND (dbo.Reception.DocType_Id <> 11) AND ";
            string cmdText = ((string.Concat(new object[] { obj2, "   (dbo.Reception.Reception_Status  = ", 2, ")   AND " }) + "   (dbo.reception.reception_u_tipodocsap = 22) and") + "   (dbo.Reception.Site_Id =" + str2 + ") ") + "   Order By dbo.Reception.Reception_Id Desc";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionEncabezado_Todo()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            string cmdText = "SELECT     TOP (100) PERCENT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn,  ";
            cmdText = (((cmdText + "   dbo.Reception.Reception_DocNumber, dbo.Reception.Reception_U_NumDocSAP, dbo.Reception.Site_Id, dbo.Site.Site_ShortDescription AS Almacen " + "   FROM         dbo.Reception INNER JOIN ") + "   dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND  " + "   dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id INNER JOIN ") + "   dbo.Site ON dbo.Reception.Site_Id = dbo.Site.Site_Id " + "   WHERE (dbo.Reception.INV_0010_SyncStat <> 'S') AND  ") + "   (dbo.Reception.Reception_Type = 5) AND (dbo.Reception.Reception_Status = 2) " + "   ORDER BY dbo.Reception.Reception_Id DESC ";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionLotes(int ReceptionId, string ItemCode)
        {
            int num = Convert.ToInt32(ConfigurationManager.AppSettings["DocTypeId_Default"].ToString());
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            DataTable dataTable = new DataTable();
            string cmdText = "   SELECT     SUM(dbo.Package.Package_QuantityInitial) AS Quantity, dbo.Package.Package_Lot AS Lote, dbo.Package.Package_ProductionDate AS FechaProduccion, ";
            cmdText = (((cmdText + "  dbo.Package.Package_ExpiresDate AS FechaVencimiento" + "  FROM dbo.Reception INNER JOIN") + "  dbo.Package ON dbo.Reception.Reception_Id = dbo.Package.Reception_Id INNER JOIN" + "  dbo.ArticleProvider ON dbo.Package.ArticleProvider_Id = dbo.ArticleProvider.ArticleProvider_Id") + "  WHERE " + "  (dbo.Reception.Reception_Id = @ReceptionId) AND ") + "  (dbo.ArticleProvider.ArticleProvider_CodClient = @ItemCode)" + "  GROUP BY dbo.Package.Package_Lot, dbo.Package.Package_ProductionDate, dbo.Package.Package_ExpiresDate";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand selectCommand = new SqlCommand(cmdText, connection);
            selectCommand.Parameters.Add("@ReceptionId", SqlDbType.Int);
            selectCommand.Parameters["@ReceptionId"].Value = ReceptionId;
            selectCommand.Parameters.Add("@ItemCode", SqlDbType.VarChar);
            selectCommand.Parameters["@ItemCode"].Value = ItemCode;
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            try
            {
                adapter.Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionPorDevolucionEncabezado()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            DataTable dataTable = new DataTable();
            SqlConnection connection = new SqlConnection(connectionString);
            object obj2 = ((((" SELECT     TOP (100) PERCENT dbo.Reception.Reception_Id, dbo.Business_Partner.Business_Partner_CId AS CID_Provider, dbo.Reception.Reception_DateIn,  " + " dbo.Reception.Reception_DocNumber, dbo.Reception.Reception_U_NumDocSAP, dbo.Reception.Site_Id, dbo.Reception.Reception_U_TipoDocSAP,  ") + " dbo.DocType.DocType_Code, dbo.Reception.DocType_Id, dbo.Reception.INV_0010_UpdFrom, dbo.Site.Site_ShortDescription, dbo.Reception.Reception_U_TpoDocRef,  " + " dbo.Reception.Reception_U_FolioRef, dbo.Reception.Reception_U_FchRef, dbo.Reception.Reception_U_RazonRef ") + " FROM         dbo.Reception INNER JOIN " + " dbo.Business_Partner ON dbo.Reception.Business_Partner_Provider = dbo.Business_Partner.Business_Partner_Id AND  ") + " dbo.Reception.Company_Id = dbo.Business_Partner.Company_Id INNER JOIN " + " dbo.DocType ON dbo.Reception.DocType_Id = dbo.DocType.DocType_Id INNER JOIN ") + " dbo.Site ON dbo.Reception.Site_Id = dbo.Site.Site_Id " + " WHERE     (dbo.Reception.INV_0010_SyncStat = 'U') AND (dbo.Reception.DocType_Id = 10) ";
            string cmdText = string.Concat(new object[] { obj2, " AND (Reception.Reception_Status = ", 2, ") " }) + " ORDER BY dbo.Reception.Reception_Id DESC ";
            try
            {
                connection.Open();
                SqlCommand selectCommand = new SqlCommand(cmdText, connection);
                new SqlDataAdapter(selectCommand).Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }

        public DataTable ObtieneRecepcionSeries(int ReceptionId, string ItemCode)
        {
            int num = Convert.ToInt32(ConfigurationManager.AppSettings["DocTypeId_Default"].ToString());
            string connectionString = ConfigurationManager.ConnectionStrings["CnxStrWMS"].ToString();
            DataTable dataTable = new DataTable();
            string cmdText = "   SELECT     SUM(dbo.Package.Package_QuantityInitial) AS Quantity, dbo.Package.Package_SN AS SerialNumber,dbo.Package.Package_ProductionDate AS FechaProduccion, ";
            cmdText = (((cmdText + "  dbo.Package.Package_ExpiresDate AS FechaVencimiento" + "  FROM dbo.Reception INNER JOIN") + "  dbo.Package ON dbo.Reception.Reception_Id = dbo.Package.Reception_Id INNER JOIN" + "  dbo.ArticleProvider ON dbo.Package.ArticleProvider_Id = dbo.ArticleProvider.ArticleProvider_Id") + "  WHERE " + "  (dbo.Reception.Reception_Id = @ReceptionId) AND ") + "  (dbo.ArticleProvider.ArticleProvider_CodClient = @ItemCode)" + "  GROUP BY dbo.Package.Package_SN,dbo.Package.Package_ProductionDate, dbo.Package.Package_ExpiresDate";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand selectCommand = new SqlCommand(cmdText, connection);
            selectCommand.Parameters.Add("@ReceptionId", SqlDbType.Int);
            selectCommand.Parameters["@ReceptionId"].Value = ReceptionId;
            selectCommand.Parameters.Add("@ItemCode", SqlDbType.VarChar);
            selectCommand.Parameters["@ItemCode"].Value = ItemCode;
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            try
            {
                adapter.Fill(dataTable);
                connection.Close();
            }
            catch (Exception exception)
            {
                connection.Close();
                //INV_0017_Common common = new INV_0017_Common();
                //int? nullable = null;
                //nullable = null;
                //common.InsertaLOGError(1, 2, nullable, nullable, null, 'E', exception.Message.ToString());
            }
            return dataTable;
        }
    }


}
