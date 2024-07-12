<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeRutas.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.InformeRutas" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <dx:ASPxPivotGrid ID="PvRutas" runat="server" OptionsData-DataProcessingEngine="Optimized" OptionsFilter-FilterPanelMode="Filter" ClientIDMode="AutoID" DataSourceID="LqDsRutas" IsMaterialDesign="False"></dx:ASPxPivotGrid>
    <asp:LinqDataSource ID="LqDsRutas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AsignacionRuta">
    </asp:LinqDataSource>
</asp:Content>
