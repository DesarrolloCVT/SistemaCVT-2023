<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DetalleExpRapida_Film.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.DetalleExpRapida_Film" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            font-weight: bold;
        }
        .auto-style6 {
            font-size: medium;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><a href="ExpedicionRapida.aspx">Espedidcion Rapida Film</a></li>
            <li><span id="current">Detalle Expedicion Rapida Film</span></li>
        </ul>
    </div>
    <br />
    <div id="tableHeader">
        <span class="tableTitle">Detalle Expedicion Rapida Film</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>
        </div>
    </div>
    <br />
    <br />
    <div style="margin-left: 250px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="FOLIO: " Font-Bold="true" Font-Size="X-Large"></asp:Label>
                    <%--  <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Folio: " Font-Bold="true"></dx:ASPxLabel>--%>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblFolio" runat="server" Text=" " Font-Size="X-Large"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Documento: " Font-Bold="true" Font-Size="X-Large"></asp:Label>
                    <%--  <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Folio: " Font-Bold="true"></dx:ASPxLabel>--%>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblNDoc" runat="server" Text=" " Font-Size="X-Large"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Bodega: " Font-Bold="true" Font-Size="X-Large"></asp:Label>
                    <%--  <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Folio: " Font-Bold="true"></dx:ASPxLabel>--%>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblNombreBodega" runat="server" Text=" " Font-Size="X-Large"></dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="margin-left: 200px">
        <table>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label3" runat="server" Text="N° Bobina" Font-Bold="true" Font-Size="Medium"></asp:Label></td>
                <td></td>
                <td>
                    <dx:ASPxTextBox ID="txtIdProd" runat="server" Width="170px" Height="28px" OnTextChanged="txtIdProd_TextChanged" AutoPostBack="True" MaxLength="10">
                        <ValidationSettings>
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetExp" KeyFieldName="ExpFilm_id;NBobina">
            <SettingsBehavior ConfirmDelete="True" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Site_id" ReadOnly="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ExpFilm_id" ReadOnly="True" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NBobina" ReadOnly="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idUsuario" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="ExpFilm_Quantity" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ExpFilm_Fech_Confirm" Visible="False" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Lote" FieldName="ExpFilm_Lote" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ExpFilm_Estado" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetExp" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_FILM_EXPEDICION_DETALLE" Where="ExpFilm_id == @ExpFilm_id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ExpFilm_id" SessionField="ExpFilm_id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
