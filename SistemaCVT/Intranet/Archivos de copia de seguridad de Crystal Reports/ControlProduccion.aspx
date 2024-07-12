<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ControlProduccion.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.ControlProduccion" %>

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
            <li><a>Produccion</a></li>
            <li><span id="current">Control Produccion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Control Produccion</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" style="width: 20px" />
                Exportar Excel DETALLE</a>
        </div>--%>
    </div>
    <div>

        <table class="style1">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="MES">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_mes" runat="server" SelectedIndex="0">
                        <Items>
                            <dx:ListEditItem Text="Todos" Value="0" Selected="True" />
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                            <dx:ListEditItem Text="8" Value="8" />
                            <dx:ListEditItem Text="9" Value="9" />
                            <dx:ListEditItem Text="10" Value="10" />
                            <dx:ListEditItem Text="11" Value="11" />
                            <dx:ListEditItem Text="12" Value="12" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="AÑO">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_año" runat="server">
                        <Items>
                            <dx:ListEditItem Text="2016" Value="2016" />
                            <dx:ListEditItem Text="2017" Value="2017" />
                            <dx:ListEditItem Text="2018" Value="2018" />
                            <dx:ListEditItem Text="2019" Value="2019" />
                            <dx:ListEditItem Text="2020" Value="2020" />
                            <dx:ListEditItem Text="2021" Value="2021" />
                            <dx:ListEditItem Text="2022" Value="2022" />
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                            <dx:ListEditItem Text="2026" Value="2026" />
                            <dx:ListEditItem Text="2027" Value="2027" />
                            <dx:ListEditItem Text="2028" Value="2028" />
                            <dx:ListEditItem Text="2029" Value="2029" />
                            <dx:ListEditItem Text="2030" Value="2030" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="SEMANA">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_semana" runat="server">
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                            <dx:ListEditItem Text="8" Value="8" />
                            <dx:ListEditItem Text="9" Value="9" />
                            <dx:ListEditItem Text="10" Value="10" />
                            <dx:ListEditItem Text="11" Value="11" />
                            <dx:ListEditItem Text="12" Value="12" />
                            <dx:ListEditItem Text="13" Value="13" />
                            <dx:ListEditItem Text="14" Value="14" />
                            <dx:ListEditItem Text="15" Value="15" />
                            <dx:ListEditItem Text="16" Value="16" />
                            <dx:ListEditItem Text="17" Value="17" />
                            <dx:ListEditItem Text="18" Value="18" />
                            <dx:ListEditItem Text="19" Value="19" />
                            <dx:ListEditItem Text="20" Value="20" />
                            <dx:ListEditItem Text="21" Value="21" />
                            <dx:ListEditItem Text="22" Value="22" />
                            <dx:ListEditItem Text="23" Value="23" />
                            <dx:ListEditItem Text="24" Value="24" />
                            <dx:ListEditItem Text="25" Value="25" />
                            <dx:ListEditItem Text="26" Value="26" />
                            <dx:ListEditItem Text="27" Value="27" />
                            <dx:ListEditItem Text="28" Value="28" />
                            <dx:ListEditItem Text="29" Value="29" />
                            <dx:ListEditItem Text="30" Value="30" />
                            <dx:ListEditItem Text="31" Value="31" />
                            <dx:ListEditItem Text="32" Value="32" />
                            <dx:ListEditItem Text="33" Value="33" />
                            <dx:ListEditItem Text="34" Value="34" />
                            <dx:ListEditItem Text="35" Value="35" />
                            <dx:ListEditItem Text="36" Value="36" />
                            <dx:ListEditItem Text="37" Value="37" />
                            <dx:ListEditItem Text="38" Value="38" />
                            <dx:ListEditItem Text="39" Value="39" />
                            <dx:ListEditItem Text="40" Value="40" />
                            <dx:ListEditItem Text="41" Value="41" />
                            <dx:ListEditItem Text="42" Value="42" />
                            <dx:ListEditItem Text="43" Value="43" />
                            <dx:ListEditItem Text="44" Value="44" />
                            <dx:ListEditItem Text="45" Value="45" />
                            <dx:ListEditItem Text="46" Value="46" />
                            <dx:ListEditItem Text="47" Value="47" />
                            <dx:ListEditItem Text="48" Value="48" />
                            <dx:ListEditItem Text="49" Value="49" />
                            <dx:ListEditItem Text="50" Value="50" />
                            <dx:ListEditItem Text="51" Value="51" />
                            <dx:ListEditItem Text="52" Value="52" />
                            <dx:ListEditItem Text="53" Value="53" />
                        </Items>
                    </dx:ASPxComboBox>
                    <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click"
                        RenderMode="Link" Text="LIMPIAR">
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="DIA">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_dia" runat="server">
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                            <dx:ListEditItem Text="8" Value="8" />
                            <dx:ListEditItem Text="9" Value="9" />
                            <dx:ListEditItem Text="10" Value="10" />
                            <dx:ListEditItem Text="11" Value="11" />
                            <dx:ListEditItem Text="12" Value="12" />
                            <dx:ListEditItem Text="13" Value="13" />
                            <dx:ListEditItem Text="14" Value="14" />
                            <dx:ListEditItem Text="15" Value="15" />
                            <dx:ListEditItem Text="16" Value="16" />
                            <dx:ListEditItem Text="17" Value="17" />
                            <dx:ListEditItem Text="18" Value="18" />
                            <dx:ListEditItem Text="19" Value="19" />
                            <dx:ListEditItem Text="20" Value="20" />
                            <dx:ListEditItem Text="21" Value="21" />
                            <dx:ListEditItem Text="22" Value="22" />
                            <dx:ListEditItem Text="23" Value="23" />
                            <dx:ListEditItem Text="24" Value="24" />
                            <dx:ListEditItem Text="25" Value="25" />
                            <dx:ListEditItem Text="26" Value="26" />
                            <dx:ListEditItem Text="27" Value="27" />
                            <dx:ListEditItem Text="28" Value="28" />
                            <dx:ListEditItem Text="29" Value="29" />
                            <dx:ListEditItem Text="30" Value="30" />
                            <dx:ListEditItem Text="31" Value="31" />
                        </Items>
                    </dx:ASPxComboBox>
                    <dx:ASPxButton ID="ASPxButton3" runat="server" OnClick="ASPxButton3_Click"
                        RenderMode="Link" Text="LIMPIAR">
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click"
                        Text="GENERAR">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>

    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" KeyFieldName="OF"
            OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords" PageSize="1000">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />                                                    
                            </Items>
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
                <dx:GridViewDataTextColumn FieldName="OF" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FECHA" VisibleIndex="1" Caption="FECHA PRODUC.">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="SEMANA" VisibleIndex="2" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DIA" VisibleIndex="3" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MES" VisibleIndex="4" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AÑO" VisibleIndex="5" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="COD_PRODUCTO" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PRODUCTO" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PRODUCIDO_OF" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PRODUCIDO_REAL" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="REPROCESO" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BARRIDO" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TURNO" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SALA" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LINEA" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OPERADOR" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PORC_CUMPLIMIENTO" VisibleIndex="12">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="T. MIN DETENCIONES"
                    FieldName="TotalDetenciones" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="META" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detenciones" VisibleIndex="21">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="cmdDetalle" CommandName="cmdDetalle" runat="server"
                            ImageUrl="~/Images/reportes.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="MERMA_FILM" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GRUPO" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>

        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server"
            HeaderText="Detalle Detenciones" Width="712px" AllowDragging="True"
            CloseAction="CloseButton" PopupHorizontalAlign="Center"
            PopupVerticalAlign="TopSides" Modal="True">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsDetenciones" KeyFieldName="Detencion_Id">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Detencion_Id" ReadOnly="True"
                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="OF_Id" ShowInCustomizationForm="True"
                                Visible="False" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Maquina" ShowInCustomizationForm="True"
                                VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Comentario"
                                ShowInCustomizationForm="True" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TotalMinutosDetencion"
                                ShowInCustomizationForm="True" VisibleIndex="6">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Categoria" FieldName="Categoria_Id"
                                ShowInCustomizationForm="True" VisibleIndex="3">
                                <PropertiesComboBox DataSourceID="LqDsCategorias" TextField="Categoria_Nombre"
                                    ValueField="Categoria_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Motivo" FieldName="Motivo_Cod"
                                ShowInCustomizationForm="True" VisibleIndex="4">
                                <PropertiesComboBox DataSourceID="LqDsMotivos0" TextField="Detencion_Motivo"
                                    ValueField="Motivo_Cod">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsCategorias" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_CategoriaDetenciones">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsMotivos0" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_MotivoDentecion">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsDetenciones" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_Detencion" Where="OF_Id == @OF_Id">
                        <WhereParameters>
                            <asp:SessionParameter DefaultValue="0" Name="OF_Id" SessionField="OF"
                                Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <br />
        <asp:LinqDataSource ID="LqDsControlProduccion" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
            TableName="CVT_VW_PRODUCCION_COMPLETO" OrderBy="FECHA"
            Where="AÑO == @AÑO">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_año" DefaultValue="0" Name="AÑO"
                    PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

    </div>
</asp:Content>
