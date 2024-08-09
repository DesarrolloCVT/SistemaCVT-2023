<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CamionesLoteFactura.aspx.cs" Inherits="CVT_MermasRecepcion.Trazabilidad.CamionesLoteFactura" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Trazabilidad</a></li>
            <li><span id="current">Factura Camiones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">FACTURA CAMIONES</span>
        <span class="tab-end"></span>
    </div>
    <br />
      <div style="margin-left:25px">
        <table>
            <tr>
                <td>
                    <label>Lote</label>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_Lote" runat="server" Width="170px"></dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsFacturaCamiones" KeyFieldName="FolioRevision" OnRowCommand="GvDatos_RowCommand1" Width="190px">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="FolioRevision" VisibleIndex="0" Caption="Folio">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                   <dx:GridViewDataHyperLinkColumn FieldName="PDF" VisibleIndex="8">
                     <DataItemTemplate>
                         <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/documentpdf.png" />
                        </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsFacturaCamiones" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_RevisionesCamionProLoteFactura" Where="Lote == @Lote">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_Lote" DefaultValue="0" Name="Lote" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
