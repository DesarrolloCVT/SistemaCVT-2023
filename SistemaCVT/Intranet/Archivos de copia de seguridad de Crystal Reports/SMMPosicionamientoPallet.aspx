<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMPosicionamientoPallet.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMPosicionamientoPallet" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>POSICIONAMIENTO</a></li>
            <li><span id="current">SMM Posicionamiento</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">SMM Posicionamiento</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
        <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbl1" runat="server" Text="N° Pallet"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNPallet" runat="server" Width="170px" Height="30px" OnTextChanged="txtNPallet_TextChanged" AutoPostBack="True"></dx:ASPxTextBox>
                    <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red"
                        Text="N de pallet no existe" Visible="False">
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
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="CodProducto:"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblCodProd" runat="server" Text=""></dx:ASPxLabel>
                </td>

            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Producto:"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblProducto" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Lote:"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblLote" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cantidad:"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblCantidad" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Ubicacion:"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblUbicacion" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Bodega:"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblBodega" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
      <div style="margin-left:25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Ubicacion"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtDestino" runat="server" Width="170px" AutoPostBack="True" Height="30px" OnTextChanged="txtDestino_TextChanged"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-left:25px">
        <table>
            <tr>
                <td>
                     <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Ubicacion:"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lbl_ubicacion_nueva" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Bodega Nueva:"></dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblBodegaNueva" runat="server" Text=""></dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left:50px">
        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="37px" Width="117px" OnClick="btnGuardar_Click"></dx:ASPxButton>
    </div>
</asp:Content>
