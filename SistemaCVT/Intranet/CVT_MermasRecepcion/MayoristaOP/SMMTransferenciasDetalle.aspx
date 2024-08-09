<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMTransferenciasDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMTransferenciasDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Transferencias</span></li>
        </ul>
    </div>


    <div id="tableHeader">
        <span class="tableTitle">
            <dx:ASPxLabel ID="lbl_Encabezado" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
        </span>

        <span class="tab-end"></span>
        <div id="options">
            <%--  <a><asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"/> Exportar Excel</a>--%>
            <a style="margin-left: 50px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;
     
        </div>
    </div>
    <br />
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="AGREGAR" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Lote" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLote" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboProducto" runat="server" DataSourceID="lqsProductos" Height="30px" TextField="ItemName" ValueField="ItemCode" Width="350px">
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="lqsProductos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="MMetro_OITM">
                    </asp:LinqDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Ubicacion" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtUbicacion" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="N°Pallet" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNumPallet" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 130px" class="auto-style6">
        <dx:ASPxButton ID="btnFiltrar" runat="server" Text="Filtrar" Height="50px" Width="100px" Theme="Glass" OnClick="btnFiltrar_Click"></dx:ASPxButton>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvFiltro" runat="server" AutoGenerateColumns="False"
            KeyFieldName="Package_Id" EnableTheming="True" Theme="BlackGlass">
            <SettingsPager AlwaysShowPager="True" PageSize="1000" Visible="False">
            </SettingsPager>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page"
                    ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Id" ShowInCustomizationForm="True"
                    VisibleIndex="10" Caption="Cod Ubicacion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemCode"
                    ShowInCustomizationForm="True" VisibleIndex="5" Caption="Codigo Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="ItemName" ShowInCustomizationForm="True"
                    VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC"
                    ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_Id" ShowInCustomizationForm="True"
                    Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Posicion"
                    FieldName="Layout_Description" ShowInCustomizationForm="True"
                    VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_Description"
                    ShowInCustomizationForm="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_Quantity"
                    ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot"
                    ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Medida" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BaseUnMed" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxButton ID="btnAgregar" runat="server" Text="Agregar" Height="46px" Width="236px" OnClick="btnAgregar_Click" Theme="Glass"></dx:ASPxButton>
    </div>
    <br />
    <br />
    <div style="margin-left: 25px">
        <dx:ASPxButton ID="btnQuitarTodos" runat="server" Text="Quitar Todos" Height="30px" Theme="Glass" Width="150px" OnClick="btnQuitarTodos_Click"></dx:ASPxButton>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDetalle" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsTransferDetail" KeyFieldName="Transfer_Id;Package_Id"
            OnHtmlRowCreated="GvDetalle_HtmlRowCreated"
            OnRowCommand="GvDetalle_RowCommand" Width="100%">
            <SettingsPager AlwaysShowPager="True" EnableAdaptivity="True" PageSize="1000"
                Visible="False">
            </SettingsPager>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Transfer_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Pos. Actual"
                    FieldName="Layout_Description" ShowInCustomizationForm="True"
                    VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_Description"
                    ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod Producto"
                    FieldName="ItemCode" ShowInCustomizationForm="True"
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="ItemName" ShowInCustomizationForm="True"
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="SSCC" FieldName="Package_SSCC"
                    ShowInCustomizationForm="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot"
                    ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Fecha" FieldName="Date"
                    ShowInCustomizationForm="True" VisibleIndex="10">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Id_Actual"
                    ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_Id" ShowInCustomizationForm="True"
                    Visible="False" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="Status"
                    ShowInCustomizationForm="True" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Creada" Value="1" />
                            <dx:ListEditItem Text="Con Tarea" Value="2" />
                            <dx:ListEditItem Text="Transferido" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="17">
                    <DataItemTemplate>
                        <asp:ImageButton ID="Eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="C. Actual"
                    FieldName="Package_Quantity" ShowInCustomizationForm="True"
                    VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="F Produccion"
                    FieldName="Package_ProductionDate" ShowInCustomizationForm="True"
                    VisibleIndex="11">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataCheckColumn Caption="Confirmado" FieldName="Package_Confirm" VisibleIndex="16">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Medida" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BaseUnMed" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>

    <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" TableName="CVT_VW_TransferenciasDetalleSMM" Where="Transfer_Id == @Transfer_Id" EntityTypeName="" ID="LqDsTransferDetail"><WhereParameters>
<asp:SessionParameter SessionField="TransferId" Name="Transfer_Id" Type="Int32"></asp:SessionParameter>
</WhereParameters>
</asp:LinqDataSource>

            </asp:Content>
