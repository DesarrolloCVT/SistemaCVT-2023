<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegCargaCombPersonal.aspx.cs" Inherits="CVT_MermasRecepcion.Transporte.RegCargaCombPersonal" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Transporte</a></li>
            <li><span id="current">Carga Combustible</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Carga Combustible</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsCarga" KeyFieldName="Id_Carga" OnRowInserting="GvDatos_RowInserting" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
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

                <settingspopup>
                    <filtercontrol autoupdateposition="False"></filtercontrol>
                </settingspopup>

                <settingssearchpanel customeditorid="tbToolbarSearch" />
                <styles>
                    <focusedrow backcolor="#FF9933">
                    </focusedrow>
                </styles>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Carga" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCarga" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Litros" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Patente" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsPatente" ValueField="Patente">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Patente" Width="200px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Marca" Width="400px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="User Registra" FieldName="IdUsuarioCreador" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="lqsUsuarios" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsCarga" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_RegistroCargaCombustible_Jefatura" Where="FechaCarga &gt;= @FechaCarga &amp;&amp; FechaCarga &lt;= @FechaCarga1" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteInicio" DefaultValue="01-01-1990" Name="FechaCarga" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dteTermino" DefaultValue="01-01-1990" Name="FechaCarga1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPatente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DescripcionVehiculo">
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="lqsUsuarios" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>

    </div>
</asp:Content>
