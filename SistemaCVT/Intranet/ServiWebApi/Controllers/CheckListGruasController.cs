using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common.CommandTrees;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    [RoutePrefix("api/CheckListGruas")]
    public class CheckListGruasController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();

        [HttpGet]
        [Route("TiposMaquinaria")]
        public List<string> ObtieneTiposMaquinaria()
        {
            List<string> ret = new List<string>();
            try
            {
                ret = (
                    from l in dbDsa.CVT_Gruas
                    select l.Tipo).Distinct().ToList<string>();
            }
            catch (Exception)
            {

            }
            return ret;
        }

        [HttpGet]
        [Route("NumeroGrua")]
        public List<string> ObtieneNumeroGrua()
        {
            List<string> ret = new List<string>();
            try
            {
                ret = (
                    from l in dbDsa.CVT_Gruas
                    select l.Grua_Numero).Distinct().ToList<string>();
            }
            catch (Exception)
            {

            }
            return ret;
        }
        [HttpGet]
        [Route("InsertaCheckListGrua")]
        public bool InsertaCheckListGrua(string Usuario_Responsable, string Numero_Grua, string Area_Trabajo, string Tipo_Maquina, string Turno, string Horometro, 
            DateTime Fecha, string Estado_Luces, string Estado_Motor, string Fuga_Agua_Aceite, string Estado_Direccion, string Estado_Transmision, 
            string Escalera_Acceso_Pasamanos, string Estado_Bocina, string Alarma_Retroceso, string Espejo_Retrovisor, string Estado_Tablero_Datos, 
            string Estado_Extintor, string Estado_Bateria, string Estado_Asiento, string Cinturon_Seguridad, string Baliza_Pertiga, 
            string Estado_Neumaticos, string Llantas_Tuercas, string Cadenas_Torre, string Unas_Horquilla, string Soporte_Cilindro, 
            string Flexible_Polea_Rodamiento, string Seguro_Una_Horquilla, string Punto_Bloqueo, string Observaciones)
        {
            bool ret = false;
            try
            {
                CVT_CheckList_Grua vNuevo = new CVT_CheckList_Grua
                {
                    Usuario_Responsable = Usuario_Responsable,
                    Numero_Grua = Numero_Grua,
                    Area_Trabajo = Area_Trabajo,
                    Tipo_Maquina = Tipo_Maquina,
                    Turno = Turno,
                    Horometro = Horometro,
                    Fecha = Fecha,
                    Estado_Luces = Estado_Luces,
                    Estado_Motor = Estado_Motor,
                    Fuga_Agua_Aceite = Fuga_Agua_Aceite,
                    Estado_Direccion = Estado_Direccion,
                    Estado_Transmision = Estado_Transmision,
                    Escalera_Acceso_Pasamanos = Escalera_Acceso_Pasamanos,
                    Estado_Bocina = Estado_Bocina,
                    Alarma_Retroceso = Alarma_Retroceso,
                    Espejo_Retrovisor = Espejo_Retrovisor,
                    Estado_Tablero_Datos = Estado_Tablero_Datos,
                    Estado_Extintor = Estado_Extintor,
                    Estado_Bateria = Estado_Bateria,
                    Estado_Asiento = Estado_Asiento,
                    Cinturon_Seguridad = Cinturon_Seguridad,
                    Baliza_Pertiga = Baliza_Pertiga,
                    Estado_Neumaticos = Estado_Neumaticos,
                    Llantas_Tuercas = Llantas_Tuercas,
                    Cadenas_Torre = Cadenas_Torre,
                    Unas_Horquilla = Unas_Horquilla,
                    Soporte_Cilindro = Soporte_Cilindro,
                    Flexible_Polea_Rodamiento = Flexible_Polea_Rodamiento,
                    Seguro_Una_Horquilla = Seguro_Una_Horquilla,
                    Punto_Bloqueo = Punto_Bloqueo,
                    Observaciones = Observaciones
                };
                dbDsa.CVT_CheckList_Grua.InsertOnSubmit(vNuevo);
                dbDsa.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {
                ret = false;
            }
            return ret;
        }
    }
}