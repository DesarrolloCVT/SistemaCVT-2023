<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MotivoDetencion.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.MotivoDetencion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
      <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Motivos Detenciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Motivos Detenciones</span>
        <span class="tab-end"></span>
    </div>
    <br />
        <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqsMotivoDet" KeyFieldName="Motivo_Cod"
            Style="margin-bottom: 0px" Width="250px" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Motivo_Cod" VisibleIndex="1">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="Detencion_Motivo" VisibleIndex="2">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Categoria" FieldName="Categoria_Id" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsCategoriaDetencion" TextField="Categoria_Nombre" ValueField="Categoria_Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Activo" Value="1" />
                            <dx:ListEditItem Text="Inactivo" Value="0" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsMotivoDet" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_MotivoDentecion" EnableDelete="True" EnableInsert="True"
            EnableUpdate="True" Where="Categoria_Id == @Categoria_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Categoria_Id" SessionField="IdCategoria" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsCategoriaDetencion" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_CategoriaDetenciones" EnableDelete="True" EnableInsert="True"
            EnableUpdate="True">
        </asp:LinqDataSource>
    </div>
</asp:Content>
