<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMRepaletizado.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMRepaletizado" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul class="auto-style5">
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>SMM</a></li>
            <li><span id="current">SMM Repaletizado</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">SMM Repaletizado</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />

    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° de Pallet" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxTextBox ID="txtPalletOrigen" runat="server" Width="170px" Height="30px" OnTextChanged="txtPalletOrigen_TextChanged" AutoPostBack="True"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td class="auto-style6">
                    <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red"
                        Text="N de pallet no existe o no posicionado" Visible="False">
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
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="CodProducto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_codproducto" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_producto" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Lote" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_lote" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Cantidad" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="lbl_cantidad" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
              <tr>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Unidad Medida" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="lblUnidadMedida" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Bodega" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lblBodega" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Pallet" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style11"></td>
                <td>
                    <dx:ASPxRadioButtonList ID="chk_tipo" runat="server" ValueType="System.String" RepeatDirection="Horizontal"
                         Font-Size="Medium" Border-BorderStyle="None" Theme="MaterialCompact" AutoPostBack="True" OnSelectedIndexChanged="chk_tipo_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="Nuevo" Value="0" />
                            <dx:ListEditItem Text="Existente" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td class="auto-style13">
                    <dx:ASPxLabel ID="lbl_destino" runat="server" Text="N° Destino" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style10"></td>
                <td class="auto-style13">
                    <dx:ASPxTextBox ID="txt_destino" runat="server" Width="170px"
                        Font-Size="Medium" Height="30px" AutoPostBack="True" OnTextChanged="txt_destino_TextChanged">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style12"></td>
                <td class="auto-style12">
                    <dx:ASPxLabel ID="lbl_compatible" runat="server" ForeColor="Black"
                        Visible="False">
                    </dx:ASPxLabel>
                    <dx:ASPxLabel ID="lbl_error0" runat="server" ForeColor="Red"
                        Text="N de pallet no existe o no posicionado" Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px" id="dvDat" runat="server" visible="false">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="CodProducto"
                        ClientInstanceName="ASPxLabel10" Font-Size="Medium" Font-Bold="true">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_dcodproducto" runat="server"
                        ClientInstanceName="lbl_dcodproducto">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Producto" Font-Size="Medium" Font-Bold="true">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lbl_dproducto" runat="server"
                        ClientInstanceName="lbl_dproducto">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Lote" Font-Size="Medium" Font-Bold="true">
                    </dx:ASPxLabel>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="lbl_dlote" runat="server" ClientInstanceName="lbl_dlote">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Cantidad" Font-Size="Medium" Font-Bold="true">
                    </dx:ASPxLabel>
                </td>
                <td></td>
                <td class="style2">
                    <dx:ASPxLabel ID="lbl_dcantidad" runat="server"
                        ClientInstanceName="lbl_dcantidad">
                    </dx:ASPxLabel>
                </td>
            </tr>
               <tr>
                <td class="style2">
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Unidad Medida" Font-Size="Medium" Font-Bold="true">
                    </dx:ASPxLabel>
                </td>
                <td></td>
                <td class="style2">
                    <dx:ASPxLabel ID="lbldUnidadMedida" runat="server"
                        ClientInstanceName="lblUnidadMedida">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbldBod" runat="server" Text="Bodega" Font-Size="Medium" Font-Bold="true">
                    </dx:ASPxLabel>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="lbl_dBodega" runat="server" ClientInstanceName="lbl_dBodega">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbl_cantrepaletizar" runat="server" Font-Bold="True"
                        Font-Size="Medium" Text="Cantidad a Repaletizar">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxTextBox ID="txt_cantidad" runat="server" Font-Size="Medium"
                        Height="30px" Width="170px" Enabled="false" AutoPostBack="True" OnTextChanged="txt_cantidad_TextChanged">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left:25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxButton ID="btnGenerar" runat="server" Text="GENERAR" Height="46px" Theme="MaterialCompact" Width="137px" Enabled="false" OnClick="btnGenerar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
