<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InspeccionGarbanzoDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Inspecciones.InspeccionGarbanzoDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Inspeccion Garbanzo Detalle</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Inspeccion Garbanzo Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" />
                volver</a>&nbsp;
            <a>
<%--                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsGarbanzoDetalle" KeyFieldName="Id_InspeccionGarbanzo_Detalle" OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../../Images/pn-add-source-copy.gif" >                  
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
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
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionGarbanzo_Detalle" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionPT_Garbanzo" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="%Granos dañados x insectos" FieldName="GranosDanadosXinsectos" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="%Granos manchados" FieldName="GranosManchados" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="%Granos Partidos" FieldName="GranosPartidos" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GranosVerdosos" VisibleIndex="8" Caption="%Granos Verdosos">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HoraAnalisis" VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Linea" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="%Materia Extraña" FieldName="MateriaExtrana" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsBehavior ConfirmDelete="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsGarbanzoDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_InspeccionPT_GarbanzoDetalle" Where="Id_InspeccionPT_Garbanzo == @Id_InspeccionPT_Garbanzo">
            <WhereParameters>
                <asp:SessionParameter Name="Id_InspeccionPT_Garbanzo" SessionField="Id_InspeccionPT_Garbanzo" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    </a>
</asp:Content>
