<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AsociacionCheques.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.AsociacionCheques" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Tesoreria</a></li>
        <li><span id="current">Asociacion Cheques</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Asociacion Cheques</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" /> Exportar Excel</a>
          <a><asp:ImageButton ID="cmdNew"   runat="server" ImageUrl="~/Images/add.png"  onclick="cmdNew_Click" style="width: 16px"/>Nuevo</a>
    </div>
</div>
<div>
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsCheques" KeyFieldName="N_Interno_SAP">
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="N Interno SAP" FieldName="N_Interno_SAP" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Folio Cheque Asignado" FieldName="Folio_Asignado" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Folio Cheque Correcto" FieldName="Folio_Correcto" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsCheques" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_AsignacionFoliosCheques">
    </asp:LinqDataSource>

        <dx:ASPxGridViewExporter runat="server" GridViewID="GvDatos" ExportedRowType="All" ID="ASPxGridViewExporter1"></dx:ASPxGridViewExporter>

</div>
</asp:Content>
