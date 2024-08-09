<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ProductoBloqueadoDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.BloqueoProducto.ProductoBloqueadoDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            width: 162px;
            height: 43px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Bloqueo Productos</a></li>
            <li><span id="current">Productos Bloqueados</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Productos Bloqueados Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <a style="margin-left: 50px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Height="27px" Width="33px" />
                volver</a>&nbsp;
     
        </div>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtLote" runat="server" Width="170px" Caption="Lote" Height="30px" SelectInputTextOnClick="True" Theme="iOS">
                        <CaptionSettings Position="Top" />
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxTextBox ID="txtRecepcion" runat="server" Width="170px" Caption="N° Recepcion" Height="30px" SelectInputTextOnClick="True" Theme="iOS">
                        <CaptionSettings Position="Top" />
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtNPallet" runat="server" Width="170px" Caption="N° Pallet" Height="30px" SelectInputTextOnClick="True" Theme="iOS">
                        <CaptionSettings Position="Top" />
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxComboBox ID="cboCodProd" runat="server" Caption="Cod.Producto" Height="30px" Width="400px" Theme="iOS" DataSourceID="LqDsProducto" ValueField="ArticleProvider_CodClient">
                        <Columns>
                            <dx:ListBoxColumn Caption="Codigo" FieldName="ArticleProvider_CodClient">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="ArticleProvider_Description" Width="400px">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                        <CaptionSettings Position="Top" VerticalAlign="Middle" />
                    </dx:ASPxComboBox>
                </td>
            </tr>
        </table>
        <asp:LinqDataSource ID="LqDsProducto" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="ArticleProvider" Where="ArticleProvider_Status == @ArticleProvider_Status" Select="new (ArticleProvider_CodClient, ArticleProvider_Description)">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="ArticleProvider_Status" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div style="margin-left: 150px" class="auto-style6">
        <dx:ASPxButton ID="btnFiltrar" runat="server" Text="Filtrar" Height="38px" Theme="iOS" Width="157px" OnClick="btnFiltrar_Click"></dx:ASPxButton>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvFiltroBpDetalle" runat="server" AutoGenerateColumns="False"
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
                <dx:GridViewDataTextColumn Caption="Codigo Producto"
                    FieldName="CodProducto" ShowInCustomizationForm="True"
                    VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="DescProducto" ShowInCustomizationForm="True"
                    VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="NumPallet"
                    ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_Id" ShowInCustomizationForm="True"
                    Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Posicion"
                    FieldName="Ubicacion" ShowInCustomizationForm="True"
                    VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Bodega"
                    ShowInCustomizationForm="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Cantidad"
                    ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lote" FieldName="Lote"
                    ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EstadoReserva" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <br />
    <div style="margin-left: 150px">
        <dx:ASPxButton ID="btnAgregar" runat="server" Text="AGREGAR" Height="47px" Theme="iOS" Width="240px" OnClick="btnAgregar_Click"></dx:ASPxButton>
    </div>
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxButton ID="btnQuitarTodos" runat="server" Text="Quitar todos" Height="35px" Theme="iOS" Width="197px" BackColor="Red" OnClick="btnQuitarTodos_Click"></dx:ASPxButton>
    </div>

    <div>
        <dx:ASPxGridView ID="GvDatosProdBloqDetalle" runat="server" AutoGenerateColumns="False" DataSourceID="LqsProdBloqDetalle" KeyFieldName="Id_ProdBloqDetalle;Id_package" OnRowCommand="GvDatosProdBloqDetalle_RowCommand" OnHtmlRowCreated="GvDatosProdBloqDetalle_HtmlRowCreated">
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id_ProdBloqueado" Visible="False" VisibleIndex="0" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_package" Visible="False" VisibleIndex="1" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_SSCC" VisibleIndex="3" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="CodProd" FieldName="ArticleProvider_CodClient" VisibleIndex="4" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto" FieldName="ArticleProvider_Description" VisibleIndex="5" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ubicacion" ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:ImageButton ID="Eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                  <dx:GridViewDataHyperLinkColumn Caption="Liberar" VisibleIndex="10">
                    <DataItemTemplate>
                        <asp:ImageButton ID="liberar" CommandName="cmdLiberar" runat="server" ImageUrl="~/Images/ico-vigente.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_Quantity" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_ProdBloqDetalle" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsProdBloqDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_Detalle_ProductoBloqueado" Where="Id_ProdBloqueado == @Id_ProdBloqueado">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_ProdBloqueado" SessionField="IdProdBloqueado" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
