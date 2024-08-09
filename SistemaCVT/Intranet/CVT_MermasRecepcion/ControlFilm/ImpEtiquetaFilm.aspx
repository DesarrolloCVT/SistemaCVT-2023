<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ImpEtiquetaFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.ImpEtiquetaFilm" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Control Film</a></li>
            <li><span id="current">Impresion Etiquetas Film</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Impresion Etiquetas Film</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 35px">
        <table>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxRadioButtonList ID="rb_tipo" runat="server" SelectedIndex="0" Theme="MaterialCompact" Border-BorderStyle="None">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Bobina" Value="1" />
                            <dx:ListEditItem Text="Recepcion" Value="2" />
                            <dx:ListEditItem Text="Transferencia" Value="3" />
                            <%--  <dx:ListEditItem Text="Ubicacion" Value="4" />--%>
                        </Items>
                    </dx:ASPxRadioButtonList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Bobina:" Font-Bold="true">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_npallet" runat="server" Width="150px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_imprimir" runat="server" OnClick="btn_imprimir_Click"
                        Text="Imprimir" Height="40px">
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>
