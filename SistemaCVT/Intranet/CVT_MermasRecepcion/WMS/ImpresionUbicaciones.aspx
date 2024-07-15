<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ImpresionUbicaciones.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.ImpresionUbicaciones" %>

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
        <a href="#">IMPRESION ETIQUETA INDIVIDUAL</a>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Codigo:">
                    </dx:ASPxLabel>
                </td>
                <td></td>
                <td>
                    <dx:ASPxTextBox ID="txt_nUbicacion" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="imp1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btn_imprimir" runat="server" OnClick="btn_imprimir_Click"
                        Text="Imprimir" ValidationGroup="imp1">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
        <a href="#"> IMPRESION ETIQUETAS POR COLUMNA</a>
        <table>
    <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Pasillo:">
            </dx:ASPxLabel>
        </td>
        <td></td>
        <td>
            <dx:ASPxTextBox ID="txt_pasillo" runat="server" Width="170px" Height="30px">
                <ValidationSettings Display="Dynamic" ValidationGroup="imp2">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>
        </td>
    </tr>
    <tr>
        <td>
    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Columna:">
    </dx:ASPxLabel>
</td>
<td></td>
<td>
    <dx:ASPxTextBox ID="txt_columna" runat="server" Width="170px" Height="30px">
        <ValidationSettings Display="Dynamic" ValidationGroup="imp2">
            <RequiredField IsRequired="True" />
        </ValidationSettings>
    </dx:ASPxTextBox>
</td>
    </tr>
    <tr>
        <td>
    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Bodega:">
    </dx:ASPxLabel>
</td>
<td></td>
<td>
    <dx:ASPxComboBox ID="cbo_site" runat="server" DataSourceID="LqDsSite" TextField="Site_ShortDescription" ValueField="Site_ShortDescription">
        <ValidationSettings ValidationGroup="imp2">
            <RequiredField IsRequired="True" />
        </ValidationSettings>
    </dx:ASPxComboBox>
    <asp:LinqDataSource ID="LqDsSite" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Site_ShortDescription)" TableName="Site">
    </asp:LinqDataSource>
</td>
    </tr>
    <tr>
        <td></td>
        <td>
            <dx:ASPxButton ID="bt_imprimirmasivo" runat="server" OnClick="btn_imprimirMasivo_Click"
                Text="Imprimir" ValidationGroup="imp2">
            </dx:ASPxButton>
        </td>
    </tr>
</table>

    </div>
</asp:Content>
