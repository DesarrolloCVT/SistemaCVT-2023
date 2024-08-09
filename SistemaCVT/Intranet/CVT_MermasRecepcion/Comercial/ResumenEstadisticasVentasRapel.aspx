<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResumenEstadisticasVentasRapel.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.ResumenEstadisticasVentasRapel" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 11px;
        }
        .auto-style6 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comex</a></li>
            <li><span id="current">Comparativo Estadistica de Ventas Comerciales</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Comparativo Estadistica de Ventas Comerciales</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1" Width="20px" />
                Exportar Excel</a>&nbsp;

             
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <br />
      <div style="margin-left:50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha inicio" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFini" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="50px" OnClick="btnBuscar_Click" Width="93px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>  
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldTipo" FieldName="Tipo" Name="fieldTipo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFechaContab" FieldName="Fecha_Contab" Name="fieldFechaContab" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFecVencto" FieldName="Fec_Vencto" Name="fieldFecVencto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCompContable" FieldName="CompContable" Name="fieldCompContable" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFolio" FieldName="Folio" Name="fieldFolio" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNumInterno" FieldName="Num_Interno" Name="fieldNumInterno" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodCliente" FieldName="Cod_Cliente" Name="fieldCodCliente" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRazonSocial" FieldName="Razon_Social" Name="fieldRazonSocial" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItmsGrpCod" FieldName="ItmsGrpCod" Name="fieldItmsGrpCod" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItmsGrpNam" FieldName="ItmsGrpNam" Name="fieldItmsGrpNam" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDescripcion" FieldName="Descripcion" Name="fieldDescripcion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidad" FieldName="Cantidad" Name="fieldCantidad" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecUnitario" FieldName="Prec_Unitario" Name="fieldPrecUnitario" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCosto" FieldName="Costo" Name="fieldCosto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalLinea" FieldName="Total_Linea" Name="fieldTotalLinea" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNameIndica" FieldName="Name_Indica" Name="fieldNameIndica" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrcRapel" FieldName="Prc_Rapel" Name="fieldPrcRapel" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecSinRapel" FieldName="Prec_SinRapel" Name="fieldPrecSinRapel" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldShipToCode" FieldName="ShipToCode" Name="fieldShipToCode" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDireccion" FieldName="Direccion" Name="fieldDireccion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCiudad" FieldName="Ciudad" Name="fieldCiudad" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTipoVenta" FieldName="TipoVenta" Name="fieldTipoVenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCostoFinal" FieldName="CostoFinal" Name="fieldCostoFinal" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPeso" FieldName="Peso" Name="fieldPeso" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMarca" FieldName="Marca" Name="fieldMarca" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCanal" FieldName="Canal" Name="fieldCanal" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTipoNegocio" FieldName="TipoNegocio" Name="fieldTipoNegocio" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldVendedor" FieldName="Vendedor" Name="fieldVendedor" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTipoMarca" FieldName="TipoMarca" Name="fieldTipoMarca" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOCReferencia" FieldName="OC_Referencia" Name="fieldOCReferencia" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldVendedorDireccion" FieldName="VendedorDireccion" Name="fieldVendedorDireccion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMedidaVentas" FieldName="MedidaVentas" Name="fieldMedidaVentas" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadMedidaVentas" FieldName="CantidadMedidaVentas" Name="fieldCantidadMedidaVentas" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMedidaEmbalaje" FieldName="MedidaEmbalaje" Name="fieldMedidaEmbalaje" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadxPaquete" FieldName="CantidadxPaquete" Name="fieldCantidadxPaquete" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPastaColiseo" FieldName="PastaColiseo" Name="fieldPastaColiseo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTPastaColiseo" FieldName="TPastaColiseo" Name="fieldTPastaColiseo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLAColiseoCM" FieldName="LA_Coliseo_CM" Name="fieldLAColiseoCM" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTLAColiseoCM" FieldName="TLA_Coliseo_CM" Name="fieldTLAColiseoCM" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLAColiseoW" FieldName="LA_Coliseo_W" Name="fieldLAColiseoW" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTLAColiseoW" FieldName="TLA_Coliseo_W" Name="fieldTLAColiseoW" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLAMMPPW" FieldName="LA_MMPP_W" Name="fieldLAMMPPW" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTLAMMPPW" FieldName="TLA_MMPP_W" Name="fieldTLAMMPPW" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCentralizacion" FieldName="Centralizacion" Name="fieldCentralizacion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTCentralizacion" FieldName="TCentralizacion" Name="fieldTCentralizacion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMerma" FieldName="Merma" Name="fieldMerma" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTMerma" FieldName="TMerma" Name="fieldTMerma" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDistribCentMMPP" FieldName="Distrib_Cent_MMPP" Name="fieldDistribCentMMPP" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTDistribCentMMPP" FieldName="TDistrib_Cent_MMPP" Name="fieldTDistribCentMMPP" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDistribCentRestSurtido" FieldName="Distrib_Cent_Rest_Surtido" Name="fieldDistribCentRestSurtido" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTDistribCentRestSurtido" FieldName="TDistrib_Cent_Rest_Surtido" Name="fieldTDistribCentRestSurtido" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldExtranetRestSurtido" FieldName="Extranet_Rest_Surtido" Name="fieldExtranetRestSurtido" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTExtranetRestSurtido" FieldName="TExtranet_Rest_Surtido" Name="fieldTExtranetRestSurtido" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRebateFijo" FieldName="Rebate_Fijo" Name="fieldRebateFijo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTRebateFijo" FieldName="TRebate_Fijo" Name="fieldTRebateFijo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldReposicionIntSellOut" FieldName="Reposicion_Int_SellOut" Name="fieldReposicionIntSellOut" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTReposicionIntSellOut" FieldName="TReposicion_Int_SellOut" Name="fieldTReposicionIntSellOut" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNoDevolucion" FieldName="NoDevolucion" Name="fieldNoDevolucion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTNoDevolucion" FieldName="TNoDevolucion" Name="fieldTNoDevolucion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPEL" FieldName="PEL" Name="fieldPEL" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTPEL" FieldName="TPEL" Name="fieldTPEL" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCobroFianza" FieldName="CobroFianza" Name="fieldCobroFianza" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTCobroFianza" FieldName="TCobroFianza" Name="fieldTCobroFianza" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalRapel" FieldName="TotalRapel" Name="fieldTotalRapel" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTTotalRapel" FieldName="TTotalRapel" Name="fieldTTotalRapel" Visible="False">
                </dx:PivotGridField>
            </Fields>
        </dx:ASPxPivotGrid>
        <br />
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="PvDatos">
        </dx:ASPxPivotGridExporter>
    </div>
</asp:Content>
