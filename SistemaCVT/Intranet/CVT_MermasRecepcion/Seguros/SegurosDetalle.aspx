<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SegurosDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Seguros.SegurosDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 15px;
        }
        .auto-style7 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <%--     <li><a>Seguros</a></li>--%>
            <li><a href="Seguros.aspx">Seguros</a></li>
            <li><span id="current">Detalle Seguro</span></li>

        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Seguro</span>
        <span class="tab-end"></span>
        <div id="options">

            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
      <%--      <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;--%>
         <%--   <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>

    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalleSeguro" KeyFieldName="Id_Detalle_Seguro" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                            <Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
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
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Detalle_Seguro" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Poliza" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MontoAsegurado" ShowInCustomizationForm="True" VisibleIndex="7">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RegularExpression ErrorText="Solo numeros o coma decimal" ValidationExpression="^[1-9]\d*(,\d+)?$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Materia Asegurada" FieldName="id_MateriaAsegurada" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsMateriaAseg" TextField="Descripcion" ValueField="Id_MateriaAsegurada">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="NFactura" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Proveedor" FieldName="CodProveedor" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqsProveedor" ValueField="CardCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Rut" FieldName="CardCode" Width="180px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="CardName" Width="250px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetalleSeguro" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_Seguro_Detalle" Where="Poliza == @Poliza">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Poliza" SessionField="Poliza" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsMateriaAseg" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Seguro_MateriaAsegurada" Where="Id_TipoSeguro == @Id_TipoSeguro">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_TipoSeguro" SessionField="TipoSeguro" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" Select="new (CardCode, CardName)" TableName="OCRD" Where="GroupCode == @GroupCode" EntityTypeName="" ID="LqsProveedor">
            <WhereParameters>
                <asp:Parameter DefaultValue="107" Name="GroupCode" Type="Int16"></asp:Parameter>
            </WhereParameters>
        </asp:LinqDataSource>

    </div>

    <div>
        <dx:ASPxPopupControl ID="PopNuevo" runat="server"
            HeaderText="Nuevo" AllowDragging="True" CloseAction="None">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Materia Asegurada" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboMateriaAsegurada" runat="server" ValueType="System.String" Height="30px" DataSourceID="LqsMateriaAseg" TextField="Descripcion" ValueField="Id_MateriaAsegurada" OnSelectedIndexChanged="cboMateriaAsegurada_SelectedIndexChanged" AutoPostBack="True">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Monto Asegurado" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtMontoAsegurado" runat="server" Width="170px" Height="30px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                                            <RegularExpression ErrorText="Solo numeros o  coma decimal" ValidationExpression="^[1-9]\d*(,\d+)?$" />
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Descripcion" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtDescripcion" runat="server" Width="200px" Height="30px">
                                        <ValidationSettings Display="Dynamic">
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
                                    <dx:ASPxLabel ID="lblFac" runat="server" Text="Numero Factura" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNumFactura" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="lblPro" runat="server" Text="Proveedor" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProveedor" runat="server" ValueType="System.String" DataSourceID="LqsProveedor" ValueField="CardCode" Width="350px" Height="30px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Rut" FieldName="CardCode" Width="180px">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Nombre" FieldName="CardName" Width="350px">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 80px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="GUARDAR" Height="50px" Theme="Glass" Width="200px" Font-Bold="true" OnClick="btnGuardar_Click"></dx:ASPxButton>
                                </td>
                                <td class="auto-style7"></td>
                                <td>
                                    <dx:ASPxButton ID="btnSalir" runat="server" Text="SALIR" Height="50px" Theme="iOS" Width="100px" Font-Bold="true"  BackColor="#ff0d0d" CausesValidation="False" OnClick="btnSalir_Click"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>

                        <br />
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
