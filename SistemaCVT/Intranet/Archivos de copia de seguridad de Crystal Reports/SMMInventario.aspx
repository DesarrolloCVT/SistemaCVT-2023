<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.SMMInventario" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>INVENTARIO</a></li>
            <li><span id="current">Inventario</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Inventario</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--     <a><asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px" /> Exportar Excel</a>--%>
            <%-- <a>             <asp:ImageButton ID="cmdNew"      runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click" style="width: 16px"/>Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>

        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsInventario" KeyFieldName="Inventario_Id" OnRowCommand="GvDatos_RowCommand" OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
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
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Inventario_Id" ReadOnly="True" VisibleIndex="1" Caption="Folio">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalles" VisibleIndex="11">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png"  Width="24px"/>
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="Id_Usuario" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Encargado Inventario" FieldName="Id_UsuarioEncargado" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsUsuarioEncargado" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierto" Value="1" />
                            <dx:ListEditItem Text="Cerrado" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoInventario" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Ciclico" Value="1" />
                            <dx:ListEditItem Text="Completo" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Comentarios" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsInventario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="FechaCreacion desc" TableName="SMM_InventarioCabecera">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuarioEncargado" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>

    </div>
</asp:Content>
