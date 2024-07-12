<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CompromisoKITDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.CompromisoKITDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Compromiso KIT Detalle</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Compromiso KIT Detalle</span>
        <span class="tab-end"></span>
          <div id="options">         
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Height="27px" Width="29px" />    </a>    
        </div>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalleCompKit" KeyFieldName="CKITDET_ID" OnRowInserting="GvDatos_RowInserting" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
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
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="CKIT_ID" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CKITDET_ID" ReadOnly="True" Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CANTIDAD" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto" FieldName="ITEMCODE" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod.Producto" FieldName="ItemCode" Width="150px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="400px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetalleCompKit" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_CompromisoKITDetalle" Where="CKIT_ID == @CKIT_ID" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="CKIT_ID" SessionField="CKIT_ID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="OITM">
        </asp:LinqDataSource>
    </div>

</asp:Content>
