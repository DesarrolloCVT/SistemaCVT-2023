<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TestLecturaHuella.aspx.cs" Inherits="CVT_MermasRecepcion.TestLecturaHuella" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <dx:ASPxButton ID="btnLeer" runat="server" Text="Leer Huella" OnClick="btnLeer_Click"></dx:ASPxButton>
</asp:Content>
