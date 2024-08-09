<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CategoriaHallazgo.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.CategoriaHallazgo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Calidad</a></li>
        <li><span id="current">Categoria Hallazgo</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Categoria Hallazgo</span>
    <span class="tab-end"></span>
    <div id="options">         
       <%--   <a><asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px" /> Exportar Excel</a>--%>
     <a>             <asp:ImageButton ID="cmdNew"      runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click" style="width: 16px"/>Nuevo</a>
    </div>
</div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvCategoriaHallazgo" runat="server" AutoGenerateColumns="False" DataSourceID="LqsCatHallazgo" KeyFieldName="Id_CategoriaHallazgo" OnRowCommand="GvCategoriaHallazgo_RowCommand">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="ID" FieldName="Id_CategoriaHallazgo" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreCategoria" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Tipo Hallazgos" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsCatHallazgo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_CategoriaHallazgoME">
        </asp:LinqDataSource>
    </div>
</asp:Content>
