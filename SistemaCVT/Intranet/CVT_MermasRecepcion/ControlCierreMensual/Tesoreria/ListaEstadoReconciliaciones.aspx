<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListaEstadoReconciliaciones.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.ListaEstadoReconciliaciones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Cierre Mensual</a></li>
            <li><a href="TesoreriaBlank.aspx">Tesoreria</a></li>
            <li><span id="current">Lista Estado Reconciliaciones</span></li>
        </ul>
    </div>
     <div id="tableHeader">
    <span class="tableTitle">Lista Estado Reconciliaciones</span>
    <span class="tab-end"></span>
    </div>
    <div>
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
        
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="CardCode" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Razon Social" FieldName="CardName" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="TipoDoc" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>
</asp:Content>
