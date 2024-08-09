<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CartolaVsCuentaSAP.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.CartolaVsCuentaSAP" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Cierre Mensual</a></li>
            <li><a href="TesoreriaBlank.aspx">Tesoreria</a></li>
            <li><span id="current">Cartola VS Cuenta SAP</span></li>
        </ul>
    </div>
    <div id="tableHeader">
    <span class="tableTitle">Cartola VS Cuenta SAP</span>
    <span class="tab-end"></span>
    </div>
    <div>
        
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="500px" HeaderText="Filtro">
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
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <Columns>
                <dx:GridViewDataTextColumn Caption="Cod Cuenta Banco" FieldName="AcctCode" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nombre Banco" FieldName="AcctName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Saldo Inicial Cartola" FieldName="SaldoIni_Cartola" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Saldo Perido Cartola" FieldName="SaldoPeriodo_Cartola" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Saldo Inicial Cuenta" FieldName="SaldoIni_Cuenta" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Saldo Periodo Cuenta" FieldName="SaldoPeriodo_Cuenta" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
</asp:Content>
