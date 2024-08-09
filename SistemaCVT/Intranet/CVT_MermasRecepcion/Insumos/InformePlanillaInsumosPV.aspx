<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformePlanillaInsumosPV.aspx.cs" Inherits="CVT_MermasRecepcion.Insumos.InformePlanillaInsumosPV" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">

    <div id="tableHeader">
        <span class="tableTitle">Informe Planilla Insumos</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
           
        </div>
    </div>
     <div>
         
        <table class="style1">
           
            <tr>
                <td>
                    <dx:aspxlabel ID="ASPxLabel2" runat="server" Text="Mes">
                    </dx:aspxlabel>
                </td>
                <td>
                    <dx:aspxcombobox ID="cbo_Mes" runat="server" Width="200px">
                        <Items>
                            <dx:ListEditItem Text="Todos" Value="0" />
                            <dx:ListEditItem Text="Enero" Value="1" />
                            <dx:ListEditItem Text="Febrero" Value="2" />
                            <dx:ListEditItem Text="Marzo" Value="3" />
                            <dx:ListEditItem Text="Abril" Value="4" />
                            <dx:ListEditItem Text="Mayo" Value="5" />
                            <dx:ListEditItem Text="Junio" Value="6" />
                            <dx:ListEditItem Text="Julio" Value="7" />
                            <dx:ListEditItem Text="Agosto" Value="8" />
                            <dx:ListEditItem Text="Septiembre" Value="9" />
                            <dx:ListEditItem Text="Octubre" Value="10" />
                            <dx:ListEditItem Text="Noviembre" Value="11" />
                            <dx:ListEditItem Text="Diciembre" Value="12" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:aspxcombobox>
                </td>
                <td>
                    <dx:aspxlabel ID="ASPxLabel1" runat="server" Text="Año">
                    </dx:aspxlabel>
                </td>
                <td>
                    <dx:aspxcombobox ID="cb_ano" runat="server" Width="200px">
                        <Items>
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                            <dx:ListEditItem Text="2026" Value="2026" />
                            <dx:ListEditItem Text="2027" Value="2027" />
                            <dx:ListEditItem Text="2028" Value="2028" />
                            <dx:ListEditItem Text="2029" Value="2029" />
                            <dx:ListEditItem Text="2030" Value="2030" />
                            <dx:ListEditItem Text="2031" Value="2031" />
                            <dx:ListEditItem Text="2032" Value="2032" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:aspxcombobox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:aspxbutton ID="btn_Generar" runat="server" OnClick="btn_Generar_Click"
                        Text="Generar">
                    </dx:aspxbutton>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:aspxpivotgrid ID="PvInformePlanillaIns" runat="server" OptionsData-DataProcessingEngine="Optimized" OptionsFilter-FilterPanelMode="Filter" ClientIDMode="AutoID"  IsMaterialDesign="False" >
            <Fields>
                <dx:PivotGridField ID="fieldFolio" FieldName="Folio" Name="fieldFolio" OLAPExpression="" Visible="True" AreaIndex="2" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" Visible="True" Area="ColumnArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" FieldName="Area" Name="fieldArea" Visible="True" Area="ColumnArea" AreaIndex="1" >
                </dx:PivotGridField>
                
                <dx:PivotGridField ID="fieldItmsGrpNam" FieldName="ItmsGrpNam" Name="fieldItmsGrpNam" Visible="True" Area="RowArea" AreaIndex="0" Caption="Grupo" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItemCode" FieldName="ItemCode" Name="fieldItemCode" Visible="True" Area="RowArea" AreaIndex="1" Caption="Cod Articulo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItemName" FieldName="ItemName" Name="fieldItemName" Visible="True" Area="RowArea" AreaIndex="2" Caption="Articulo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDescripcion" FieldName="Descripcion" Name="fieldDescripcion" Visible="True" Area="RowArea" AreaIndex="3">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidad" FieldName="Cantidad" Name="fieldCantidad" Visible="True" Area="DataArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCod_Proveedor" FieldName="Cod_Proveedor" Name="fieldCod_Proveedor" Visible="True" AreaIndex="0" >
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProveedor" FieldName="Proveedor" Name="fieldProveedor" Visible="True" AreaIndex="1" >
                </dx:PivotGridField>
               
            </Fields>
            <OptionsPager RowsPerPage="1000"></OptionsPager>
<OptionsData DataProcessingEngine="Optimized"></OptionsData>

<OptionsFilter FilterPanelMode="Filter"></OptionsFilter>
        </dx:aspxpivotgrid>
        <dx:aspxpivotgridexporter ID="ASPxPivotGridExporter1" runat="server"
        ASPxPivotGridID="PvInformePlanillaIns">
    </dx:aspxpivotgridexporter>
    </div>


</asp:Content>
