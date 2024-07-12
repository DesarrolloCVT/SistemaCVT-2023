<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMInventarioDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.SMMInventarioDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>INVENTARIO</a></li>
            <li><span id="current">Detalle Inventario</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Inventario</span>
        <span class="tab-end"></span>
      <div id="options">
            <%--  <a><asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"/> Exportar Excel</a>--%>
            <a style="margin-left: 50px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" />
                volver</a>&nbsp;
     
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsInventario" KeyFieldName="InventarioDet_Id" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>                    
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>

<Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True"
                    VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="InventarioDet_Id" ReadOnly="True"
                    VisibleIndex="1" Caption="ID Detalle" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="2" Caption="Folio">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Dun14" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SiteID" VisibleIndex="7" Caption="Bodega">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="11" Caption="F. Registro">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodProducto" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsProducto" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ItemCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="ItemName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="IdUsuario" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Pasillo" FieldName="UbiPasillo" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="F. Vencimiento" FieldName="FechaVencimiento" VisibleIndex="5">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Num Pallet" FieldName="Package_SSCC" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoEmpaque" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant Base Empaque" FieldName="CantBase" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="CodUbicacion" FieldName="Location_Id" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsBehavior ConfirmDelete="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsInventario" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext"
            EnableUpdate="True" EntityTypeName="" TableName="SMM_InventarioDetalle"
            EnableDelete="True" Where="Inventario_Id == @Inventario_Id">
            <WhereParameters>
                <asp:SessionParameter Name="Inventario_Id" SessionField="Inventario_Id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="MMetro_OITM">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
</asp:Content>
