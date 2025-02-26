﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CheckListArmadoPedido.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.CheckListArmadoPedido" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Calidad</a></li>
        <li><span id="current">Check List Armado Pedido</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Armado Pedido</span>
    <span class="tab-end"></span>
    
</div>
<div>


    <table class="style1">
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="FECHA">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_fecha" runat="server" AutoPostBack="True" 
                    ondatechanged="cbo_fecha_DateChanged">
                    <ValidationSettings ValidationGroup="A">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N Pedido">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_pedido" runat="server" DataSourceID="LqDsPedido" 
                    ValueField="DocNum">
                    <Columns>
                        <dx:ListBoxColumn Caption="N Pedido" FieldName="DocNum">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Cliente" FieldName="CardName" Width="400px">
                        </dx:ListBoxColumn>
                    </Columns>
                    <ValidationSettings ValidationGroup="A">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsPedido" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" 
                    TableName="ORDR" 
                    Where="DocStatus == @DocStatus &amp;&amp; DocDueDate == @DocDueDate">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="O" Name="DocStatus" Type="Char" />
                        <asp:ControlParameter ControlID="cbo_fecha" Name="DocDueDate" 
                            PropertyName="Value" Type="DateTime" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" Text="BUSCAR" 
                    onclick="btn_buscar_Click" style="height: 23px" ValidationGroup="A">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>


</div>
<div>
    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Resumen Pedido" 
        Font-Bold="True" Font-Size="Large">
    </dx:ASPxLabel>
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" FieldName="ItemName" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="CantPedidoSAP" 
                VisibleIndex="2">
                <PropertiesTextEdit DisplayFormatString="N0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Base" FieldName="CantidadProdBase" 
                VisibleIndex="3">
                <PropertiesTextEdit DisplayFormatString="N0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Altura" FieldName="CantidadProdAltura" 
                VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="N0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Pallet" FieldName="Pallet_Descripcion" 
                VisibleIndex="5">
                <PropertiesTextEdit DisplayFormatString="N0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cliente" FieldName="ORDR_CardName" 
                VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="N0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cant Pallets" FieldName="CantidadPallets" 
                VisibleIndex="7">
                <PropertiesTextEdit DisplayFormatString="N0">
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>

</div>
<div>


    <table>
        <tr  style="border:solid; border-color:black; ">
            <td colspan="2" align="center">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="CHECK LIST" Font-Bold="True" 
                    Font-Size="Large">
                </dx:ASPxLabel>
                </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="Medium" 
                    Text="CUMPLE FEFO">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="CHK_FEFO" runat="server" Text=" ">
                    <GrayedImage Height="25px" Width="25px">
                    </GrayedImage>
                    <CheckBoxStyle Font-Overline="False" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="Medium" 
                    Text="CUMPLE VIDA UTIL">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="CHK_VIDAUTIL" runat="server" Text=" ">
                    <GrayedImage Height="25px" Width="25px">
                    </GrayedImage>
                    <CheckBoxStyle Font-Overline="False" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Size="Medium" 
                    Text="PALLET EN BUENAS CONDICIONES (NO ESTA: ROTO, CONTAMINADO)">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="CHK_ESTADOPALLET" runat="server" Text=" ">
                    <GrayedImage Height="25px" Width="25px">
                    </GrayedImage>
                    <CheckBoxStyle Font-Overline="False" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr  style="border:solid; border-color:black; ">
            <td>
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Font-Size="Medium" 
                    Text="BASE PALLET TIENE SACOS O CARTON (NO APLICA A PRODUCTOS EN CAJA)">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="CHK_BASEPRODUCTO" runat="server" Text=" ">
                    <GrayedImage Height="25px" Width="25px">
                    </GrayedImage>
                    <CheckBoxStyle Font-Overline="False" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Font-Size="Medium" 
                    Text="PRODUCTO EN BUENAS CONDICIONES (NO ESTA: ROTO, MANCHADO, CONTAMINADO)">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="CHK_ESTADOPRODUCTO" runat="server" Text=" ">
                    <GrayedImage Height="25px" Width="25px">
                    </GrayedImage>
                    <CheckBoxStyle Font-Overline="False" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Size="Medium" 
                    Text="DUN14 CORRECTO">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="CHK_DUN14" runat="server" Text=" ">
                    <GrayedImage Height="25px" Width="25px">
                    </GrayedImage>
                    <CheckBoxStyle Font-Overline="False" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Font-Size="Medium" 
                    Text="PALLETIZADO DERECHO Y CON SUFICIENTE FILM">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="CHK_FILM" runat="server" Text=" ">
                    <GrayedImage Height="25px" Width="25px">
                    </GrayedImage>
                    <CheckBoxStyle Font-Overline="False" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Font-Size="Medium" 
                    Text="LUGAR ARMADO PEDIDO">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="CBO_LUGARARMADO" runat="server">
                    <Items>
                        <dx:ListEditItem Text="PASILLO 1" Value="PASILLO 1" />
                        <dx:ListEditItem Text="PASILLO 2" Value="PASILLO 2" />
                        <dx:ListEditItem Text="PASILLO 3" Value="PASILLO 3" />
                        <dx:ListEditItem Text="PASILLO 4" Value="PASILLO 4" />
                        <dx:ListEditItem Text="PASILLO 5" Value="PASILLO 5" />
                        <dx:ListEditItem Text="PASILLO 6" Value="PASILLO 6" />
                        <dx:ListEditItem Text="PASILLO 7" Value="PASILLO 7" />
                        <dx:ListEditItem Text="PASILLO 8" Value="PASILLO 8" />
                        <dx:ListEditItem Text="PASILLO 9" Value="PASILLO 9" />
                        <dx:ListEditItem Text="PASILLO 21" Value="PASILLO 21" />
                        <dx:ListEditItem Text="PASILLO 22" Value="PASILLO 22" />
                        <dx:ListEditItem Text="PASILLO 23" Value="PASILLO 23" />
                        <dx:ListEditItem Text="PASILLO 24" Value="PASILLO 24" />
                        <dx:ListEditItem Text="PASILLO 25" Value="PASILLO 25" />
                        <dx:ListEditItem Text="PATIO BODEGA NUEVA" Value="PATIO BODEGA NUEVA" />
                        <dx:ListEditItem Text="PATIO CASINO" Value="PATIO CASINO" />
                        <dx:ListEditItem Text="PATIO CARGA" Value="PATIO CARGA" />
                        <dx:ListEditItem Text="PATIO AGRICOLA" Value="PATIO AGRICOLA" />
                        <dx:ListEditItem Text="BODEGA AGRICOLA" Value="BODEGA AGRICOLA" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Font-Size="Medium" 
                    Text="OBSERVASIONES">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxMemo ID="txt_observasiones" runat="server" Height="71px" Width="170px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_grabar" runat="server" onclick="btn_grabar_Click" 
                    Text="Grabar" ValidationGroup="A">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>


</div>
</asp:Content>
