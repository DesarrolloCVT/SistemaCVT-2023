<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OFEspecial.aspx.cs" Inherits="CVT_MermasRecepcion.Merma.OFEspecial" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 189px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Bodega Recuperacion</a></li>
        <li><span id="current">OF Especial</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">OF Especial</span>
    <span class="tab-end"></span>
    
</div>
    <dx:ASPxPopupControl ID="PopUp_Nuevo" runat="server"><ContentCollection>
<dx:PopupControlContentControl runat="server">
    <div>
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Producto a Producir:" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
            </td>
            <td class="auto-style5">
                <dx:ASPxComboBox ID="cbo_Producto" Width="750px" runat="server" AutoPostBack="True" DataSourceID="LqDsProductos" OnSelectedIndexChanged="cbo_Producto_SelectedIndexChanged" ValueField="ItemCode">
                    <Columns>
                        <dx:ListBoxColumn Caption="Codigo" FieldName="ItemCode">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Producto" FieldName="ItemName">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsProductos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, U_ItemCodeUnidad, ItemName)" TableName="OITM" Where="QryGroup4 == @QryGroup4 &amp;&amp; validFor == @validFor">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="Y" Name="QryGroup4" Type="Char" />
                        <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <br />
            </td>
            </tr>
            <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Codigo Unidad a Consumir:" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
                <br />
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_Unidad" runat="server" Text="" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
            </td>
                </tr>
        
            <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Unidad a Consumir:" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
                <br />
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_NUnidad" runat="server" Text="" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
            </td>
                </tr>
            <tr>
                <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cant Unidades x Empaque:" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
                    <br />
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_cantunid" runat="server" Text="" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <br />
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Insumo:" Font-Bold="True" Font-Size="Medium"></dx:ASPxLabel>
            </td>
            <td class="auto-style5">
                <br />
                <br />
                <dx:ASPxComboBox ID="cbo_insumo" runat="server" DataSourceID="LqDsInsumos" ValueField="ItemCode" Width="750px">
                    <Columns>
                        <dx:ListBoxColumn Caption="Codigo" FieldName="ItemCode">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Insumo" FieldName="ItemName">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsInsumos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="OITM" Where="validFor == @validFor &amp;&amp; QryGroup17 == @QryGroup17">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
                        <asp:Parameter DefaultValue="Y" Name="QryGroup17" Type="Char" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <dx:ASPxButton ID="btn_Crear_OF" runat="server" Text="Crear OF"></dx:ASPxButton>
        </tr>
    </table>

</div>
        </dx:PopupControlContentControl>
</ContentCollection>
    </dx:ASPxPopupControl>
<div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server"></dx:ASPxGridView>
</div>
</asp:Content>
