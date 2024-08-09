<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Dashboards.aspx.cs" Inherits="CVT_MermasRecepcion.Dashboards" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>
<%@ Register Assembly="DevExpress.XtraCharts.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <br />
    <br />
    <table class="dxeBinImgCPnlSys">
        <tr>
            <td dir="rtl">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Mes">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_mes" runat="server">
                    <Items>
                        <dx:ListEditItem Text="1" Value="1" />
                        <dx:ListEditItem Text="2" Value="2" />
                        <dx:ListEditItem Text="3" Value="3" />
                        <dx:ListEditItem Text="4" Value="4" />
                        <dx:ListEditItem Text="5" Value="5" />
                        <dx:ListEditItem Text="6" Value="6" />
                        <dx:ListEditItem Text="7" Value="7" />
                        <dx:ListEditItem Text="8" Value="8" />
                        <dx:ListEditItem Text="9" Value="9" />
                        <dx:ListEditItem Text="10" Value="10" />
                        <dx:ListEditItem Text="11" Value="11" />
                        <dx:ListEditItem Text="12" Value="12" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td dir="rtl">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Año">
                </dx:ASPxLabel>
            </td>
            <td dir="ltr">
                <dx:ASPxComboBox ID="cb_año" runat="server">
                    <Items>
                        <dx:ListEditItem Text="2017" Value="2017" />
                        <dx:ListEditItem Text="2018" Value="2018" />
                        <dx:ListEditItem Text="2019" Value="2019" />
                        <dx:ListEditItem Text="2020" Value="2020" />
                        <dx:ListEditItem Text="2021" Value="2021" />
                        <dx:ListEditItem Text="2022" Value="2012" />
                        <dx:ListEditItem Text="2023" Value="2013" />
                        <dx:ListEditItem Text="2024" Value="2024" />
                        <dx:ListEditItem Text="2025" Value="2025" />

                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_actualizar" runat="server"
                    OnClick="btn_actualizar_Click" Text="Actualizar">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td dir="ltr" colspan="3">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="Large"
                        Text="Detenciones Por Categoria">
                    </dx:ASPxLabel>
                </td>
                <td dir="ltr">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            </table>
        <div>
            <dx:WebChartControl ID="WebChartControl3" runat="server" CrosshairEnabled="True" DataSourceID="LqDsProduccion" Height="327px" SeriesDataMember="Detencion_Motivo" Width="1352px">
                <DiagramSerializable>
                    <dx:XYDiagram>
                        <axisx visibleinpanesserializable="-1">
                        </axisx>
                        <axisy visibleinpanesserializable="-1">
                        </axisy>
                    </dx:XYDiagram>
                </DiagramSerializable>
                <Legend Name="Default Legend" Visibility="False"></Legend>
                <SeriesSerializable>
                    <dx:Series Name="Serie1" />
                </SeriesSerializable>
                <SeriesTemplate ArgumentDataMember="Categoria_Nombre" SeriesDataMember="Detencion_Motivo" ValueDataMembersSerializable="TotalMin" />
            </dx:WebChartControl>
            <asp:LinqDataSource ID="LqDsProduccion" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_VW_ResumenDetenciones"
                Where="Mes == @Mes &amp;&amp; Año == @Año">
                <WhereParameters>
                    <asp:ControlParameter ControlID="cb_mes" DefaultValue="0" Name="Mes" PropertyName="Value" Type="Int32" />
                    <asp:ControlParameter ControlID="cb_año" DefaultValue="0" Name="Año"
                        PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </div>
    </div>

    <br />
    <div>
        <table>
            <tr>
                <td colspan="5">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="Large"
                        Text="Toneladas Movidas por Grupo Producto">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
        <div>
            <dx:WebChartControl ID="WebChartControl2" runat="server"
                CrosshairEnabled="True" DataSourceID="LqDsTonMovidas" Height="300px"
                SeriesDataMember="TIPO" Width="1350px">
                <DiagramSerializable>
                    <dx:XYDiagram>
                        <axisx visibleinpanesserializable="-1">
                            </axisx>
                        <axisy visibleinpanesserializable="-1">
                            </axisy>
                    </dx:XYDiagram>
                </DiagramSerializable>
                <Legend Name="Default Legend"></Legend>
                <SeriesTemplate ArgumentDataMember="ItmsGrpNam"
                    ValueDataMembersSerializable="TON"></SeriesTemplate>
            </dx:WebChartControl>
            <asp:LinqDataSource ID="LqDsTonMovidas" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
                TableName="CVT_VW_ResumenTonMovidasFamilia"
                Where="AÑO == @AÑO">
                <WhereParameters>
                    <asp:ControlParameter ControlID="cb_año" DefaultValue="0" Name="AÑO"
                        PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </div>
    </div>
    <br />
    <br />


    <div>
       <iframe width="933" height="700" src="https://app.powerbi.com/view?r=eyJrIjoiMmZkODMyNTEtMzUxNi00YzA2LTg1MjAtNzc2YzcwMjk5NWJkIiwidCI6ImNlZTgzY2VmLWY2ZDUtNGUyYS04NTUxLTNmZDQ0NjhlOTU3YSJ9" frameborder="0" allowFullScreen="true"></iframe>
    </div>
</asp:Content>
