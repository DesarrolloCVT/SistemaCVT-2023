<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InformeInventario" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Inventario</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Inventario</span>
    <span class="tab-end"></span>
</div>
<div>
    <table class="dxeBinImgCPnlSys">
        <tr>
            <td>
                <dx:ASPxButton ID="btn_descargar" runat="server" onclick="btn_descargar_Click" 
                    Text="Descargar">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_inventario" runat="server" 
                    onclick="btn_inventario_Click" Text="Preparar">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_inventariovalorizado" runat="server" 
                    onclick="btn_inventariovalorizado_Click" Text="Preparar Valorizado">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LqDsMailing" Width="156px">
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
                    TableName="CVT_MailingInformes">
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Considerar no enviar informe antes de las 10:05 - este es enviado automaticamente ,si existe algun cambio en el inventario considerar enviarlo despues de este horario" ForeColor="Red" Font-Size="Large"></dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Informacion Adicional">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <dx:ASPxMemo ID="txt_infoadicional" runat="server" Height="127px" Width="500px">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="btn_enviar" runat="server" onclick="btn_enviar_Click" 
                    Text="Enviar">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Informe:">
                </dx:ASPxLabel>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxLabel ID="lbl_informe" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
    </table>

</div>
</asp:Content>
