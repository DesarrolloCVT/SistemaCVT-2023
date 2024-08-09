<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Blank2.aspx.cs" Inherits="CVT_MermasRecepcion.Blank2" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div>
        <br /> <br />
        <dx:ASPxLabel ID="lbl_bienvenida" runat="server" Text="Bienvenido a la intranet CV Trading" Font-Bold="True" Font-Size="X-Large" Font-Names="Arial" ForeColor="Black"></dx:ASPxLabel>
        <br /><br /> <br />
    </div>
    <table>
        <tr height=50% width=50%>
            <td height=50% align ="center">
                <p><b>Listado Partidas Abiertas</b></p>
                <dx:ASPxGridView ID="GVPartidasAbiertas" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsPartidasAbiertas">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Tipo" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDsPartidasAbiertas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="CVT_VW_PartidasAbiertas_Inicio"></asp:LinqDataSource>
            </td>
            </tr>
             <tr height=50% width=50%>
            <td height=50%  align ="center">
                <p><b>Produccion en Curso</b></p>
                <dx:ASPxGridView ID="GvProduccionHoy" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsProduccionHoy">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="OF" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Sala" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Origen" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CantidadProducida" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KilosRechazados" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDsProduccionHoy" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_ProduccionHoy"></asp:LinqDataSource>
            </td>
        </tr>
        <%--<tr height=50% width=50%>
            <td align ="center">
                
                <dx:ASPxGridView ID="ASPxGridView2" runat="server"></dx:ASPxGridView>
                <asp:LinqDataSource ID="LinqDataSource2" runat="server"></asp:LinqDataSource>
            </td>
            <td align ="center">
                <dx:ASPxGridView ID="ASPxGridView3" runat="server"></dx:ASPxGridView>
                <asp:LinqDataSource ID="LinqDataSource3" runat="server"></asp:LinqDataSource>
            </td>
        </tr>--%>

    </table>
</asp:Content>
