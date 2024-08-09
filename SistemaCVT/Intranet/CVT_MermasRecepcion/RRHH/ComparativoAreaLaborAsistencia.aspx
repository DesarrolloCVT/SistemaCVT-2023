<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ComparativoAreaLaborAsistencia.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.ComparativoAreaLaborAsistencia" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="tableHeader">
        <span class="tableTitle">Compara Asistencia X Area</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" Height="20px" />
                Exportar Excel</a>
            <%--<a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
        </div>
    </div>
     <div>
        <table class="style1">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Desde"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="cbo_Fdesde" runat="server">
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha Hasta">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="cbo_Fhasta" runat="server">
                    </dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <dx:ASPxButton ID="btn_Generar" runat="server" OnClick="btn_Generar_Click"
                        Text="Generar">
                    </dx:ASPxButton>
                </td>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxPivotGrid ID="PvComparaAreaLabor" runat="server" OptionsData-DataProcessingEngine="Optimized" OptionsFilter-FilterPanelMode="Filter" ClientIDMode="AutoID"  IsMaterialDesign="False" >
            <Fields>
                <dx:PivotGridField ID="fieldCantPersonasLabor" FieldName="CantPersonasLabor" Name="fieldCantPersonasLabor" OLAPExpression="" Visible="True" Area="DataArea" AreaIndex="0">
                </dx:PivotGridField>
                
                <dx:PivotGridField ID="fieldTotalHorasTrabajadas" FieldName="TotalHorasTrabajadas" Name="fieldTotalHorasTrabajadas" Visible="True" Area="DataArea" AreaIndex="1">
                    <CellFormat FormatString="N0" />
                    <ValueFormat FormatString="N0" FormatType="Custom" />
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFecha" FieldName="Fecha" Name="fieldFecha" Visible="True" Area="RowArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" FieldName="Area" Name="fieldArea" Visible="True" Area="ColumnArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLabor" FieldName="Labor" Name="fieldLabor" Visible="True" Area="ColumnArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEmpresa" FieldName="Empresa" Name="fieldEmpresa" Visible="True" Area="ColumnArea" AreaIndex="2">
                </dx:PivotGridField>
               
                <dx:PivotGridField ID="fieldTotalPagoxHoras" FieldName="TotalPagoxHoras" Area="DataArea" AreaIndex="2" Name="fieldTotalPagoxHoras">
                    <CellFormat FormatString="0,000" FormatType="Custom" />
                </dx:PivotGridField>
               
            </Fields>
            
            <OptionsView ShowColumnGrandTotals="False" ShowColumnTotals="False" ShowRowTotals="False" />
            <OptionsPager RowsPerPage="1000"></OptionsPager>
<OptionsData DataProcessingEngine="Optimized"></OptionsData>

<OptionsFilter FilterPanelMode="Filter"></OptionsFilter>
        </dx:ASPxPivotGrid>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
        ASPxPivotGridID="PvComparaAreaLabor">
    </dx:ASPxPivotGridExporter>
    </div>

</asp:Content>