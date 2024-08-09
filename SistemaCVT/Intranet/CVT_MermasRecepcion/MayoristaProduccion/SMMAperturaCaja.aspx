<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMAperturaCaja.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaProduccion.SMMAperturaCaja" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
        .auto-style6 {
            width: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">B+ APERTURA CAJA</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">B+ APERTURA CAJA</span>
        <span class="tab-end"></span>
        <%--  <dx:ASPxTextBox ID="txtCuotas" runat="server" Width="170px" Theme="iOS"></dx:ASPxTextBox>--%>
    </div>
    <br />
    <br />
    <div style="margin-left:45PX">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Monto" Theme="iOS"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtMonto" runat="server" Width="170px" Theme="iOS"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Encargado Caja" Theme="iOS"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboEncargadoCaja" runat="server" EnableTheming="True" Theme="iOS" Width="258px" DataSourceID="LqsUsuaio" TextField="NombreUsuario" ValueField="UsuarioSistema">
                     
                    </dx:ASPxComboBox>
             
                </td>
                <td class="auto-style5">
                </td>
                <td style="padding-top:15px">
                    <dx:ASPxButton ID="btnAbrir" runat="server" Text="ABRIR" Height="53px" Theme="iOS" Width="149px" OnClick="btnAbrir_Click">
                        <Image IconID="scheduling_forward_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>

            </tr>
        </table>
    </div>
           <asp:LinqDataSource ID="LqsUsuaio" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios" Where="IdPerfil == @IdPerfil">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="39" Name="IdPerfil" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>

</asp:Content>
