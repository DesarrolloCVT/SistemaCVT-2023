<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="EditaRecepcion.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.EditaRecepcion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Recepcion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Edita Recepcion</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left:50px">
        <table>
            <tr>
                <td colspan="3">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server"
                        Text="Numero de Recepcion WMS">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_recepcion" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btn_buscar" runat="server" OnClick="btn_buscar_Click"
                        Text="Buscar" Height="34px" Width="67px">
                    </dx:ASPxButton>
                    <dx:ASPxLabel ID="lbl_error" runat="server" Visible="False">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <table class="style1">
            <tr>
                <td>
                    <dx:ASPxLabel ID="l1" runat="server" Text="Proveedor" Visible="False">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_proveedor" runat="server" DataSourceID="LqDsProveedor"
                        ValueField="Business_Partner_Id" Visible="False" Height="30px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Business_Partner_Id" Name="Codigo" />
                            <dx:ListBoxColumn FieldName="Business_Partner_Name" Name="Proveedor" />
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsProveedor" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Business_Partner">
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxLabel ID="l2" runat="server" Text="Orden de Compra" Visible="False">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_oc" runat="server" Visible="False" Width="170px" Height="30px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="l3" runat="server" Text="Numero Documento" Visible="False">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_docnum" runat="server" Visible="False" Width="170px" Height="30px">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_actualizar" runat="server"
                        OnClick="btn_actualizar_Click" Text="Actualizar" Visible="False">
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsPackage" KeyFieldName="Package_Id"
                        OnRowUpdating="GvDatos_RowUpdating" Visible="False">
                        <SettingsPager PageSize="100">
                        </SettingsPager>
                        <EditFormLayoutProperties RequiredMarkDisplayMode="OptionalOnly">
                        </EditFormLayoutProperties>
                        <Columns>
                            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Id" ReadOnly="True"
                                Visible="False" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Folio Barcode" FieldName="Package_Barcode"
                                VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_Quantity"
                                VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot"
                                VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Producto"
                                FieldName="ArticleProvider_Id" VisibleIndex="3">
                                <PropertiesComboBox DataSourceID="LqDsProducto" ValueField="ArticleProvider_Id">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="ArticleProvider_CodClient" Name="Codigo" />
                                        <dx:ListBoxColumn FieldName="ArticleProvider_Description" Name="Producto" />
                                    </Columns>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="SSCC" FieldName="Package_SSCC"
                                VisibleIndex="2">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_QuantityInitial" Visible="False"
                                VisibleIndex="9">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Info 1 (Lote Proveedor)"
                                FieldName="Package_Data1" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="DUN 14" FieldName="Package_SN"
                                VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsPackage" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EnableUpdate="True"
                        EntityTypeName="" TableName="Package" Where="Reception_Id == @Reception_Id">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="txt_recepcion" DefaultValue="0"
                                Name="Reception_Id" PropertyName="Text" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsProducto" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="ArticleProvider">
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="4">&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>
