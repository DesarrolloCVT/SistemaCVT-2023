<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformesTrazabilidad.aspx.cs" Inherits="CVT_MermasRecepcion.Trazabilidad.InformesTrazabilidad" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
            <ul>
                <li><a href="../Blank.aspx">Inicio</a></li>
                <li><a>Trazabilidad</a></li>
                <li><span id="current">Informes Trazabilidad</span></li>
            </ul>
        </div>

        <div id="tableHeader">
            <span class="tableTitle">Informes Trazabilidad</span>
            <span class="tab-end"></span>
        </div>
    <div>
        <table>
            <tr>
                <td colspan="2">
                    Consumibles por OF
                </td>
            </tr>
            <tr>
                <td>OF</td>
                <td><dx:ASPxTextBox ID="txt_OFConsumiblesxOF" runat="server" Width="170px"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_InfConsumiblesxOF" runat="server" Text="Generar" OnClick="btn_InfConsumiblesxOF_Click"></dx:ASPxButton>
                </td>
            </tr>
            
            
        </table>
    </div>
</asp:Content>
