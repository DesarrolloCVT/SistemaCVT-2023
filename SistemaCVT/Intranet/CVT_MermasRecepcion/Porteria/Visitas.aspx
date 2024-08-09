<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Visitas.aspx.cs" Inherits="CVT_MermasRecepcion.Porteria.Visitas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Porteria</a></li>
        <li><span id="current">Visitas</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Visitas</span>
    <span class="tab-end"></span>
</div>
    <div>
        <dx:ASPxGridView ID="GvVisita" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsVisitas" KeyFieldName="Visita_Id" OnHtmlRowCreated="GvVisita_HtmlRowCreated" OnRowCommand="GvVisita_RowCommand" OnRowInserting="GvVisita_RowInserting" OnToolbarItemClick="GvVisita_ToolbarItemClick">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
<SettingsEditing Mode="PopupEditForm">
</SettingsEditing>
                                    <Toolbars>
                            <dx:GridViewToolbar >
                                <Items>
                                    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
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
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Visita_Id" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaEntrada" VisibleIndex="2">
                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy hh:mm tt" EditFormat="DateTime">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaSalida" VisibleIndex="3">
                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy hh:mm tt">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="RUN" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Nombre" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Patente" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Area" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqDsArea" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Empleado" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="LqDsPersona" ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Motivo" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Entrevista" Value="1" />
                            <dx:ListEditItem Text="Capacitacion" Value="2" />
                            <dx:ListEditItem Text="RRHH" Value="3" />
                            <dx:ListEditItem Text="Proveedor" Value="4" />
                            <dx:ListEditItem Text="Otros" Value="5" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataCheckColumn FieldName="EPP" VisibleIndex="10">
                </dx:GridViewDataCheckColumn>
                 <dx:GridViewDataHyperLinkColumn Caption="Salida" VisibleIndex="14">
     <EditFormSettings Visible="False" />
     <DataItemTemplate>
         <asp:ImageButton ID="Salida" CommandName="cmdSalida" runat="server"
             ImageUrl="~/Images/confirm.png"  />
     </DataItemTemplate>
 </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="N Tarjeta" FieldName="NTarjeta" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Observacion" FieldName="Observacion" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsVisitas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" OrderBy="Visita_Id desc" TableName="CVT_ControlAcceso_Visita" EnableDelete="True" EnableInsert="True" EnableUpdate="True"></asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsPersona" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
    </div>
</asp:Content>
