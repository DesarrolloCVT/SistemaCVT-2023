<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditaPallets.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.CorrigePallet" %>

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
            <li><a>WMS</a></li>
            <li><span id="current">Edita Pallet</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Edita Pallet</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 150px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Pallet" Theme="iOS"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNPallet" runat="server" Width="170px" Theme="iOS"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td style="padding-top: 16px">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="47px" Theme="iOS" Width="151px" OnClick="btnBuscar_Click">
                        <Image IconID="iconbuilder_actions_zoom_svg_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosPallet" EnableTheming="True" Theme="iOS" KeyFieldName="NPallet" OnRowCommand="GvDatos_RowCommand">
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod_Ubicacion" FieldName="Layout_Id" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reserva" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Add Ubicacion" VisibleIndex="53">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="AgregaUbicacion" CommandName="cmdAgregaUbicacion" runat="server"
                            ImageUrl="~/Images/boxadd.png" Width="25px" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Elimina Reserva" VisibleIndex="54">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="ElimReserva" CommandName="cmdElimReserva" runat="server"
                            ImageUrl="~/Images/eliminar.png" Width="25px" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Mod Pais Origen" VisibleIndex="55">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="ElimReserva" CommandName="cmdModPais" runat="server"
                            ImageUrl="~/Images/change.png" Width="25px" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Pais Origen" FieldName="Country_Name" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header BackColor="#FF9933" Font-Bold="True">
                </Header>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosPallet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="VW_DATO_EDIT_PROD" Where="NPallet == @NPallet">
            <WhereParameters>
                <asp:ControlParameter ControlID="txtNPallet" DefaultValue="-1" Name="NPallet" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <dx:ASPxPopupControl ID="PopEditaPais" runat="server" AllowDragging="True" CloseAction="None" CloseAnimationType="Fade" HeaderText="Verificacion " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Pais" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>                  
                    </div>               
                    <dx:ASPxComboBox ID="cbo_pais" runat="server" DataSourceID="LQPais" ValueField="Country_Id" TextField="Country_Name">
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LQPais" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Country_Id, Country_Name)" TableName="Country">
                    </asp:LinqDataSource>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnGuardaPais" runat="server" Text="Guardar" Theme="MaterialCompact"  Height="45px" ValidationGroup="b2" OnClick="btnGuardaPais_Click"></dx:ASPxButton>
                                </td>
                                <td class="auto-style10"></td>
                                <td>
                                    <dx:ASPxButton ID="btnCancelaPais" runat="server" Text="Cancelar" Theme="MaterialCompact" BackColor="Red" Height="45px" CausesValidation="False" OnClick="btnCancelaPais_Click"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <div>
        <dx:ASPxPopupControl ID="PopAddUbi" runat="server" AllowDragging="True" CloseAction="None" CloseAnimationType="Fade" HeaderText="Verificacion " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Cod Ubicacion" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCodUbicacion" runat="server" Width="170px" Height="25px" Theme="Default">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="b2">
                                            <RegularExpression ValidationExpression="\d+" />
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>                  
                    </div>               
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnGuardaUbi" runat="server" Text="Guardar" Theme="MaterialCompact"  Height="45px" ValidationGroup="b2" OnClick="btnGuardaUbi_Click"></dx:ASPxButton>
                                </td>
                                <td class="auto-style10"></td>
                                <td>
                                    <dx:ASPxButton ID="btnCancela" runat="server" Text="Cancelar" Theme="MaterialCompact" BackColor="Red" Height="45px" CausesValidation="False" OnClick="btnCancela_Click"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
