<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMGeneradorEtiquetas.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaProduccion.SMMGeneradorEtiquetas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 15px;
        }

        .auto-style7 {
            width: 236px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Etiquetas Produccion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Etiquetado Produccion</span>
        <span class="tab-end"></span>
        <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Orden Fabricacion" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_of" runat="server" AutoPostBack="True"
                        DataSourceID="LqDsOF" ValueField="OF" Width="300px" Height="30px" OnSelectedIndexChanged="cbo_of_SelectedIndexChanged">
                        <Columns>
                            <dx:ListBoxColumn FieldName="OF">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="CodProducto">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Producto" Width="450px">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cantidad Cajas" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_cantidad" runat="server" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ValidationExpression="^([0-9])*$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Linea" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboLinea" runat="server" Width="80px" Height="30px">
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>

            </tr>
        </table>
        <asp:LinqDataSource ID="LqDsOF" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName=""
            TableName="SMM_VW_ListaOFLiberadas" OrderBy="OF">
        </asp:LinqDataSource>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbl_bultos" runat="server" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_producto" runat="server" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_cantidad" runat="server" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbl_lote" runat="server" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_codproducto" runat="server" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_producido" runat="server" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 150px">
        <dx:ASPxButton ID="btn_generar" runat="server" Text="AGREGAR" Height="50px" OnClick="btn_generar_Click" Width="200px" Theme="Glass">
        </dx:ASPxButton>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsPackage" KeyFieldName="Package_Id" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager AlwaysShowPager="True" EnableAdaptivity="True"
                Mode="ShowAllRecords" PageSize="100000000">
            </SettingsPager>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
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
                <dx:GridViewDataTextColumn FieldName="Package_Id" ReadOnly="True" Visible="False" VisibleIndex="8">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Id" Visible="False" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="1" Caption="CodProducto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_QuantityInitial" Visible="False" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Quantity" VisibleIndex="3" Caption="Cantidad">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Status" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N° Pallet" FieldName="Package_SSCC" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Lot" VisibleIndex="4" Caption="Lote">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="F.Produccion"
                    FieldName="Package_ProductionDate"
                    VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="F.Vencimiento"
                    FieldName="Package_ExpiresDate"
                    VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Package_InDate" Visible="False" VisibleIndex="12">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Package_OutDate" Visible="False" VisibleIndex="13">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Package_SN" Visible="False" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_ReserveQuantity" Visible="False" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Data1" Visible="False" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Data2" Visible="False" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto" FieldName="ItemCode" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsProducto" TextField="ItemName" ValueField="ItemCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Posicion" FieldName="Layout_Id" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqDsLayout" TextField="Layout_Description" ValueField="Layout_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsPackage" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            TableName="SMM_Package" Where="Package_Lot == @Package_Lot">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Package_Lot" SessionField="LoteOF"
                    Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsLayout" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            TableName="SMM_Layout">
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="LqDsProducto" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName=""
            TableName="MMetro_OITM">
        </asp:LinqDataSource>

    </div>
</asp:Content>
