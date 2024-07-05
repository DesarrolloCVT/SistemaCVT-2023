<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMTransformaciones.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMTransformaciones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 10px;
        }

        .auto-style6 {
            width: 13px;
        }

        .auto-style7 {
            width: 15px;
        }
        .auto-style8 {
            width: 218px;
        }
        .auto-style9 {
            margin-bottom: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul class="auto-style5">
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>SMM</a></li>
            <li><span id="current">SMM Transformaciones</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">SMM Transformaciones</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° de Pallet" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNpallet" runat="server" Width="170px" Height="30px" AutoPostBack="True" OnTextChanged="txtNpallet_TextChanged"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red"
                        Text="N de pallet no existe" Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Producto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNombreProducto" runat="server" Width="359px" Height="30px" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>

        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="CodProducto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCodProducto" runat="server" Width="170px" Height="30px" ReadOnly="true"></dx:ASPxTextBox>
                </td>
                <td class="auto-style7"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Cantidad" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantidad" runat="server" Width="170px" Height="30px" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>

        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>

                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Unidad Medida" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtUMedida" runat="server" Width="170px" Height="30px" ReadOnly="true"></dx:ASPxTextBox>
                </td>
                <td class="auto-style7"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Cantidad Base Medida" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtBaseUMedida" runat="server" Width="170px" Height="30px" ReadOnly="true"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblCodBarra" runat="server" Text="Cod Barra" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCodBarra" runat="server" Width="256px" Height="30px">
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
        <table class="auto-style9">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Transformar a " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTipoUm" runat="server" DataSourceID="LqsUM" Height="30px" OnSelectedIndexChanged="cboTipoUm_SelectedIndexChanged" TextField="UomCode" ValueField="UomEntry" AutoPostBack="True"></dx:ASPxComboBox>
                </td>
                <td class="auto-style7"></td>
                <td class="auto-style8">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Cantidad a Transformar " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantATransformar" runat="server" Width="227px" ReadOnly="true" Height="30px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />

    <br />
    <br />
    <br />
    <div style="margin-left: 125px">
        <dx:ASPxButton ID="btnTransformar" runat="server" Text="TRANSFORMAR" Height="57px" Theme="iOS" OnClick="btnTransformar_Click"></dx:ASPxButton>
    </div>
    <asp:LinqDataSource ID="LqsUM" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="SMM_VW_DATO_PROD_RECEPCION" Where="ItemCode == @ItemCode">
        <WhereParameters>
            <asp:ControlParameter ControlID="txtCodProducto" DefaultValue="0" Name="ItemCode" PropertyName="Text" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
