<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="VencimientosProyectadosCVT.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.VencimientosProyectadosCVT" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Vencimientos Proyectados CVtrading</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Vencimientos Proyectados CVtrading</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID" DataSourceID="LqsVencProyectados" IsMaterialDesign="False">
            <Fields>
                <dx:PivotGridField ID="fieldBodega" Area="ColumnArea" AreaIndex="0" FieldName="Bodega" Name="fieldBodega">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidad" Area="DataArea" AreaIndex="0" FieldName="Cantidad" Name="fieldCantidad">
                    <CellFormat FormatString="N0" FormatType="Custom" />
                    <TotalCellFormat FormatString="N0" FormatType="Custom" />
                    <ValueFormat FormatString="N0" FormatType="Custom" />
                    <TotalValueFormat FormatString="N0" FormatType="Custom" />
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodProducto" Area="RowArea" AreaIndex="3" FieldName="CodProducto" Name="fieldCodProducto">
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top">
                    </CellStyle>
                    <ValueStyle VerticalAlign="Top">
                    </ValueStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCosto" Area="DataArea" AreaIndex="1" FieldName="Costo" Name="fieldCosto">
                   <CellFormat FormatString="N0" FormatType="Custom" />
                    <TotalCellFormat FormatString="N0" FormatType="Custom" />
                    <ValueFormat FormatString="N0" FormatType="Custom" />
                    <TotalValueFormat FormatString="N0" FormatType="Custom" />
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDiasVencimiento" FieldName="DiasVencimiento" Name="fieldDiasVencimiento" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEstado" Area="RowArea" AreaIndex="1" FieldName="Estado" Name="fieldEstado">
                    <CellStyle BackColor="Yellow" HorizontalAlign="Center" VerticalAlign="Top">
                    </CellStyle>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ValueStyle TopAlignedRowValues="True" VerticalAlign="Top">
                    </ValueStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFVencimiento" Area="RowArea" AreaIndex="5" FieldName="FVencimiento" Name="fieldFVencimiento">
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top">
                    </CellStyle>
                    <ValueStyle VerticalAlign="Top">
                    </ValueStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupo" Area="RowArea" AreaIndex="2" FieldName="Grupo" Name="fieldGrupo">
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top">
                    </CellStyle>
                    <ValueStyle VerticalAlign="Top">
                    </ValueStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecioUnit" FieldName="PrecioUnit" Name="fieldPrecioUnit" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" Area="RowArea" AreaIndex="4" FieldName="Producto" Name="fieldProducto">
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top">
                    </CellStyle>
                    <ValueStyle VerticalAlign="Top">
                    </ValueStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEnumerador" Area="RowArea" AreaIndex="0" FieldName="Enumerador" Name="fieldEnumerador">
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Top">
                    </CellStyle>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                    <ValueStyle HorizontalAlign="Center" VerticalAlign="Top">
                    </ValueStyle>
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="500">
            </OptionsPager>
            <Styles>
                <RowAreaStyle HorizontalAlign="Center" VerticalAlign="Top">
                </RowAreaStyle>
                <RowFieldValuesAreaStyle HorizontalAlign="Center" VerticalAlign="Top">
                </RowFieldValuesAreaStyle>
            </Styles>
            <StylesPager>
                <Ellipsis VerticalAlign="Top">
                </Ellipsis>
            </StylesPager>
        </dx:ASPxPivotGrid>
        <asp:LinqDataSource ID="LqsVencProyectados" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" OrderBy="Enumerador desc" TableName="VW_VencimientosProyectadosCVT">
        </asp:LinqDataSource>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
            ASPxPivotGridID="PvDatos">
        </dx:ASPxPivotGridExporter>
    </div>
</asp:Content>
