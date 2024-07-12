<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeTransferenciasxConfirmar.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InformeTransferenciasxConfirmar" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">

    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Informe Transferencias por Recepcionar</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Transferencias por Recepcionar</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
    </div>
    <div>
        <table class="style1">
            
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Bodega">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_bodega" runat="server" DataSourceID="LqDsBodega"
                        ValueField="Site_Id" Width="200px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Site_ShortDescription" Name="Codigo" />
                            <dx:ListBoxColumn FieldName="Site_Description" Name="Bodega" />
                        </Columns>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsBodega" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="VW_SITIOS_TODOS">
                    </asp:LinqDataSource>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxButton ID="btn_Generar" runat="server" OnClick="btn_Generar_Click"
                        Text="Generar">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>

        <dx:ASPxGridView ID="GvTransferXRecep" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFooter="True" />
            <SettingsBehavior />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--                        <dx:GridViewToolbarItem Command="New" />--%>
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
                <dx:GridViewDataTextColumn FieldName="Folio"
                    VisibleIndex="0" Caption="Folio" Width="300px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Fecha" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Origen"
                    VisibleIndex="2" Caption="Origen">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Destino"
                    VisibleIndex="3" Caption="Destino">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="NPallet" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="ArticleProvider_CodClient" VisibleIndex="5" Caption="Cod Producto">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="ArticleProvider_Description" VisibleIndex="6" Caption="Producto">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Quantity" VisibleIndex="7" Caption="Cantidad">
                </dx:GridViewDataTextColumn>
                
                <dx:GridViewDataTextColumn Caption="Usuario Origen" FieldName="Staff_UserName" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                
            </Columns>
           
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

            <SettingsCookies CookiesID="GvTransxRecepcionar" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
       

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvTransferXRecep">
        </dx:ASPxGridViewExporter>
        
        

    </div>
</asp:Content>
