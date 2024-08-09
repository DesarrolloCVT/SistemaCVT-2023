<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CreaPalletMixto.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.CreaPalletMixto" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Logistica</a></li>
            <li><a href="SeleccionPedidos.aspx">Seleccion Pedido</a></li>
            <li><a href="DetallePedidoSeleccionado.aspx">Detalle Pedido</a></li>
            <li><span id="current">Pallet Mixtos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Pallet Mixtos</span>
        <span class="tab-end"></span>
        <div id="options">
        <%--    <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
                          <a>
                              <asp:ImageButton ID="cmdBack" runat="server"
                                  ImageUrl="~/Images/back.png" OnClick="cmdNew_Click" Style="width: 16px" />Volver</a>
        </div>
    </div>
    <div style="margin-left: 25px; display: inline-block">
        <br />
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Contendor"></asp:Label>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cboContenedor" runat="server" ValueType="System.String" DataSourceID="LqsContenedores" TextField="Descripcion" ValueField="IdContenedor">
                            <ValidationSettings>
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="LqsContenedores" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Contenedores">
                        </asp:LinqDataSource>
                    </td>
                    <td></td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Id Palletizado"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtIdPalletizado" runat="server" ReadOnly="True" Width="66px" Height="23px"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Cant.Base"></asp:Label>
                        <dx:ASPxTextBox ID="txtCantBase" runat="server" Width="68px" Height="18px">
                            <ValidationSettings>
                                <RegularExpression ErrorText="numeros" ValidationExpression="\d+" />
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td class="auto-style3">
                        <asp:Label ID="Label3" runat="server" Text="Cant.Corridas"></asp:Label>
                        <dx:ASPxTextBox ID="txtCorridas" runat="server" Width="68px" Height="18px">
                            <ValidationSettings>
                                <RegularExpression ErrorText="numeros" ValidationExpression="\d+" />
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:Label ID="Label4" runat="server" Text="Indicaciones uso Pallet"></asp:Label>
                        <dx:ASPxTextBox ID="txtIndicaciones" runat="server" Width="271px" Height="23px"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Observaciones de Entrega"></asp:Label>
                        <dx:ASPxTextBox ID="txtObsEntrega" runat="server" Width="448px" Height="23px"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />

        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Cantidad Pallets Final: " Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCantPalletsItem" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="    Peso Total Aprox: " Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPesoTaprox" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Text="Peso Aprox. x Pallet: " Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPesoAproxPallet" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label11" runat="server" Text="Volumen Aprox. x Pallet: " Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblVolAproxPallet" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>

        <br />
        <br />
        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblVoltotal" runat="server" Text=""></asp:Label>

        <div style="margin-left: 200px">
            <table>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnDesarmar" runat="server" Text="Desarmar" Height="28px" Width="114px" OnClick="btnDesarmar_Click"></dx:ASPxButton>
                    </td>
                    <td class="auto-style6"></td>
                    <td>
                        <dx:ASPxButton ID="btnConfirmar" runat="server" Text="Confirmar" Height="28px" Width="114px" OnClick="btnConfirmar_Click"></dx:ASPxButton>
                    </td>

                </tr>
            </table>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatoPallMix" runat="server" AutoGenerateColumns="False" KeyFieldName="IdCont;IdContDet;Orden;CodProd;DescProd;Cantidad;Pedido;Linea" OnRowCommand="GvDatoPallMix_RowCommand" ValidateRequestMode="Enabled">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="IdCont" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IdContDet" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Orden" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DescProd" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pedido" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Linea" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProd" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Quitar" VisibleIndex="8">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdQuitar" runat="server" ImageUrl="~/Images/bloqueado.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <div style="margin-left: 250px">
        <dx:ASPxButton ID="btnver" runat="server" Text="VER PRODUCTOS" OnClick="btnver_Click" Height="35px"></dx:ASPxButton>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" KeyFieldName="DocEntry;Linea;CodProd;Producto;Cantidad;QPalletizado;QPallets;PesoQPendiente" OnRowCommand="GvDatos_RowCommand">
            <Columns>
                <dx:GridViewDataTextColumn Caption="N° Linea" FieldName="Linea" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProd" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Pedido" FieldName="Cantidad" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Palletizada" FieldName="QPalletizado" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Pallets" FieldName="QPallets" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Peso Cant.Pendiente" FieldName="PesoQPendiente" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocEntry" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Palletizar" VisibleIndex="15">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/confirm.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
</asp:Content>
