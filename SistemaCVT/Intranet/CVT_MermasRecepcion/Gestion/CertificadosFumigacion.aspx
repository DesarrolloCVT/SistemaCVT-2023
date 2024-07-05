<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CertificadosFumigacion.aspx.cs" Inherits="CVT_MermasRecepcion.Gestion.CertificadosFumigacion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Gestion</a></li>
            <li><span id="current">Certificados Fumigacion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Certificados Fumigacion</span>
        <span class="tab-end"></span>
    </div>
    <br />
<%--    <div>
        <dx:ASPxButton ID="btnVer" runat="server" Text="ACTUALIZAR ARCHIVOS" OnClick="btnVer_Click"></dx:ASPxButton>
    </div>--%>
    <br />
  <%--  <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" KeyFieldName="Ruta" OnRowCommand="GvDatos_RowCommand" AutoGenerateColumns="False" DataSourceID="LqsDatos">     
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Archivo" FieldName="Nombre" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ruta" FieldName="Ruta" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="Certificado" VisibleIndex="4">
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="Extension" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>

            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />

            <SettingsBehavior AllowFocusedRow="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9900">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_RutaCertificadoFumigacion">
        </asp:LinqDataSource>
    </div>--%>

      <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" KeyFieldName="Ruta" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
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
                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="Tipo" VisibleIndex="0" SortIndex="0" SortOrder="Descending">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Extension" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
</asp:Content>
