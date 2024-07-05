<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="infTrazabilidadFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.infTrazabilidadFilm" %>

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
            <li><a>WMS</a></li>
            <li><span id="current">Trazabilidad Pallet</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Trazabilidad Pallet</span>
        <span class="tab-end"></span>
        <%--  <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/Images/pdf.png"
                    OnClick="cmdExcel_Click" />
                Exportar PDF</a>
        </div>--%>
    </div>
    <br />
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Pallet" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_pallet" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ValidationExpression="\d+" ErrorText="Solo Numeros" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btn_buscar" runat="server" Text="Buscar" Height="40px" Width="100px">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxVerticalGrid ID="GvBusqueda" runat="server" Width="700px" AutoGenerateRows="False" DataSourceID="LqsBusqueda">
            <Rows>
                <dx:VerticalGridTextRow FieldName="NBobina" VisibleIndex="0">
                    <RecordStyle HorizontalAlign="Left">
                    </RecordStyle>
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="PesoBruto" VisibleIndex="1">
                    <RecordStyle HorizontalAlign="Left">
                    </RecordStyle>
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="PesoNeto" VisibleIndex="2">
                    <RecordStyle HorizontalAlign="Left">
                    </RecordStyle>
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="Reserve_Quantity" VisibleIndex="3" Caption="Cant.Reserva">
                    <RecordStyle HorizontalAlign="Left">
                    </RecordStyle>
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="LoteInterno" VisibleIndex="4">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="CodProducto" VisibleIndex="5">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="Producto" VisibleIndex="6">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="EstadoBobina" VisibleIndex="7" Caption="Estado">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="FechaRecep" VisibleIndex="8">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="BodActual" VisibleIndex="9">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="Fecha_Produc" VisibleIndex="10" Caption="Fech. Produccion">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridDateRow FieldName="Fecha_Venc" VisibleIndex="11" Caption="Fech.Vencimiento">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="LoteProveedor" VisibleIndex="12">
                </dx:VerticalGridTextRow>
            </Rows>
            <SettingsPager Mode="ShowPager"></SettingsPager>
        </dx:ASPxVerticalGrid>
        <asp:LinqDataSource ID="LqsBusqueda" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_TRAZA_BUSQUEDA_FILM" Where="NBobina == @NBobina">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_pallet" DefaultValue="0" Name="NBobina" PropertyName="Text" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div style="margin-left: 35px">
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Detalle Movimientos" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDetMov" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetMovimientos" Width="1036px" OnToolbarItemClick="GvDetMov_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
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
            <Columns>
                <dx:GridViewDataDateColumn FieldName="Fecha" MaxWidth="150" MinWidth="140" VisibleIndex="0" Width="150px">
                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyy HH:mm:ss">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Nbobina" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Entidad" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Operacion" MaxWidth="350" MinWidth="350" VisibleIndex="4" Width="350px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Identidad" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N° Documento" FieldName="Ndocumento" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Documento" FieldName="Tipo" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoBruto" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoNeto" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Info. Adicional" FieldName="info" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetMovimientos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" OrderBy="Fecha" TableName="VW_RPT_TRAZABILIDAD_FILM" Where="Nbobina == @Nbobina">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_pallet" DefaultValue="0" Name="Nbobina" PropertyName="Text" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <br />
    <div style="margin-left: 35px">
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Detalle Reserva" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDetReserva" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetReserva">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="NBobina" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Operacion" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Id_TransferenciaFilm" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreUsuario" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Peso Reserva" FieldName="Reserve_Quantity" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoBruto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetReserva" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_FilmConReserva" Where="NBobina == @NBobina">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_pallet" DefaultValue="0" Name="NBobina" PropertyName="Text" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
