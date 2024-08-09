<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LogSistema.aspx.cs" Inherits="CVT_MermasRecepcion.Sistema.LogSistema" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Sistema</a></li>
        <li><span id="current">Log Sistema</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Sistema</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel"  runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" /> Exportar Excel</a>&nbsp;
              <a>             
        <%--  <asp:ImageButton ID="cmdNew"  runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click"/>Nuevo</a>--%>
    </div>
</div>
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LqsLogSistema">
        <SettingsPager PageSize="40">
        </SettingsPager>
        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Log_Id" ShowInCustomizationForm="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nombre_SubMenu" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nombre_Menu" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tipo" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NombreUsuario" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Año" ShowInCustomizationForm="True" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
        </Columns>
        </dx:ASPxGridView>
     
        <asp:LinqDataSource ID="LqsLogSistema" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_LogRegistro">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
        </a>
     
</asp:Content>
