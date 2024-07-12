<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Consolidado_Pedido_Grilla.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.Consolidado_Pedido_Grilla" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 11px;
        }

        .auto-style6 {
            width: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Consolidado Pedidos por Fecha</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Consolidado Pedidos por Fecha</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFInicio" runat="server" Height="30px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Seleccione Departamento"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboDepto" runat="server" DataSourceID="LqsDepto" TextField="GroupName" ValueField="GroupName" Height="30px"></dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td style="padding-top: 10px">
                    <dx:ASPxButton ID="btnGrilla" runat="server" Text="Ver En Grilla" Height="30px" Theme="iOS" OnClick="btnGrilla_Click">
                        <Image IconID="find_find_16x16gray">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="margin-left:50px">
        <table>
            <tr>
                 <td style="padding-top: 10px">
                    <dx:ASPxButton ID="btnExportar" runat="server" Text="Exportar Todo" Height="30px" Theme="MaterialCompact" OnClick="btnExportar_Click">
                        <Image IconID="export_exporttoxls_16x16gray">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>

    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="DeptoVentas" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaEntrega" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadSolicitada" VisibleIndex="4" Caption="Cant.Solicitada">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadPendienteFacturar" VisibleIndex="5" Caption="Pendiente Facturar" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadEntregar" VisibleIndex="6" Caption="Cant.Entregada">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDepto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="VW_DEPARTAMENTOS_VENTAS">
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <br />
    <div>
         <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Resumen Factura" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="DeptoVentas" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaEntrega" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NFactura" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod.Proveedor" FieldName="CardCode" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Proveedor" FieldName="CardName" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalFactura" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo Pago" ExportWidth="250" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total Pago" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha Pago" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <dx:ASPxGridViewExporter ID="GvPrint2" runat="server" GridViewID="GvDatos1">
        </dx:ASPxGridViewExporter>
        <dx:ASPxGridViewExporter ID="GvPrint1" runat="server" GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>
