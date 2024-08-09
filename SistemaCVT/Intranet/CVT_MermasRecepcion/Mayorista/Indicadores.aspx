<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Indicadores.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.Indicadores" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            width: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Indicadores</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Indicadores</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--     <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
            <%--     <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Desde"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Hasta"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btnVer" runat="server" Text="Ver" Height="41px" Width="62px" OnClick="btnVer_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <div style="float: left; margin-left: 20px">
            <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" Width="200px">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Horario" MaxWidth="130" MinWidth="125" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantVentas" MaxWidth="130" MinWidth="125" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
        <div style="display: inline-block; margin-left: 120px">
            <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" Height="350px" Width="550px">
                <Legend Name="Default Legend"></Legend>
                <Titles>
                    <cc1:ChartTitle Text="Cantidad de Ventas x Hora" />
                </Titles>
            </dx:WebChartControl>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <div style="float: left; margin-left: 20px">
            <dx:ASPxGridView ID="GvDatos2" runat="server" AutoGenerateColumns="False" Width="300px">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="0" MaxWidth="100" MinWidth="100" Width="100px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Dia" VisibleIndex="1" MaxWidth="150" MinWidth="150" Width="150px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NDia" VisibleIndex="2" Visible="False">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </div>
        <div style="float: left; margin-left: 20px">
            <dx:WebChartControl ID="WebChartControl2" runat="server" CrosshairEnabled="True" Height="350px" Width="550px" PaletteName="Office">
                <Legend Name="Default Legend"></Legend>
                <Titles>
                    <cc1:ChartTitle Text="Cantidad de Ventas x Día" />
                </Titles>
            </dx:WebChartControl>
        </div>
    </div>
</asp:Content>
