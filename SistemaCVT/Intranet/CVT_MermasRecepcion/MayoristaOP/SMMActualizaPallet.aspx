<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMActualizaPallet.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMActualizaPallet" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
        .auto-style6 {
            height: 56px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Actualiza Pallet</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Actualiza Pallet</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Pallet" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNPallet" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a">
                            <RegularExpression ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td style="padding-top: 15px">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="36px" Theme="MaterialCompact" OnClick="btnBuscar_Click" Width="60px" ValidationGroup="a"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cod Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCodProducto" runat="server" Width="170px" Height="30px" ReadOnly="true" Border-BorderStyle="None"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtProducto" runat="server" Width="550px" Height="30px" ReadOnly="true" Border-BorderStyle="None"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Lote" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLoteInterno" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="b">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td class="auto-style6">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Lote Proveedor" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLotProveedor" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="b">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
     <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Fecha Produccion" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFechaProd" runat="server" Height="30px" Theme="MaterialCompact">
                        <ValidationSettings Display="Dynamic" ValidationGroup="b">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>             
                </td>
            </tr>
        </table>
    </div>
    <br />
     <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Fecha Vencimiento" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFechaVenc" runat="server" Height="30" Theme="MaterialCompact">
                        <ValidationSettings Display="Dynamic" ValidationGroup="b">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>             
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxButton ID="btnActualizar" runat="server" Text="Actualizar" Height="49px" OnClick="btnActualizar_Click" Theme="MaterialCompact" ValidationGroup="b" Width="211px"></dx:ASPxButton>
    </div>
</asp:Content>
