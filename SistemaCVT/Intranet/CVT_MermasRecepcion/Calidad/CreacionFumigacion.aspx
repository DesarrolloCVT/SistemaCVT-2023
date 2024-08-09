<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CreacionFumigacion.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.CreacionFumigacion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
        .auto-style6 {
            width: 25px;
        }
        .auto-style7 {
            height: 78px;
        }
        .auto-style8 {
            width: 20px;
            height: 78px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Creacion Fumigacion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Creacion Fumigacion</span>
        <span class="tab-end"></span>
        <%--  <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <br />

    <div style="margin-left: 150px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Datos Creacion Fumigacion " Font-Size="X-Large" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <br />
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Proveedor" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtProveedor" runat="server" Height="30px" >
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Producto a Tratar" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtProdTratar" runat="server" Height="30px" >
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Lote N°" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLote" runat="server" Height="30px" >
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Kilos" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtKilos" runat="server" Width="100px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Tiempo de Exposicion" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtTiempoExpo" runat="server" Width="200px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Concentracion" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtConcentracion" runat="server" Width="150px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btnGenerar" runat="server" Text="Crear Fumigacion" Height="95px" Width="145px" OnClick="btnGenerar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Fecha Inicio Tratamiento" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Fecha Termino Tratamiento" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermno" runat="server" Height="30px">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>

                </td>
                <td class="auto-style8"></td>

            </tr>
        </table>
    </div>

</asp:Content>
