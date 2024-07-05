<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CreacionProducto.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.CreacionProducto" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style5 {
            height: 32px;
        }
        .auto-style6 {
            width: 170px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Creacion Producto</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Creacion Producto</span>
        <span class="tab-end"></span>
             <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
         <%--     <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <div>

        <table class="dxeBinImgCPnlSys">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Grupo Articulo">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.String">
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tipo Empaque">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6">
                    <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" ValueType="System.String">
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Tipo Producto">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="ASPxComboBox3" runat="server" ValueType="System.String">
                    </dx:ASPxComboBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cod Producto">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Descripcion">
                    </dx:ASPxLabel>
                </td>
                <td colspan="3">
                    <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="400px">
                    </dx:ASPxTextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Descripcion General">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style5" colspan="3">
                    <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="400px">
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5">
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Unid. X Empaque">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style5">
                    <dx:ASPxTextBox ID="ASPxTextBox4" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Proveedor">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="ASPxComboBox4" runat="server" ValueType="System.String">
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="EAN13">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6">
                    <dx:ASPxTextBox ID="ASPxTextBox6" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="DUN14">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="ASPxTextBox7" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="SKU Proveedor">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="ASPxTextBox5" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Sub Grupo Articulo">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6">
                    <dx:ASPxComboBox ID="ASPxComboBox5" runat="server" ValueType="System.String">
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="ASPxLabel">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="ASPxComboBox6" runat="server" ValueType="System.String">
                    </dx:ASPxComboBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </div>
    <div>

    </div>
</asp:Content>
