﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DetalleCamiones.aspx.cs" Inherits="CVT_MermasRecepcion.ControlCierreMensual.Transporte.DetalleCamiones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <%--     <li><a>Control Cierre</a></li>--%>
            <li><span id="current">Detalle Camiones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Camiones</span>
        <span class="tab-end"></span>
        <%--    <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"
                    style="width: 20px" />
                Exportar Excel</a>&nbsp;
              <a>
             <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" onclick="cmdNew_Click" style="height: 16px; width: 16px;" />
                  Nuevo</a>
        </div>  --%>
    </div>
    <br />
    <br />
    <br />
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalleCamiones" KeyFieldName="Patente" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">
        <SettingsPager PageSize="20">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
        <Toolbars>
            <dx:GridViewToolbar>
                <Items>
                    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
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
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Patente" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Propietario" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="KilometroRecorrido" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Carroceria" FieldName="Id_TipoCarroceria" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="LqsTipoCarroceria" TextField="Carroceria" ValueField="Id_TipoCarroceria">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="CapacidadPallet" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        <Styles>
            <FocusedRow BackColor="#FF9933">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqsDetalleCamiones" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DescripcionDeCamiones" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqsTipoCarroceria" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_TipoCarroceriaCamion">
    </asp:LinqDataSource>
   
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
    <br />

</asp:Content>
