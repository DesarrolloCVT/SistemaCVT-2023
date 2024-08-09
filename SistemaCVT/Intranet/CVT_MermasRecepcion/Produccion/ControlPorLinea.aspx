<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ControlPorLinea.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.ControlPorLinea" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Produccion</a></li>
        <li><span id="current">Control x Linea</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Control x Linea</span>
    <span class="tab-end"></span>
    </div>
    <table class="dxeBinImgCPnlSys">
        <tr>
            <td>
                <dx:ASPxLabel runat="server" Text="Orden Fabricacion" ID="ASPxLabel1"></dx:ASPxLabel>

                <asp:LinqDataSource runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" OrderBy="OF" 
                    TableName="CVT_ListaOFLiberadas" EntityTypeName="" ID="LqDsOF"></asp:LinqDataSource>

                </td>
            <td>

                <dx:ASPxComboBox runat="server" DataSourceID="LqDsOF" ValueField="OF" 
                    Width="300px" ID="cbo_of" 
                    onselectedindexchanged="cbo_of_SelectedIndexChanged"><Columns>
<dx:ListBoxColumn FieldName="OF"></dx:ListBoxColumn>
<dx:ListBoxColumn FieldName="CodProducto"></dx:ListBoxColumn>
<dx:ListBoxColumn FieldName="Producto"></dx:ListBoxColumn>
</Columns>

<ValidationSettings ValidationGroup="a">
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
</dx:ASPxComboBox>

                </td>
            <td>
                <dx:ASPxButton ID="btn_Generar" runat="server" onclick="btn_Generar_Click" 
                    Text="Generar">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LqDsControl" KeyFieldName="ControlLinea_Id" 
                    onrowinserting="GvDatos_RowInserting">
                    <SettingsEditing Mode="PopupEditForm">
                    </SettingsEditing>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="ControlLinea_Id" ReadOnly="True" 
                            Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="OrdenFabricacion" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="3">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="CantPallets70" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CantPallets30" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CantPaletizadores" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CantAbastMercaderia" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CantAbastCajas" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CantAseo" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CantCajas" Visible="False" 
                            VisibleIndex="10">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Staff_Id" Visible="False" 
                            VisibleIndex="11">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="Linea" VisibleIndex="2">
                            <PropertiesComboBox>
                                <Items>
                                    <dx:ListEditItem Text="1" Value="1" />
                                    <dx:ListEditItem Text="2" Value="2" />
                                    <dx:ListEditItem Text="3" Value="3" />
                                    <dx:ListEditItem Text="4" Value="4" />
                                    <dx:ListEditItem Text="5" Value="5" />
                                    <dx:ListEditItem Text="6" Value="6" />
                                    <dx:ListEditItem Text="7" Value="7" />
                                </Items>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDsControl" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
                    TableName="CVT_ControlLineasPacking" 
                    Where="OrdenFabricacion == @OrdenFabricacion" EnableInsert="True">
                    <WhereParameters>
                        <asp:SessionParameter DefaultValue="0" Name="OrdenFabricacion" 
                            SessionField="OF" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
