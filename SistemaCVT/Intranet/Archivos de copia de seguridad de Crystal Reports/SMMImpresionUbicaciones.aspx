<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMImpresionUbicaciones.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.SMMImpresionUbicaciones" %>

<%@ Register Assembly="DevExpress.XtraReports.v22.1.Web.WebForms, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Mayorista Impresion Ubicaciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Mayorista Impresion Ubicaciones</span>
        <span class="tab-end"></span>
    </div>
<br />
    <div style="margin-left:30px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Bodega"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboBodega" runat="server" DataSourceID="LqsBodega" TextField="Site_Description" ValueField="Site_Description" Height="30px"></dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsBodega" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Site">
                    </asp:LinqDataSource>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Pasillo inicial"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPasilloIni" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Pasillo Termino"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPasilloTer" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnGenerar" runat="server" Text="Generar" Height="70px" OnClick="btnGenerar_Click" Width="121px"></dx:ASPxButton>                </td>

            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" Height="900px" DisableHttpHandlerValidation="False"></dx:ASPxWebDocumentViewer>
    </div>
</asp:Content>
