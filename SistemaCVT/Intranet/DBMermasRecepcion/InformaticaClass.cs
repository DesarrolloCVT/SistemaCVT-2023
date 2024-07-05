using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
   public class InformaticaClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTControlBIODataContext Bio = new DBMLCVTControlBIODataContext();
        public InformaticaClass() { }

        public List<CVT_INF_LineasMoviles> ObtieneDatosLineas(int idUser)
        {
            List<CVT_INF_LineasMoviles> ret = new List<CVT_INF_LineasMoviles>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_LineasMoviles
                       where p.Asignado.Equals(idUser)
                       select p).ToList<CVT_INF_LineasMoviles>();
            }
            catch
            {

            }
            return ret;
        }

        public List<CVT_INF_RadioFrecuencia> ObtieneDatosRF(int idUser)
        {
            List<CVT_INF_RadioFrecuencia> ret = new List<CVT_INF_RadioFrecuencia>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_RadioFrecuencia
                       where p.Usuario.Equals(idUser)||p.UsuarioDos.Equals(idUser)
                       select p).ToList<CVT_INF_RadioFrecuencia>();
            }
            catch
            {

            }
            return ret;
        }

        
        public bool ActualizaEstadoServidor(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_Servidor> queryable = from t in this.DBDESAINT.CVT_INF_Servidor
                                                         where t.Cod_AF.Equals(CodActivo)
                                                        select t;
                foreach (CVT_INF_Servidor td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoComputador(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_Computador> queryable = from t in this.DBDESAINT.CVT_INF_Computador
                                                           where t.Cod_AF.Equals(CodActivo)
                                                         select t;
                foreach (CVT_INF_Computador td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoImpresora(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_Impresora> queryable = from t in this.DBDESAINT.CVT_INF_Impresora
                                                          where t.Cod_AF.Equals(CodActivo)
                                                           select t;
                foreach (CVT_INF_Impresora td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaEstadoRF(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_RadioFrecuencia> queryable = from t in this.DBDESAINT.CVT_INF_RadioFrecuencia
                                                                where t.Cod_AF.Equals(CodActivo)
                                                          select t;
                foreach (CVT_INF_RadioFrecuencia td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public bool ActualizaEstadoRed(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_EqRED> queryable = from t in this.DBDESAINT.CVT_INF_EqRED
                                                      where t.Cod_AF.Equals(CodActivo)
                                                                select t;
                foreach (CVT_INF_EqRED td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoWifi(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_EqWireless> queryable = from t in this.DBDESAINT.CVT_INF_EqWireless
                                                           where t.Cod_AF.Equals(CodActivo)
                                                      select t;
                foreach (CVT_INF_EqWireless td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoVideo(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_VideoVigilancia> queryable = from t in this.DBDESAINT.CVT_INF_VideoVigilancia
                                                                where t.Codificacion.Equals(CodActivo)
                                                           select t;
                foreach (CVT_INF_VideoVigilancia td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoOtros(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_OtroEq> queryable = from t in this.DBDESAINT.CVT_INF_OtroEq
                                                       where t.Cod_AF.Equals(CodActivo)
                                                                select t;
                foreach (CVT_INF_OtroEq td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoUps(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_EqRespaldoEnergia> queryable = from t in this.DBDESAINT.CVT_INF_EqRespaldoEnergia
                                                                  where t.Cod_AF.Equals(CodActivo)
                                                       select t;
                foreach (CVT_INF_EqRespaldoEnergia td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoTF(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_Telefonia_Fija> queryable = from t in this.DBDESAINT.CVT_INF_Telefonia_Fija
                                                               where t.Cod_AF.Equals(CodActivo)
                                                                  select t;
                foreach (CVT_INF_Telefonia_Fija td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoEM(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_EquiposMoviles> queryable = from t in this.DBDESAINT.CVT_INF_EquiposMoviles
                                                               where t.Cod_AF.Equals(CodActivo)
                                                               select t;
                foreach (CVT_INF_EquiposMoviles td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        public bool ActualizaEstadoMonitor(string CodActivo)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_INF_Monitores> queryable = from t in this.DBDESAINT.CVT_INF_Monitores
                                                          where t.CodActivo.Equals(CodActivo)
                                                               select t;
                foreach (CVT_INF_Monitores td in queryable)
                {

                    td.Estado = 2;
                }
                this.DBDESAINT.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        public string BuscaNombreArea(int idArea)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_AreaTrabajo
                            where u.Id_Area.Equals(idArea)
                            select new { u.Nombre }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Nombre);
                }
            }
            catch { }
            return ret;
        }

        public string TraeNombreUsuario(string idUsuario)
        {
            string ret = "";
            try
            {
                var temp = (from u in Bio.pers_person
                            where u.pin.Equals(idUsuario)
                            select new { u.name,u.last_name }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.name+' '+temp.last_name);
                }
            }
            catch { }
            return ret;
        }

        public string BuscaNombreDispositivo(int idispo)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_TipoDispositivo
                            where u.Id_tipoDispositivo.Equals(idispo)
                            select new { u.Nombre }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Nombre);
                }
            }
            catch { }
            return ret;
        }

        public int VerificaUserinRF(int iduser)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_RadioFrecuencia
                            where u.Usuario.Equals(iduser)||u.UsuarioDos.Equals(iduser)
                            select new { u.ID }).First();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.ID);
                }
            }
            catch { }
            return ret;
        }

        public int VerificaUserinLineasMov(int iduser)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_LineasMoviles
                            where u.Asignado.Equals(iduser)
                            select new { u.NLinea }).First();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.NLinea);
                }
            }
            catch { }
            return ret;
        }


        public bool AgregaFormulario(CVT_INF_FORM_EntregaCelulares nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_INF_FORM_EntregaCelulares.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }

        public int VerificaFormulario(int iduser,string dispo)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_FORM_EntregaCelulares
                            where u.idUsuarioAsignado.Equals(iduser)&& u.TipoDispo.Equals(dispo)
                            select new { u.ID_FormEntregaCelulares }).First();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.ID_FormEntregaCelulares);
                }
            }
            catch { }
            return ret;
        }

        public List<CVT_VW_INF_Mantencion_DatosEquipo> ObtieneDatosEquipos(string Codaf)
        {
            List<CVT_VW_INF_Mantencion_DatosEquipo> ret = new List<CVT_VW_INF_Mantencion_DatosEquipo>();
            try
            {
                ret = (from p in DBDESAINT.CVT_VW_INF_Mantencion_DatosEquipo
                       where p.Cod_AF.Equals(Codaf)
                       select p).ToList<CVT_VW_INF_Mantencion_DatosEquipo>();
            }
            catch
            {

            }
            return ret;
        }
        public string TraeCodAF(int idReg)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_Mantencion_Encabezado
                            where u.ID_MantInfEnc.Equals(idReg)
                            select new { u.CodActivo }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.CodActivo);
                }
            }
            catch { }
            return ret;
        }

        public string TraeCodAFServidor(int idServ)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_Servidor
                            where u.ID.Equals(idServ)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }
        public string TraeCodAFComputador(int idComputador)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_Computador
                            where u.ID.Equals(idComputador)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }

        public string TraeCodAFImpresora(int idimpresora)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_Impresora
                            where u.ID.Equals(idimpresora)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }

        public string TraeCodAFRadioF(int idRF)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_RadioFrecuencia
                            where u.ID.Equals(idRF)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }

        public string TraeCodAFOtrosEquipos(int idOtros)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_OtroEq
                            where u.ID.Equals(idOtros)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }

        public string TraeCodAFUps(int idResp)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_EqRespaldoEnergia
                            where u.ID.Equals(idResp)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }

        public string TraeCodAFTF(int idResp)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_Telefonia_Fija
                            where u.ID_TFija.Equals(idResp)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }
        public string TraeCodAFRed(int idRed)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_EqRED
                            where u.ID.Equals(idRed)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }
        public string TraeCodAFWifi(int idWifi)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_EqWireless
                            where u.ID.Equals(idWifi)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }
        public string TraeCodAFVideoV(int idVideo)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_VideoVigilancia
                            where u.ID.Equals(idVideo)
                            select new { u.Codificacion }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Codificacion);
                }
            }
            catch { }
            return ret;
        }
        public string TraeCodAFEqMovil(int idMovil)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_EquiposMoviles
                            where u.Id_EquiposMoviles.Equals(idMovil)
                            select new { u.Cod_AF }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Cod_AF);
                }
            }
            catch { }
            return ret;
        }
        public string TraeCodAFMonitor(int idMonitor)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_Monitores
                            where u.Id_invMonitores.Equals(idMonitor)
                            select new { u.CodActivo }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.CodActivo);
                }
            }
            catch { }
            return ret;
        }

        public bool InsertaNuevoAdjunto(CVT_INF_AdjuntosInventarioEquipos nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_INF_AdjuntosInventarioEquipos.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }

        public bool InsertaNuevaBajada(CVT_INF_Bajada_Equipos nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_INF_Bajada_Equipos.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }

        public List<CVT_INF_Servidor> DatosServidores(string CodActivo)
        {
            List<CVT_INF_Servidor> ret = new List<CVT_INF_Servidor>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_Servidor
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_Servidor>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_INF_Computador> DatosComputadores(string CodActivo)
        {
            List<CVT_INF_Computador> ret = new List<CVT_INF_Computador>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_Computador
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_Computador>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_INF_Impresora> DatosImpresoras(string CodActivo)
        {
            List<CVT_INF_Impresora> ret = new List<CVT_INF_Impresora>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_Impresora
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_Impresora>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_INF_RadioFrecuencia> DatosRF(string CodActivo)
        {
            List<CVT_INF_RadioFrecuencia> ret = new List<CVT_INF_RadioFrecuencia>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_RadioFrecuencia
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_RadioFrecuencia>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_INF_EqRED> DatosRed(string CodActivo)
        {
            List<CVT_INF_EqRED> ret = new List<CVT_INF_EqRED>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_EqRED
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_EqRED>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_INF_EqWireless> DatosWifi(string CodActivo)
        {
            List<CVT_INF_EqWireless> ret = new List<CVT_INF_EqWireless>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_EqWireless
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_EqWireless>();
            }
            catch
            {

            }
            return ret;
        }

        public List<CVT_INF_VideoVigilancia> DatosVideo(string CodActivo)
        {
            List<CVT_INF_VideoVigilancia> ret = new List<CVT_INF_VideoVigilancia>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_VideoVigilancia
                       where p.Codificacion.Equals(CodActivo)
                       select p).ToList<CVT_INF_VideoVigilancia>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_INF_OtroEq> DatosOtros(string CodActivo)
        {
            List<CVT_INF_OtroEq> ret = new List<CVT_INF_OtroEq>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_OtroEq
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_OtroEq>();
            }
            catch
            {

            }
            return ret;
        }

        public List<CVT_INF_EqRespaldoEnergia> DatosUps(string CodActivo)
        {
            List<CVT_INF_EqRespaldoEnergia> ret = new List<CVT_INF_EqRespaldoEnergia>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_EqRespaldoEnergia
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_EqRespaldoEnergia>();
            }
            catch
            {

            }
            return ret;
        }

        public List<CVT_INF_Telefonia_Fija> DatosTF(string CodActivo)
        {
            List<CVT_INF_Telefonia_Fija> ret = new List<CVT_INF_Telefonia_Fija>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_Telefonia_Fija
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_Telefonia_Fija>();
            }
            catch
            {

            }
            return ret;
        }
        public List<CVT_INF_EquiposMoviles> DatosEM(string CodActivo)
        {
            List<CVT_INF_EquiposMoviles> ret = new List<CVT_INF_EquiposMoviles>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_EquiposMoviles
                       where p.Cod_AF.Equals(CodActivo)
                       select p).ToList<CVT_INF_EquiposMoviles>();
            }
            catch
            {

            }
            return ret;
        }

        public List<CVT_INF_Monitores> DatosMonitor(string CodActivo)
        {
            List<CVT_INF_Monitores> ret = new List<CVT_INF_Monitores>();
            try
            {
                ret = (from p in DBDESAINT.CVT_INF_Monitores
                       where p.CodActivo.Equals(CodActivo)
                       select p).ToList<CVT_INF_Monitores>();
            }
            catch
            {

            }
            return ret;
        }



        public string validaCodActivoBajda(string CodActivo)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_Bajada_Equipos
                            where u.CodActivo.Equals(CodActivo)
                            select new { u.CodActivo }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.CodActivo);
                }
            }
            catch { }
            return ret;
        }

        public string TraeMarca(int IdMarca)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_INF_MARCA
                            where u.ID.Equals(IdMarca)
                            select new { u.MARCA }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.MARCA);
                }
            }
            catch { }
            return ret;
        }


    }
}
