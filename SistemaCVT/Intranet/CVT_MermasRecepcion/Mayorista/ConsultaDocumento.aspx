<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ConsultaDocumento.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.ConsultaDocumento" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Consulta documento</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Consulta documento</span>
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
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblTipoDoc" runat="server" Text="Tipo Documento" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxRadioButtonList ID="rbtTipoDoc" runat="server" Theme="DevEx" Border-BorderStyle="None">
                        <Items>
                            <dx:ListEditItem Text="OC COMPRA" Value="1" />
                            <dx:ListEditItem Text="FACT COMPRA" Value="2" />
                            <dx:ListEditItem Text="BOLETA VENTA" Value="3" />
                            <dx:ListEditItem Text="FACTURA VENTA" Value="4" />
                        </Items>
                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>

                        <Border BorderStyle="None"></Border>
                    </dx:ASPxRadioButtonList>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    <dx:ASPxLabel ID="lblNumdoc" runat="server" Text="Numero Documento" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtNumdoc" runat="server" Width="170px" Height="34px" Style="margin-bottom: 0px">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="34px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
        </dx:ASPxGridView>
    </div>
</asp:Content>
