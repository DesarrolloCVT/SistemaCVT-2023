<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EntregaPerifericoDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.EntregaPerifericoDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Entrega Perifericos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Entrega Perifericos</span>
        <span class="tab-end"></span>
         <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px; height: 16px;" />
                volver</a>&nbsp;
         <%--   <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPerifericos" KeyFieldName="Id_EntPeriferico" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowInserting="GvDatos_RowInserting">
            <SettingsPager PageSize="500000000">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
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
            <settingsexport enableclientsideexportapi="true" excelexportmode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                <settingssearchpanel customeditorid="tbToolbarSearch" />
           
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="idDetPeri" VisibleIndex="1" ReadOnly="True" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comentarios" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Dispositivo" FieldName="IdDispositivo" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="Lqsdispositivo" TextField="Nombre" ValueField="IdPerisferico">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoEntrega" VisibleIndex="4">
                    <PropertiesComboBox>
                        
                    <Items><dx:ListEditItem Text="Prestamo" Value="1" /><dx:ListEditItem Text="Definitivo" Value="2" /></Items></PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPerifericos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_EntregaPerifericos_Detalle" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="Id_EntPeriferico == @Id_EntPeriferico">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_EntPeriferico" SessionField="IdPeri" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Lqsdispositivo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_Perifericos">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsPersona" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
        </asp:LinqDataSource>
    </div>
</asp:Content>
