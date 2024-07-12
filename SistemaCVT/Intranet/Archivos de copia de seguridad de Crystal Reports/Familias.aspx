<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Familias.aspx.cs" Inherits="CVT_MermasRecepcion.Mantenedores.Familias" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Familia Productos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Familia Productos</span>
        <span class="tab-end"></span>
 <%--       <div id="options">
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
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqsFamilia" KeyFieldName="Company_Id; Family_Id"
            Style="margin-bottom: 0px" OnRowInserting="GvDatos_RowInserting" Width="250px" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />
                        <dx:GridViewToolbarItem Text="Exportar"  Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
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
                    ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True"
                    ShowInCustomizationForm="True" VisibleIndex="1" Caption="ID Compañia">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Family_Id" ReadOnly="True"
                    ShowInCustomizationForm="True" VisibleIndex="2" Caption="ID Familia">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Family_Description"
                    ShowInCustomizationForm="True" VisibleIndex="3" Caption="Nombre">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Family_Shortdescription"
                    ShowInCustomizationForm="True" VisibleIndex="4" Caption="Cod. Descripcion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Family_Parent" VisibleIndex="5"
                    Caption="Cod Perteneciente">
                    <PropertiesComboBox DataSourceID="LqsFamilia1" TextField="Family_Description"
                        ValueField="Family_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default"/>
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsFamilia" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="Family" EnableDelete="True" EnableInsert="True"
            EnableUpdate="True">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsFamilia1" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="Family">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
