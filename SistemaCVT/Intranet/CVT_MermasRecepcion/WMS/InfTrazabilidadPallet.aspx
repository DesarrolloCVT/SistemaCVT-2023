<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InfTrazabilidadPallet.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.InfTrazabilidadPallet" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 134px;
        }
        .auto-style6 {
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
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/Images/pdf.png"
                    OnClick="cmdExcel_Click" />
                Exportar PDF</a>
        </div>
    </div>
    <br />
    <div style="margin-left:50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Pallet" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style5">
                    <dx:ASPxTextBox ID="txt_pallet" runat="server" Width="170px" Height="29px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btn_buscar" runat="server" OnClick="btn_buscar_Click"
                        Text="Buscar" Style="height: 23px">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br/>
    <div >
        <table class="dxflInternalEditorTable">
            <tr>

                <td > <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Detalle Pallet" Font-Bold="true" Font-Size="Medium"/></td>
            </tr>
            <tr>
                <td colspan="3">
                    <dx:ASPxVerticalGrid ID="GvBusqueda" runat="server" AutoGenerateRows="False"
                        DataSourceID="LqDsBusqueda" Width="700px">
                        <Rows>
                            <dx:VerticalGridTextRow FieldName="Company_Id" Visible="False" VisibleIndex="0">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Site_Id" Visible="False" VisibleIndex="1">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Warehouse_Id" Visible="False"
                                VisibleIndex="2">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Sector_Id" Visible="False" VisibleIndex="3">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Layout_Id" Visible="False" VisibleIndex="4">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_Owner" Visible="False"
                                VisibleIndex="5">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_Id" Visible="False" VisibleIndex="6">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="ArticleProvider_Id" Visible="False"
                                VisibleIndex="7">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Supportive_Id" Visible="False"
                                VisibleIndex="8">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow Caption="Folio Recepcion" FieldName="Reception_Id"
                                Visible="False" VisibleIndex="17">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridDateRow Caption="Fecha Recepcion" FieldName="FRecepcion"
                                VisibleIndex="18">
                            </dx:VerticalGridDateRow>
                            <dx:VerticalGridTextRow Caption="Cod Producto" FieldName="Cod_Cliente"
                                VisibleIndex="13">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow Caption="SSCC" FieldName="Package_SSCC"
                                VisibleIndex="9">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow Caption="Producto" FieldName="Articulo"
                                VisibleIndex="14">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow Caption="Cantidad" FieldName="Package_Quantity"
                                VisibleIndex="10">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_QualityStatus" Visible="False"
                                VisibleIndex="19">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow Caption="Lote" FieldName="Package_Lot"
                                VisibleIndex="12">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_SN" Visible="False"
                                VisibleIndex="20">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow Caption="Cantidad Reservada"
                                FieldName="Package_ReserveQuantity" VisibleIndex="11">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow Caption="Bodega Actual" FieldName="Site"
                                VisibleIndex="21">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow Caption="Ubicacion Actual" FieldName="Ubicacion"
                                VisibleIndex="22">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Soportante" Visible="False"
                                VisibleIndex="23">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Propietario" Visible="False"
                                VisibleIndex="24">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Sector" Visible="False" VisibleIndex="25">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="GTIN13" Visible="False" VisibleIndex="26">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="TipoDocumento" Visible="False"
                                VisibleIndex="27">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Reception_DocNumber" Visible="False"
                                VisibleIndex="28">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Almacen" Visible="False" VisibleIndex="29">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridDateRow Caption="Fecha Produccion"
                                FieldName="Package_ProductionDate" VisibleIndex="30">
                            </dx:VerticalGridDateRow>
                            <dx:VerticalGridDateRow Caption="Fecha Vencimiento"
                                FieldName="Package_ExpiresDate" VisibleIndex="31">
                            </dx:VerticalGridDateRow>
                            <dx:VerticalGridTextRow Caption="Lote Proveedor" FieldName="Info1"
                                VisibleIndex="33">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Info2" VisibleIndex="34">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Cuenta" Visible="False" VisibleIndex="35">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_PN" Visible="False"
                                VisibleIndex="36">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_Barcode" Visible="False"
                                VisibleIndex="37">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_QuantityInitial" Visible="False"
                                VisibleIndex="38">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_NetWeightInitial" Visible="False"
                                VisibleIndex="39">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_NetWeight" Visible="False"
                                VisibleIndex="40">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_GrossWeightInitial" Visible="False"
                                VisibleIndex="41">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_GrossWeight" Visible="False"
                                VisibleIndex="42">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_SSCCParent" Visible="False"
                                VisibleIndex="43">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_Height" Visible="False"
                                VisibleIndex="44">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Package_Mixed" Visible="False"
                                VisibleIndex="45">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridDateRow FieldName="Package_InDate" Visible="False"
                                VisibleIndex="46">
                            </dx:VerticalGridDateRow>
                            <dx:VerticalGridDateRow FieldName="Package_OutDate" Visible="False"
                                VisibleIndex="47">
                            </dx:VerticalGridDateRow>
                            <dx:VerticalGridTextRow FieldName="Package_Reserve" Visible="False"
                                VisibleIndex="48">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Hijos" Visible="False" VisibleIndex="49">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Disponibilidad" Visible="False"
                                VisibleIndex="50">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="KDisponible" Visible="False"
                                VisibleIndex="51">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="KUnitario" Visible="False" VisibleIndex="52">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="ArticleProvider_GTIN14" Visible="False"
                                VisibleIndex="53">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="InputType_Description" Visible="False"
                                VisibleIndex="54">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Trucks_Plate" Visible="False"
                                VisibleIndex="55">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="Trucker_Name" Visible="False"
                                VisibleIndex="56">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridDateRow FieldName="AccessControl_DateIn" Visible="False"
                                VisibleIndex="57">
                            </dx:VerticalGridDateRow>
                            <dx:VerticalGridTextRow FieldName="AccessControl_Documents" Visible="False"
                                VisibleIndex="58">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridComboBoxRow Caption="Estado" FieldName="Package_Status"
                                VisibleIndex="15">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="En Proceso Recepcion" Value="1" />
                                        <dx:ListEditItem Text="Recepcionado X Posicionar" Value="2" />
                                        <dx:ListEditItem Text="Disponible" Value="3" />
                                        <dx:ListEditItem Text="Despachado" Value="7" />
                                        <dx:ListEditItem Text="Convertido a unidades" Value="8" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:VerticalGridComboBoxRow>
                            <dx:VerticalGridTextRow FieldName="Origen" VisibleIndex="32">
                            </dx:VerticalGridTextRow>
                            <dx:VerticalGridTextRow FieldName="EstadoPallet" VisibleIndex="16">
                            </dx:VerticalGridTextRow>
                        </Rows>
                        <SettingsPager Mode="ShowPager"></SettingsPager>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                    </dx:ASPxVerticalGrid>
                    <asp:LinqDataSource ID="LqDsBusqueda" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="ViewTrazabilidadBusqueda" Where="Package_SSCC == @Package_SSCC">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="txt_pallet" DefaultValue="-1"
                                Name="Package_SSCC" PropertyName="Text" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>        
        </table>
    </div>
    <br />
    <div>
        <table>
            
            <tr>
                <td colspan="3">Detalle Movimientos</td>
            </tr>
            <tr>
                <td colspan="3">
                    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsTrazabilidad">
                        <SettingsPager AlwaysShowPager="True" PageSize="10000">
                        </SettingsPager>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Package_Id" Visible="False"
                                VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Entidad" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Operacion" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Folio" FieldName="IDentidad"
                                VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Documento" FieldName="Tipo"
                                VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ndocumento" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="Staff_Name"
                                VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Fecha" FieldName="fecha" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Company_Id" Visible="False"
                                VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Package_ProductionDate" Visible="False"
                                VisibleIndex="10">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="Package_ExpiresDate" Visible="False"
                                VisibleIndex="11">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_SN" Visible="False"
                                VisibleIndex="12">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_SSCC" Visible="False"
                                VisibleIndex="13">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_PN" Visible="False"
                                VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Barcode" Visible="False"
                                VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Lot" Visible="False"
                                VisibleIndex="16">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Business_Partner_Name" Visible="False"
                                VisibleIndex="17">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Business_Partner_CId" Visible="False"
                                VisibleIndex="18">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Supportive_Description" Visible="False"
                                VisibleIndex="19">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Article_Description" Visible="False"
                                VisibleIndex="20">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Quantity" Visible="False"
                                VisibleIndex="21">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsTrazabilidad" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        OrderBy="fecha" TableName="RPTtrazabilidadSoportante"
                        Where="Package_SSCC == @Package_SSCC">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="txt_pallet" DefaultValue="-1"
                                Name="Package_SSCC" PropertyName="Text" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <table>
                <tr>
                <td colspan="3">Detalle Reserva</td>
            </tr>
            <tr>
                <td colspan="3">
                    <dx:ASPxGridView ID="GvReserva" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsReserva">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="SSCC" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Operacion" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Folio" FieldName="ID" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Estado" Visible="False" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Id" Visible="False"
                                VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="Staff_Name"
                                VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_Quantity"
                                VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cantidad Reservada"
                                FieldName="Package_ReserveQuantity" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsReserva" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="CVT_VW_BultoConReserva" Where="SSCC == @SSCC">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="txt_pallet" DefaultValue="-1" Name="SSCC"
                                PropertyName="Text" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
