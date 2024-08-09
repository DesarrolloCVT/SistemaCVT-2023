<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="OrdenDeCargaPorPedido.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.OrdenDeCargaPorPedido" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Logistica</a></li>
             <li><a href="SeleccionPedidos.aspx">Seleccion Pedido</a></li>
            
            <%--<li><a href="SeleccionPedidos.aspx"></a></li>--%>
            <li><span id="current">Orden de carga por Pedido</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Orden de carga por Pedido</span>
        <span class="tab-end"></span>
           <div id="options">
            <%--<a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
                  <a>
                  <asp:ImageButton ID="cmdBack" runat="server"
                      ImageUrl="~/Images/back.png" OnClick="cmdNew_Click" />Volver</a>
        </div>
    </div>
    <br />
    <br />
    <div style="margin-left:150px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Fecha de Despacho"></asp:Label>
                    <dx:ASPxDateEdit ID="dteDespacho" runat="server">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Nota de venta SAP"></asp:Label>
                    <dx:ASPxTextBox ID="txtNotaVenta" runat="server" Width="133px" Height="25px">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
             
                <td>
                    <dx:ASPxButton ID="btnGenerar" runat="server" Text="Generar Orden" Height="35px" OnClick="btnGenerar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
