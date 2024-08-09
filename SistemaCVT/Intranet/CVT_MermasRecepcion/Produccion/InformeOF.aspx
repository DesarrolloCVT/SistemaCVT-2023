<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeOF.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.InformeOF" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 201px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
 <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Produccion</a></li>
        <li><span id="current">Informe OF</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Informe OF</span>
    <span class="tab-end"></span>
    </div>
    <table class="dxeBinImgCPnlSys">
        <tr>
            <td>
                <dx:ASPxLabel runat="server" Text="Orden Fabricacion" ID="ASPxLabel1"></dx:ASPxLabel>

            </td>
            <td colspan="2">

                <dx:ASPxComboBox runat="server" DataSourceID="LqDsOF" ValueField="OF" 
                    Width="300px" ID="cbo_of"><Columns>
<dx:ListBoxColumn FieldName="OF"></dx:ListBoxColumn>
<dx:ListBoxColumn FieldName="CodProducto"></dx:ListBoxColumn>
<dx:ListBoxColumn FieldName="Producto"></dx:ListBoxColumn>
</Columns>

<ValidationSettings ValidationGroup="a">
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
</dx:ASPxComboBox>

                <asp:LinqDataSource runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" OrderBy="OF" 
                    TableName="CVT_LISTADO_OF" EntityTypeName="" ID="LqDsOF"></asp:LinqDataSource>

                </td>
            <td>
                <dx:ASPxButton ID="btn_Generar" runat="server" onclick="btn_Generar_Click" 
                    Text="Generar">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lbl_producto"></dx:ASPxLabel>

            </td>
            <td>
                <dx:ASPxLabel runat="server" ID="lbl_codproducto"></dx:ASPxLabel>

            </td>
            <td>
                <dx:ASPxLabel runat="server" ID="lbl_lote"></dx:ASPxLabel>

            </td>
            <td>
                <dx:ASPxLabel runat="server" ID="lbl_bultos"></dx:ASPxLabel>

            </td>
        </tr>
        <tr>
            <td colspan="4">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="DETALLE POR LINEA">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style1" colspan="4">
                <dx:ASPxGridView ID="GvLineas" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LqDsDetalleLinea">
                    <SettingsPager Visible="False">
                    </SettingsPager>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CantidadPallet" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Lot" Visible="False" 
                            VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Linea N" FieldName="Package_Barcode" 
                            VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDsDetalleLinea" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
                    TableName="CVT_PalletOFLinea" Where="Package_Lot == @Package_Lot">
                    <WhereParameters>
                        <asp:SessionParameter DefaultValue="0" Name="Package_Lot" SessionField="LoteOF" 
                            Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                DETALLE GENERAL</td>
        </tr>
        <tr>
            <td colspan="4">
                <dx:ASPxGridView ID="GvDetalle" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LqDsDetalle">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC" 
                            ReadOnly="True" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Cantidad" 
                            FieldName="Package_QuantityInitial" ReadOnly="True" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Linea" FieldName="Package_Barcode" 
                            ReadOnly="True" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Lot" ReadOnly="True" 
                            Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Fecha Produccion" 
                            FieldName="Package_ProductionDate" ReadOnly="True" VisibleIndex="4">
                            <PropertiesDateEdit DisplayFormatString="dd-MM-yy HH:mm">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDsDetalle" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
                    OrderBy="Package_Barcode, Package_ProductionDate" 
                    Select="new (Package_SSCC, Package_QuantityInitial, Package_Barcode, Package_Lot, Package_ProductionDate)" 
                    TableName="Package" Where="Package_Lot == @Package_Lot">
                    <WhereParameters>
                        <asp:SessionParameter DefaultValue="0" Name="Package_Lot" SessionField="LoteOF" 
                            Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
