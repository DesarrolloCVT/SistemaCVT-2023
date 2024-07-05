using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
   public class ReclamosClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DbWms = new DBMLCVTWMSDataContext();

        public ReclamosClass() { }

        public bool ActualizaEstadoReclamo(int idRec, int Estado)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDESAINT.CVT_Reclamo
                        where a.Id_Reclamo.Equals(idRec)
                        select a;
                foreach (var r in t)
                {

                    r.EstadoReclamo = Estado;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDESAINT.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string insertaReclamo(CVT_Reclamo nuevo)
        {
            string ret = "-1";
            try
            {
                DBDESAINT.CVT_Reclamo.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = "Creado";
            }
            catch (Exception ex)
            {
                ret = ex.Message;

            }
            return ret;
        }

        public int insertaReclamoArchivo(CVT_Reclamo_Archivos nuevo)
        {
            int ret = 0;
            try
            {
                DBDESAINT.CVT_Reclamo_Archivos.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret=nuevo.Id_RutaArchivoReclamo;
            }
            catch (Exception ex)
            {
               ret=-1;

            }
            return ret;
        }
        public string ActualizaArchivoReclamo(int idArchivo, int idReclamo, string Ruta, string nombreArch, string exten)
        {
            string ret = "-1";

            try
            {
                var t = from a in DBDESAINT.CVT_Reclamo_Archivos
                        where a.Id_RutaArchivoReclamo.Equals(idArchivo)
                        select a;
                foreach (var r in t)
                {

                    r.Id_Reclamo = idReclamo;
                    r.RutaArchivo = Ruta;
                    r.NombreArchivo = nombreArch;
                    r.Extencion = exten;
                    //r. = Responsable;
                    //r.TipoTrabajo = TipoTrabaj;
                    //r.FechaInicio = FeInicio;
                    //r.FechaTermino = FeTermino;
                    //r.Estado = Estado;
                    //r.Comentario = Comentarios;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDESAINT.SubmitChanges();
                }
                ret = "Creado";
            }
            catch (Exception ex)
            {
                ret = ex.Message;

            }
            return ret;
        }

        public string BuscaNombreArchivo(int idRuta)
        {
            string res = "";

            var tem = (from u in DBDESAINT.CVT_Reclamo_Archivos
                       where u.Id_RutaArchivoReclamo.Equals(idRuta)
                       select new { u.NombreArchivo }).First();
            if (tem != null)
            {
                res = tem.NombreArchivo;
            }
            return res;
        }

        public string BuscaRutaArchivo(int idRuta)
        {
            string res = "";
            try
            {
                var tem = (from u in DBDESAINT.CVT_Reclamo_Archivos
                           where u.Id_RutaArchivoReclamo.Equals(idRuta)
                           select new { u.RutaArchivo }).First();
                if (tem != null)
                {
                    res = tem.RutaArchivo;
                }
            }
            catch (Exception)
            {

                return res;
            }

            return res;
        }

        public List<Package> ObtieneInfoPallet(int nPallet)
        {
            List<Package> ret = new List<Package>();
            ret = (from r in DbWms.Package
                   where r.Package_SSCC.Equals(nPallet) && r.Package_Status != 7
                   select r).ToList<Package>();
            return ret;
        }
        public List<ArticleProvider> ObtieneInfoProducto(int ID)
        {
            List<ArticleProvider> ret = new List<ArticleProvider>();
            ret = (from r in DbWms.ArticleProvider
                   where r.ArticleProvider_Id.Equals(ID)
                   select r).ToList<ArticleProvider>();
            return ret;
        }

        public string insertaReclamoDetalleProd(CVT_Reclamo_DetalleProd nuevo)
        {
            string ret = "-1";
            try
            {
                DBDESAINT.CVT_Reclamo_DetalleProd.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = "Registrado";
            }
            catch (Exception ex)
            {
                ret = ex.Message;

            }
            return ret;
        }

        public List<VW_Resumen_Reclamo_Cab> ObtieneEncReclamo(int idReclamo)
        {
            List<VW_Resumen_Reclamo_Cab> ret = new List<VW_Resumen_Reclamo_Cab>();
            try
            {
                ret = (from vrp in DBDESAINT.VW_Resumen_Reclamo_Cab
                       where vrp.Id_Reclamo.Equals(idReclamo)
                       select vrp).ToList<VW_Resumen_Reclamo_Cab>();
            }
            catch
            {
            }
            return ret;
        }
        public List<VW_Resumen_Reclamo_Lotes> ObtieneEncReclamoLotes(int idReclamo, string codproducto)
        {
            List<VW_Resumen_Reclamo_Lotes> ret = new List<VW_Resumen_Reclamo_Lotes>();
            try
            {
                ret = (from vrp in DBDESAINT.VW_Resumen_Reclamo_Lotes
                       where vrp.Id_Reclamo.Equals(idReclamo) && vrp.CodProducto.Equals(codproducto)
                       select vrp).ToList<VW_Resumen_Reclamo_Lotes>();
            }
            catch
            {
            }
            return ret;
        }

        public int CreaExpedicionReclamo(int siteid, int orderid, int usuario)
        {
            int ret = 0;
            try
            {
                WMSClass wMS = new WMSClass();

                Expedition vnew = new Expedition();
                vnew.Company_Id = 1;
                vnew.Site_Id = siteid;
                vnew.Business_Partner_Id = "19";
                vnew.DocType_Id = 1;
                vnew.AccessControl_Id = 0;
                vnew.Order_Id = orderid;
                vnew.Staff_Id = usuario;
                vnew.Sector_Id = wMS.ObtieneSectorPF(siteid);
                vnew.WorkType_Id = 1;
                vnew.ClientDestiny_Id = 1;
                vnew.Expedition_DocNumber = orderid;
                vnew.Expedition_DateIn = DateTime.Now;
                vnew.Expedition_DateOut = DateTime.Now;
                vnew.Expedition_Note = "Generada por Sistema CVT - Reclamos";
                vnew.Expedition_GrossWeight = 0;
                vnew.Expedition_NetWeight = 0;
                vnew.Expedition_Tare = 0;
                vnew.Expedition_Status = 1;
                vnew.Expedition_Stamp = string.Empty;
                vnew.Expedition_seals1 = string.Empty;
                vnew.Expedition_seals2 = string.Empty;
                vnew.Expedition_seals3 = string.Empty;
                vnew.Expedition_NumContainer = string.Empty;
                vnew.Expedition_Type = 1;
                vnew.Expedition_SendState = 1;
                vnew.Expedition_Sync = 0;
                vnew.Expedition_U_TipoDocSAP = 13;          
                vnew.Expedition_U_Motivo = 01;
                DbWms.Expedition.InsertOnSubmit(vnew);
                DbWms.SubmitChanges();
                ret = vnew.Expedition_Id;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public List<CVT_Reclamo_DetalleProd> ObtieneDetalleReclamo(int idReclamo)
        {
            List<CVT_Reclamo_DetalleProd> ret = new List<CVT_Reclamo_DetalleProd>();
            try
            {
                ret = (from td in DBDESAINT.CVT_Reclamo_DetalleProd
                       where td.ID_Reclamo.Equals(idReclamo)
                       select td).ToList<CVT_Reclamo_DetalleProd>();
            }
            catch (Exception)
            {


            }
            return ret;
        }


    }
}
