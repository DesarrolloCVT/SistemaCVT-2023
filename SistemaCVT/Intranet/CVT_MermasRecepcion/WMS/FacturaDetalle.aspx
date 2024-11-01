﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FacturaDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.FacturaDetalle" %>
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
        <li><span id="current">Info Factura</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Consulta Factura</span>
    <span class="tab-end"></span>
    
</div>
    
           
<div>

    <table class="dxflInternalEditorTable">
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Factura">
                </dx:ASPxLabel>
            </td>
            <td class="style1">
                <dx:ASPxTextBox ID="txt_Factura" runat="server" Width="170px">
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
        <Columns>
            <dx:GridViewDataDateColumn FieldName="FecFactura" VisibleIndex="0">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Folio" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn 
                FieldName="Cód_Cliente" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn 
                FieldName="Razón_Social" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ShipToCode" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Pedido" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn 
                FieldName="Producto" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Descripción" 
                VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad_Facturada" 
                VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad_Lote" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fproduccion" VisibleIndex="11">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FVencimiento" VisibleIndex="12">
            </dx:GridViewDataDateColumn>
        </Columns>
           <Styles>
               <FocusedRow BackColor="#FF9933">
               </FocusedRow>
           </Styles>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsResumenUbicacion" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" 
        TableName="CVT_VW_FacturaDetalleLote" 
        Where="Folio == @Folio">
        <WhereParameters>
            <asp:ControlParameter ControlID="txt_Factura" DefaultValue="-1" 
                Name="Folio" PropertyName="Text" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    
</div>
</asp:Content>


