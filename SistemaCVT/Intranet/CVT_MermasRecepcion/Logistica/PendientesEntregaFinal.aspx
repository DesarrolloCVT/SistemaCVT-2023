<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PendientesEntregaFinal.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.PendientesEntregaFinal" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Logistica</a></li>
        <li><span id="current">Informe Pendientes</span></li>
    </ul>
</div>
<br />
<br />
<div id="tableHeader">
    <span class="tableTitle">Informe Pendientes</span>
    <span class="tab-end"></span>
   
    <br />
</div>
<div>
    <dx:ASPxButton ID="Btn_Modificar" runat="server" Text="Modificar" OnClick="Btn_Modificar_Click"></dx:ASPxButton>
</div>
<div>

    <table class="filterNavBar">
        <tr>
            <td>
                <dx:ASPxLabel ID="l1" runat="server" Font-Bold="True" ForeColor="Black" Text="1 Dia">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l2" runat="server" Font-Bold="True" ForeColor="Black" Text="2 Dias">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l3" runat="server" Font-Bold="True" ForeColor="Black" Text="3 Dias">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l4" runat="server" Font-Bold="True" ForeColor="Black" Text="4 Dias">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l5" runat="server" Font-Bold="True" ForeColor="Black" Text="5 Dias">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l6" runat="server" Font-Bold="True" ForeColor="Black" Text="&gt;5 Dias">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="l1a" runat="server" Font-Bold="True" ForeColor="Black" Text="1 Dia Asig">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l2a" runat="server" Font-Bold="True" ForeColor="Black" Text="2 Dias Asig">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l3a" runat="server" Font-Bold="True" ForeColor="Black" Text="3 Dias Asig">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l4a" runat="server" Font-Bold="True" ForeColor="Black" Text="4 Dias Asig">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l5a" runat="server" Font-Bold="True" ForeColor="Black" Text="5 Dias Asig">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="l6a" runat="server" Font-Bold="True" ForeColor="Black" Text="&gt;5 Dias Asig">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>

</div>
<div>
    <dx:ASPxGridView ID="GvPendientesVenta" runat="server" KeyFieldName="DocEntry" OnHtmlRowCreated="GvPendientesVenta_HtmlRowCreated" OnHtmlRowPrepared="GvPendientesVenta_HtmlRowPrepared" OnDataBound="GvPendientesVenta_DataBound">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="600" VerticalScrollBarMode="Visible" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
    </dx:ASPxGridView>
</div>
 <div>
     <dx:ASPxPopupControl ID="PopUP_ModificaFecha" runat="server" HeaderText="Asignacion Dia Despacho"><ContentCollection>
<dx:PopupControlContentControl runat="server">
    <table class="filterNavBar">
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Despacho">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_fechaDesp" runat="server">
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Hora Entrega">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_hora" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="N Agendamiento">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_Agendamiento" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_Actualizar" runat="server" OnClick="btn_Actualizar_Click" style="height: 23px" Text="Actualizar">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
         </dx:PopupControlContentControl>
</ContentCollection>
     </dx:ASPxPopupControl>
 </div>
</asp:Content>
