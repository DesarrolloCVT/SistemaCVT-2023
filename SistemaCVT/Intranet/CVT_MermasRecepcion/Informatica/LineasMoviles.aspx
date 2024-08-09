<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LineasMoviles.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.LineasMoviles" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">

    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Lineas Moviles</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Lineas Moviles</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
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
    <div>
        <dx:ASPxGridView ID="GvMoviles" runat="server" AutoGenerateColumns="False" DataSourceID="LqsMovilesDato" KeyFieldName="NLinea" OnToolbarItemClick="GvMoviles_ToolbarItemClick">
            <SettingsPager PageSize="2000">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <SettingsPopup>
                <CustomizationWindow HorizontalAlign="WindowCenter" MinWidth="800px" VerticalAlign="WindowCenter" />
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar >
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
                                <dx:ASPxButtonEdit ID="tbToolbarSearch10" runat="server" NullText="Search..." Height="100%">
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="NLinea" ShowInCustomizationForm="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SIM" ShowInCustomizationForm="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Serie" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Modelo" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaAdquisicion" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Modelo Asignado" FieldName="Modelo_AsignadoMovistar" ShowInCustomizationForm="True" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ValorCuota" ShowInCustomizationForm="True" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Serie Asignado" FieldName="Serie_AsignadoMovistar" ShowInCustomizationForm="True" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Asignado" ShowInCustomizationForm="True" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqsPersonalAsignado" ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn Caption="Rut" FieldName="pin">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqsMarca" TextField="MARCA" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoEquipo" ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsTipoDispositivo" TextField="Nombre" ValueField="Id_tipoDispositivo">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Area" ShowInCustomizationForm="True" VisibleIndex="12">
                    <PropertiesComboBox DataSourceID="LqsArea" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Codigo Plan" FieldName="Cod_Plan" ShowInCustomizationForm="True" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="LqsPlan" TextField="Plan_Codigo" ValueField="Plan_Codigo">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Marca Asignada" FieldName="Marca_AsignadoMovistar" ShowInCustomizationForm="True" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="LqsMarca" TextField="MARCA" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch10" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsMovilesDato" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_INF_LineasMoviles">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPersonalAsignado" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsMarca" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPlan" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_PlanesMoviles">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsTipoDispositivo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_TipoDispositivo" Where="IdFiltro == @IdFiltro">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="IdFiltro" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter10" runat="server" ExportedRowType="All" GridViewID="GvMoviles">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
