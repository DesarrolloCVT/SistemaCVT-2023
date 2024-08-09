<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TestWSIntranet.aspx.cs" Inherits="CVT_MermasRecepcion.TestWSIntranet" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <dx:ASPxTextBox ID="txtn1" runat="server" Width="170px"></dx:ASPxTextBox>
    <dx:ASPxTextBox ID="txtn2" runat="server" Width="170px"></dx:ASPxTextBox>
    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ASPxButton" OnClick="ASPxButton1_Click"></dx:ASPxButton>
    <dx:ASPxLabel ID="lblres" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
</asp:Content>
