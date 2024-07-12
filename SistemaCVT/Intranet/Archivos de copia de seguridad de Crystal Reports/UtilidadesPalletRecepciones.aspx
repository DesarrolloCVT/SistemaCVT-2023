<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UtilidadesPalletRecepciones.aspx.cs" Inherits="CVT_MermasRecepcion.UtilidadCVT.UtilidadesPalletRecepciones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
        .auto-style6 {
            width: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Utilidades</a></li>
            <li><span id="current">Utilidades Pallets / Recepcion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Utilidades Pallets / Recepcion</span>
        <span class="tab-end"></span> 
    </div>
    <br />
    <br />
    <div style="margin-left:25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Seleciona Tarea" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTarea" runat="server" OnSelectedIndexChanged="cboTarea_SelectedIndexChanged" AutoPostBack="True" Height="25px">
                        <Items>
                            <dx:ListEditItem Text="Elimina Pallet" Value="1" />
                            <dx:ListEditItem Text="Elimina Recepcion" Value="2" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="lblNumero" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNelimina" runat="server" Width="170px" Height="25px">
                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btnEliminar" runat="server" Text="" Height="47px" OnClick="btnEliminar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>        
    </div>
</asp:Content>
