<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResumenEjercicio.aspx.cs" Inherits="CVT_MermasRecepcion.Trazabilidad.ResumenEjercicio" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: 12px;
            background-color: #E0DFDF;
            background-repeat: repeat-x;
            background-position: 50% top;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Trazabilidad</a></li>
        <li><span id="current">Resumen Ejercicio</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Resumen Ejercicio</span>
    <span class="tab-end"></span>
    <%--<div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"/> Exportar Excel DETALLE</a>    
    </div>--%>
</div>
    <div>

        <table class="dxeBinImgCPnlSys">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tipo Producto">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxRadioButtonList ID="Rb_TipoProducto" runat="server" Width="213px" AutoPostBack="True">
                        <Items>
                            <dx:ListEditItem Text="Producto Terminado" Value="3" />
                            <dx:ListEditItem Text="Materia Prima" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Lote">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="Txt_Lote" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <a>
                    <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" />
                    Exportar Excel</a></td>
                <td class="auto-style1">
                    <dx:ASPxButton ID="btn_generar" runat="server" OnClick="btn_generar_Click1" Text="GENERAR">
                    </dx:ASPxButton>
                    </td>
            </tr>
            <tr>
                <td colspan="2">
                    <dx:ASPxGridView ID="GvDatos" runat="server">
                        <SettingsPager PageSize="10000">
                        </SettingsPager>
                    </dx:ASPxGridView>
                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>
                </td>
            </tr>
        </table>
        <div>

        </div>
    </div>
</asp:Content>
