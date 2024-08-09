<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PalletPedido.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.PalletPedido" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Logistica</a></li>
             <li><a>Seleccion Pedido</a></li>
               <li><a href="SeleccionPedidos.aspx">Seleccion Pedido</a></li>
            <li><a href="DetallePedidoSeleccionado.aspx">Detalle Pedido</a></li>
            <li><span id="current">Pallet Pedido</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Pallet Pedido</span>
        <span class="tab-end"></span>
           <div id="options">
          <%--  <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
                 <a>
                  <asp:ImageButton ID="cmdBack" runat="server"
                      ImageUrl="~/Images/back.png" OnClick="cmdNew_Click" Style="width: 16px" />Volver</a>
        </div>
    </div>
    <br />
    <table>
        <tr>
            <td>
                 <asp:Label ID="Label1" runat="server" Text="LISTADO DE PALLETS PARA PEDIDO N°: " Font-Bold="True" ForeColor="Blue"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblNpedido" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </td>
        </tr>
    </table>   
    <br />
    <br />
    <div style="margin-left:200px">
        <dx:ASPxButton ID="btnVer" runat="server" Text="Ver Pallets" Height="30px" Width="83px" OnClick="btnVer_Click"></dx:ASPxButton>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" KeyFieldName="IdContenedorCarga" OnRowCommand="GvDatos_RowCommand">
            <Columns>
                <dx:GridViewDataTextColumn Caption="ID" FieldName="IdContenedorCarga" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoContenedor" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pedido" FieldName="NumPedido" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Linea" FieldName="NumPedidoLinea" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto" FieldName="CodProducto" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="DescProducto" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="CantPedidoSAP" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Pallests" FieldName="CantidadPallets" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Base" FieldName="CantidadProdBase" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Corridas" FieldName="CantidadProdAltura" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Indicacion Uso" FieldName="ObsIndUsoPallet" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ObsEntrega" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaRegistro" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaUpdate" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Peso" FieldName="PesoTotalPallets" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Volumen" FieldName="VolTotalPallets" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Estado" FieldName="IndCargado" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataHyperLinkColumn Caption="Desarmar" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDesarmar" runat="server" ImageUrl="~/Images/delete.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
</asp:Content>
