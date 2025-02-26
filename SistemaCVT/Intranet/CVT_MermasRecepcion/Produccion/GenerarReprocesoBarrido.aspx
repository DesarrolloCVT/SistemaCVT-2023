﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="GenerarReprocesoBarrido.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.GenerarReprocesoBarrido" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 300px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Produccion</a></li>
        <li><span id="current">Etiquetas Produccion</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Etiquetado Barrido Reproceso Produccion</span>
    <span class="tab-end"></span>
    </div>
    <table class="dxeBinImgCPnlSys">
        <tr>
            <td>
                <dx:ASPxLabel runat="server" Text="Orden Fabricacion" ID="ASPxLabel1"></dx:ASPxLabel>

            </td>
            <td class="style1">

                <asp:LinqDataSource runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" OrderBy="OF" 
                    TableName="CVT_ListaOFLiberadas" EntityTypeName="" ID="LqDsOF"></asp:LinqDataSource>

                <dx:ASPxComboBox runat="server" DataSourceID="LqDsOF" ValueField="OF" 
                    Width="300px" ID="cbo_of">
                   
                    <Columns>
<dx:ListBoxColumn FieldName="OF"></dx:ListBoxColumn>
<dx:ListBoxColumn FieldName="CodProducto"></dx:ListBoxColumn>
<dx:ListBoxColumn FieldName="Producto"></dx:ListBoxColumn>
</Columns>

<ValidationSettings ValidationGroup="a">
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
</dx:ASPxComboBox>

                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Barrido">
                </dx:ASPxLabel>
            </td>
            <td class="style1">
              <dx:ASPxTextBox ID="txt_cantidadBarrido" runat="server" Width="170px">
                    <ValidationSettings ValidationGroup="a">
                        <RegularExpression ValidationExpression="^([0-9])*$" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
              </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Reproceso">
                </dx:ASPxLabel>
            </td>
            <td class="style1">
                <dx:ASPxTextBox ID="txt_cantidadReproceso" runat="server" Width="170px">
                    <ValidationSettings ValidationGroup="a">
                        <RegularExpression ValidationExpression="^([0-9])*$" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
                </td>
            <td>
    <dx:ASPxButton ID="btn_generar" runat="server" Text="GENERAR" 
            onclick="btn_generar_Click">
        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
    </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
