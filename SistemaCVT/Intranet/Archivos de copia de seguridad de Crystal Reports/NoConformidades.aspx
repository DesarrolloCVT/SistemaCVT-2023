<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NoConformidades.aspx.cs" Inherits="CVT_MermasRecepcion.NoConformidades.NoConformidades" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">No Conformidades</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">No Conformidades</span>
        <span class="tab-end"></span>
      <%--  <div id="options">
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
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsNoConformidades" KeyFieldName="Id_NoConformidad" OnRowInserting="GvDatos_RowInserting" OnRowCommand="GvDatos_RowCommand" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />
                        <%--<dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
                        </dx:GridViewToolbarItem>--%>
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Id_NoConformidad" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCierre" VisibleIndex="6">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Observaciones" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Área Relacionada" FieldName="id_AreaNoConformidad" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsAreNoConformidad" TextField="Area" ValueField="id_AreaNoConformidad">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Tipo" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Accion Correctiva" Value="Accion Correctiva" />
                            <dx:ListEditItem Text="Accion Preventiva" Value="Accion Preventiva" />
                            <dx:ListEditItem Text="No Conformidad Interna" Value="No Conformidad Interna" />
                            <dx:ListEditItem Text="No Conformidad Cliente" Value="No Conformidad Cliente" />
                            <dx:ListEditItem Text="BRC" Value="BRC" />
                            <dx:ListEditItem Text="Observacion" Value="Observacion" />
                            <dx:ListEditItem Text="Mejora" Value="Mejora" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="Usuario" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="NombreUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalles" VisibleIndex="11">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Versión" FieldName="Version" ShowInCustomizationForm="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="PDF" VisibleIndex="12">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdDetallePdf" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsNoConformidades" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_NoConformidades">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsAreNoConformidad" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaNoConformidad">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
</asp:Content>
