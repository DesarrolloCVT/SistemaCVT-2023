<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BitacoraProyectos.aspx.cs" Inherits="CVT_MermasRecepcion.Servicios.BitacoraProyectos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Servicios</a></li>
            <li><span id="current">Peguntas Encuesta</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Peguntas Encuesta</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a><asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px" /> Exportar Excel</a>&nbsp;
              <a>   --%>
            <%--       <asp:ImageButton ID="cmdNew" runat="server"
                ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px;" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsBitacora" KeyFieldName="Id_Bitacora">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="True" Position="Top">
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />            
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id_Bitacora" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Inicial" VisibleIndex="1">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Proyecto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Termino" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Responsable" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="Id_Area" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsArea" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn Caption="Detalle Proyecto" FieldName="Detalle" ShowInCustomizationForm="True" VisibleIndex="6">
                    <PropertiesMemoEdit Height="100px" Width="200px">
                    </PropertiesMemoEdit>
                </dx:GridViewDataMemoColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:LinqDataSource ID="LqsBitacora" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_BitacoraProyectos" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="Id_Area == @Id_Area">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="-1" Name="Id_Area" SessionField="area" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
    </div>
</asp:Content>
