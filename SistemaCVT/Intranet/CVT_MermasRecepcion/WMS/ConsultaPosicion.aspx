<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ConsultaPosicion.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.ConsultaPosicion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 222px;
        }

        .style2 {
            width: 105px;
        }

        .style3 {
            width: 100%;
        }
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Info Ubicacion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Consulta Ubicacion</span>
        <span class="tab-end"></span>
       <%-- <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel DETALLE</a>


        </div>--%>
    </div>
    <br />
    <div style="margin-left:25px">
        <table >
            <tr>
                <td >
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Posicion" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td >
                    <dx:ASPxTextBox ID="txt_ubicacion" runat="server" Width="170px" Height="30px">
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btn_buscar" runat="server" OnClick="btn_buscar_Click"
                        Text="Buscar">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>

    </div>
    <br/>
    <br />
    <div>
        <a>RESUMEN</a>
        <dx:ASPxGridView ID="GvResumen" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsResumenUbicacion">
            <SettingsPager AlwaysShowPager="True" Mode="ShowAllRecords" PageSize="1000">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />

            <Columns>
                <dx:GridViewDataTextColumn FieldName="Layout_Id" Visible="False"
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Codigo"
                    FieldName="ArticleProvider_CodClient" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="ArticleProvider_Description" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bultos" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant Comprometida"
                    FieldName="Cantidad_Pedidos" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsResumenUbicacion" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="CVT_ResumenConsultaUbicacion" Where="Layout_Id == @Layout_Id">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_ubicacion" DefaultValue="0"
                    Name="Layout_Id" PropertyName="Text" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

    </div>
    <br />
    <div>
        <br />
        <a>DETALLE</a>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowGroupPanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--        <dx:GridViewToolbarItem Command="New" />--%>
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
                <dx:GridViewDataTextColumn FieldName="Package_SSCC" VisibleIndex="0"
                    Caption="N Pallet">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_CodClient"
                    VisibleIndex="1" Caption="Codigo Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_Description"
                    VisibleIndex="2" Caption="Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Quantity" VisibleIndex="3"
                    Caption="Cantidad">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Lot" VisibleIndex="4"
                    Caption="Lote">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Description" VisibleIndex="5"
                    Caption="Posicion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Id" VisibleIndex="6"
                    Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription"
                    VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad Lote SAP" FieldName="Quantity"
                    VisibleIndex="8" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Usuario" FieldName="Staff_Name"
                    VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha" FieldName="Location_InDate"
                    VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha Produccion" FieldName="Package_ProductionDate" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha Expiracion" FieldName="Package_ExpiresDate" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N° Recepcion" FieldName="Reception_Id" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <%--<asp:LinqDataSource ID="LqDsConsultaPosicion" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
        TableName="CVT_ConsultaPosicion" Where="Layout_Id == @Layout_Id">
        <WhereParameters>
            <asp:ControlParameter ControlID="txt_ubicacion" DefaultValue="0" 
                Name="Layout_Id" PropertyName="Text" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>--%>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>
    </div>
    <div>
        <br />
        <a>CAMIONES</a>
        <dx:ASPxGridView ID="GvUbicCamion" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsUbicCamion" Width="300px">
            <SettingsPager AlwaysShowPager="True" Mode="ShowAllRecords" PageSize="1000">
            </SettingsPager>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Posicion" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cant_Bultos" VisibleIndex="1"
                    Caption="Cant Bultos">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsUbicCamion" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="CVT_ResumenPosicionesCamion">
        </asp:LinqDataSource>
    </div>
</asp:Content>
