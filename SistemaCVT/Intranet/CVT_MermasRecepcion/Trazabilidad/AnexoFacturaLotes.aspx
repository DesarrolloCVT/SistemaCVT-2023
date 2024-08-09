<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AnexoFacturaLotes.aspx.cs" Inherits="CVT_MermasRecepcion.Trazabilidad.AnexoFacturaLotes" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Trazabilidad</a></li>
            <li><span id="current">Anexo Factura Lotes</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">ANEXOS FACTURACION</span>
        <span class="tab-end"></span>

    </div>
    <br />
    <br />
    <div style="padding-left:15px">
        <table>
            <tr>
                <td>
                    <label>Lote</label>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_Lote" runat="server" Width="170px"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" OnClick="btn_Buscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" KeyFieldName="ANEXO" OnRowCommand="GvDatos_RowCommand">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AbsEntry" VisibleIndex="2" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Line" VisibleIndex="3" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumFactura" VisibleIndex="4" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioPref" VisibleIndex="5" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioFactura" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Archivo" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="Documento" VisibleIndex="9">
                     <DataItemTemplate>
                         <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/documentpdf.png" />
                        </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="ANEXO" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_AnexosFacturasTrazabilidad" Where="Lote == @Lote">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_Lote" DefaultValue="0" Name="Lote" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
