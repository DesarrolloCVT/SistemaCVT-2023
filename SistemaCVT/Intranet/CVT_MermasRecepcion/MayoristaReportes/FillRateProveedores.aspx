<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FillRateProveedores.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.FillRateProveedores" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Fill Rate Proveedores</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Fill Rate Proveedores</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 20px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="Fecha_Inicio" runat="server" Text="Fecha de Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>

                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Tipo Informe"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTipoInforme" runat="server" Height="30px">
                        <Items>
                            <dx:ListEditItem Text="Informe Resumido" Value="true" />
                            <dx:ListEditItem Text="Informe Completo" Value="false" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>

            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 20px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="label1" runat="server" Text="Proveedor (Opcional)"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboProveedor" runat="server" ValueType="System.String" Height="30px" Width="250px" DataSourceID="lqsProveedor2" ValueField="CardCode">
                        <Columns>
                            <dx:ListBoxColumn FieldName="CardCode" Width="200px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="CardName" Width="250px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Grupo de Articulo (Opcional)"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboItemGroup" runat="server" DataSourceID="LqsItemGroup" TextField="ItmsGrpNam" ValueField="ItmsGrpCod" Height="30px"></dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="labelq" runat="server" Text="N° OC (Opcional)"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtOC" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btLimpiar" runat="server" Text="Limpiar Filtros" Theme="iOS" BackColor="Red" CausesValidation="False" OnClick="btLimpiar_Click" Height="48px">
                        <Image IconID="filter_clearfilter_16x16">
                        </Image>
                    </dx:ASPxButton>
                </td>

            </tr>
        </table>
        <br />
        <div style="margin-left: 150px">
            <dx:ASPxButton ID="btVerInforme" runat="server" Text="Ver Informe" OnClick="btVerInforme_Click" Height="49px" Theme="iOS" Width="204px">
                <Image IconID="edit_paste_16x16">
                </Image>
            </dx:ASPxButton>
        </div>
        <asp:LinqDataSource ID="lqsProveedor2" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName=""
            TableName="MMetro_OCRD" Where="CardType == @CardType">
            <WhereParameters>
                <asp:Parameter DefaultValue="S" Name="CardType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsItemGroup" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (ItmsGrpCod, ItmsGrpNam)" TableName="MMETRO_OITB">
        </asp:LinqDataSource>
    </div>
</asp:Content>
