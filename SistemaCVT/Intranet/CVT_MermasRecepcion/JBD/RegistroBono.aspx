<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistroBono.aspx.cs" Inherits="CVT_MermasRecepcion.JBD.RegistroBono" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
         <div id="tableHeader">
    <span class="tableTitle">Registro Bono</span>
    <span class="tab-end"></span>

</div>
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>RRHH</a></li>
        <li><span id="current">Registro Bono</span></li>
    </ul>
</div>
<div>
    <dx:ASPxGridView ID="GvBonoJDB" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsBonoJDB" KeyFieldName="ID"  OnToolbarItemClick="GvBonoJDB_ToolbarItemClick" OnRowInserting="GvBonoJDB_RowInserting">
        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                    <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
<Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False">
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
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" ShowInCustomizationForm="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="3" ShowInCustomizationForm="True">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="10" ShowInCustomizationForm="True" Caption="Responsable">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Valor" VisibleIndex="8" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Area" ShowInCustomizationForm="True" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="LqDsArea" TextField="Nombre" ValueField="Id_Area">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Trabajador" ShowInCustomizationForm="True" VisibleIndex="6">
                <PropertiesComboBox DataSourceID="LqDsPersona" ValueField="pin">
                    <Columns>
                        <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                        </dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="MotivoBono" ShowInCustomizationForm="True" VisibleIndex="7">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Turno Extendido" Value="Turno Extendido" />
                        <dx:ListEditItem Text="Peoneta" Value="Peoneta" />
                        <dx:ListEditItem Text="&gt;5 Horas" Value="&gt;5 Horas" />
                        <dx:ListEditItem Text="Guardia Fin de Semana" Value="Guardia Fin de Semana" />
                        <dx:ListEditItem Text="Otros" Value="Otros" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="HrsSalida" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="HrsEntrada" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn FieldName="Comentario" VisibleIndex="9">
            </dx:GridViewDataMemoColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsBonoJDB" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" OrderBy="Fecha desc" TableName="CVT_GestionExternosBono_JDB" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsPersona" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
</div>
</asp:Content>
