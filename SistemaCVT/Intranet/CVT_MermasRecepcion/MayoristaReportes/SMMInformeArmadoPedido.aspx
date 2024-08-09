<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMInformeArmadoPedido.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.SMMInformeArmadoPedido" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Informe armado Pedido</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe armado Pedido</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <div style="margin-left: 50px">
            <table>
                <tr>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha inicio" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        <dx:ASPxDateEdit ID="dteFini" runat="server"></dx:ASPxDateEdit>
                    </td>
                    <td class="auto-style5"></td>
                    <td>
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                    </td>
                    <td class="auto-style5"></td>
                    <td>
                        <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="50px" OnClick="btnBuscar_Click" Width="93px"></dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </div>
        <br />
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsArmadoPedidoBmas" KeyFieldName="Id_MedicionArmado" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsPager PageSize="500">
            </SettingsPager>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                            </Items>
                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id_MedicionArmado" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NOrden" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodBarras" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UniMedida" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaIngreso" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="CantCorrecta" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VencCorrecto" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Etiqueta" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Enfilado" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estibado" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CondPallet" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcCumpl" VisibleIndex="14">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodProducto" ReadOnly="True" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsProd" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ItemCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="ItemName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Verificador" FieldName="IdVerificador" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqsReponedor" TextField="Nombre" ValueField="IdReponedor">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsArmadoPedidoBmas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_MedicionArmadoPedido">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsReponedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Reponedores">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProd" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="MMetro_OITM" Where="validFor == @validFor">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
