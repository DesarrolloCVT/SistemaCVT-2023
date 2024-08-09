<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SeleccionPedidos.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.ArmadoPedido" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Logistica</a></li>
            <li><span id="current">Seleccion Pedidos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Seleccion Pedidos</span>
        <span class="tab-end"></span>
     <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <br />
    <div style="padding-left:15px">
        <table>
            <tr>
                <td>
                    <label>Fecha Despacho</label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" OnClick="btn_Buscar_Click"></dx:ASPxButton>
                </td>
                <td class="auto-style1">

                </td>
                <td>
                    <dx:ASPxButton ID="btnOrden" runat="server" Text="Emisión Orden de Carga" OnClick="btnOrden_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" KeyFieldName="DocEntry" OnRowCommand="GvDatos_RowCommand1">
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="PedSAP" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cliente" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Despachar a :" FieldName="DirDespacho" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FecDocto" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FecDespacho" VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IndPalletizado" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Facturado" FieldName="IndFacturado" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Indvuelta" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoTotal" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoPendiente" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocEntry" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Seleccion" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="15">
                 <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPedidos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_Pedidos_Despacho" Where="FecDespacho == @FecDespacho">
            <WhereParameters>
                <asp:ControlParameter ControlID="ASPxDateEdit1" DefaultValue="01-01-1990" Name="FecDespacho" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
