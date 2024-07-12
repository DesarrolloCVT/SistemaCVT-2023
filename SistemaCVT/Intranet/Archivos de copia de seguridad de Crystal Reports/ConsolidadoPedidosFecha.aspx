<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ConsolidadoPedidosFecha.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.ConsolidadoPedidosFecha" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Consolidado Pedidos por Fecha</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Consolidado Pedidos por Fecha</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFInicio" runat="server" Height="30px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <%-- <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>--%>
                <td class="auto-style5"></td>
                <td style="padding-top: 10px">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Ver Informe" Height="30px" Theme="iOS" OnClick="btnBuscar_Click">
                        <Image IconID="print_summary_16x16devav">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
<%--    <div style="margin-left: 25px">
        <table>
            <tr>
                <td style="padding-top: 10px">
                    <dx:ASPxButton ID="btnGrilla" runat="server" Text="Ver En Grilla" Height="30px" Theme="MaterialCompact" OnClick="btnGrilla_Click">
                        <Image IconID="conditionalformatting_conditionalformatting_16x16">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />--%>
  <%--  <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="DeptoVentas" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaEntrega" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadSolicitada" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadPendienteFacturar" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadEntregar" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>--%>
</asp:Content>
