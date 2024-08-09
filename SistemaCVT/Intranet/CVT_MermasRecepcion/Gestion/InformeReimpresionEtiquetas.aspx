<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeReimpresionEtiquetas.aspx.cs" Inherits="CVT_MermasRecepcion.Gestion.InformeReimpresionEtiquetas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Gestion</a></li>
        <li><span id="current">Reimpresion Etiquetas</span></li>
    </ul>
</div>
<br />
<br />
<div id="tableHeader">
    <span class="tableTitle">Informe Reimpresion Etiquetas</span>
</div>
<div>
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N Pallet"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_npallet" runat="server" Width="170px" AutoCompleteType="Disabled"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" Text="Buscar" OnClick="btn_buscar_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    <dx:ASPxGridView ID="GvReimpresion" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsReimpresion">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="1">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy hh:mm:ss tt" EditFormat="DateTime">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsReimpresion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" OrderBy="Fecha" TableName="CVT_VW_ReimpresionEtiquetas" Where="NPallet == @NPallet">
        <WhereParameters>
            <asp:ControlParameter ControlID="txt_npallet" DefaultValue="-1" Name="NPallet" PropertyName="Text" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</div>
</asp:Content>
