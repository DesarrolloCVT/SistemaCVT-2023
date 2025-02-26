﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ImpresionEtiquetas.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.ImpresionEtiquetas" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>WMS</a></li>
        <li><span id="current">Impresion Etiquetas</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Impresion</span>
    <span class="tab-end"></span>
</div>
<div>

    <table class="dxeBinImgCPnlSys">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxRadioButtonList ID="rb_tipo" runat="server" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Pallet" Value="1" />
                        <dx:ListEditItem Text="Recepcion" Value="2" />
                        <dx:ListEditItem Text="Transferencia" Value="3" />
                        <dx:ListEditItem Text="Ubicacion" Value="4" />
                    </Items>
                </dx:ASPxRadioButtonList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Numero:">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_npallet" runat="server" Width="170px">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_imprimir" runat="server" onclick="btn_imprimir_Click" 
                    Text="Imprimir">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>

</div>
</asp:Content>
