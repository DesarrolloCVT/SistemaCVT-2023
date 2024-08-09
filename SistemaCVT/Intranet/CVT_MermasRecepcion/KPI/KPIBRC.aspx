<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="KPIBRC.aspx.cs" Inherits="CVT_MermasRecepcion.KPI.KPIBRC" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>KPI</a></li>
            <li><span id="current">KPI BRC</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">KPI BRC</span>
        <span class="tab-end"></span>

    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Mes"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_mes" runat="server">
                        <Items>
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
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Año"></dx:ASPxLabel>
                    </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_ano" runat="server">
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
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="BUSCAR"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="KPI Devoluciones" Font-Bold="True" Font-Size="Large"></dx:ASPxLabel>
        <table>
            <tr>
                <td>
                    <dx:ASPxGridView ID="GvKPIDevoluciones" runat="server" AutoGenerateColumns="False" DataSourceID="LqDevoluciones" >
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ventas" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="n2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Devolucion" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="n2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Porc" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="n2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDevoluciones" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_Devoluciones_Ventas_KPI" Where="Mes == @Mes &amp;&amp; Año == @Año">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="Mes" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="cbo_ano" DefaultValue="0" Name="Año" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:WebChartControl ID="GrafDevoluciones" runat="server" CrosshairEnabled="True" DataSourceID="LqDevoluciones" Height="300px" Width="400px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <Legend Visibility="True" AlignmentHorizontal="Center" AlignmentVertical="TopOutside"><Title Text="Devoluciones sobre Ventas" Visible="True" WordWrap="True"></Title></Legend>
                        <SeriesSerializable>
                            <dx:Series ArgumentDataMember="GrupoArticulo" LabelsVisibility="True" Name="Porc Devoluciones sobre Ventas" ValueDataMembersSerializable="Porc">
                                <LabelSerializable>
                                    <dx:SideBySideBarSeriesLabel TextPattern="{V:N2}">
                                    </dx:SideBySideBarSeriesLabel>
                                </LabelSerializable>
                            </dx:Series>
                        </SeriesSerializable>
                    </dx:WebChartControl>
                </td>
                
            </tr>
            <tr>
                <td>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="KPI Motivos Devoluciones" Font-Bold="True" Font-Size="Large"></dx:ASPxLabel>
            </td>
                    </tr>
            <tr>
                <td>
                    <dx:ASPxGridView ID="GvMotivos" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsMotivos">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Cod_Cliente" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cliente" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Peso" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cod_Motivo" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Motivo" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Razon_Global_Devolucion" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes_Devolucion" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Año_Devolucion" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsMotivos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" OrderBy="Cod_Cliente, Motivo, Peso" TableName="CVT_VW_DevolucionesMotivos" Where="Año_Devolucion == @Año_Devolucion &amp;&amp; Mes_Devolucion == @Mes_Devolucion">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_ano" DefaultValue="0" Name="Año_Devolucion" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="Mes_Devolucion" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:WebChartControl ID="GrafMotivos" runat="server" CrosshairEnabled="True" DataSourceID="LqDsMotivos" Height="600px" SeriesDataMember="Motivo" Width="1500px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <Legend MarkerSize="15, 9"><Title Text="Motivos" Visible="True"></Title></Legend>
                        <SeriesTemplate ArgumentDataMember="Cliente" SeriesDataMember="Motivo" ValueDataMembersSerializable="Peso" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1">
                        </SeriesTemplate>
                    </dx:WebChartControl>
                </td>
            </tr>
        </table>
    </div>
      <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="KPI Produccion" Font-Bold="True" Font-Size="Large"></dx:ASPxLabel>
        <table>
            <tr>
                <td>
                    <dx:ASPxGridView ID="GvKPIProduccion" runat="server" AutoGenerateColumns="False" DataSourceID="LqProduccion">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="MES" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AÑO" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="GRUPO" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SumaMeta" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="n0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SumaProducidoReal" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="n0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PromedioCumplimiento" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="n2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cumplimiento" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="n2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqProduccion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_PRODUCCION_KPI" Where="MES == @MES &amp;&amp; AÑO == @AÑO">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="MES" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="cbo_ano" DefaultValue="0" Name="AÑO" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:WebChartControl ID="GrafProduccion" runat="server" CrosshairEnabled="True" DataSourceID="LqProduccion" Height="300px" Width="400px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                                <DefaultPane>
                                    <StackedBarTotalLabel Visible="True">
                                    </StackedBarTotalLabel>
                                </DefaultPane>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <Legend AlignmentHorizontal="Center" AlignmentVertical="TopOutside" Visibility="True"><Title Text="Porcentaje Cumplimiento Produccion" Visible="True"></Title></Legend>
                        <SeriesSerializable>
                            <dx:Series ArgumentDataMember="GRUPO" Name="Porc Cumplimiento Produccion" ValueDataMembersSerializable="PromedioCumplimiento" LabelsVisibility="True">
                                <LabelSerializable>
                                    <dx:SideBySideBarSeriesLabel TextPattern="{V:N2}">
                                    </dx:SideBySideBarSeriesLabel>
                                </LabelSerializable>
                            </dx:Series>
                        </SeriesSerializable>
                    </dx:WebChartControl>
                </td>
            </tr>
            <tr>
                <td>
                     <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="KPI Produccion Detenciones" Font-Bold="True" Font-Size="Large"></dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxGridView ID="GvDetenciones" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsDetenciones">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ano" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Categoria_Nombre" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Detencion_Motivo" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItmsGrpNam" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MinDetencion" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MinutosTotales" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Golpes" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Kilos" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsDetenciones" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_ProduccionDetencionesKPI" Where="Ano == @Ano &amp;&amp; Mes == @Mes">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_ano" DefaultValue="0" Name="Ano" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="Mes" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:WebChartControl ID="GrafDetenciones" runat="server" CrosshairEnabled="True" DataSourceID="LqDsDetenciones" Height="600px" SeriesDataMember="Detencion_Motivo" Width="1500px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <SeriesTemplate ArgumentDataMember="ItmsGrpNam" SeriesDataMember="Detencion_Motivo" SeriesPointsSortingKey="Value_1" ValueDataMembersSerializable="Kilos">
                        </SeriesTemplate>
                    </dx:WebChartControl>
                </td>
            </tr>
        </table>
    </div>
      <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="KPI Barrido" Font-Bold="True" Font-Size="Large"></dx:ASPxLabel>
        <table>
            <tr>
                <td>
                    <dx:ASPxGridView ID="GvKPIBarrido" runat="server" AutoGenerateColumns="False" DataSourceID="LqBarrido">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="MES" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AÑO" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="GRUPO" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ProducidoReal" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="n0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="KilosReproceso" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="KilosBarrido" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PromedioBarrido" VisibleIndex="6" PropertiesTextEdit-DisplayFormatString="n4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PromedioReproceso" VisibleIndex="7" PropertiesTextEdit-DisplayFormatString="n4">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqBarrido" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_BARRIDOREPROCESO_KPI" Where="MES == @MES &amp;&amp; AÑO == @AÑO">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="MES" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="cbo_ano" DefaultValue="0" Name="AÑO" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:WebChartControl ID="GrafBarrido" runat="server" CrosshairEnabled="True" DataSourceID="LqBarrido" Height="300px" Width="400px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <Legend AlignmentHorizontal="Center" AlignmentVertical="TopOutside"><Title Text="Porcentaje Barrido y reproceso sobre produccion" Visible="True"></Title></Legend>
                        <SeriesSerializable>
                            <dx:Series ArgumentDataMember="GRUPO" Name="Porc Barrido" ValueDataMembersSerializable="PromedioBarrido" LabelsVisibility="True">
                                <LabelSerializable>
                                    <dx:SideBySideBarSeriesLabel TextPattern="{V:N4}">
                                    </dx:SideBySideBarSeriesLabel>
                                </LabelSerializable>
                            </dx:Series>
                            <dx:Series ArgumentDataMember="GRUPO" Name="Porc Reproceso" ValueDataMembersSerializable="PromedioReproceso" LabelsVisibility="True">
                                <LabelSerializable>
                                    <dx:SideBySideBarSeriesLabel TextPattern="{V:N4}">
                                    </dx:SideBySideBarSeriesLabel>
                                </LabelSerializable>
                            </dx:Series>
                        </SeriesSerializable>
                    </dx:WebChartControl>
                </td>
            </tr>
        </table>
    </div>




</asp:Content>
