<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMComisionProductos.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.SMMComisionProductos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Comision Productos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Comision productos</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsComiProd" KeyFieldName="CodProducto" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                            <Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                          <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />                            
                            </Items>
                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
                 <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="PrcComision" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoComision" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto" FieldName="CodProducto" ReadOnly="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LqsProducto" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Codigo" FieldName="ItemCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Categoria" FieldName="Cod_Categoria" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsCategoria" TextField="ItmsGrpNam" ValueField="ItmsGrpCod">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="SubCategoria" FieldName="Cod_Sub_Categoria" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsSubCategoria" TextField="U_SubCategoria" ValueField="Code">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="U_MarcaProducto" VisibleIndex="6">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsComiProd" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_ComisionProductos" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="MMetro_OITM">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsCategoria" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="MMETRO_OITB">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsSubCategoria" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="_SCATEGORIA_PRODUCTO">
        </asp:LinqDataSource>
    </div>
    <dx:ASPxPopupControl ID="popNuevo" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="500px">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <br />
                <div>
                    <div>
                        <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" Height="30px" Theme="iOS" Width="453px" DataSourceID="LqsProd" ValueField="ItemCode">
                            <Columns>
                                <dx:ListBoxColumn Caption="Cod Producto" FieldName="ItemCode" Width="150px">
                                </dx:ListBoxColumn>
                                <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="350px">
                                </dx:ListBoxColumn>
                            </Columns>
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="LqsProd" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="MMetro_OITM" Where="validFor == @validFor">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>   
                    <br />
                    <div>
                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Theme="iOS" ValidationGroup="a1" Height="36px" Width="128px"></dx:ASPxButton>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
