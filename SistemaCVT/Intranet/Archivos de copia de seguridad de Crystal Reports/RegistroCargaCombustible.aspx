<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegistroCargaCombustible.aspx.cs" Inherits="CVT_MermasRecepcion.Transporte.RegistroCargaCombustible" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Transporte</a></li>
            <li><span id="current">Carga Combustible</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Carga Combustible</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRegistroCombustible" KeyFieldName="Id_LitrosPrecio" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">
        <SettingsPager PageSize="50">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
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
                            <dx:GridViewToolbarItem Command="ExportToCsv" />
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
            <dx:GridViewDataTextColumn FieldName="Id_LitrosPrecio" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Numero_Documento" ShowInCustomizationForm="True" VisibleIndex="3" Caption="N° Documento">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaDeCarga" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Litros" ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Odometro" ShowInCustomizationForm="True" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Precio por Litro" FieldName="Precio_Litro" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Patente" ShowInCustomizationForm="True" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="LqsCamion" TextField="Patente" ValueField="Patente">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataCheckColumn FieldName="CargaEnPlanta" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="IdUsuarioCreador" VisibleIndex="10">
                <PropertiesComboBox DataSourceID="lqsUsuarios" TextField="NombreUsuario" ValueField="IdUsuario">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="NEstanque" VisibleIndex="9">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="1" Value="1" />
                        <dx:ListEditItem Text="2" Value="2" />
                        <dx:ListEditItem Text="3" Value="3" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
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

    <asp:LinqDataSource ID="LqsRegistroCombustible" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_RegistroCargaCombustible" OrderBy="FechaDeCarga desc" Where="FechaDeCarga &gt;= @FechaDeCarga &amp;&amp; FechaDeCarga &lt;= @FechaDeCarga1">
        <WhereParameters>
            <asp:ControlParameter ControlID="dteInicio" Name="FechaDeCarga" PropertyName="Value" Type="DateTime" />
            <asp:ControlParameter ControlID="dteTermino" Name="FechaDeCarga1" PropertyName="Value" Type="DateTime" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqsCamion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DescripcionDeCamiones">
    </asp:LinqDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
    </dx:ASPxGridViewExporter>

    <asp:LinqDataSource ID="lqsUsuarios" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
    </asp:LinqDataSource>

</asp:Content>
