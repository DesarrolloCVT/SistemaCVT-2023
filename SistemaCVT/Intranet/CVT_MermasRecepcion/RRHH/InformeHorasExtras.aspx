<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeHorasExtras.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.InformeHorasExtras" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>RRHH</a></li>
        <li><span id="current">Informe Horas Extras</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Informe Horas Extras</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a>
          <asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" style="width: 20px" 
              /> Exportar Excel</a>             
     
    </div>
</div>
<div>

    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" 
        DataSourceID="LqDsInfHoras">
        <Fields>
            <dx:PivotGridField ID="fieldAO" FieldName="AÑO" Name="fieldAO" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDepartamento" Area="RowArea" AreaIndex="0" 
                FieldName="Departamento" Name="fieldDepartamento">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDIA" FieldName="DIA" Name="fieldDIA" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldEmpleadoId" FieldName="Empleado_Id" 
                Name="fieldEmpleadoId" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFecha" Area="ColumnArea" AreaIndex="0" 
                FieldName="Fecha" Name="fieldFecha">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldHE100" Area="ColumnArea" AreaIndex="1" 
                FieldName="HE_100" Name="fieldHE100">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldHoras" Area="DataArea" AreaIndex="2" 
                CellFormat-FormatString="N" FieldName="Horas" Name="fieldHoras">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMES" FieldName="MES" Name="fieldMES" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMinutos" FieldName="Minutos" Name="fieldMinutos" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldNombre" Area="RowArea" AreaIndex="2" 
                FieldName="Nombre" Name="fieldNombre">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldRun" Area="RowArea" AreaIndex="1" FieldName="Run" 
                Name="fieldRun">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSEMANA" AreaIndex="0" FieldName="SEMANA" 
                Name="fieldSEMANA">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldsueldobase" Area="RowArea" AreaIndex="3" 
                FieldName="sueldo_base" Name="fieldsueldobase">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldValorBruto" Area="DataArea" AreaIndex="0" 
                CellFormat-FormatString="N" FieldName="ValorBruto" Name="fieldValorBruto">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldValorRedondeado" Area="DataArea" AreaIndex="1" 
                CellFormat-FormatString="N" FieldName="ValorRedondeado" 
                Name="fieldValorRedondeado">
            </dx:PivotGridField>
            <dx:PivotGridField ID="field20000" Area="DataArea" AreaIndex="3" 
                FieldName="_20000" Name="field20000">
            </dx:PivotGridField>
            <dx:PivotGridField ID="field10000" Area="DataArea" AreaIndex="4" 
                FieldName="_10000" Name="field10000">
            </dx:PivotGridField>
            <dx:PivotGridField ID="field5000" Area="DataArea" AreaIndex="5" 
                FieldName="_5000" Name="field5000">
            </dx:PivotGridField>
            <dx:PivotGridField ID="field1000" Area="DataArea" AreaIndex="6" 
                FieldName="_1000" Name="field1000">
            </dx:PivotGridField>
        </Fields>
    </dx:ASPxPivotGrid>
    <asp:LinqDataSource ID="LqDsInfHoras" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
        TableName="CVT_VW_CalculoHorasExtras">
    </asp:LinqDataSource>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="ASPxPivotGrid1">
    </dx:ASPxPivotGridExporter>

</div>
</asp:Content>


