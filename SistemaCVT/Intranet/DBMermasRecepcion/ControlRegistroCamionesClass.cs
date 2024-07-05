using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class ControlRegistroCamionesClass
    {
        public DBMLCVTDESAINTDataContext DesaInt = new DBMLCVTDESAINTDataContext();
        
        public int BuscaCamion(string Patente)
        {
            int ret = 0;
            try
            {
                var temp = (from c in DesaInt.CVT_ControlAccesoCamion
                            where c.Patente.Equals(Patente)
                            select new { c.Patente }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Patente);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public int BuscaChofer(string RUN)
        {
            int ret = 0;
            try
            {
                var temp = (from c in DesaInt.CVT_ControlAccesoChofer
                            where c.RUN.Equals(RUN)
                            select new { c.RUN }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.RUN);
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int CreaCamion (string Patente, string PatenteRampla, int permisoCirculacion, int revisionTecnica, string observaciones)
        {
            int ret = 0;
            try
            {
                CVT_AccesoCamion ACamion = new CVT_AccesoCamion();
                ACamion.Patente = Patente.ToUpper();
                ACamion.Patente_Rampla = PatenteRampla.ToUpper();
                ACamion.Permiso_circulacion = permisoCirculacion;
                ACamion.Revision_Tecnica = revisionTecnica;
                ACamion.Observaciones = observaciones;
                DesaInt.CVT_AccesoCamion.InsertOnSubmit(ACamion);
                DesaInt.SubmitChanges();
                ret = Convert.ToInt32(ACamion.Id_Camion);
            }
            catch(Exception)
            {

            }
            return ret;
        }

        public int CreaChofer (string RUN, string nombre, string apellidos, DateTime fechaNacim, int licenciaConducir)
        {
            int ret = 0;
            try
            {
                CVT_ControlAccesoChofer AChofer = new CVT_ControlAccesoChofer();
                AChofer.RUN = RUN;
                AChofer.Nombre = nombre;
                AChofer.Apellidos = apellidos;
                AChofer.Fecha_Nacimiento = fechaNacim;
                AChofer.LicConducir = licenciaConducir;
                DesaInt.CVT_ControlAccesoChofer.InsertOnSubmit(AChofer);
                DesaInt.SubmitChanges();
                ret = Convert.ToInt32(AChofer.Id_Chofer);
            }
            catch(Exception)
            {

            }
            return ret;
        }

        public int AgregaRegistro (int Id_RegistroCamion, DateTime fechaIngreso, DateTime fechaSalida, string patente, int motivo, int referencia, int tipoDocumento, int numDocumento, 
                                 int tipoTransporte, DateTime revisionTecnica, int permisoCirculacion, string patenteRampla, string observaciones)
        {
            int ret = 0;
            try
            {
                CVT_ControlAccesoCamion AAcceso = new CVT_ControlAccesoCamion();
                AAcceso.Id_registro = Id_RegistroCamion;
                AAcceso.Fecha_Ingreso = fechaIngreso;
                AAcceso.Fecha_Salida = fechaSalida;
                AAcceso.Patente = patente;

                if (Convert.ToInt32(patente) != 0)
                {
                    CreaCamion(patente, patenteRampla, permisoCirculacion, Convert.ToInt32(revisionTecnica), observaciones);
                }

                AAcceso.Motivo = motivo;
                AAcceso.Referencia = Convert.ToString(referencia);
                AAcceso.Tipo_Documento = tipoDocumento;
                AAcceso.Num_Documento = numDocumento;
                AAcceso.Tipo_Transporte = tipoTransporte;
                AAcceso.Fecha_RevisionTecnica = revisionTecnica;
                AAcceso.Permiso_Circulacion = permisoCirculacion;
                AAcceso.Patente_Rampla = patenteRampla;
                AAcceso.Observaciones = observaciones;
                DesaInt.CVT_ControlAccesoCamion.InsertOnSubmit(AAcceso);
                DesaInt.SubmitChanges();
                
                ret = AAcceso.Id_registro;
            }
            catch (Exception)
            {

            }
            return ret;
        }

       

        }
}
