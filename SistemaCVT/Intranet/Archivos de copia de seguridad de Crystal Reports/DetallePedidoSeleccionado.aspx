<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DetallePedidoSeleccionado.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.DetallePedidoSeleccionado" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 28px;
        }

        .auto-style2 {
            width: 79px;
            height: 46px;
        }

        .auto-style3 {
            width: 93px;
            height: 46px;
        }

        .auto-style5 {
            width: 112px;
        }

        .auto-style6 {
            width: 67px;
        }

        .auto-style7 {
            height: 46px;
        }

        .auto-style8 {
            width: 226px;
        }
        .auto-style9 {
            width: 130px;
        }
        .auto-style10 {
            width: 91px;
        }
        .auto-style11 {
            width: 180px;
        }
        .auto-style14 {
            width: 257px;
        }
        .auto-style15 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Logistica</a></li>
            <li><a href="SeleccionPedidos.aspx">Seleccion Pedido</a></li>
            <li><span id="current">Detalle Pedido</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Pedido</span>
        <span class="tab-end"></span>
           <div id="options">
            <%--<a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
              <a>
                  <asp:ImageButton ID="cmdBack" runat="server"
                      ImageUrl="~/Images/back.png" OnClick="cmdNew_Click" Style="width: 16px" />Volver</a>
        </div>
    </div>
    <br />
    <div style="padding-left: 15px">
        <table>
            <tr>
                <td>
                    <label>Pedido</label>
                </td>
                <td class="auto-style1">
                    <br />
                </td>
                <td>
                    <dx:ASPxButton ID="btn_buscar" runat="server" Text="Ver Productos" OnClick="btn_buscar_Click"></dx:ASPxButton>
                </td>
                <td class="auto-style15">

                </td>
                <td>
                    <asp:Label ID="Label17" runat="server" Text="Pallet Mixto "></asp:Label>
                </td>
                <td>

                </td>
                <td>
                    <dx:ASPxButton ID="btnMixto" runat="server" Text="Crear Pallet Mixto" OnClick="btnMixto_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvPedido" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPedidos" KeyFieldName="DocEntry" OnRowCommand="GvPedido_RowCommand">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="DocEntry" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PedSAP" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cliente" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DirDespacho" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FecDocto" Visible="False" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FecDespacho" Visible="False" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="IndFacturado" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Indvuelta" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoTotal" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoPendiente" Visible="False" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Pallets Pedido" VisibleIndex="15">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetallePalletizado" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>                          
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:LinqDataSource ID="LqsPedidos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_Pedidos_Despacho" Where="DocEntry == @DocEntry">
        <WhereParameters>
            <asp:SessionParameter Name="DocEntry" SessionField="DocEntry" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <br />
    <div style="padding-left: 15px">
        <table>
            <tr>
                <td>
                    <label>Detalle de Pedidos</label>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
    </div>
    <div>
        <dx:ASPxGridView ID="Gvdatos" runat="server" AutoGenerateColumns="False" OnRowCommand="Gvdatos_RowCommand" KeyFieldName="DocEntry;Linea;CodProd;Producto;Cantidad;QPalletizado;QPallets;PesoQPendiente">
            <Columns>
                <dx:GridViewDataTextColumn Caption="N° Linea" FieldName="Linea" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProd" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Pedido" FieldName="Cantidad" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Palletizada" FieldName="QPalletizado" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Pallets" FieldName="QPallets" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Peso Cant.Pendiente" FieldName="PesoQPendiente" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocEntry" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Palletizar" VisibleIndex="15">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <div>
        <dx:ASPxPopupControl ID="Pop1" runat="server" PopupAction="None" PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" Width="804px" AllowDragging="True" CloseAction="None">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div style="margin-left: 25px">
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
                                        <dx:ASPxTextBox ID="txtCorridas" runat="server" Width="68px" Height="18px" AutoPostBack="True" OnTextChanged="txtCorridas_TextChanged">
                                            <ValidationSettings>
                                                <RegularExpression ErrorText="numeros" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style7">
                                        <asp:Label ID="Label4" runat="server" Text="Indicaciones uso Pallet"></asp:Label>
                                        <dx:ASPxTextBox ID="txtIndicaciones" runat="server" Width="350px" Height="23px"></dx:ASPxTextBox>
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
                                        <dx:ASPxTextBox ID="txtObsEntrega" runat="server" Width="534px" Height="24px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label6" runat="server" Text="Liberar Pallets incompletos"></asp:Label>
                                        <dx:ASPxCheckBox ID="ChkLiberaPallet" runat="server" AutoPostBack="True" OnCheckedChanged="ChkLiberaPallet_CheckedChanged"></dx:ASPxCheckBox>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="Label7" runat="server" Text="Forzar Cantidad de pallets"></asp:Label>
                                        <dx:ASPxCheckBox ID="ChkForzarPallet" runat="server" AutoPostBack="True" OnCheckedChanged="ChkForzarPallet_CheckedChanged"></dx:ASPxCheckBox>
                                    </td>
                                    <td>
                                        <asp:Label ID="lbllib" runat="server" Text="cantidad Pallets liberar" ></asp:Label>
                                        <asp:TextBox ID="txtCanLibera" runat="server" AutoPostBack="True" OnTextChanged="txtCanLibera_TextChanged"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label8" runat="server" Text="Cantidad Pallets Final: " Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblCantPalletsItem" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label9" runat="server" Text="Peso Total Aprox: " Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPesoTaprox" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                  <tr>
                                    <td>
                                        <asp:Label ID="Label10" runat="server" Text="Peso Aprox. x Pallet: " Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPesoAproxPallet" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                                     <tr>
                                    <td>
                                        <asp:Label ID="Label11" runat="server" Text="Volumen Aprox. x Pallet: " Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblVolAproxPallet" runat="server" Text="" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:Label ID="Label12" runat="server" Text="Pedido"></asp:Label>                                        
                                    </td>   
                                    <td class="auto-style10">
                                        <asp:Label ID="Label13" runat="server" Text="Linea"></asp:Label>                                        
                                    </td>
                                       <td class="auto-style11">
                                        <asp:Label ID="Label14" runat="server" Text="Producto"></asp:Label>                                        
                                    </td> 
                                        <td class="auto-style14">
                                        <asp:Label ID="Label15" runat="server" Text=""></asp:Label>                                        
                                    </td> 
                                        <td>
                                        <asp:Label ID="Label16" runat="server" Text="Cantidad"></asp:Label>                                        
                                    </td>    
                                                                     
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                         <asp:TextBox ID="txtNPedido" runat="server" Width="102px" ReadOnly="True"></asp:TextBox>
                                    </td>
                                       <td class="auto-style10">
                                         <asp:TextBox ID="txtNlinea" runat="server" Width="71px" ReadOnly="True"></asp:TextBox>
                                    </td> 
                                         <td class="auto-style11">
                                         <asp:TextBox ID="txtCodProducto" runat="server" Width="157px" ReadOnly="True"></asp:TextBox>
                                    </td> 
                                           <td class="auto-style14">
                                         <asp:TextBox ID="txtDescProducto" runat="server" Width="250px" ReadOnly="True"></asp:TextBox>
                                    </td> 
                                         <td>
                                         <asp:TextBox ID="txtCantidadPro" runat="server" Width="74px" ReadOnly="True"></asp:TextBox>
                                    </td> 
                                </tr>
                            </table>
                        </div>
                        <br />
                        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblVoltotal" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <br />
                        <div style="margin-left: 200px">
                            <table>
                                <tr>
                                    <td class="auto-style5">
                                        <dx:ASPxButton ID="btnSalir" runat="server" Text="Salir" Height="28px" Width="114px" OnClick="btnSalir_Click" CausesValidation="False"></dx:ASPxButton>
                                    </td>
                                    <td class="auto-style6"></td>
                                    <td>
                                        <dx:ASPxButton ID="btnConfirmar" runat="server" Text="Confirmar" Height="28px" Width="114px" OnClick="btnConfirmar_Click"></dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <br />
    <br />

</asp:Content>
