    <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RepaletizadoFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.RepaletizadoFilm" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Repaletizado Film</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Repaletizado Film</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 100px">
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Bobina" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="txtNPallet" runat="server" Width="170px" Height="30px" AutoPostBack="True" OnTextChanged="txtNPallet_TextChanged">
                            <ValidationSettings Display="Dynamic">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="CodProd" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="lblCodProd" runat="server" Width="170px" Height="30px" ReadOnly="True" Border-BorderStyle="None" ForeColor="Blue"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="lblProducto" runat="server" Width="250px" Height="30px" ReadOnly="True" Border-BorderStyle="None" ForeColor="Blue"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Peso Bruto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="lblCantidad" runat="server" Width="170px" Height="30px" ReadOnly="True" Border-BorderStyle="None" ForeColor="Blue"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Peso Neto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="txtPesoNeto" runat="server" Width="170px" Height="30px" ReadOnly="True" Border-BorderStyle="None" ForeColor="Red" Font-Bold="true"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Peso Cono" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="txtPesoCono" runat="server" Width="170px" Height="30px" ReadOnly="True" Border-BorderStyle="None" ForeColor="Blue"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Bodega" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="lblBodega" runat="server" Width="170px" Height="30px" ReadOnly="True" Border-BorderStyle="None" ForeColor="Blue"></dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Peso Bruto a Repaletizar" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="txtCantidadPaletizar" runat="server" Width="170px" Height="30px">
                            <ValidationSettings Display="Dynamic">
                                <RegularExpression ErrorText="Solo Numeros o Coma decimal ( , )" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <dx:ASPxButton ID="btnGenerar" runat="server" Text="Generar" Height="40px" Theme="iOS" Width="170px" OnClick="btnGenerar_Click"></dx:ASPxButton>
        </div>
    </div>


</asp:Content>
