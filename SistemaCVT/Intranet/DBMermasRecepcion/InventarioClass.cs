using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class InventarioClass
    {
        public InventarioClass()
        {
        }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWms = new DBMLCVTWMSDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        public bool InsertaRegistroInventario(CVT_DetalleInventario nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_DetalleInventario.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
            }
            catch 
            {

                
            }
            return ret;
        }
        public int ValidaNPallet(int pallet)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWms.Package
                            where p.Package_SSCC.Equals(pallet)
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Package_Id);
            }
            catch
            {
            }
            return ret;
        }
        public string TraeNombrePalletPackage(int pkId)
        {
            string ret = "";
            try
            {
                var temp = (from s in DBWms.Supportive
                            join p in DBWms.Package on s.Supportive_Id equals p.Supportive_Id
                            where p.Package_Id.Equals(pkId)
                            select new { s.Supportive_Description }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Supportive_Description;
            }
            catch
            {
            }
            return ret;
        }
        public int ValidaCodProducto(string producto)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWms.ArticleProvider
                            where p.ArticleProvider_CodClient.Equals(producto)
                            select new { p.ArticleProvider_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.ArticleProvider_Id);
            }
            catch
            {
            }
            return ret;
        }
        public int ValidaLote(string lote)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBWms.Package
                            where p.Package_Lot.Equals(lote)
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Package_Id);
            }
            catch
            {
            }
            return ret;
        }
        public int ValidaUbicacion(int posicion)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBWms.Layout
                            where l.Layout_Id.Equals(posicion)
                            select new { l.Layout_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Layout_Id);
                }
            }
            catch
            {
            }
            return ret;
        }

		public List<CVT_VW_InventarioPalletInventariadosEstadoDespachado> ListaPalletDatosdeBaja(int folio)
		{
			List<CVT_VW_InventarioPalletInventariadosEstadoDespachado> ret = new List<CVT_VW_InventarioPalletInventariadosEstadoDespachado>();
			try
			{
				DBDesaint.CommandTimeout = 3600;
				ret = (from t in DBDesaint.CVT_VW_InventarioPalletInventariadosEstadoDespachado
					   where t.Inventario_Id.Equals(folio)
					   select t).ToList();
			}
			catch (Exception ex)
			{
				throw new Exception("Mensaje.", ex);
			}
			return ret;
		}
		public List<CVT_VW_DiferenciasDuplicados> ListaDiferenciaDuplicados(int folio)
		{
			List<CVT_VW_DiferenciasDuplicados> ret = new List<CVT_VW_DiferenciasDuplicados>();
			try
			{
				DBDesaint.CommandTimeout = 3600;
				ret = (from t in DBDesaint.CVT_VW_DiferenciasDuplicados
					   where t.Inventario_Id.Equals(folio)
					   select t).ToList();
			}
			catch (Exception ex)
			{
				throw new Exception("Mensaje.", ex);
			}
			return ret;
		}
		public List<CVT_VW_InventarioCantidadDiferente> ListaCantidadDiferente(int folio)
		{
			List<CVT_VW_InventarioCantidadDiferente> ret = new List<CVT_VW_InventarioCantidadDiferente>();
			try
			{
				DBDesaint.CommandTimeout = 3600;
				ret = (from t in DBDesaint.CVT_VW_InventarioCantidadDiferente
					   where t.Inventario_Id.Equals(folio)
					   select t).ToList();
			}
			catch (Exception ex)
			{
				throw new Exception("Mensaje.", ex);
			}
			return ret;
		}

		public List<CVT_VW_InventarioProductoDiferente> ListaProductoDiferente(int folio)
		{
			List<CVT_VW_InventarioProductoDiferente> ret = new List<CVT_VW_InventarioProductoDiferente>();
			try
			{
				DBDesaint.CommandTimeout = 3600;
				ret = (from t in DBDesaint.CVT_VW_InventarioProductoDiferente
					   where t.Inventario_Id.Equals(folio)
					   select t).ToList();
			}
			catch (Exception ex)
			{
				throw new Exception("Mensaje.", ex);
			}
			return ret;
		}

		public List<CVT_VW_InventarioLoteDiferente> ListaLoteDiferente(int folio)
		{
			List<CVT_VW_InventarioLoteDiferente> ret = new List<CVT_VW_InventarioLoteDiferente>();
			try
			{
				DBDesaint.CommandTimeout = 3600;
				ret = (from t in DBDesaint.CVT_VW_InventarioLoteDiferente
					   where t.Inventario_Id.Equals(folio)
					   select t).ToList();
			}
			catch (Exception ex)
			{
				throw new Exception("Mensaje.", ex);
			}
			return ret;
		}

		public List<CVT_VW_InventarioSiteDiferente> ListaSiteDiferente(int folio)
		{
			List<CVT_VW_InventarioSiteDiferente> ret = new List<CVT_VW_InventarioSiteDiferente>();
			try
			{
				DBDesaint.CommandTimeout = 3600;
				ret = (from t in DBDesaint.CVT_VW_InventarioSiteDiferente
					   where t.Inventario_Id.Equals(folio)
					   select t).ToList();
			}
			catch (Exception ex)
			{
				throw new Exception("Mensaje.", ex);
			}
			return ret;
		}
		public List<CVT_VW_InventarioPalletVivosNoInventariados> ListaPalletVivosNoInventariados(int folio)
		{
			List<CVT_VW_InventarioPalletVivosNoInventariados> ret = new List<CVT_VW_InventarioPalletVivosNoInventariados>();
			try
			{
				DBDesaint.CommandTimeout = 3600;
				ret = (from t in DBDesaint.CVT_VW_InventarioPalletVivosNoInventariados
					   where t.Inventario_Id.Equals(folio)
					   select t).ToList();
			}
			catch (Exception ex)
			{
				throw new Exception("Mensaje.", ex);
			}
			return ret;
		}

        public DataTable SP_AuditoriaStockGeneral(DateTime Fini, DateTime Fterm)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_AUDITORIA_STOCK_GENERAL(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_AuditoriaStockXcodigo(DateTime Fini, DateTime Fterm,string codPro)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_AUDITORIA_STOCK_XCODIGO(Fini, Fterm,codPro));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_InfInventario(string codpro,string bodega)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_StockLotesWmsSapxBodega1(codpro,bodega));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_InfInventarioProdSinLotes(string codpro, string bodega)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_StockLotesWmsSapxBodega_SLote(codpro, bodega));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_InvValorizadoVsBalance(string sn)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_InventarioValorizadoVsBalance(sn));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_InvValorizadoVsBalanceBodega()

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_InventarioValorizadoVsBalanceBodega());
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_InvValorizadoVsBalanceBodegaReporteB()

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_InventarioValorizadoVsBalanceBodega_ReporteB());
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_InvStockProductos()

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_STOCKPRODUCTO_CVT_SMM());
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_InvStockCombinado()

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_STOCKPRODUCTO_CVT_COMBINADO());
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_AuditoriaStockGeneral_ReporteB(DateTime Fini, DateTime Fterm)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_AUDITORIA_STOCK_GENERAL_ReporteB(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_CompStockVsInventario(string codpro, string bodega,int fInventario)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_StockLotesWmsSapxBodegaVSInventario(codpro, bodega,fInventario));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ListadoExpediciones(DateTime fini,DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                DBWms.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBWms.CVT_SP_ListadoExpediciones(fini,fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ListadoTranferencias(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                DBWms.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBWms.CVT_SP_ListadoTransferencia(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_InformeProyeccionVentas(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                DBWms.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_VTA_STOCK(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_InformePlanillaInsumos(int Mes, int ano)

        {
            DataTable ret = new DataTable();
            try
            {
                DBWms.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDesaint.SP_InformePlanillaInsumos(Mes, ano));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int ValidaUsuarioPlanillaInsumos(int PinsumosID)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDesaint.CVT_Planilla_Insumos
                            where l.PInsumos_Id.Equals(PinsumosID)
                            select new { l.Usuario_Sistema }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Usuario_Sistema);
                }
            }
            catch
            {

            }

            return ret;
        }
        public int ValidaMesPlanillaInsumos(int PinsumosID)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDesaint.CVT_Planilla_Insumos
                            where l.PInsumos_Id.Equals(PinsumosID)
                            select new { l.Mes }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Mes);
                }
            }
            catch
            {

            }

            return ret;
        }
        public int ValidaAnoPlanillaInsumos(int PinsumosID)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDesaint.CVT_Planilla_Insumos
                            where l.PInsumos_Id.Equals(PinsumosID)
                            select new { l.Ano }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Ano);
                }
            }
            catch
            {

            }

            return ret;
        }
        public int CreaPreEntradaOC(int OCDocnum, string Bodega, string Usuario)
        {
            int ret = 0;
            try
            {
                DBSap.SP_InsertaRegistroEntradaOC(OCDocnum, Bodega, Usuario);
                var temp=(from p in DBDesaint.CVT_EntradaInsumos
                          orderby p.EntradaInsumos_ID descending
                          select new {p.EntradaInsumos_ID}).FirstOrDefault();
                if (temp != null)
                {
                    ret=Convert.ToInt32(temp.EntradaInsumos_ID);
                }
            }
            catch { }
            return ret;
        }
        public int CreaPreSalidaInsumo(string responsable, string Bodega, string Usuario)
        {
            int ret = 0;
            try
            {
                CVT_SalidaInsumos vNuevo=new CVT_SalidaInsumos();
                vNuevo.Bodega=Bodega;
                vNuevo.FechaCreacion=DateTime.Now;
                vNuevo.Usuario=Usuario;
                vNuevo.Responsable=responsable;
                DBDesaint.CVT_SalidaInsumos.InsertOnSubmit(vNuevo);
                DBDesaint.SubmitChanges();
                ret = vNuevo.SalidaInsumos_ID;
            }
            catch { }
            return ret;
        }
        public int AgregaDetalleSalidaInsumo(int folio, string articulo, string cc, string item, decimal cantidad)
        {
            int ret = 0;
            try
            {
                CVT_SalidaInsumosDetalle vNuevo = new CVT_SalidaInsumosDetalle();
                vNuevo.SalidaInsumos_ID = folio;
                vNuevo.ItemCode = articulo;
                vNuevo.CCosto = cc;
                vNuevo.Item = item;
                vNuevo.Cantidad = cantidad;
                DBDesaint.CVT_SalidaInsumosDetalle.InsertOnSubmit(vNuevo);
                DBDesaint.SubmitChanges();
                
            }
            catch { }
            return ret;
        }
        public List<CVT_EntradaInsumosDetalle> ObtieneEntradaInsumos (int Folio)
        {
            List<CVT_EntradaInsumosDetalle> ret=new List<CVT_EntradaInsumosDetalle> ();
            try
            {
                ret = (from t in DBDesaint.CVT_EntradaInsumosDetalle
                       where t.EntradaInsumos_ID.Equals(Folio) && t.CantRecepcionar>0
                       select t).ToList();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_SalidaInsumosDetalle> ObtieneDetalleSalidaInsumos(int Folio)
        {
            List<CVT_SalidaInsumosDetalle> ret = new List<CVT_SalidaInsumosDetalle>();
            try
            {
                ret = (from t in DBDesaint.CVT_SalidaInsumosDetalle
                       where t.SalidaInsumos_ID.Equals(Folio)
                       select t).ToList();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_SalidaInsumos> ObtieneSalidaInsumos(int Folio)
        {
            List<CVT_SalidaInsumos> ret = new List<CVT_SalidaInsumos>();
            try
            {
                ret = (from t in DBDesaint.CVT_SalidaInsumos
                       where t.SalidaInsumos_ID.Equals(Folio)
                       select t).ToList();
            }
            catch
            {
            }
            return ret;
        }
        public int CreaEncSalidaInsumo(string Responsable, string Bodega, string Usuario)
        {
            int ret = 0;
            try
            {
                CVT_SalidaInsumos vSalida=new CVT_SalidaInsumos();
                vSalida.Responsable = Responsable;
                vSalida.Bodega = Bodega;
                vSalida.FechaCreacion=DateTime.Now;
                vSalida.Usuario=Usuario;
                DBDesaint.CVT_SalidaInsumos.InsertOnSubmit(vSalida);
                ret=vSalida.SalidaInsumos_ID;
            }
            catch { }
            return ret;
        }
    }
}
