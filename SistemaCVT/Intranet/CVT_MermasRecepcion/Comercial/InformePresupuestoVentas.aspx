<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformePresupuestoVentas.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.InformePresupuestoVentas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div>

    </div>
    <div>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Vendedor"></dx:ASPxLabel> 
        <dx:ASPxComboBox ID="cbo_vendedor" runat="server" ValueType="System.String"></dx:ASPxComboBox>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Año"></dx:ASPxLabel>
        <dx:ASPxComboBox ID="cbo_año" runat="server" ValueType="System.String"></dx:ASPxComboBox>
    </div>
    <div>
        <dx:ASPxGridView ID="GvInfPresupuesto" runat="server"></dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsinfpresupuesto" runat="server"></asp:LinqDataSource>
    </div>
</asp:Content>
