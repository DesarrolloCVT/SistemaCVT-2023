<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMConsolidadoKIT.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.SMMConsolidadoKIT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Consolidado Cajas Kit</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Consolidado Cajas Kit</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatos">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProveedor" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Proveedor" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantProdRequerido" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StockSAP" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantTotalRequerido" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SaldoSAP" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                
            </Columns>
            <FormatConditions>
                <dx:GridViewFormatConditionHighlight FieldName="SaldoSAP" Expression="[SaldoSAP] < 0" Format="RedText" />
                 <dx:GridViewFormatConditionHighlight FieldName="SaldoSAP" Expression="[SaldoSAP] < 0"  Format="BoldText" />
                 <dx:GridViewFormatConditionColorScale FieldName="SaldoSAP" Format="GreenWhiteRed"/>
            </FormatConditions>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="VW_SMM_ConsolidadoCompras">
        </asp:LinqDataSource>
    </div>
</asp:Content>
