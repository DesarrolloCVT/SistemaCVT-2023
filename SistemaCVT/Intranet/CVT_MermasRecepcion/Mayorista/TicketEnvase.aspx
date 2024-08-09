<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TicketEnvase.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.TicketEnvase" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Ticket Envases</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Ticket Envases</span>
        <span class="tab-end"></span>
        <div id="options">
           <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
         <%--     <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div style="margin-left:50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cajas"  Font-Size="Large"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCajas" runat="server" Width="170px" Height="40px"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left:50px"> 
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Envases" Font-Size="Large"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtEnvases" runat="server" Width="170px" Height="40px"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div  style="margin-left:80px" >
        <dx:ASPxButton ID="btnGenerar" runat="server" Text="Generar" Height="46px" Theme="iOS" Width="115px" OnClick="btnGenerar_Click"></dx:ASPxButton>
    </div>
</asp:Content>
