
<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMReporteInventario.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.SMMReporteInventario" %>

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
            <li><a>Informes</a></li>
            <li><span id="current">SMM Inventario</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Reporte Inventario</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxButton ID="btnDescargar" runat="server" Text="Descargar" Height="30px" OnClick="btnDescargar_Click"></dx:ASPxButton>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnInventario" runat="server" Text="Preparar" Height="30px" OnClick="btnInventario_Click"></dx:ASPxButton>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnInventarioValorizado" runat="server" Text="Preparar Valorizado" Height="30px" OnClick="btnInventarioValorizado_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsMailing">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Distribucion_Id" Visible="False"
                    VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mail" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Informe" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsMailing" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_MailingInformes" Where="Informe == @Informe">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Informe" SessionField="v_informe" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Informe:">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_informe" runat="server">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Informacion Adicional">
        </dx:ASPxLabel>
        <dx:ASPxMemo ID="txt_infoadicional" runat="server" Height="127px" Width="500px">
        </dx:ASPxMemo>
    </div>    
    <br />
    <div>
        <dx:ASPxButton ID="btnEnviar" runat="server" Text="Enviar" Height="41px" Width="174px" OnClick="btnEnviar_Click"></dx:ASPxButton>
    </div>
</asp:Content>
