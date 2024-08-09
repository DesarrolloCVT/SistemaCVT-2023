<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeCR.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Mermas.InformeCR" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server"  
    AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" 
        ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
        ToolPanelView="None" ToolPanelWidth="200px" Width="350px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="C:\Users\mrivero\Documents\Visual Studio 2010\Projects\CVT_MermasRecepcion\CVT_MermasRecepcion\InformesCR\CVT_ReporteMermaRecepcion.rpt">
        </Report>
    </CR:CrystalReportSource>
</asp:Content>
