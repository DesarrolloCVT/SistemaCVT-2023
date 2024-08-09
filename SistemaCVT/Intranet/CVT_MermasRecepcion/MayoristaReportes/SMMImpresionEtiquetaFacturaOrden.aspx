<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMImpresionEtiquetaFacturaOrden.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.SMMImpresionEtiquetaFacturaOrden" %>

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
            <li><span id="current">Impresion etiqueta Factura / Orden de Compra</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Impresion etiqueta Factura / Orden de Compra</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left:50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Factura"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNFactura" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="37px" OnClick="btnBuscar_Click" Theme="MaterialCompact" Width="84px">
                        <Image IconID="iconbuilder_actions_zoom_svg_16x16">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
      <div>
        <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" Height="900px" DisableHttpHandlerValidation="False"></dx:ASPxWebDocumentViewer>
    </div>
</asp:Content>
