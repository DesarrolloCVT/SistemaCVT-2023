<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ConsolidadoComprasKit.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.ConsolidadoComprasKit" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <dx:ASPxPivotGrid runat="server" OptionsData-DataProcessingEngine="Optimized" OptionsFilter-FilterPanelMode="Filter"></dx:ASPxPivotGrid>
</asp:Content>
