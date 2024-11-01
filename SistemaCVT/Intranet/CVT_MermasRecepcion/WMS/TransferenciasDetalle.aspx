﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TransferenciasDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.TransferenciasDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>WMS</a></li>
        <li><span id="current">Transferencias</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle"><dx:ASPxLabel ID="lbl_Encabezado" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel> </span>
    
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"/> Exportar Excel</a>
        <a style="margin-left: 50px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;
     
    </div>
</div>
<div>
<p>AGREGAR</p>
    <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="200px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <table class="dxeBinImgCPnlSys">
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Lote">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Producto">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_producto" runat="server" 
                    ClientInstanceName="cbo_producto" DataSourceID="LqDsProducto" 
                    ValueField="ArticleProvider_Id">
                    <Columns>
                        <dx:ListBoxColumn Caption="Codigo" FieldName="ArticleProvider_CodClient">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <dx:ASPxButton ID="btn_limpiarproducto" runat="server" AutoPostBack="False" 
                    OnClick="btn_limpiarproducto_Click" Text="Limpiar Producto" 
                    RenderMode="Link">
                    <ClientSideEvents Click="function(s, e) {
cbo_producto.SetSelectedIndex(-1);
	
}" />
<ClientSideEvents Click="function(s, e) {
cbo_producto.SetSelectedIndex(-1);
	
}"></ClientSideEvents>
                </dx:ASPxButton>
                <asp:LinqDataSource ID="LqDsProducto" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
                    TableName="ArticleProvider" Where="ArticleProvider_Status == @ArticleProvider_Status">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="1" Name="ArticleProvider_Status" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Ubicacion">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_ubicacion" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="N Pallet">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_npallet" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_Filtrar" runat="server" OnClick="btn_Filtrar_Click" 
                    Text="Filtrar">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <dx:ASPxGridView ID="GvFiltro" runat="server" AutoGenerateColumns="False" 
                    KeyFieldName="Package_Id" EnableTheming="True" Theme="BlackGlass">
                    <SettingsPager AlwaysShowPager="True" PageSize="1000" Visible="False">
                    </SettingsPager>
                    <Columns>
                        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" 
                            ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Id" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Layout_Id" ShowInCustomizationForm="True" 
                            VisibleIndex="11" Caption="Cod Ubicacion">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ArticleProvider_Id" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Codigo Producto" 
                            FieldName="ArticleProvider_CodClient" ShowInCustomizationForm="True" 
                            VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Producto" 
                            FieldName="ArticleProvider_Description" ShowInCustomizationForm="True" 
                            VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC" 
                            ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Site_Id" ShowInCustomizationForm="True" 
                            Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Posicion" 
                            FieldName="Layout_ShortDescription" ShowInCustomizationForm="True" 
                            VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription" 
                            ShowInCustomizationForm="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_Quantity" 
                            ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot" 
                            ShowInCustomizationForm="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_Agregar" runat="server" Text="Agregar" 
                    OnClick="btn_Agregar_Click">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxPanel>
</div>
<div>
<p>DETALLE</p>
    <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="200px">
        <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxButton ID="btn_Quitar_Todos" runat="server" Text="Quitar Todos" 
        OnClick="btn_Quitar_Todos_Click">
    </dx:ASPxButton>
    <dx:ASPxGridView ID="GvDetalle" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LqDsTransferDetail" KeyFieldName="Transfer_Id;Package_Id" 
        OnHtmlRowCreated="GvDetalle_HtmlRowCreated" 
        OnRowCommand="GvDetalle_RowCommand" Width="100%">
        <SettingsPager AlwaysShowPager="True" EnableAdaptivity="True" PageSize="1000" 
            Visible="False">
        </SettingsPager>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Transfer_Id" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Package_Id" 
                ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pos. Actual" 
                FieldName="Layout_ShortDescription" ShowInCustomizationForm="True" 
                VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription" 
                ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cod Producto" 
                FieldName="ArticleProvider_CodClient" ShowInCustomizationForm="True" 
                VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" 
                FieldName="ArticleProvider_Description" ShowInCustomizationForm="True" 
                VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="SSCC" FieldName="Package_SSCC" 
                ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot" 
                ShowInCustomizationForm="True" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Fecha" FieldName="Date" 
                ShowInCustomizationForm="True" VisibleIndex="11">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="N Tarea" FieldName="Task_Id" 
                ShowInCustomizationForm="True" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Layout_Id_Actual" 
                ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Site_Id" ShowInCustomizationForm="True" 
                Visible="False" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="Status" 
                ShowInCustomizationForm="True" VisibleIndex="10">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Creada" Value="1" />
                        <dx:ListEditItem Text="Con Tarea" Value="2" />
                        <dx:ListEditItem Text="Transferido" Value="3" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="16">
                <DataItemTemplate>
                    <asp:ImageButton ID="Eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Rechazar" VisibleIndex="17">
                <DataItemTemplate>
                    <asp:ImageButton ID="Rechazar" CommandName="cmdRechazar" runat="server" ImageUrl="~/Images/bloqueado.png" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn Caption="C. Actual" 
                FieldName="Package_Quantity" ShowInCustomizationForm="True" 
                VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="C. Pickeada" 
                FieldName="Task_Quantity_Picked" ShowInCustomizationForm="True" 
                VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="F Produccion" 
                FieldName="Package_ProductionDate" ShowInCustomizationForm="True" 
                VisibleIndex="13">
            </dx:GridViewDataDateColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsTransferDetail" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
        TableName="CVT_VW_TransferenciasDetalle" 
        Where="Transfer_Id == @Transfer_Id">
        <WhereParameters>
            <asp:SessionParameter Name="Transfer_Id" 
                SessionField="TransferId" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
        ExportedRowType="All" GridViewID="GvDetalle">
    </dx:ASPxGridViewExporter>
            <dx:ASPxPopupControl ID="popup_motrechazo" runat="server" AllowDragging="True" HeaderText="Rechazo">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Motivo">
                        </dx:ASPxLabel>
                        <dx:ASPxComboBox ID="cbo_MotivoRechazo" runat="server">
                            <Items>
                                <dx:ListEditItem Text="Dif Cantidad" Value="Dif Cantidad" />
                                <dx:ListEditItem Text="Dif Producto" Value="Dif Producto" />
                                <dx:ListEditItem Text="No Encontrado Fisico" Value="No Encontrado Fisico" />
                            </Items>
                        </dx:ASPxComboBox>
                        <dx:ASPxButton ID="btn_rechazo" runat="server" OnClick="btn_rechazo_Click" Text="Rechazar">
                        </dx:ASPxButton>
                    </dx:PopupControlContentControl>
                </ContentCollection>
    </dx:ASPxPopupControl>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxPanel>
</div>
</asp:Content>
