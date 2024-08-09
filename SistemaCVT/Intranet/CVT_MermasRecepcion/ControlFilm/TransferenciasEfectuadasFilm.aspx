<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TransferenciasEfectuadasFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.TransferenciasEfectuasdas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Informe Transferencias Efectuadas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Transferencias Efectuadas</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 30px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha Desde">
                    </dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="fdesde" runat="server" Height="30px">
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha Hasta">
                    </dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="fhasta" runat="server" Height="30px">
                    </dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 30px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Bodega Origen">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_bodegaOrigen" runat="server" DataSourceID="LqDsBodega0"
                        ValueField="Bodega" Height="30px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Bodega" Name="Codigo" Width="150px" />
                            <dx:ListBoxColumn FieldName="Descripcion" Name="Bodega" Width="200px" />
                        </Columns>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Bodega Origen">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_bodegaDestino" runat="server" DataSourceID="LqDsBodega0"
                        ValueField="Bodega" Height="30px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Bodega" Name="Codigo" Width="150px" />
                            <dx:ListBoxColumn FieldName="Descripcion" Name="Bodega" Width="200px" />
                        </Columns>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btn_Generar" runat="server" OnClick="btn_Generar_Click"
                        Text="Generar" Height="42px" Width="74px">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <asp:LinqDataSource ID="LqDsBodega0" runat="server"
        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
        TableName="VW_Bodegas_Transfer_Film" Where="Site_Id==5 || Site_Id==4 || Site_Id==17 || Site_Id==3 || Site_Id==0">
    </asp:LinqDataSource>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" OnToolbarItemClick="GvDatos_ToolbarItemClick" AutoGenerateColumns="False">
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NBobina" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoBruto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoNeto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Fecha" VisibleIndex="5" Caption="Fecha Transf.">
                    <PropertiesTextEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteInterno" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BoOrigen" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BoDestino" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Entidad" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreUsuario" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierta" Value="1" />
                            <dx:ListEditItem Text="Pend.Recepcion" Value="2" />
                            <dx:ListEditItem Text="Confirmada" Value="3" />
                            <dx:ListEditItem Text="Anulada" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
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
        </dx:ASPxGridView>
    </div>
</asp:Content>
