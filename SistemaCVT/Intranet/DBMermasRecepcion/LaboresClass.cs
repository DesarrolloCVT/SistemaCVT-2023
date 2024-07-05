using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class LaboresClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
        public LaboresClass()
        {

        }

        public int CreaEncabezadoLabor(DateTime fecha, int turno, string Usuario)
        {
            int ret = 0;
            try
            {
                CVT_LaboresTurno dt = new CVT_LaboresTurno();
                dt.Turno = turno;
                dt.Fecha = fecha;
                dt.UsuarioRegistro = Usuario;
                dt.FechaRegistro = DateTime.Now;
                DBDESAINT.CVT_LaboresTurno.InsertOnSubmit(dt);
                DBDESAINT.SubmitChanges();
                ret = dt.ID_LaborTurno;
            }
            catch(Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }
        public int CreaLabor(CVT_LaboresTurnoDetalle dt)
        {
            int ret = 0;
            try
            {
                DBDESAINT.CVT_LaboresTurnoDetalle.InsertOnSubmit(dt);
                DBDESAINT.SubmitChanges();
            }
            catch
            {

            }
            return ret;
        }

        public int AgregaRecepcion(int LaborId, int Nrecep, string Ubicacion, string Obs)

        {
            int ret = 0;
            int OC = 0;
            int Guia = 0;
            string Productos = string.Empty;
            
            try
            {
                var Prod = from dtProd in DBWMS.CVT_VW_ReceptionReported
                           where dtProd.Reception_Id.Equals(Nrecep)
                           select dtProd;
                foreach (var p in Prod)
                {
                    Productos = Productos + "- " + p.ArticleProvider_CodClient + ";" + p.ArticleProvider_Description;
                }


                    var temp = (from r in DBWMS.Reception
                            where r.Reception_Id.Equals(Nrecep)
                            select new { r.Reception_U_NumDocSAP, r.Reception_DocNumber }).FirstOrDefault();
                if(temp!=null)
                {
                    OC = Convert.ToInt32(temp.Reception_U_NumDocSAP);
                    Guia = Convert.ToInt32(temp.Reception_DocNumber);
                }
                CVT_LaboresTurnoRecepciones dt = new CVT_LaboresTurnoRecepciones();
                dt.NRecepcion = Nrecep;
                dt.ID_LaborTurno = LaborId;
                dt.OC = OC;
                dt.Guia = Guia;
                dt.Ubicacion = Ubicacion;
                dt.Observaciones = Obs;
                dt.Productos = Productos;
                DBDESAINT.CVT_LaboresTurnoRecepciones.InsertOnSubmit(dt);
                DBDESAINT.SubmitChanges();


            }
            catch
            { }
            return ret;
        }


        public int CreaDetalleLabor(int ID, int? labVarP, int? labVarC, int? gruerosP, int? gruerosC, int? apoPickP, int? apoPickC, int? otrosP, int? otrosC, string observDotacion,
                                    int? inasP, int? inasC, int? atraP, int? atraC,int? cmnsTurnoAnt, int? cmnsLlegTurno, int? cmnsDesc, int? cmnsPend,
                                    int? pedBaj, int? pedPrepAP, int? pedPrepPick, int? pedPrepOtros, int? cmnsCargP, int? cmnsCargExt, string ObsPedido, string ObsCargaCam)
        {
            int ret = 0;
            try
            {
                var iq = from dt in DBDESAINT.CVT_LaboresTurno
                          where dt.ID_LaborTurno.Equals(ID)
                          select dt;
                foreach (var dt in iq)
                {

                    dt.LaboresVariasP = labVarP;
                    dt.LaboresVariasC = labVarC;
                    dt.GruerosP = gruerosP;
                    dt.GruerosC = gruerosC;
                    dt.ApoyoPickingP = apoPickP;
                    dt.ApoyoPickingC = apoPickC;
                    dt.OtrosP = otrosP;
                    dt.OtrosC = otrosC;
                    dt.ObservacionDotacion = observDotacion;
                    dt.InasistenciasP = inasP;
                    dt.InasistenciasC = inasC;
                    dt.AtrasosRetiroC = atraC;
                    dt.AtrasosRetiroP = atraP;
                    dt.CamionesTurnoAnterior = cmnsTurnoAnt;
                    dt.CamionesLlegadosTurno = cmnsLlegTurno;
                    dt.CamionesDescargados = cmnsDesc;
                    dt.CamionesPendientes = cmnsPend;
                    dt.BajadaPedidos = pedBaj;
                    dt.PedidosPreparadosAP = pedPrepAP;
                    dt.PedidosPreparadosPicking = pedPrepPick;
                    dt.PedidosPreparadosOtros = pedPrepOtros;
                    dt.CamionesCargadosPl = cmnsCargP;
                    dt.CamionesCargadosExt = cmnsCargExt;
                    dt.ObservacionPedidos = ObsPedido;
                    dt.ObservacionCargaCamiones = ObsCargaCam;
                }
                DBDESAINT.SubmitChanges();

             }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
                ret = -1;
            }
            return ret;
        }
        public List<CVT_LaboresTurno> BuscaFolioLabor(int turno,DateTime Fecha)
        {
            List<CVT_LaboresTurno> ret = new List<CVT_LaboresTurno>();
            try
            {
                ret = (from LT in DBDESAINT.CVT_LaboresTurno
                       where LT.Fecha.Equals(Fecha) && LT.Turno.Equals(turno)
                       select LT).ToList<CVT_LaboresTurno>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
                
            }
            return ret;
        }
        public int insertaLaborArchivo(CVT_LaboresArchivos nuevo)
        {
            int ret = 0;
            try
            {
                DBDESAINT.CVT_LaboresArchivos.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = nuevo.Id_RutaArchivoLabores;
            }
            catch (Exception)
            {
                ret = -1;

            }
            return ret;
        }
        public string ActualizaArchivoLabores(int idArchivo, int idLabor, string Ruta, string nombreArch, string exten)
        {
            string ret = "-1";

            try
            {
                var t = from a in DBDESAINT.CVT_LaboresArchivos
                        where a.Id_RutaArchivoLabores.Equals(idArchivo)
                        select a;
                foreach (var r in t)
                {

                    r.ID_LaborTurno = idLabor;
                    r.RutaArchivo = Ruta;
                    r.NombreArchivo = nombreArch;
                    r.Extension = exten;
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

            var tem = (from u in DBDESAINT.CVT_LaboresArchivos
                       where u.Id_RutaArchivoLabores.Equals(idRuta)
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
                var tem = (from u in DBDESAINT.CVT_LaboresArchivos
                           where u.Id_RutaArchivoLabores.Equals(idRuta)
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

    }
}
