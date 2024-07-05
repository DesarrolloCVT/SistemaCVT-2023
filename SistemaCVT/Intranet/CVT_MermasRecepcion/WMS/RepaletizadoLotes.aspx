<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RepaletizadoLotes.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.RepaletizadoLotes" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            height: 23px;
        }

        .auto-style5 {
            margin-left: 80px;
        }

        .auto-style6 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul class="auto-style5">
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Repaletizado</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Repaletizado</span>
        <span class="tab-end"></span>
    </div>
    <div style="margin-left: 25px">

        <table class="style1">
            <tr>
                <td>

                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N de Pallets" Font-Bold="True"
                        Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_origen" runat="server" Width="200px" AutoPostBack="True"
                        Font-Size="Medium" Height="50px" OnTextChanged="txt_origen_TextChanged">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red"
                        Text="N de pallet no existe o no posicionado" Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">

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

                    <dx:ASPxLabel ID="lblBod" runat="server" Text="Bodega">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblBodega" runat="server">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Pallet" Font-Bold="True"
                        Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <br />
                <td>
                    <dx:ASPxRadioButtonList ID="chk_tipo" runat="server"
                        ClientInstanceName="chk_tipo" RepeatDirection="Horizontal"
                        SelectedIndex="0" Font-Size="Medium">
                        <ClientSideEvents
                            SelectedIndexChanged="function(s, e) 
{
 if (s.GetValue() == '1') 
    {
     txt_destino.SetVisible(true);
     lbl_destino.SetVisible(true);

     lblTipoPallet.SetVisible(false);
     cboTipoPallet.SetVisible(false);
  
     btn_generar.SetEnabled(false);             
    }
    else 
    {
     txt_destino.SetVisible(false); 
      lblTipoPallet.SetVisible(true);
     cboTipoPallet.SetVisible(true);
  
     lbl_destino.SetVisible(false);
  
           btn_generar.SetEnabled(true);

          

    }	
}
" />

                        <%--                           txt_destino.Text='';
            ASPxLabel10.SetVisible(false);
            ASPxLabel11.SetVisible(false);
            ASPxLabel12.SetVisible(false);
            ASPxLabel9.SetVisible(false);
            lbldBod.SetVisible(false);--%>
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Nuevo" Value="0" />
                            <dx:ListEditItem Text="Existente" Value="1" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblTipoPallet" runat="server" Text="Tipo Pallet" Font-Bold="True"
                        Font-Size="Medium" ClientInstanceName="lblTipoPallet">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cboTipoPallet" runat="server" DataSourceID="LqsTipoPallet" Height="30px" TextField="Supportive_Description" ValueField="Supportive_Id" Width="191px" ClientInstanceName="cboTipoPallet"></dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsTipoPallet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Supportive_Id, Supportive_Description)" TableName="Supportive">
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbl_destino" runat="server" ClientInstanceName="lbl_destino"
                        Text="Destino" ClientVisible="false" Font-Bold="True" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_destino" runat="server"
                        ClientInstanceName="txt_destino" ClientVisible="false" Width="200px"
                        Font-Size="Medium" Height="50px" OnTextChanged="txt_destino_TextChanged"
                        AutoPostBack="True">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxLabel ID="lbl_compatible" runat="server" ForeColor="Black"
                        Visible="False">
                    </dx:ASPxLabel>
                    <dx:ASPxLabel ID="lbl_error0" runat="server" ForeColor="Red"
                        Text="N de pallet no existe o no posicionado" Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cod. Producto"
                        Visible="False" ClientInstanceName="ASPxLabel10">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_dcodproducto" runat="server"
                        ClientInstanceName="lbl_dcodproducto" Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Producto" Visible="False" ClientInstanceName="ASPxLabel11">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_dproducto" runat="server"
                        ClientInstanceName="lbl_dproducto" Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Lote" Visible="False" ClientInstanceName="ASPxLabel12">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_dlote" runat="server" ClientInstanceName="lbl_dlote"
                        Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Cantidad" Visible="False" ClientInstanceName="ASPxLabel9">
                    </dx:ASPxLabel>
                </td>
                <td class="style2">
                    <dx:ASPxLabel ID="lbl_dcantidad" runat="server"
                        ClientInstanceName="lbl_dcantidad" Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbldBod" runat="server" Text="Bodega" Visible="False" ClientInstanceName="lbldBod">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_dBodega" runat="server" ClientInstanceName="lbl_dBodega"
                        Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <dx:ASPxLabel ID="lbl_cantrepaletizar" runat="server" Font-Bold="True"
                        Font-Size="Medium" Text="Cantidad a Repaletizar">
                    </dx:ASPxLabel>
                </td>
                <td class="style2">
                    <dx:ASPxTextBox ID="txt_cantidad" runat="server" Font-Size="Medium"
                        Height="50px" Width="200px">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxButton ID="btn_generar" runat="server" Text="GENERAR"
                        OnClick="btn_generar_Click" Enabled="False">
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
