<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InfInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfInventario" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script language="javascript" type="text/javascript">
    function PersonalizaGrilla(s, e) {
        if (GvDatos.IsCustomizationWindowVisible())
            GvDatos.HideCustomizationWindow();
        else
            GvDatos.ShowCustomizationWindow();
        UpdateButtonText();
    }
    function grid_CustomizationWindowCloseUp(s, e) {
        UpdateButtonText();
    }
    function UpdateButtonText() {
        var text = GvDatos.IsCustomizationWindowVisible() ? "Ocultar" : "Mostrar";
        text += " Personalizar Grilla";
        lbl_grilla.SetText(text);
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Inventario</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Inventario</span>
    <span class="tab-end"></span>
    <div id="options">   
     <a>             <asp:ImageButton ID="cmdGrilla"   runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-grilla.png"     OnClientClick="PersonalizaGrilla()" /> 
                       <dx:ASPxLabel ID="lbl_grilla" runat="server" Text="Mostrar Personalizar Grilla" ClientInstanceName="lbl_grilla"> </dx:ASPxLabel></a>      
          <a><asp:ImageButton ID="cmdExcel"    runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" /> Exportar Excel</a>
          
    </div>
</div>
<div>
</div>
<div>
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LqDsInventario">
        <SettingsPager PageSize="30" Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" 
            ShowGroupPanel="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Correlativo" Visible="False" 
                VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Inventario" Visible="False" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ConteoCod" Visible="False" 
                VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="4" GroupIndex="0" 
                SortIndex="0" SortOrder="Ascending">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Entidad" Visible="False" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Conteo" Visible="False" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NUMSerie" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Estado" Visible="False" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="14">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Contenedor" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaElab" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaVcto" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IdUbicCod" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="Contenedor" ShowInColumn="Contenedor" 
                ShowInGroupFooterColumn="Contenedor" SummaryType="Count" Tag="Contenedor" />
        </TotalSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem  FieldName="Contenedor" SummaryType="Count" Tag="Contenedor"  />
        </GroupSummary>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsInventario" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
        OrderBy="Correlativo" TableName="Vista_Inventario_Octubre2017">
    </asp:LinqDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos">
    </dx:ASPxGridViewExporter>
</div>
</asp:Content>
