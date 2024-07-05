using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class OrdenDeVentaSMMController : ApiController
    {

        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public int ValidaFolioOrden(int FolOrden)
        {
            int ret = 0;
            try
            {
                var temp = (from l in wmsM.SMM_Orden_de_Ventas
                            where l.IdOrdenVentas.Equals(FolOrden)
                            select new { l.IdOrdenVentas }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.IdOrdenVentas);
                }
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public string ValidaRutCliente(string Rutcli)
        {
            string ret = "-1";
            try
            {
                var temp = (from l in wmsM.SMM_Clientes_Orden_Venta
                            where l.RutCliente.Equals(Rutcli)
                            select new { l.RutCliente }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.RutCliente;
                }
            }
            catch
            {
            }
            return ret;
        }


        [HttpGet]

        public bool Creacliente(string rutClien,string nomCliente, string Razon,string Giro,string dirFac,string dirDes,string Tel,string mail,string lati,string longitud,string alt)
        {
            bool ret = false;           

            try
            {
                SMM_Clientes_Orden_Venta vDi = new SMM_Clientes_Orden_Venta();

                vDi.RutCliente = rutClien;
                vDi.NombreCliente = nomCliente;
                vDi.RazonSocial = Razon;
                vDi.Giro =Giro;
                vDi.DirecFact=dirFac;
                vDi.DirecDesp =dirDes;
                vDi.Telefono=Tel;
                vDi.Correo=mail;
                vDi.Ubi_Latitud = lati;
                vDi.Ubi_Longitud = longitud;
                vDi.Ubi_Altitud = alt;
                vDi.Estado = 1;

                wmsM.SMM_Clientes_Orden_Venta.InsertOnSubmit(vDi);
                wmsM.SubmitChanges();
                ret = true;
            }
            catch
            {
                ret = false;

            }
            return ret;
        }

        [HttpGet]

        public IEnumerable<SMM_VW_CLIENTES_ORDEN_VENTAS> ListadoClientes()
        {
            var listadoCli = wmsM.SMM_VW_CLIENTES_ORDEN_VENTAS.ToList();
            return listadoCli;
        }

      

        [HttpGet]
        public IEnumerable<SMM_VW_DIR_DESPACHO_ORDEN_VENTA> ListadoDirDespacho(string CodCliente)
        {
            List<SMM_VW_DIR_DESPACHO_ORDEN_VENTA> ret = new List<SMM_VW_DIR_DESPACHO_ORDEN_VENTA>();
            try
            {
                ret = (from p in wmsM.SMM_VW_DIR_DESPACHO_ORDEN_VENTA
                       where p.RutCliente.Equals(CodCliente)
                       select p).ToList<SMM_VW_DIR_DESPACHO_ORDEN_VENTA>();
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public IEnumerable<SMM_VW_DIR_FACTURACION_ORDEN_VENTA> ListadoDirFacturacion(string DirClienteFactura)
        {
            List<SMM_VW_DIR_FACTURACION_ORDEN_VENTA> ret = new List<SMM_VW_DIR_FACTURACION_ORDEN_VENTA>();
            try
            {
                ret = (from p in wmsM.SMM_VW_DIR_FACTURACION_ORDEN_VENTA
                       where p.RutCliente.Equals(DirClienteFactura)
                       select p).ToList<SMM_VW_DIR_FACTURACION_ORDEN_VENTA>();
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public int CreaOrdenDeVenta(string NumCliente,string fechaEnt,string direcDesp,string direcFact)
        {
            int ret = 0;

            try
            {
                SMM_Orden_de_Ventas or = new SMM_Orden_de_Ventas();

                or.Cliente = NumCliente;
                or.FechaEntrega =Convert.ToDateTime(fechaEnt);
                or.Dir_Despacho = direcDesp;
                or.Dir_Facturacion =direcFact;             

                wmsM.SMM_Orden_de_Ventas.InsertOnSubmit(or);
                wmsM.SubmitChanges();
                ret = or.IdOrdenVentas;
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }


    }
}