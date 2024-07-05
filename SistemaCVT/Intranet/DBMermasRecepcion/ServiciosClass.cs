using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class ServiciosClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DbSap = new DBMLCVTSAPDataContext();
        public ServiciosClass()
        {

        }
        public List<CVT_PreguntaEncuesta> ObtienePreguntaArea(int areaid)
        {
            List<CVT_PreguntaEncuesta> ret = new List<CVT_PreguntaEncuesta>();
            try
            {
                ret = (from p in DBDESAINT.CVT_PreguntaEncuesta
                       where p.Id_Area.Equals(areaid)
                       select p).ToList<CVT_PreguntaEncuesta>();
            }
            catch
            {

            }
            return ret;
        }
        public bool InsertaRespuesta(CVT_RespuestaEncuesta RES)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_RespuestaEncuesta.InsertOnSubmit(RES);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {

            }
            return ret;
        }
        public DateTime BuscaFechaCreacion(int idRevision)
        {
            DateTime? ret=null;
            try
            {
                var temp = (from u in DBDESAINT.CVT_RegistroRevisionCamiones
                            where u.Id_RevisionCamion.Equals(idRevision)
                            select new { u.Fecha }).First();
                if (temp != null)
                {
                    ret= temp.Fecha;
                }
            }
            catch {            
            }
            return Convert.ToDateTime(ret);
        }
        public bool BuscaIdRevision(int idRevision)
        {
          bool ret =false;
            try
            {
                var temp = (from u in DBDESAINT.CVT_RegistroRevisionCamionFactura
                            where u.Id_RevisionCamion.Equals(idRevision)
                            select new { u.Id_RevisionCamionFactura }).FirstOrDefault();
                if (temp != null)
                {
                    ret = true;
                }
            }
            catch
            {
            }
            return ret;

        }

        public DataTable SP_EmpresasRelacionadas()

        {
            DataTable ret = new DataTable();
            try
            {
                DbSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DbSap.CVT_EmpresasRelacionadas());
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_EmpresasRelacionadasDocumentos()
        {
            DataTable ret = new DataTable();
            try
            {
                DbSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DbSap.CVT_EmpresasRelacionadasDoc());
            }
            catch (Exception)
            {

            }
            return ret;
        }
    }
}
