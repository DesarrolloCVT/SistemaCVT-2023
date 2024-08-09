<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ListadoProcedimientosPlanta.aspx.cs" Inherits="CVT_MermasRecepcion.Gestion.ListadoProcedimientosPlanta" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Gestion</a></li>
        <li><span id="current">Procedimientos</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Procedimientos</span>
    <span class="tab-end"></span>
   
</div>
    <div>
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" KeyFieldName="Ruta" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Archivo" FieldName="Nombre" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ruta" FieldName="Ruta" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="ANEXO" VisibleIndex="4">
                        <DataItemTemplate>
                         <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/documentpdf.png" />
                        </DataItemTemplate>
                       
                        </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn Caption="Tipo" FieldName="Tipo" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Extension" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
        </div>
</asp:Content>
