using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ApiWebCVTProductivo.Models
{
    public class PedidoOVClass
    {
        //[Required(ErrorMessage = "ID de sucursal Obligatorio")]
        public string BPLId { get; set; } //idSucursal

        [Required(ErrorMessage = "ID Cliente Obligatorio")]
        public string CardCode { get; set; } //ID cliente ERP

        [Required(ErrorMessage = "Fecha Entrega Obligatorio")]
        public DateTime DocDueDate { get; set; }//FechaEntrega

        [Required(ErrorMessage = "Obligatorio")]
        public string NumAtCard { get; set; } //Numero orden de compra del cliente

        [Required(ErrorMessage = "ID Vendedor Obligatorio")]
        public string SlpCode { get; set; } //ID vendedor CVT

        public string Comments { get; set; } //Comentarios

        [Required(ErrorMessage = "ID Producto Obligatorio")]
        public string ItemCode { get; set; } //ID del producto ERP

        [Range(1, 99999999.99), Required(ErrorMessage = "Cantidad Obligartoria")]
        public double Quantity { get; set; } //ID del producto ERP

        [Range(1, 99999999.99), Required(ErrorMessage = "Precio Obligartorio")]
        public double Price { get; set; } //ID del producto ERP

        [Required(ErrorMessage = "ID de Venta Obligatorio")]
        public int ID_Venta { get; set; } //idSucursal

        [Required(ErrorMessage = "Obligatorio")]
        public int TipoEntidad { get; set; } //Numero orden de compra del cliente

        [Required(ErrorMessage = "Obligatorio")]
        public int UomEntry { get; set; }

        public int Descuento { get; set; } //% descuento
    }
}