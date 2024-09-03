using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;

namespace DBMermasRecepcion
{
    public class ControlAccesoClass
    {
        public ControlAccesoClass()
        {
        }
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        public int agregacontrolacceso(int motivo, bool propio, string runchofer, string nombre, string patente, string rampla, string comentario, DateTime fechaentrega)
        {
            int ret = 0;
            try
            {
                bool devolucion=false;
                if (motivo == 3)
                {
                    devolucion = true;
                    motivo = 1;
                }
                int choferid = BuscaChoferWMS(runchofer);
                if (choferid == 0)
                    choferid = CreaChoferWMS(runchofer, nombre);
                int camionid = BuscaCamionWMS(patente);
                if (camionid == 0)
                    camionid = CreaCamionWMS(patente);
                CVT_ControlAcceso nuevo = new CVT_ControlAcceso();
                nuevo.Motivo = motivo;
                nuevo.Propio = propio;
                nuevo.Chofer = runchofer.ToUpper() + " - " + nombre.ToUpper();
                nuevo.Id_Chofer = choferid;
                nuevo.Patente = patente;
                nuevo.Id_Camion = camionid;
                nuevo.Patente_Rampla = rampla;
                nuevo.Devolucion = devolucion;
                if (propio == true)
                {
                    nuevo.FechaSalida = DateTime.Now;
                    nuevo.FechaEntrega = fechaentrega;
                }
                else
                {
                    nuevo.FechaIngreso = DateTime.Now;
                }
                nuevo.Estado = 1;
                nuevo.Comentario = comentario;
                DBDesaint.CVT_ControlAcceso.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = nuevo.AccesoCamion_Id;
                 
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public int agregacontrolaccesoWMS(int motivo, int usuario, int camionid, int choferid )
        {
            int ret = 0;
            try
            {
                AccessControl nuevo = new AccessControl();
                nuevo.Company_Id = 1;
                nuevo.Site_Id = 1;
                nuevo.InputType_Id=motivo;
                nuevo.Staff_Id=usuario;
                nuevo.Trucker_Id=choferid;
                nuevo.Trucks_Id=camionid;
                nuevo.AccessControl_DateIn=DateTime.Now;
                nuevo.AccessControl_Documents="1";
                nuevo.AccessControl_Notes="Generado en forma automatica por Sistema CVT";
                nuevo.Lodge_IdIn=1;

            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public bool agregapeoneta(int controlid, string run, string nombre, string comentario)
        {
            bool ret = false;
            try
            {
                CVT_PeonetaControlAcceso nuevo = new CVT_PeonetaControlAcceso();
                nuevo.ControlAcceso_Id = controlid;
                nuevo.Nombre = nombre.ToUpper();
                nuevo.Observacion = comentario;
                nuevo.RUN = run;
                DBDesaint.CVT_PeonetaControlAcceso.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {

                
            }
            return ret;
        }
        public int BuscaCamionWMS(string Patente)
        {
            int ret = 0;
            try
            {
                var temp = (from c in DBWMS.Trucks
                            where c.Trucks_Plate.Equals(Patente)
                            select new { c.Trucks_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Trucks_Id);
                }
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public int BuscaChoferWMS(string run)
        {
            int ret = 0;
            try
            {
                var temp = (from c in DBWMS.Trucker
                            where c.Trucker_CId.Equals(run)
                            select new { c.Trucker_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Trucker_Id);
                }
            }
            catch (Exception)
            {

                
            }
            return ret;
        }
        public int CreaChoferWMS(string run, string Nombre)
        {
            int ret = 0;
            try
            {
                Trucker nuevo = new Trucker();
                nuevo.Trucker_CId = run;
                nuevo.Trucker_Name = Nombre.ToUpper();
                nuevo.Trucker_License_Expires = DateTime.Now.AddYears(10);
                nuevo.Trucker_Status = 1;
                nuevo.Country_Id = 41;
                DBWMS.Trucker.InsertOnSubmit(nuevo);
                DBWMS.SubmitChanges();
                ret = nuevo.Trucker_Id;
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public int CreaCamionWMS(string patente)
        {
            int ret = 0;
            try
            {
                Trucks nuevo = new Trucks();
                nuevo.Trucks_Brand = "Generico";
                nuevo.Trucks_Plate = patente.ToUpper();
                nuevo.Trucks_Year = DateTime.Now.Year;
                nuevo.Trucks_Axis_Number = 6;
                nuevo.Trucks_Capacity_Ton = 45000;
                nuevo.Trucks_Tare = 40000;
                nuevo.Trucks_Status = 1;
                nuevo.Trucks_Note = "Creado Automaticamente Sistema CVT";
                nuevo.Country_Id = 41;
                DBWMS.Trucks.InsertOnSubmit(nuevo);
                DBWMS.SubmitChanges();
                ret = nuevo.Trucks_Id;
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public int ObtieneEstadoControlAcceso(int control)
        {
            int ret = 0;
            try
            {
                var temp = (from c in DBDesaint.CVT_ControlAcceso
                            where c.AccesoCamion_Id.Equals(control)
                            select new { c.Estado }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Estado);
            }
            catch (Exception)
            {

                
            }
            return ret;
        }
        public bool CierreControlAcceso(int control)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_ControlAcceso> queryable = from t in this.DBDesaint.CVT_ControlAcceso
                                                 where t.AccesoCamion_Id.Equals(control)
                                                 select t;
                foreach (CVT_ControlAcceso tr in queryable)
                {
                    
                    if (tr.Propio == true)
                    {
                        tr.FechaIngreso = DateTime.Now;
                    }
                    else
                    {
                        tr.FechaSalida = DateTime.Now;
                    }
                }
                this.DBDesaint.SubmitChanges();
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public byte[] ObtieneImagen(int doc)
        {
            byte[] ret = new byte[1000];
            DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
            var queryable = from c in DBDesaint.CVT_DocControlAcceso
                            where c.DocControlAcceso_Id.Equals(doc)
                            select new {c.Documento };
            foreach (var type in queryable)
            {
                System.Array.Resize<byte>(ref ret, type.Documento.Length);
                ret = type.Documento.ToArray();
            }
            return ret;

        }
        public bool IngresaHoraExtra(CVT_HorasExtras nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_HorasExtras.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }
        public bool IngresaHoraSalidaVisita(int ID)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_ControlAcceso_Visita> queryable = from t in this.DBDesaint.CVT_ControlAcceso_Visita
                                                                 where t.Visita_Id.Equals(ID)
                                                          select t;
                foreach (CVT_ControlAcceso_Visita tr in queryable)
                {

                   tr.FechaSalida=DateTime.Now;
                    ret = true;
                }
                this.DBDesaint.SubmitChanges();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool IngresaHoraSalidaProvNac(int ID)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_CA_ProveedoresNacionales> queryable = from t in this.DBDesaint.CVT_CA_ProveedoresNacionales
                                                                 where t.CA_PN_ID.Equals(ID)
                                                                 select t;
                foreach (CVT_CA_ProveedoresNacionales tr in queryable)
                {

                    tr.FechaSalida = DateTime.Now;
                    ret = true;

                }
                this.DBDesaint.SubmitChanges();
            }
            catch (Exception)
            {


            }
            return ret;
        }


    }
}
