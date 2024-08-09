<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ExpedicionPorProducto.aspx.cs" Inherits="CVT_MermasRecepcion.Trazabilidad.ExpedicionPorProducto" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Trazabilidad</a></li>
            <li><span id="current">Expediciones por Producto</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Expediciones por Producto</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <label>N° Expedicion</label>
                    <dx:ASPxTextBox ID="txtNExpedicion" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="Imp1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <label>Cod.Producto</label>
                    <dx:ASPxTextBox ID="txtCodProducto" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="Imp1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <label>Lote</label>
                    <dx:ASPxTextBox ID="txtLote" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="Imp1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" Height="53px" Width="87px" OnClick="btn_Buscar_Click" ValidationGroup="imp1"></dx:ASPxButton>
                </td>
            </tr>
        </table>
        <table>
    <tr>
       
        <td>
            <label>Cod.Producto</label>
            <dx:ASPxTextBox ID="txt_prodMasivo" runat="server" Width="170px" Height="30px">
                <ValidationSettings Display="Dynamic" ValidationGroup="imp2">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </td>
        <td class="auto-style5"></td>
        <td>
            <label>Lote</label>
            <dx:ASPxTextBox ID="txt_lotemasivo" runat="server" Width="170px" Height="30px">
                <ValidationSettings Display="Dynamic" ValidationGroup="imp2">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </td>
        <td class="auto-style5"></td>
        <td>
            <dx:ASPxButton ID="bt_buscarmasivo" runat="server" Text="Buscar" Height="53px" Width="87px" OnClick="btn_BuscarMasivo_Click" ValidationGroup="imp2"></dx:ASPxButton>
        </td>
    </tr>
</table>
    </div>
</asp:Content>
