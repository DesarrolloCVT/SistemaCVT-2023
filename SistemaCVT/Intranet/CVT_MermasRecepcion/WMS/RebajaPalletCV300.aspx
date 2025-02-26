﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RebajaPalletCV300.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.RebajaPalletCV300" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>WMS</a></li>
        <li><span id="current">Rebaja Consumos CV300</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Rebaja Consumos CV300</span>
    <span class="tab-end"></span>
    
</div>
     <table class="dxflInternalEditorTable">
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Orden Fabricacion">
                </dx:ASPxLabel>
            </td>
            <td class="style1">
                <dx:ASPxTextBox ID="txt_of" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" onclick="btn_buscar_Click" 
                    Text="Buscar">
                </dx:ASPxButton>
            </td>
             <td>
                 <dx:ASPxButton ID="btn_despachar" runat="server" Text="Consumir" 
                     onclick="btn_despachar_Click">
                 </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LqDsBultosCV300" KeyFieldName="Package_Id">
        <SettingsPager AlwaysShowPager="True" PageSize="10000">
        </SettingsPager>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Package_Id" Visible="False" 
                VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Codigo" 
                FieldName="ArticleProvider_CodClient" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" 
                FieldName="ArticleProvider_Description" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_Quantity" 
                VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot" 
                VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription" 
                VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Transfer_U_Entidad" Visible="False" 
                VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="OF" FieldName="Transfer_U_Folio_Entidad" 
                VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Package_Status" Visible="False" 
                VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Package_OutDate" Visible="False" 
                VisibleIndex="10">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="N Transferencia" FieldName="Transfer_Id" 
                VisibleIndex="11">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>       
    <asp:LinqDataSource ID="LqDsBultosCV300" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
        TableName="CVT_VW_PalletTransferidosCV300" 
        Where="Transfer_U_Folio_Entidad == @Transfer_U_Folio_Entidad">
        <WhereParameters>
            <asp:ControlParameter ControlID="txt_of" DefaultValue="0" 
                Name="Transfer_U_Folio_Entidad" PropertyName="Text" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
<div>

</div>
</asp:Content>
