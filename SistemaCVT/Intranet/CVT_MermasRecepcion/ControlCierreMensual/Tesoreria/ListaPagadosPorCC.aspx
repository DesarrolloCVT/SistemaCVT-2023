<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ListaPagadosPorCC.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.ListaPagadosPorCC" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Cierre Mensual</a></li>
            <li><a href="TesoreriaBlank.aspx">Tesoreria</a></li>
            <li><span id="current">Lista Pagados Por CC</span></li>
        </ul>
    </div>
    <div id="tableHeader">
    <span class="tableTitle">Lista Pagados Por CC</span>
    <span class="tab-end"></span>
    </div>

    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Width="200px" HeaderText="Filtro">
        <PanelCollection>
<dx:PanelContent runat="server">
    <table>
        <tr>
            <td style="width:250px">
                <label>Fecha Inicial</label>
            </td>
            <td>
                <label>Fecha Final</label>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxDateEdit ID="cb_fini" runat="server"></dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cb_fter" runat="server"></dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" Text="Buscar" OnClick="btn_buscar_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
</dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>

        <div>
            <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False">
                <SettingsPager PageSize="20">
                </SettingsPager>
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Centro Costo" FieldName="CenCosto" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <FocusedRow BackColor="#FF9933">
                    </FocusedRow>
                </Styles>
            </dx:ASPxGridView>
        </div>
</asp:Content>
