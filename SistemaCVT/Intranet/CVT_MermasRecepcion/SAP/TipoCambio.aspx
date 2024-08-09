<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TipoCambio.aspx.cs" Inherits="CVT_MermasRecepcion.SAP.TipoCambio" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
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
        <li><a>SAP</a></li>
        <li><span id="current">Tipo Cambio</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Actualiza Tipo Cambio SAP</span>
    <span class="tab-end"></span>
</div>
<div>

    <table class="style1">
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_fecha_inicio" runat="server">
                    <ValidationSettings ValidationGroup="a">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Moneda">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_TipoMoneda" runat="server" DataSourceID="LqDsCurrency" 
                    ValueField="Serie_BancoCentral" TextField="Moneda_Code">
                    <ValidationSettings ValidationGroup="a">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsCurrency" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" 
                    EntityTypeName="" TableName="CVT_Homologacion_Moneda_BancoCentral">
                </asp:LinqDataSource>
            </td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" Text="Buscar" 
                    onclick="btn_buscar_Click" ValidationGroup="a">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha Termino">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_fecha_termino" runat="server">
                    <ValidationSettings ValidationGroup="a">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Valor:">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_tipomoneda" runat="server">
                </dx:ASPxLabel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="5">
                <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
                    Width="300px">
                    <SettingsPager PageSize="10000" Visible="False">
                    </SettingsPager>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Fecha" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Valor" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_sync" runat="server" Text="Sincronizar" 
                    onclick="btn_sync_Click">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</div>
</asp:Content>
