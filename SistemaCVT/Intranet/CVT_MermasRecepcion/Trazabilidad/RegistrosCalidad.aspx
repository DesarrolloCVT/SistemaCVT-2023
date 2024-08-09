<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistrosCalidad.aspx.cs" Inherits="CVT_MermasRecepcion.Trazabilidad.RegistrosCalidad" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Trazabilidad</a></li>
            <li><span id="current">Registros Calidad</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Registros Calidad</span>
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
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" OnClick="btn_Buscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRegistrosCalidad" KeyFieldName="ID" OnRowCommand="GvDatos_RowCommand" Width="190px">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Informe" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reporte" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                   <dx:GridViewDataTextColumn FieldName="LotePT" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteMP" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataHyperLinkColumn FieldName="PDF" VisibleIndex="5">
                     <DataItemTemplate>
                         <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/documentpdf.png" />
                        </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsRegistrosCalidad" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ReportesTrazabalidadCalidad" Where="LotePT == @LotePT">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_Lote" DefaultValue=" " Name="LotePT" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>

