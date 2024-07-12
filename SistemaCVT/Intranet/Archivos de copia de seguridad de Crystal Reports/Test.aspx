<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="CVT_MermasRecepcion.Test" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">

    <dx:ASPxDateEdit ID="dte1" runat="server"></dx:ASPxDateEdit>
 <%--   <dx:ASPxDateEdit ID="dte2" runat="server"></dx:ASPxDateEdit>--%>

    <dx:ASPxButton ID="btnCalcular" runat="server" Text="Calcular" OnClick="btnCalcular_Click"></dx:ASPxButton>
    <dx:ASPxLabel ID="lblTotal" runat="server" Text=""></dx:ASPxLabel>
</asp:Content>
