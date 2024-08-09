<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DetalleCC.aspx.cs" Inherits="CVT_MermasRecepcion.Contabilidad.DetalleCC" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Contabilidad</a></li>
            <li><span id="current">Detalle U.Adm</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle U.Adm</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;         
        </div>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Año"></dx:ASPxLabel>
                    <dx:ASPxDateEdit runat="server" PickerType="Years" ID="dteano" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Mes"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboMes" runat="server" Height="30px">
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
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Uni.Administrativa"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboUAdmi" runat="server" Height="30px">
                        <Items>
                            <dx:ListEditItem Text="TODOS" Value="Todos" />
                            <dx:ListEditItem Text="ADMIN" Value="ADMIN" />
                            <dx:ListEditItem Text="ADMIN_AG" Value="ADMIN_AG" />
                            <dx:ListEditItem Text="CORP_UNI" Value="CORP_UNI" />
                            <dx:ListEditItem Text="FINANZAS" Value="FINANZAS" />
                            <dx:ListEditItem Text="PLANTA" Value="PLANTA" />
                            <dx:ListEditItem Text="PROD_SL" Value="PROD_SL" />
                            <dx:ListEditItem Text="VENTAS" Value="VENTAS" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" Height="40px" OnClick="btn_Buscar_Click" Width="100px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldL1CodCuenta" Area="RowArea" AreaIndex="0" FieldName="L1CodCuenta" Name="fieldL1CodCuenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL1Cuenta" Area="RowArea" AreaIndex="0" FieldName="L1Cuenta" Name="fieldL1Cuenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL2CodCuenta" Area="RowArea" AreaIndex="0" FieldName="L2CodCuenta" Name="fieldL2CodCuenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL2Cuenta" Area="RowArea" AreaIndex="0" FieldName="L2Cuenta" Name="fieldL2Cuenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL3CodCuenta" Area="RowArea" AreaIndex="0" FieldName="L3CodCuenta" Name="fieldL3CodCuenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL3Cuenta" Area="RowArea" AreaIndex="0" FieldName="L3Cuenta" Name="fieldL3Cuenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL4CodCuenta" Area="RowArea" AreaIndex="0" FieldName="L4CodCuenta" Name="fieldL4CodCuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL4Cuenta" Area="RowArea" AreaIndex="1" FieldName="L4Cuenta" Name="fieldL4Cuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL5CodCuenta" FieldName="L5CodCuenta" Name="fieldL5CodCuenta" Area="RowArea" AreaIndex="2">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL5Cuenta" FieldName="L5Cuenta" Name="fieldL5Cuenta" Area="RowArea" AreaIndex="3">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL6CodCuenta" FieldName="L6CodCuenta" Name="fieldL6CodCuenta" Visible="False" Area="RowArea" AreaIndex="4">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldL6Cuenta" FieldName="L6Cuenta" Name="fieldL6Cuenta" Visible="False" Area="RowArea" AreaIndex="4">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDivision" Area="RowArea" AreaIndex="2" FieldName="Division" Name="fieldDivision" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUAdm" Area="RowArea" AreaIndex="2" FieldName="UAdm" Name="fieldUAdm" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCCosto" Area="ColumnArea" AreaIndex="1" FieldName="CCosto" Name="fieldCCosto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItem" FieldName="Item" Name="fieldItem" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDEBITO" Area="DataArea" AreaIndex="0" FieldName="DEBITO" Name="fieldDEBITO" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCREDITO" Area="DataArea" AreaIndex="0" FieldName="CREDITO" Name="fieldCREDITO" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSALDO" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" FieldName="SALDO" Name="fieldSALDO">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAO" Area="ColumnArea" AreaIndex="0" FieldName="AÑO" Name="fieldAO" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMES" Area="ColumnArea" AreaIndex="0" FieldName="MES" Name="fieldMES">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="1000" AlwaysShowPager="True">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
