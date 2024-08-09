<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TesoreriaBlank.aspx.cs" Inherits="CVT_MermasRecepcion.ControlCierreMensual.Tesoreria.TesoreriaBlank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <asp:UpdatePanel ID="pnl1" runat="server">
        <ContentTemplate>
       

   


 <div id="mainContent">


            <h1>Puntos control para cierre de mes area Tesoreria,<a href="#">
 <asp:Label ID="lblUser" runat="server"></asp:Label></a></h1>
            <p>Este es tu escritorio con el despliegue de los accesos a <strong>Informes de Control</strong> 
            que CV Trading consideran te pueden servir para cada cierre mensual.<br/>
            </p>
   </div>

            <div id="launcher">
                <ul>
                    <li>
                        <h2 class="shortcut control-launcher">Tesoreria</h2>
                        <h3><a href="CartolaVsCuentaSAP.aspx">Cartola v/s Cuenta SAP</a></h3>
                        <p>Resumen cartola bancos v/s Cuenta Banco en SAP</p>
                    </li>
              
              
              
                    <li>
                        <h2 class="shortcut control-launcher">Tesoreria</h2>
                        <h3><a href="ListaCumplimientoCondPago.aspx">Cumplimiento condicion de pago</a></h3>
                        <p>Porcentaje cumplimiento condicion de pago</p>
                    </li>
              

                      <li>
                        <h2 class="shortcut almacenamiento-launcher">Tesoreria</h2>
                        <h3><a href="ListarProyeccionPagos.aspx">Proyeccion de pagos</a></h3>
                        <p>Proyeccion de pagos</p>
                    </li>
                
                      <li>
                        <h2 class="shortcut camiones-launcher">Tesoreria</h2>
                        <h3><a href="ListarProyeccionCobranza.aspx">Proyecccion de cobranza</a></h3>
                        <p>Proyeccion de cobranza</p>
                    </li>
                    </ul>

                


            </div>
                     <div id="launcher">
                <ul>
                    <li>
                        <h2 class="shortcut camiones-launcher">Tesoreria</h2>
                        <h3><a href="ListaEstadoReconciliaciones.aspx">Estado de Reconciliaciones</a></h3>
                        <p>Estado de Reconciliaciones</p>
                    </li>
                    <li>
                        <h2 class="shortcut camiones-launcher">Tesoreria</h2>
                        <h3><a href="ListaPagadosPorCC.aspx">Pagado x CC</a></h3>
                        <p>Pagado por Centro de Costo</p>
                    </li>
                    <li>
                        <h2 class="shortcut camiones-launcher">Tesoreria</h2>
                        <h3><a href="ListaPagoCobranzasPeriodo.aspx">Pagos y Cobranzas del periodo</a></h3>
                        <p>Pagos y Cobranzas del periodo</p>
                    </li>

                </ul>

                


            </div>




        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

