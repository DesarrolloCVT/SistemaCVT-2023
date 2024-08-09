<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TareaInforme.aspx.cs" Inherits="CVT_MermasRecepcion.Tareas.TareaInforme" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Informe Tareas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Tareas</span>
        <span class="tab-end"></span>
        <div id="options">
            <a style="margin-left: 150px">
                <dx:ASPxButton ID="btnVolver" runat="server" Text="volver" Height="50px" Theme="iOS" Width="128px" OnClick="btnVolver_Click">
                    <Image IconID="navigation_backward_svg_white_32x32">
                    </Image>
                </dx:ASPxButton>
            </a>&nbsp

        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxDateEdit runat="server" Caption="Desde" Theme="iOS" ID="dteDesde"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxDateEdit runat="server" Caption="Hasta" Theme="iOS" ID="dteHasta"></dx:ASPxDateEdit>

                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxComboBox ID="cboArea" runat="server" Caption="Area(opcional)" Theme="iOS" DataSourceID="LqdsArea" TextField="Nombre" ValueField="Id_Area"></dx:ASPxComboBox>
                </td>
            </tr>
        </table>
        <asp:LinqDataSource ID="LqdsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
    </div>
    <div style="margin-left: 150px">
        <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="50px" Width="130px" OnClick="btnBuscar_Click" Theme="iOS"></dx:ASPxButton>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" FileName="Informe Tareas" GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>
    </div>
    <br />
    <br />
    <div>
        <div style="margin-left: 150px">
            <dx:ASPxButton ID="btnExportar" runat="server" Text="Exportar Excel" Height="50px" Width="230px" Theme="iOS" BackColor="Green" OnClick="btnExportar_Click">
                <Image IconID="export_exporttoxls_svg_white_32x32">
                </Image>
            </dx:ASPxButton>
        </div>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosTareas" EnableTheming="True" KeyFieldName="IdTarea" Theme="DevEx" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Settings ShowFilterRow="True" />
            <SettingsPager PageSize="100">
            </SettingsPager>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%" Theme="iOS">
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
            <Columns>
                <dx:GridViewDataTextColumn FieldName="IdTarea" ReadOnly="True" VisibleIndex="0" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaInicio" VisibleIndex="5">
                    <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaTermino" VisibleIndex="6">
                    <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Asunto" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Detalle" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcCumpli" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Creador" VisibleIndex="16" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Resolucion" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TiempoEstimado" VisibleIndex="11" Caption="Tiem Esti Hrs">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaInicioReal" VisibleIndex="7" Caption="Fech Ini Real">
                    <PropertiesDateEdit ShowShadow="False">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaTerminoReal" VisibleIndex="9" Caption="Fech Term Real">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area Tarea" FieldName="DptoID" ShowInCustomizationForm="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LqsAreaTrabajo" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Prioridad" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem ImageUrl="~/Images/Priority1.png" Text="Baja" Value="1" />
                            <dx:ListEditItem ImageUrl="~/Images/Priority2.png" Text="Media" Value="2" />
                            <dx:ListEditItem ImageUrl="~/Images/Priority3.png" Text="Alta" Value="3" />
                            <dx:ListEditItem ImageUrl="~/Images/Priority4.png" Text="Urgente" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Asignado a :" FieldName="IdAsignado" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Comenzado" Value="1" Selected="true" />
                            <dx:ListEditItem Text="Completo" Value="2" />
                            <dx:ListEditItem Text="En Progreso" Value="3" />
                            <dx:ListEditItem Text="Necesita Asistencia" Value="4" />
                            <dx:ListEditItem Text="Aplazado" Value="5" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTimeEditColumn FieldName="HoraInicioReal" VisibleIndex="8">
                    <PropertiesTimeEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="HH:mm">
                    </PropertiesTimeEdit>
                </dx:GridViewDataTimeEditColumn>
                <dx:GridViewDataTimeEditColumn FieldName="HoraTeminoReal" VisibleIndex="10">
                    <PropertiesTimeEdit DisplayFormatString="" EditFormat="Custom" EditFormatString="HH:mm">
                    </PropertiesTimeEdit>
                </dx:GridViewDataTimeEditColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosTareas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Registro_Tareas" Where="IdTarea == @IdTarea">
            <WhereParameters>
                <asp:Parameter DefaultValue="0" Name="IdTarea" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsAreaTrabajo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
</asp:Content>
