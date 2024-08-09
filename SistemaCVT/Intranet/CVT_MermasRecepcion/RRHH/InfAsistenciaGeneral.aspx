<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InfAsistenciaGeneral.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.InfAsistenciaGeneral" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
      <div id="tableHeader">
        <span class="tableTitle">Detalle Asistencia</span>
        <span class="tab-end"></span>
    </div>
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>RRHH</a></li>
            <li><span id="current">Informe de Asistencia</span></li>
        </ul>
    </div>

    <dx:ASPxRoundPanel HeaderText="Filtro" ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="false">
        <PanelCollection>
            <dx:PanelContent>
                <table>
                    <tr>
                        <td>
                            <dx:ASPxLabel runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxDateEdit Width="150px" runat="server" ID="cb_fini" ValidateRequestMode="Enabled">

                                <ValidationSettings ValidationGroup="mensaje" CausesValidation="True">
                                    <RequiredField IsRequired="true" />
                                </ValidationSettings>
                            </dx:ASPxDateEdit>
                        </td>
                        <td>
                            <dx:ASPxLabel runat="server" Text="Area"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxComboBox Width="400px" runat="server" ID="cb_area" DataSourceID="LqDsArea" TextField="Nombre" ValueField="Id_Area">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Area" FieldName="Nombre">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </dx:ASPxComboBox>
                            <asp:LinqDataSource ID="LqDsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxLabel runat="server" Text="Fecha Término"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxDateEdit Width="150px" runat="server" ID="cb_fter" ValidateRequestMode="Enabled">
                                <ValidationSettings ValidationGroup="mensaje" CausesValidation="True">
                                    <RequiredField IsRequired="true" />
                                </ValidationSettings>
                            </dx:ASPxDateEdit>
                        </td>

                        <td>
                            <dx:ASPxLabel runat="server" Text="Labor"></dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxComboBox Width="400px" runat="server" ID="cb_labor" DataSourceID="LqDsLabor" TextField="Nombre" ValueField="Id_Labores">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Labores" FieldName="Nombre">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </dx:ASPxComboBox>
                            <asp:LinqDataSource ID="LqDsLabor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (Id_Labores, Nombre)" TableName="CVT_LaboresExternas">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <dx:ASPxButton runat="server" ID="btn_buscar" Text="Buscar" OnClick="btn_buscar_Click">
                                <ClientSideEvents Click="function(s, e){
                                    ASPxClientEdit.ValidateGroup('mensaje');    
                               }" />
                            </dx:ASPxButton>
                        </td>
                        <td>
                            <dx:ASPxButton runat="server" ID="btn_limpiar" Text="Limpiar" OnClick="btn_limpiar_Click"></dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <br />
    <br />
    <div>
        <dx:ASPxLabel runat="server" Font-Bold="true" Text="Detalle Asistencia"></dx:ASPxLabel>
     <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>

        </div>--%>
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos">
    </dx:ASPxGridViewExporter>
    <dx:ASPxGridView runat="server" ID="GvDatos" AutoGenerateColumns="False" KeyFieldName="Asistencia_Id" DataSourceID="LqDsDetalle" OnToolbarItemClick="GvDatos_ToolbarItemClick">
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsCookies Enabled="True" />
        <Toolbars>
            <dx:GridViewToolbar >
                <Items>                    
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
            <dx:GridViewDataTextColumn FieldName="Asistencia_Id" ReadOnly="True" Visible="False" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Fecha Asistencia" FieldName="Fecha" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Fecha Registro" FieldName="Fecha_Registro" VisibleIndex="13">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Minutos Trabajados" FieldName="Minutos_Trabajados" VisibleIndex="9">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="Id_Area" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="LqDsArea2" TextField="Nombre" ValueField="Id_Area">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Labores" FieldName="Id_Labores" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="LqDsLab" TextField="Nombre" ValueField="Id_Labores">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Trabajador" FieldName="Id_Personal" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="LqDsPersonal" ValueField="pin">
                    <Columns>
<dx:ListBoxColumn FieldName="pin" Caption="Run"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                        </dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Hora Entrada" FieldName="Hora_Entrada" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Hora Salida" FieldName="Hora_Salida" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Responsable" FieldName="Id_Usuario" VisibleIndex="12">
                <PropertiesComboBox DataSourceID="LqDsResponsable" TextField="NombreUsuario" ValueField="IdUsuario">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Empresa" FieldName="Empresa" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TotalMinTrabajados" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TotalHorasTrabajadas" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Turno" FieldName="Turno" ShowInCustomizationForm="True" VisibleIndex="6">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Dia" Value="1" />
                        <dx:ListEditItem Text="Noche" Value="2" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Styles>
            <FocusedRow BackColor="#FF9933">
            </FocusedRow>
        </Styles>
        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Asistencia" Where="Fecha &gt;= @Fecha &amp;&amp; Fecha &lt;= @Fecha1 &amp;&amp; Id_Area == @Id_Area &amp;&amp; Id_Labores == @Id_Labores">
        <WhereParameters>
            <asp:ControlParameter ControlID="ASPxRoundPanel1$cb_fini" DefaultValue="01/01/1990" Name="Fecha" PropertyName="Value" Type="DateTime" />
            <asp:ControlParameter ControlID="ASPxRoundPanel1$cb_fter" DefaultValue="01/01/1990" Name="Fecha1" PropertyName="Value" Type="DateTime" />
            <asp:ControlParameter ControlID="ASPxRoundPanel1$cb_area" DefaultValue="0" Name="Id_Area" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="ASPxRoundPanel1$cb_labor" DefaultValue="0" Name="Id_Labores" PropertyName="Value" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsArea2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsLab" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (Id_Labores, Nombre)" TableName="CVT_LaboresExternas">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsPersonal" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_FULL_PERSONAL_TORNIQUETE">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsResponsable" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (IdUsuario, NombreUsuario)" TableName="CVT_Usuarios">
    </asp:LinqDataSource>

    <br />
    <br />
    <br />
    <div>
        <dx:ASPxLabel runat="server" Font-Bold="true" Text="Total Asistencia diaria" Font-Size="Medium"></dx:ASPxLabel>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatosDiarios" runat="server" AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Fecha" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Labor" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantTrabajadores" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total Horas" FieldName="TotalMinutos" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel runat="server" Font-Bold="true" Text="Total Asistencia" Font-Size="Medium"></dx:ASPxLabel>
    </div>
    <dx:ASPxGridView runat="server" ID="GvDatos2" AutoGenerateColumns="False">
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsCookies Enabled="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="0" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Labor" VisibleIndex="1" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CantTrabajadores" VisibleIndex="2" ShowInCustomizationForm="True">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TotalMinutos" VisibleIndex="3" ShowInCustomizationForm="True" Caption="Total Horas">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Styles>
            <FocusedRow BackColor="#FF9933">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>

    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="GvDatos2">
    </dx:ASPxGridViewExporter>
</asp:Content>
