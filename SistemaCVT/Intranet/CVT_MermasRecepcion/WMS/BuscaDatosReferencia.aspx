<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="BuscaDatosReferencia.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.BuscaDatosReferencia" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 222px;
        }
        .style2
        {
            width: 105px;
        }
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>WMS</a></li>
        <li><span id="current">Info Referencia</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Consulta Referencia</span>
    <span class="tab-end"></span>
    
</div>
    
           
<div>

    <table class="dxflInternalEditorTable">
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Referencia">
                </dx:ASPxLabel>
            </td>
            <td class="style1">
                <dx:ASPxTextBox ID="txt_Referencia" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" onclick="btn_buscar_Click" 
                    Text="Buscar">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>

</div>
<div>
<a>RESUMEN</a>
       <dx:ASPxGridView ID="GvResumen" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LqDsResumenUbicacion">
        <SettingsPager AlwaysShowPager="True" Mode="ShowAllRecords" PageSize="1000">
        </SettingsPager>
           <SettingsBehavior AllowFocusedRow="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Documento" 
                VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn 
                FieldName="DocNum" VisibleIndex="1" Caption="N Documento">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Referencia" 
                FieldName="NumAtCard" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CardCode" VisibleIndex="4" 
                Caption="Cod Proveedor">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CardName" VisibleIndex="5" 
                Caption="Proveedor">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Sigla Proveedor" 
                FieldName="U_SiglaLote" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cod Producto" FieldName="ItemCode" 
                VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" FieldName="Dscription" 
                VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Quantity" 
                VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad Pendiente" FieldName="OpenQty" 
                VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Proyecto" FieldName="Project" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
           <Styles>
               <FocusedRow BackColor="#FF9933">
               </FocusedRow>
           </Styles>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsResumenUbicacion" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
        TableName="CVT_VW_ReferenciaDocumentoCompra" 
        Where="NumAtCard == @NumAtCard">
        <WhereParameters>
            <asp:ControlParameter ControlID="txt_Referencia" DefaultValue="0" 
                Name="NumAtCard" PropertyName="Text" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    
</div>
</asp:Content>

