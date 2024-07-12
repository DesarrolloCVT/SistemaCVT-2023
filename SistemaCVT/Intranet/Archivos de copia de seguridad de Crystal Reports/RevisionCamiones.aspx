<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RevisionCamiones.aspx.cs" Inherits="CVT_MermasRecepcion.Transporte.RevisionCamiones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <%--     <li><a>Control Cierre</a></li>--%>
            <li><span id="current">Revision Camiones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Revision Camiones</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--  <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;--%>
            <%--  <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="height: 16px; width: 16px;" />
                Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div style="margin-left: 150px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFechaini" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="39px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="Gvdatos" runat="server" AutoGenerateColumns="False" CssClass="auto-style1" DataSourceID="LqsVerificacionCamion" KeyFieldName="Id_RevisionCamion" OnRowCommand="Gvdatos_RowCommand" OnRowInserting="Gvdatos_RowInserting" OnHtmlRowCreated="Gvdatos_HtmlRowCreated" OnRowDeleting="Gvdatos_RowDeleting" OnRowUpdating="Gvdatos_RowUpdating">
            <SettingsPager PageSize="40">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_RevisionCamion" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="U_Conductor" VisibleIndex="3" Caption="Conductor">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="2" Settings-AllowAutoFilter="False">
                    <Settings AllowAutoFilter="False"></Settings>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalles" VisibleIndex="15">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Hora Carga" FieldName="HoraCarga" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CamionLimpio" VisibleIndex="6" Caption="Camion Libre de Plagas">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ProductoBuenEstado" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EstadoCarpa" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EstadoLuces" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Externo" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="PDF" VisibleIndex="16">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdDetallePdf" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="" VisibleIndex="14">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Alerta" CommandName="cmdAlerta" runat="server" ImageUrl="~/Images/warning.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="TotalDoc" Visible="False" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hora Termino" FieldName="HoraTerminoCarga" VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="t">
                          <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccionCorrectiva" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Camion Libre de Olores Extraños" FieldName="LibreOlores" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Nombre Quien Carga" FieldName="QuienCarga" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsVerificacionCamion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_RegistroRevisionCamiones" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="Id_RevisionCamion desc" Where="Fecha == @Fecha">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteFechaini" DefaultValue="01-01-1990" Name="Fecha" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPatente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DescripcionDeCamiones">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Conductor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (U_Conductor)" TableName="_CVT_CAMIONES" Where="U_Conductor != @U_Conductor">
            <WhereParameters>
                <asp:QueryStringParameter Name="U_Conductor" QueryStringField="Null" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
