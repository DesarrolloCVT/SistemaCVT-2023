<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MantencionInformatica.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.MantencionInformatica" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Correos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Mantencion Informática</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--     <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
            <%--    <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="height: 16px;" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosMantencion" KeyFieldName="ID_MantInfEnc" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_MantInfEnc" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaMantencion" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Falla" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Causa" ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Solucion" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoMantencion" ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Preventiva" Value="Preventiva" />
                            <dx:ListEditItem Text="Correctiva" Value="Correctiva" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="IdUsuario" VisibleIndex="5" Caption="Encargado">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle " VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/encuesta.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Repuestos " VisibleIndex="11">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdRepu" runat="server" ImageUrl="~/Images/mantenimiento.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodActivo" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsCodActivo" ValueField="Cod_AF">
                        <Columns>
                            <dx:ListBoxColumn Caption="Codigo Activo" FieldName="Cod_AF">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Marca" FieldName="MARCA">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre Equipo" FieldName="Nombre_Equipo">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="informe" VisibleIndex="12">
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdDetallePdf" runat="server" ImageUrl="~/Images/documentoPDF.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>

            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosMantencion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_Mantencion_Encabezado" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="ID_MantInfEnc desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios" Where="Id_Area == @Id_Area &amp;&amp; IdPerfil == @IdPerfil">
            <WhereParameters>
                <asp:Parameter DefaultValue="7" Name="Id_Area" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="IdPerfil" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsCodActivo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_INF_CODIGOS_ACTIVOS">
        </asp:LinqDataSource>
    </div>
</asp:Content>
