﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ImpresionUbicaciones.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.ImpresionUbicaciones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Impresion Ubicaciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Impresion Ubicacion</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Codigo:">
                    </dx:ASPxLabel>
                </td>
                <td></td>
                <td>
                    <dx:ASPxTextBox ID="txt_nUbicacion" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btn_imprimir" runat="server" OnClick="btn_imprimir_Click"
                        Text="Imprimir">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
