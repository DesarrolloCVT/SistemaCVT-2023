<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TipoHallazgos.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.TipoHallazgos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Calidad</a></li>
        <li><span id="current">Tipo Hallazgo</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Tipo Hallazgo</span>
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
        <dx:ASPxGridView ID="GvTipoHallazgo" runat="server" AutoGenerateColumns="False" DataSourceID="LqsTipoHallazgo" KeyFieldName="Id_TipoHallazgo" OnRowInserting="GvTipoHallazgo_RowInserting">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="ID Tipo Hallazgo" FieldName="Id_TipoHallazgo" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ID Categoria" FieldName="Id_CategoriaHallazgo" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo Hallazgo" FieldName="NombreTipoHallazgo" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsTipoHallazgo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_TipoHallazgoME" Where="Id_CategoriaHallazgo == @Id_CategoriaHallazgo">
            <WhereParameters>
                <asp:SessionParameter Name="Id_CategoriaHallazgo" SessionField="Id_CategoriaHallazgo" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
