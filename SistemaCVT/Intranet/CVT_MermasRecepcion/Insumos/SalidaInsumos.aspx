<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SalidaInsumos.aspx.cs" Inherits="CVT_MermasRecepcion.Insumos.SalidaInsumos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Insumos</a></li>
        <li><span id="current">Consumo de Insumos</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Consumo de Insumos</span>
    <span class="tab-end"></span>
</div>
<div>
    <table>
        <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Responsable/Solicitante:"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxComboBox ID="cbo_responsable" runat="server" ValueType="System.String"></dx:ASPxComboBox>
        </td>
       <td>
           <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Bodega"></dx:ASPxLabel>
       </td>
            <td>
                <dx:ASPxComboBox ID="cbo_bodega" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_crear" runat="server" Text="CREAR" OnClick="btn_crear_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
    <div>
        <dx:ASPxGridView ID="GvConsumoEncabezado" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsEncabezado" KeyFieldName="SalidaInsumos_ID">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="SalidaInsumos_ID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Responsable" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsEncabezado" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_SalidaInsumos">
        </asp:LinqDataSource>
    </div>
<div>
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Familia:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_familia" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Articulo:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_articulo" runat="server" ValueType="System.String"></dx:ASPxComboBox>
            </td>
            
             <td>
     <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Lugar Uso:"></dx:ASPxLabel>
 </td>
 <td>
     <dx:ASPxComboBox ID="cbo_ccosto" runat="server" ValueType="System.String"></dx:ASPxComboBox>
 </td>
 <td>
     <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Especifico:"></dx:ASPxLabel>
 </td>
 <td>
     <dx:ASPxComboBox ID="cbo_item" runat="server" ValueType="System.String"></dx:ASPxComboBox>
 </td><td>
    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Cantidad:"></dx:ASPxLabel>
</td>
            <td>
                <dx:ASPxTextBox ID="txt_cantidad" runat="server" Width="170px"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_agregar" runat="server" Text="AGREGAR" OnClick="btn_agregar_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
<div>
    <dx:ASPxGridView ID="GvConsumoInsumo" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsDetalle" KeyFieldName="SalidaInsumosDetalle_ID">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="SalidaInsumos_ID" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SalidaInsumosDetalle_ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Division" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UAdm" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CCosto" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Item" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_SalidaInsumosDetalle">
    </asp:LinqDataSource>
</div>
<div>
    <dx:ASPxButton ID="btn_Sincronizar" runat="server" Text="SINCRONIZAR CON SAP"></dx:ASPxButton>
</div>
</asp:Content>
