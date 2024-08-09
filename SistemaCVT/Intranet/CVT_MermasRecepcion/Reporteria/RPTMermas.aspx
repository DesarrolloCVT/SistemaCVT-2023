<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RPTMermas.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.RPTMermas" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
                <ul>
                    <li><a href="../Blank.aspx">Inicio</a></li>
                    <li><a>Reportes</a></li>
                    <li><span id="current">Mermas</span></li>
                </ul>
            </div>

                <div id="tableHeader">
                <span class="tableTitle">Mermas</span>
                <span class="tab-end"></span>
                    <div id="options">                   
                               
                                   <a>             <asp:ImageButton ID="cmdExcel"    runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" /> Exportar Excel</a>
                                 <a>             <asp:ImageButton ID="cmdGrilla"   runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-grilla.png"     OnClientClick="PersonalizaGrilla()" /> 
                       <dx:ASPxLabel ID="lbl_grilla" runat="server" Text="Mostrar Personalizar Grilla" ClientInstanceName="lbl_grilla"> </dx:ASPxLabel> </a> 
                        </div>
                   </div>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true"
        Width="100%">
        <PanelCollection>
<dx:PanelContent runat="server">
    <table class="style1">
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Proveedor">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_proveedor" runat="server" DataSourceID="LqDsProveedor" 
                    TextField="CardName" ValueField="CardCode">
                    <Columns>
                        <dx:ListBoxColumn FieldName="CardCode" Name="Codigo" />
                        <dx:ListBoxColumn FieldName="CardName" Name="Proveedor" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsProveedor" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
                    TableName="CVT_CmbProveedorCompraImp_Vista">
                </asp:LinqDataSource>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Guia">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_guia" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Recepcion SAP">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_recsap" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Grupo Producto">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxComboBox ID="cb_gproducto" runat="server" DataSourceID="LqDsGrupo" 
                    TextField="ItmsGrpNam" ValueField="ItmsGrpCod">
                    <Columns>
                        <dx:ListBoxColumn FieldName="ItmsGrpCod" Name="Codigo" />
                        <dx:ListBoxColumn FieldName="ItmsGrpNam" Name="Grupo" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsGrupo" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
                    TableName="CVT_CmbGrupoProductoCompraImp_Vista">
                </asp:LinqDataSource>
            </td>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Factura Cliente">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxTextBox ID="txt_factura" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Recepcion WMS">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxTextBox ID="txt_recwms" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td class="style2">
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_producto" runat="server" DataSourceID="LqDsProducto" 
                    TextField="DescProducto" ValueField="ItemCode">
                    <Columns>
                        <dx:ListBoxColumn FieldName="ItemCode" Name="Codigo" />
                        <dx:ListBoxColumn FieldName="DescProducto" Name="Producto" />
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsProducto" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
                    TableName="CVT_CmbProductosCompraImp_Vista">
                </asp:LinqDataSource>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Orden de Compra">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_oc" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Lote Interno">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Fecha Recepcion">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox ID="ch_frecep" runat="server" CheckState="Unchecked" 
                    ClientInstanceName="ch_frecep" Text=" ">
                </dx:ASPxCheckBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" ClientInstanceName="lb_fini" 
                    Text="Fecha Inicio">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cb_fini" runat="server" ClientInstanceName="cb_fini">
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" ClientInstanceName="lb_ffin" 
                    Text="Fecha Fin">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cb_ffin" runat="server" ClientInstanceName="cb_ffin">
                </dx:ASPxDateEdit>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" Text="BUSCAR" 
                    OnClick="btn_buscar_Click">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
    <dx:ASPxGridViewExporter ID="GridExporter" runat="server" GridViewID="GvDatos">
    </dx:ASPxGridViewExporter>
    <dx:ASPxGridView ID="GvDatos" runat="server" Width="100%">
        <Settings ShowGroupPanel="True" />
    </dx:ASPxGridView>
</asp:Content>
