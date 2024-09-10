<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="EntradaInsumos.aspx.cs" Inherits="CVT_MermasRecepcion.Insumos.EntradaInsumos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Insumos</a></li>
            <li><span id="current">Entrada de Insumos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Entrada de Insumos</span>
        <span class="tab-end"></span>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N Orden de Compra"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_docnumOC" runat="server" Width="170px"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_BuscarOC" runat="server" Text="BUSCAR" OnClick="btn_BuscarOC_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatosOCSAP" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsDatosOCSAP">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="DocEntry" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CardCode" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CardName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocNum" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LineNum" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Dscription" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OpenQty" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsDatosOCSAP" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_OCxRecepcionar" Where="DocNum == @DocNum">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_docnumOC" DefaultValue="0" Name="DocNum" PropertyName="Text" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Si es la OC correcta, seleccione almacen donde sera recepcionada, presione Recepcionar para cargar pantalla donde debera ingresar los insumos recepcionados"></asp:Label>
        <dx:ASPxComboBox ID="cbo_Bodega" runat="server">
            <Items>
                <dx:ListEditItem Text="Bodega Insumos" Value="CV400" />
                <dx:ListEditItem Text="Bodega Agricola" Value="CVAGRI" />
                <dx:ListEditItem Text="Bodega Aseo" Value="CVASEO" />
                <dx:ListEditItem Text="Bodega Mantencion" Value="CVMANT" />
            </Items>
        </dx:ASPxComboBox>
        <dx:ASPxButton ID="btn_recepcionar" runat="server" Text="RECEPCIONAR" OnClick="btn_recepcionar_Click"></dx:ASPxButton>
    </div>
    <div>
        <dx:ASPxGridView ID="GvRecepOCEnc" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsRecepOCEnc" KeyFieldName="EntradaInsumos_ID">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EntradaInsumos_ID" VisibleIndex="0" Caption="Folio">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OC" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsRecepOCEnc" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_EntradaInsumos" Where="EntradaInsumos_ID == @EntradaInsumos_ID">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="EntradaInsumos_ID" SessionField="EntradaInsumosID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div>
        <dx:ASPxGridView ID="GvRecepOC" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsRecepOC" KeyFieldName="EntradaInsumosDetalle_ID">
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <SettingsDataSecurity AllowInsert="False" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="EntradaInsumos_ID" VisibleIndex="0" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EntradaInsumosDetalle_ID" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocEntry" VisibleIndex="2" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CardCode" VisibleIndex="3" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CardName" VisibleIndex="4" Caption="Proveedor">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocNum" VisibleIndex="5" Caption="OC">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LineNum" VisibleIndex="6" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="7" Caption="Cod Articulo">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Dscription" VisibleIndex="8" Caption="Articulo">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="9" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OpenQty" VisibleIndex="10" Caption="Cantidad Pendiente">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega" VisibleIndex="11">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantRecepcionar" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsRecepOC" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_EntradaInsumosDetalle" Where="EntradaInsumos_ID == @EntradaInsumos_ID">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="EntradaInsumos_ID" SessionField="EntradaInsumosID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div>
        <dx:ASPxButton ID="btn_Grabar" runat="server" Text="SINCRONIZAR CON SAP" OnClick="btn_Grabar_Click"></dx:ASPxButton>
    </div>
</asp:Content>
