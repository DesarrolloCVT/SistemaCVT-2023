<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PosicionamientoMasivoMP.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.PosicionamientoMasivoMP" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Posicionamiento Masivo</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Posicionamiento Masivo</span>
        <span class="tab-end"></span>
    </div>
    <br />

    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Recepcion" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNRecepcion" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td></td>
                <td style="padding-top: 10px">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="30px" Theme="iOS" OnClick="btnBuscar_Click" ValidationGroup="a1"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left:25px" runat="server" id="Div1" visible="false">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="N° Ubicacion" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNPosicion" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a2">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td></td>
                <td style="padding-top:10px">
                    <dx:ASPxButton ID="btnPosicionar" runat="server" Text="Posicionar" Height="30px" Theme="MaterialCompact" OnClick="btnPosicionar_Click" ValidationGroup="a2" Enabled="true"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsResumenRecepcion">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_CodClient" VisibleIndex="0" Caption="CodProducto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_Description" VisibleIndex="1" Caption="Descripcion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Id" VisibleIndex="2" Caption="N° Recepcion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadBultos" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsResumenRecepcion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="VW_ResumenRecepcionBultos" Where="Reception_Id == @Reception_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="-1" Name="Reception_Id" SessionField="nrep" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
