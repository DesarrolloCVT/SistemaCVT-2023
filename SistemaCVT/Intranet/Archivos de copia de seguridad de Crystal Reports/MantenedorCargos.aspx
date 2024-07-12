<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MantenedorCargos.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.MantenedorCargos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>RRHH</a></li>
            <li><span id="current">Tarifas Externos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Tarifas Externos</span>
        <span class="tab-end"></span>
     <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" />Nuevo</a>
        </div>--%>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsCargos" KeyFieldName="CVT_Cargo" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                    VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Cargo" FieldName="CVT_Cargo"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Valor Hora" FieldName="Valor_Hora"
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Empresa" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LqDsEmpresa" TextField="DEPTNAME"
                        ValueField="DEPTNAME">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>

        <dx:ASPxGridViewExporter runat="server" GridViewID="GvDatos"
            ID="ASPxGridViewExporter1">
        </dx:ASPxGridViewExporter>

        <asp:LinqDataSource runat="server"
            ContextTypeName="DBMermasRecepcion.DBControlAccesoDataContext"
            TableName="DEPARTMENTS" Where="SUPDEPTID == @SUPDEPTID" EntityTypeName=""
            ID="LqDsEmpresa" EnableDelete="True" EnableInsert="True"
            EnableUpdate="True">
            <WhereParameters>
                <asp:Parameter DefaultValue="0" Name="SUPDEPTID" Type="Int32"></asp:Parameter>
            </WhereParameters>
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="LqDsCargos" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_TarifasExternos" EnableDelete="True" EnableInsert="True"
            EnableUpdate="True">
        </asp:LinqDataSource>
    </div>

</asp:Content>
