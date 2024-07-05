<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeSacosVaciados.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InformeSacosVaciados" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Vaciado Sacos por OF</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Vaciado Sacos</span>
    <span class="tab-end"></span>
    
    
    
</div>
<div>
<table>
<tr>
<td>

    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Orden de Fabricacion">
    </dx:ASPxLabel>
    </td>
    <td>
    <dx:ASPxTextBox ID="txt_of" runat="server" Width="170px">
        <ValidationSettings>
            <RequiredField IsRequired="True" />
        </ValidationSettings>
    </dx:ASPxTextBox>
    </td>
    <td>
    <dx:ASPxButton ID="btn_generar" runat="server" Text="GENERAR DETALLE" 
            onclick="btn_generar_Click">
        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
    </dx:ASPxButton>
 </td>
 <td>
    <dx:ASPxButton ID="btn_generar0" runat="server" Text="GENERAR DETALLE RESUMEN" 
            onclick="btn_generar_resumen_Click">
        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
    </dx:ASPxButton>
 </td>
 </tr>
</table>

</div>
<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
