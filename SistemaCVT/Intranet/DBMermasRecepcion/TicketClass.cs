using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class TicketClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        

        public TicketClass()
        {
        }   
          
        public void EliminaRuta(int idTicket)
        {

            var el = (from r in DBDESAINT.CVT_Tickets_ArchivoAdjunto
                      where r.Id_Ticket.Equals(idTicket)
                      select r).FirstOrDefault();

            if (el != null)
            {
                DBDESAINT.CVT_Tickets_ArchivoAdjunto.DeleteOnSubmit(el);
                DBDESAINT.SubmitChanges();

            }
        }

        public int compruebaTicket(int idTick)
        {
            int res = 0;
            try
            {
                var temp = (from u in DBDESAINT.CVT_Ticket
                            where u.Id_Ticket.Equals(idTick)
                            select new { u.Id_Usuario }).FirstOrDefault();
                if (temp !=null)
                {
                    res =Convert.ToInt32(temp.Id_Usuario);
                }
             
            }
            catch { }
            return res;       
        }


        public bool InsertaRegistroRutaArchivo(CVT_Tickets_ArchivoAdjunto nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_Tickets_ArchivoAdjunto.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }
        public bool InsertaRegistroRutaRespuesta(CVT_Ticket_AdjuntoRespuesta nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_Ticket_AdjuntoRespuesta.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }


        public string BuscaNombreArchivo(int idRuta)
        {
            string res = "";

            var tem = (from u in DBDESAINT.CVT_Tickets_ArchivoAdjunto
                       where u.Id_AdjuntoTicket.Equals(idRuta)
                       select new { u.Nombre }).First();
            if (tem != null)
            {
                res = tem.Nombre;
            }
            return res;
        }
        public string BuscaNombreArchivoRespuesta(int idRuta)
        {
            string res = "";

            var tem = (from u in DBDESAINT.CVT_Ticket_AdjuntoRespuesta
                       where u.Id_AdjTicketResp.Equals(idRuta)
                       select new { u.Nombre }).First();
            if (tem != null)
            {
                res = tem.Nombre;
            }
            return res;
        }
        public int BuscaIdArea(int idUser)
        {
            int res = 0;

            var tem = (from u in DBDESAINT.CVT_Usuarios
                       where u.IdUsuario.Equals(idUser)
                       select new { u.Id_Area }).First();
            if (tem != null)
            {
                res = tem.Id_Area;
            }
            return res;
        }


        public bool CreaTicket(int idTick, CVT_Ticket vCrea)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDESAINT.CVT_Ticket
                        where a.Id_Ticket.Equals(idTick)
                        select a;
                foreach (var r in t)
                {
                    r.id_CategoriaTicket = vCrea.id_CategoriaTicket;
                    r.id_TipoProblema = vCrea.id_TipoProblema;
                    r.Id_Usuario = vCrea.Id_Usuario;
                    r.Estado = vCrea.Estado;
                    r.Descripcion = vCrea.Descripcion;
                    r.Id_Area = vCrea.Id_Area;               

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


        public DataTable SP_ListarTickets(int perf, int user)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDESAINT.SP_ListarTickets(perf, user));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public List<CVT_Tickets_ArchivoAdjunto> ObtieneRutas(int idtick)
        {
            List<CVT_Tickets_ArchivoAdjunto> ret = new List<CVT_Tickets_ArchivoAdjunto>();
            try
            {
                ret = (from p in DBDESAINT.CVT_Tickets_ArchivoAdjunto
                       where p.Id_Ticket.Equals(idtick)
                       select p).ToList<CVT_Tickets_ArchivoAdjunto>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_Ticket_AdjuntoRespuesta> ObtieneRutasRespuesta(int idtick)
        {
            List<CVT_Ticket_AdjuntoRespuesta> ret = new List<CVT_Ticket_AdjuntoRespuesta>();
            try
            {
                ret = (from p in DBDESAINT.CVT_Ticket_AdjuntoRespuesta
                       where p.Id_RespTiquet.Equals(idtick)
                       select p).ToList<CVT_Ticket_AdjuntoRespuesta>();
            }
            catch
            {

            }
            return ret;
        }

        public int TraeCantidadRegistros()
        {
            int ret = 0;
            try
            {
                List<VW_MAXCANTIDADREGISTROSTICKET> dt = new List<VW_MAXCANTIDADREGISTROSTICKET>();
                dt = (from tr in DBDESAINT.VW_MAXCANTIDADREGISTROSTICKET
                      select tr).ToList<VW_MAXCANTIDADREGISTROSTICKET>();
                foreach (var n in dt)
                {
                    ret =Convert.ToInt32(n.ULTIMOTICKET);

                }
                return ret;
            }
            catch (Exception)
            {


            }        
            return ret;
        }

        public DataTable SP_TraeMails(int tick)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDESAINT.ObtieneMailsTickets(tick));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }
        public DataTable SP_TraeMailsRespuesta(int tick)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDESAINT.ObtieneMailsTickets_Respuesta(tick));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public bool ActualizaEstadoTicket(int IdTicket,int Estado, int EncTicket)
        {
            bool ret = false;
           
            try
            {
                var t = from a in DBDESAINT.CVT_Ticket
                        where a.Id_Ticket.Equals(IdTicket)
                        select a;
                foreach (var r in t)
                {

                    r.Estado =Estado;
                    r.Id_TomaTicket = EncTicket;
                    r.FechaTomaTicket = DateTime.Now;
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


        public bool ActualizaEstadoTicketInRespuesta(int IdTicket, int Estado,DateTime fter)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDESAINT.CVT_Ticket
                        where a.Id_Ticket.Equals(IdTicket)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.FechaTermino = fter;
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
        public bool ActualizaRespuestaTicket(int IdTicketResp,string Resp,int RCi)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDESAINT.CVT_Tickets_Respuesta
                        where a.Id_RespuestaTicket.Equals(IdTicketResp)
                        select a;
                foreach (var r in t)
                {

                    r.Respuesta = Resp;
                    r.RespuestaCierre = RCi;
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
        public DataTable SP_HistorialTicket(int idTick)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDESAINT.ObtieneHistorialTickets(idTick));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }


        public bool eliminaRespuestas(int IdTicket)
        {
            bool ret = false;
            try
            {

                DBDESAINT.CVT_Tickets_Respuesta.Where(x => x.Id_Ticket == IdTicket).ToList().ForEach(DBDESAINT.CVT_Tickets_Respuesta.DeleteOnSubmit);
                DBDESAINT.SubmitChanges();
                ret = true;           

            }
            catch (Exception)
            {


            }
            return ret;
        
        }
        public bool eliminaRespuestasNull(int IdTicketResp)
        {

            bool ret = false;
            try
            {

                //List<CVT_Tickets_Respuesta> dt = new List<CVT_Tickets_Respuesta>();
                var dt = (from tr in DBDESAINT.CVT_Tickets_Respuesta
                          where tr.Id_RespuestaTicket.Equals(IdTicketResp)
                          select tr);/*.ToList<CVT_Tickets_Respuesta>();*/
                foreach (var n in dt)
                {
                    //if (n.Id_Ticket == IdTicket)
                    //{
                    DBDESAINT.CVT_Tickets_Respuesta.DeleteOnSubmit(n);
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDESAINT.SubmitChanges();
                    //}
                    return true;
                }
                ret = true;

            }
            catch (Exception)
            {


            }
            return ret;

        }

        public bool eliminaTicket(int IdTicket)
        {
            bool ret = false;
            try
            {

                //List<CVT_Tickets_Respuesta> dt = new List<CVT_Tickets_Respuesta>();
                var dt = (from tr in DBDESAINT.CVT_Ticket
                          where tr.Id_Ticket.Equals(IdTicket)
                          select tr);/*.ToList<CVT_Tickets_Respuesta>();*/
                foreach (var n in dt)
                {
                    //if (n.Id_Ticket == IdTicket)
                    //{
                        DBDESAINT.CVT_Ticket.DeleteOnSubmit(n);
                        //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                        DBDESAINT.SubmitChanges();
                    //}
                    return true;
                }
                ret = true;

            }
            catch (Exception)
            {


            }
            return ret;

        }

        public bool eliminaTicket_archivoadjunto(int IdTicket)
        {
            bool ret = false;
            try
            {

               
                var dt = (from tr in DBDESAINT.CVT_Tickets_ArchivoAdjunto
                          where tr.Id_Ticket.Equals(IdTicket)
                          select tr);
                foreach (var n in dt)
                {
                   
                    DBDESAINT.CVT_Tickets_ArchivoAdjunto.DeleteOnSubmit(n);
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDESAINT.SubmitChanges();
                    //}
                    return true;
                }
                ret = true;

            }
            catch (Exception)
            {


            }
            return ret;

        }

        public string TraeRespTicketNull(int idTickResp)
        {
            string res = "0";

            var tem = (from u in DBDESAINT.CVT_Tickets_Respuesta
                       where u.Id_RespuestaTicket.Equals(idTickResp)
                       select new { u.Respuesta }).FirstOrDefault();
            if (tem != null)
            {
                res = tem.Respuesta;
            }
            return res;
        }

        public DataTable SP_Inf_Full(DateTime fIni,DateTime fter, int idAr)

        {
            DataTable ret = new DataTable();
            try
            {
                DBDESAINT.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDESAINT.SP_Detalle_ticket_full(fIni, fter, idAr));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_Inf_totalTick(DateTime fIni, DateTime fter, int idAr)

        {
            DataTable ret = new DataTable();
            try
            {
                DBDESAINT.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDESAINT.SP_Detalle_ticket_Total_Tick_Area(fIni, fter, idAr));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_Inf_PromedioTiempo(DateTime fIni, DateTime fter, int idAr)

        {
            DataTable ret = new DataTable();
            try
            {
                DBDESAINT.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDESAINT.SP_Detalle_ticket_PromedioTiempoRespuesta(fIni, fter, idAr));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int IdUsuarioTomaRespTick(int idTick)
        {
            int res = 0;
            try
            {
                var temp = (from u in DBDESAINT.CVT_Ticket
                            where u.Id_Ticket.Equals(idTick)
                            select new { u.Id_TomaTicket }).FirstOrDefault();
                if (temp != null)
                {
                    res = Convert.ToInt32(temp.Id_TomaTicket);
                }

            }
            catch { }
            return res;
        }
        public int IdUsuarioCreaTick(int idTick)
        {
            int res = 0;
            try
            {
                var temp = (from u in DBDESAINT.CVT_Ticket
                            where u.Id_Ticket.Equals(idTick)
                            select new { u.Id_Usuario }).FirstOrDefault();
                if (temp != null)
                {
                    res = Convert.ToInt32(temp.Id_Usuario);
                }

            }
            catch { }
            return res;
        }

    }
}
