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
        public bool InsertaRegistroRonda(Dictionary<string, string> CheckListDatos)
        {
            bool ret = false;
            try
            {
                CVT_CheckList_Grua vNuevo = new CVT_CheckList_Grua
                {
                    Numero_Grua = CheckListDatos["NumeroGrua"],
                    Area_Trabajo = CheckListDatos["AreaTrabajo"],
                    Tipo_Maquina = CheckListDatos["TipoMaquinaria"],
                    Turno = CheckListDatos["Turno"],
                    Horometro = CheckListDatos["Horometro"],
                    Fecha = DateTime.Parse(CheckListDatos["Fecha"]),
                    Estado_Luces = CheckListDatos["Luces"],
                    Estado_Motor = CheckListDatos["Motor"],
                    Fuga_Agua_Aceite = CheckListDatos["Fugas"],
                    Estado_Direccion = CheckListDatos["Direccion"],
                    Estado_Transmision = CheckListDatos["Transmision"],
                    Escalera_Acceso_Pasamanos = CheckListDatos["Escalera"],
                    Estado_Bocina = CheckListDatos["Bocina"],
                    Alarma_Retroceso = CheckListDatos["Alarma"],
                    Espejo_Retrovisor = CheckListDatos["Espejos"],
                    Estado_Tablero_Datos = CheckListDatos["Tablero"],
                    Estado_Extintor = CheckListDatos["Extintor"],
                    Estado_Bateria = CheckListDatos["Bateria"],
                    Estado_Asiento = CheckListDatos["Asiento"],
                    Cinturon_Seguridad = CheckListDatos["Cinturon"],
                    Baliza_Pertiga = CheckListDatos["Baliza"],
                    Estado_Neumaticos = CheckListDatos["Neumaticos"],
                    Llantas_Tuercas = CheckListDatos["Llantas"],
                    Cadenas_Torre = CheckListDatos["Cadenas"],
                    Unas_Horquilla = CheckListDatos["Unashorquilla"],
                    Soporte_Cilindro = CheckListDatos["Soportecilindro"],
                    Flexible_Polea_Rodamiento = CheckListDatos["Flexible"],
                    Seguro_Una_Horquilla = CheckListDatos["Segurohorquilla"],
                    Punto_Bloqueo = CheckListDatos["puntodebloqueo"],
                    Observaciones = CheckListDatos["Observaciones"]
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