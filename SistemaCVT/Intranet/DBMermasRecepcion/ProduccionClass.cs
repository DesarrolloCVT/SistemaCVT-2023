using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class ProduccionClass
    {

        public ProduccionClass()
        {
        }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        public bool InsertaDetencionOF(CVT_Detencion nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_Detencion.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaControlEnv(CVT_ControlEnvasadoPT nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ControlEnvasadoPT.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaControlEnvDetalle(CVT_ControlEnvasadoPT_Detalle nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ControlEnvasadoPT_Detalle.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public string ObtieneSiglaProveedor(string idProv)
        {
            string ret = "";
            try
            {
                var temp = (from t in DBSap.OCRD
                            where t.CardCode.Equals(idProv)
                            select new { t.U_SiglaLote }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.U_SiglaLote;
                }
            }
            catch
            {
                ret ="";

            }
            return ret;
        }

        public bool InsertaControlPesoLinea(CVT_ControlEnvasadoPT_ControlPesoLinea nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ControlEnvasadoPT_ControlPesoLinea.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaControlAseoDiarioPT(CVT_ControlEnvasadoPT_AseoDiario nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ControlEnvasadoPT_AseoDiario.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaMonitoreoPuestaEnMarcha(CVT_ControlEnvasadoPT_PuestaEnMarchaMaquina nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ControlEnvasadoPT_PuestaEnMarchaMaquina.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaPuestaEnMarchaLinea(CVT_ContorlEnvasadoPT_PuestaEnMarchaLinea nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ContorlEnvasadoPT_PuestaEnMarchaLinea.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public bool InsertaCintaImpresion(CVT_ControlEnvasadoPT_UsoCintaImpresion nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ControlEnvasadoPT_UsoCintaImpresion.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public bool InsertaPuestaEnMarchaEnvasadora(CVT_ControlEnvasadoPT_PuestaEnMarchaEnvasadora nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ControlEnvasadoPT_PuestaEnMarchaEnvasadora.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public int ObtieneIdPersonal(string nomb)
        {
            int ret = 0;
            try
            {
                var temp = (from d in DBDesaint.VW_CVT_PersonalControlPT
                            where d.nombre.Equals(nomb)
                            select new { d.Id_Personal }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Id_Personal);
            }
            catch (Exception)
            {


            }
            return ret;
        }


        public int ObtieneOF(int id)
        {
            int ret = 0;
            try
            {
                var temp = (from d in DBDesaint.CVT_ControlEnvasadoPT
                            where d.ID_ControlEnvPT.Equals(id)
                            select new { d.OF }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.OF);
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string ObtieneLinea(int id)
        {
            string ret = "";
            try
            {
                var temp = (from d in DBDesaint.CVT_ControlEnvasadoPT
                            where d.ID_ControlEnvPT.Equals(id)
                            select new { d.Linea }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.Linea);
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public DataTable SP_ConsumidosLoteProducto(int of, string lot, string codpro)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_SP_ConsumidoOFLoteProducto(of,lot,codpro));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool ActualizaEstadoDetenciones(int IdDet, int Estado, int idConfir)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_Detencion
                        where a.Detencion_Id.Equals(IdDet)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.UserConfirma = idConfir;
                    r.FechConfirma = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int ObtieneNumBobinaDet(int SSCC)
        {
            int ret = 0;
            try
            {
                var temp = (from d in DBDesaint.CVT_ControlEnvasadoPT_Detalle
                            where d.NBobina.Equals(SSCC)
                            select new { d.NBobina }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.NBobina);
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool ActualizaEstadoControlEnv(int IdControl, int Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDesaint.CVT_ControlEnvasadoPT
                        where a.ID_ControlEnvPT.Equals(IdControl)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.UsuarioValidador = verificador;
                    r.FechaValidacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDesaint.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }


        public int ObtieneEstadoControlEnv(int idControl)
        {
            int ret = 0;
            try
            {
                var temp = (from d in DBDesaint.CVT_ControlEnvasadoPT
                            where d.ID_ControlEnvPT.Equals(idControl)
                            select new { d.Estado }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Estado);
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public DataTable SP_ListadoControlEnvasadoPT(int of,int Mes,int Ano)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_LISTA_CONTROLENVPT(of,Mes,Ano));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ControlProduccionCompleta(int Ano, int Mes, int Semana,int Dia)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDesaint.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDesaint.SP_ProduccionCompleto(Ano, Mes, Semana,Dia));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_StockBajadaPedido(int sitio, string  Codpro,string lot)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDesaint.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDesaint.SP_STOCK_DISPONIBLE_BAJADA_PEDIDO(sitio,Codpro,lot));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_RptEtiquetado(string SSCC,int nRec,int Orig)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_RptEtiquetado(SSCC,nRec,Orig));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }
        public DataTable SP_RptFefo(string Bodega,string CodProd)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDesaint.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDesaint.SP_RPT_FEFO(Bodega,CodProd));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }
        public int TraeNOrdenPallet(int idControlPallet)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDesaint.CVT_ControlPeso_ProductoPalletizado_Detalle
                            where s.Id_ContrPesoPallet.Equals(idControlPallet)
                            select s.NPallet).Max();

                ret = Convert.ToInt32(temp);

            }
            catch (Exception ex)
            {
                string ms = ex.Message;
            }
            return ret;
        }

        public string TraeEstadoControl(int idControl)
        {
            string ret = "";
            try
            {
                var temp = (from l in DBDesaint.CVT_ControlPeso_ProductoPalletizado
                            where l.Id_ContrPesoPallet.Equals(idControl)
                            select new { l.Estado }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Estado;

                }
            }
            catch
            {
            }
            return ret;
        }
    }
}
