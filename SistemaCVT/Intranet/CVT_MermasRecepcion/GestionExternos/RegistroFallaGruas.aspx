<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegistroFallaGruas.aspx.cs" Inherits="CVT_MermasRecepcion.GestionExternos.RegistroFallaGruas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
     <ul>
         <li><a href="../Blank.aspx">Inicio</a></li>
         <li><a>Gestion externos</a></li>
         <li><span id="current">Registro Falla Gruas</span></li>
     </ul>
 </div>
 <br />
 <br />
 <div id="tableHeader">
     <span class="tableTitle">Registro Falla Gruas</span><br />
 </div>
<div>
    <dx:ASPxGridView ID="GVRegistroFallaGrua" runat="server" DataSourceID="LqDsFallaGruas" AutoGenerateColumns="False" KeyFieldName="RFG_ID" OnRowInserting="GVRegistroFallaGrua_RowInserting" OnRowCommand="GVRegistroFallaGrua_RowCommand">
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                        <SettingsBehavior AllowFocusedRow="True" />
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
            <dx:GridViewDataTextColumn FieldName="RFG_ID" ReadOnly="True" VisibleIndex="1" Caption="Folio">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmpresaReclamo" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaFalla" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="8">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FechaReparacion" VisibleIndex="9">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FechaCierre" VisibleIndex="11">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="12">
    <EditFormSettings Visible="False" />
    <DataItemTemplate>
        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
            ImageUrl="~/Images/confirm.png"  />
    </DataItemTemplate>
</dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataComboBoxColumn Caption="Grua" FieldName="Grua_ID" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="LqDsGruas" TextField="Grua_Numero" ValueField="Grua_Id">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tipo Falla" FieldName="TFalla_ID" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="LqDsTipoFallas" TextField="TFalla_Nombre" ValueField="TFalla_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ChoferMomentoFalla" VisibleIndex="6">
                <PropertiesComboBox DataSourceID="LqDsGrueros" TextField="Staff_UserName" ValueField="Staff_Id">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="UsuarioCreacion" VisibleIndex="7">
                <PropertiesComboBox DataSourceID="LqDsUsuario" TextField="UsuarioSistema" ValueField="IdUsuario">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="UsuarioCierre" VisibleIndex="10">
                <PropertiesComboBox DataSourceID="LqDsUsuario" TextField="UsuarioSistema" ValueField="IdUsuario">
                </PropertiesComboBox>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsFallaGruas" runat="server" EntityTypeName="" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" OrderBy="RFG_ID desc" TableName="CVT_RegistroFallaGruas" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsTipoFallas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_TFallaGrua">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsGruas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Gruas">
    </asp:LinqDataSource>

                    <asp:LinqDataSource ID="LqDsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (IdUsuario, UsuarioSistema)" TableName="CVT_Usuarios">
    </asp:LinqDataSource>

                    <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" TableName="Staff" Where="Profiles_Id == @Profiles_Id &amp;&amp; Staff_Enabled == @Staff_Enabled" EntityTypeName="" ID="LqDsGrueros"><WhereParameters>
<asp:Parameter DefaultValue="13" Name="Profiles_Id" Type="Int32"></asp:Parameter>
<asp:Parameter DefaultValue="1" Name="Staff_Enabled" Type="Int32"></asp:Parameter>
</WhereParameters>
</asp:LinqDataSource>

</div>
</asp:Content>
