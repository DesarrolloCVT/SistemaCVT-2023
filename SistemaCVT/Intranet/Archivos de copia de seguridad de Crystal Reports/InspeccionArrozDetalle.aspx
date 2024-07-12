<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InspeccionArrozDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Inspecciones.InspeccionArrozDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Inspeccion Arroz</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Inspeccion Arroz</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;
         <%--   <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalleArroz" KeyFieldName="IdDetalleInspeccionPT_Arroz" OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../../Images/pn-add-source-copy.gif">         
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                    </items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="IdDetalleInspeccionPT_Arroz" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionPT_Arroz" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Color" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Impuresas" FieldName="Impurezas" VisibleIndex="6">
                    <PropertiesTextEdit HelpText="hojas, fecas, insectos, metales, piedras, maderas, etc">
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="unidad Arroz Cascara" FieldName="ArrozCascara" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Unidad Semillas objetables" FieldName="SemillasObjetables" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Granos Partido" FieldName="GranosPartidos" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Granps Yesados" FieldName="GranosYesados" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Granos Dañados" FieldName="GranosDanados" VisibleIndex="11">
                    <PropertiesTextEdit HelpText="Dañados por calor y/o manchados y/o amarillos">
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hora analisis" FieldName="HoraAnalisis" VisibleIndex="3">
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
                <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetalleArroz" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_InspeccionPT_ArrozDetalle" Where="Id_InspeccionPT_Arroz == @Id_InspeccionPT_Arroz">
            <WhereParameters>
                <asp:SessionParameter Name="Id_InspeccionPT_Arroz" SessionField="Id_InspeccionPT_Arroz" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
