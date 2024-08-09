<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MantencionTransporteRepuestos.aspx.cs" Inherits="CVT_MermasRecepcion.Transporte.MantencionTransporteRepuestos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Transporte</a></li>
            <li><span id="current">Mantencion Repuestos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Mantencion Repuestos</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--     <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
            <%--      <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" />Nuevo</a>--%>
            <a>
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" />
                volver</a>&nbsp;
        </div>
    </div>
    <br />
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosRepuestos" KeyFieldName="Id_RepuestosTransporte" OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
        <Toolbars>
            <dx:GridViewToolbar >
                <Items>
                    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                        <Image Url="../Images/pn-add-source-copy.gif"></Image>
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
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Id_RepuestosTransporte" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Id_MantencionTransporte" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Repuesto" VisibleIndex="3">
                <PropertiesTextEdit>
                    <ValidationSettings Display="Dynamic">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ValorRepuesto" VisibleIndex="4">
                <PropertiesTextEdit>
                    <ValidationSettings Display="Dynamic">
                        <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqsDatosRepuestos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_Transporte_Mantencion_Repuesto" Where="Id_MantencionTransporte == @Id_MantencionTransporte">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="0" Name="Id_MantencionTransporte" SessionField="Id_MantencionTransporte" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <div>
    </div>
</asp:Content>
