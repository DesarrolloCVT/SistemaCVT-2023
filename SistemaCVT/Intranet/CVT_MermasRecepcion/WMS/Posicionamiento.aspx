<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Posicionamiento.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.Pisicionamiento" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>WMS</a></li>
        <li><span id="current">Posicionamiento</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Posicionamiento</span>
    <span class="tab-end"></span>
</div>
<div>

    <table class="style1">
        <tr>
            <td>

    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N de Pallets" Font-Bold="True" 
                    Font-Size="Medium">
    </dx:ASPxLabel>
            </td>
            <td>
    <dx:ASPxTextBox ID="txt_origen" runat="server" Width="200px" AutoPostBack="True" 
                    Font-Size="Medium" Height="50px" ontextchanged="txt_origen_TextChanged">
    </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>

                &nbsp;</td>
            <td>
                <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red" 
                    Text="N de pallet no existe" Visible="False">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cod. Producto">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_codproducto" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Producto">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_producto" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Lote">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_lote" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Cantidad">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_cantidad" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Sitio">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_sitio" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Ubicacion Actual">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_ubicacion" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lbl_destino" runat="server" ClientInstanceName="lbl_destino" 
                    Text="Ubicacion" Font-Bold="True" Font-Size="Medium">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_destino" runat="server" 
                    ClientInstanceName="txt_destino" Width="200px" 
                    Font-Size="Medium" Height="50px" ontextchanged="txt_destino_TextChanged" 
                    AutoPostBack="True">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">

                <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Sitio">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxLabel ID="lbl_sitio_nuevo" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td class="style2">

                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Ubicacion Nueva">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxLabel ID="lbl_ubicacion_nueva" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
    <dx:ASPxButton ID="btn_generar" runat="server" Text="ASIGNAR" 
            onclick="btn_generar_Click" Enabled="False">
        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
    </dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
