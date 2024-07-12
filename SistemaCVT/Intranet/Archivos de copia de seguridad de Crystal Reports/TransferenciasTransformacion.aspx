<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TransferenciasTransformacion.aspx.cs" Inherits="CVT_MermasRecepcion.Merma.TransferenciasTransformacion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Bodega Recuperacion</a></li>
        <li><span id="current">Transformacion Transferencias</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Transformacion Transferencias</span>
    <span class="tab-end"></span>
    
</div>
<div>
    <dx:ASPxGridView ID="GvTransfer" runat="server"></dx:ASPxGridView>

</div>
</asp:Content>
