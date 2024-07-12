<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IngresoCostoCamion.aspx.cs" Inherits="CVT_MermasRecepcion.ControlCierreMensual.Transporte.CostoTotalPorCamion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <%--     <li><a>Control Cierre</a></li>--%>
            <li><span id="current">Costo Total Camiones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Ingreso Gasto Camion</span>
        <span class="tab-end"></span>
     <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="height: 16px;" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <br />

    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosGastoCamion" KeyFieldName="Id_CostoCamion" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">
        <SettingsPager PageSize="40">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
        <Toolbars>
            <dx:GridViewToolbar >
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
            <dx:GridViewDataTextColumn FieldName="Id_CostoCamion" VisibleIndex="1" Visible="False" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="3">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Monto" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FolioDocumento" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Patente" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="LqsCamion" TextField="Patente" ValueField="Patente">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tipo Gasto" FieldName="Id_GastoCamion" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="LqsDetalleGasto" TextField="DetalleGasto" ValueField="Id_GastoCamion">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="TipoDocumento" VisibleIndex="7">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Factura" Value="1" />
                        <dx:ListEditItem Text="Boleta" Value="2" />
                        <dx:ListEditItem Text="Vale Por" Value="3" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="NRendicion" VisibleIndex="9">
                <PropertiesTextEdit>
                    <ValidationSettings Display="Dynamic">
                        <RegularExpression ValidationExpression="\d+" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
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


    <asp:LinqDataSource ID="LqsDatosGastoCamion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_CostoPorCamion" EnableInsert="True" EnableUpdate="True" OrderBy="Fecha desc" EnableDelete="True">
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="LqsDetalleGasto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DetalleGastosCamion">
    </asp:LinqDataSource>


    <asp:LinqDataSource ID="LqsCamion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DescripcionDeCamiones">
    </asp:LinqDataSource>



    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
    </dx:ASPxGridViewExporter>



    <br />
</asp:Content>
