<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LibroNovedades.aspx.cs" Inherits="CVT_MermasRecepcion.Porteria.LibroNovedades" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Porteria</a></li>
        <li><span id="current">Libro Novedades</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Libro Novedades</span>
    <span class="tab-end"></span>
</div>
    <div>

        <dx:ASPxGridView ID="GvLibroNovedades" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsLibro" KeyFieldName="Novedad_Id" OnToolbarItemClick="GvLibroNovedades_ToolbarItemClick" OnRowInserting="GvLibroNovedades_RowInserting">
            <Settings ShowFilterRow="True" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
             <Toolbars>
     <dx:GridViewToolbar Position="Top">
         <Items>
             <%-- <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                 <Image Url="../Images/pn-add-source-copy.gif"></Image>
             </dx:GridViewToolbarItem>--%>
             <dx:GridViewToolbarItem Command="New" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                 <Image Url="../../Images/pn-add-source-copy.gif"></Image>
             </dx:GridViewToolbarItem>
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
 <SettingsEditing Mode="PopupEditForm">
 </SettingsEditing>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Novedad_Id" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Usuario" FieldName="Usuario_Id" Visible="False" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Actividad" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Ronda" Value="Ronda" />
                            <dx:ListEditItem Text="Evento" Value="Evento" />
                            <dx:ListEditItem Text="Accidente" Value="Accidente" />
                            <dx:ListEditItem Text="Otro" Value="Otro" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn FieldName="Descripcion" VisibleIndex="4">
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn FieldName="Fecha" VisibleIndex="2">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy hh:mm">
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsLibro" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableInsert="True" EntityTypeName="" OrderBy="Fecha desc" TableName="CVT_LibroNovedades">
        </asp:LinqDataSource>

    </div>
</asp:Content>
