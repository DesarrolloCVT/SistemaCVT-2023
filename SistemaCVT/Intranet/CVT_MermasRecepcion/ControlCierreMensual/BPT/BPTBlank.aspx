<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BPTBlank.aspx.cs" Inherits="CVT_MermasRecepcion.ControlCierreMensual.BPT.BPTBlank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <asp:UpdatePanel ID="pnl1" runat="server">
        <ContentTemplate>
       

   


 <div id="mainContent">


            <h1>Puntos control para cierre de mes area Bodega PT,<a href="#">
 <asp:Label ID="lblUser" runat="server"></asp:Label></a></h1>
            <p>Este es tu escritorio con el despliegue de los accesos a <strong>Informes de Control</strong> 
            que CV Trading consideran te pueden servir para cada cierre mensual.<br/>
            </p>
   </div>

            <div id="launcher">
                <ul>
                    <li>
                        <h2 class="shortcut control-launcher">Almacenamiento</h2>
                        <h3><a href="ProductoMezclado.aspx">Producto Mezclado</a></h3>
                        <p>Porcentaje de rack con producto mezclado</p>
                    </li>
              
              
              
                    <li>
                        <h2 class="shortcut control-launcher">Almacenamiento</h2>
                        <h3><a href="PorcentajeUbicacionCV100.aspx">Ocupacion de Rack</a></h3>
                        <p>Porcentaje ocupacion de rack</p>
                    </li>
              

                      <li>
                        <h2 class="shortcut almacenamiento-launcher">Almacenamiento</h2>
                        <h3><a href="OcupacionPasillos.aspx">Ocupacion de Pasillos</a></h3>
                        <p>Porcentaje ocupacion de pasillos</p>
                    </li>
                
                      <li>
                        <h2 class="shortcut camiones-launcher">Merma</h2>
                        <h3><a href="ProductoMermado.aspx">Merma x Grupo de Producto</a></h3>
                        <p>Detalle cantidades transferidas a merma x grupo de producto</p>
                    </li>

                       <li>
                        <h2 class="shortcut control-launcher">Merma</h2>
                        <h3><a href="PorcRecuperacionProducto.aspx">% Recuperacion Productos</a></h3>
                        <p>Porcentaje Recuperacion de Productos Merma</p>
                    </li>
                    </ul>

                


            </div>
                     <div id="launcher">
                <ul>
                    <li>
                        <h2 class="shortcut camiones-launcher">Inventario</h2>
                        <h3><a href="ProductoNoEncontrado.aspx">Producto no Encontrado</a></h3>
                        <p>Listado con pallets y tiempo de producto identificados como no encontrado</p>
                    </li>
                   <li>
                        <h2 class="shortcut almacenamiento-launcher">Almacenamiento</h2>
                        <h3><a href="InformeRecepciones.aspx">Recepciones</a></h3>
                        <p>Informe Recepciones</p>
                    </li>
                </ul>

                


            </div>




        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
