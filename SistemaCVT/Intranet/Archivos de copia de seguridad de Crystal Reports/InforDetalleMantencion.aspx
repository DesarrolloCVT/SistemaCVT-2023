<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InforDetalleMantencion.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.InforDetalleMantencion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 101px;
        }

        .auto-style6 {
            width: 26px;
        }

        .auto-style7 {
            width: 25px;
        }

        .auto-style8 {
            width: 252px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Correos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Mantencion Informatica</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--     <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
        <%--    <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
            <a>
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;
        </div>
    </div>
    <br />
    <div style="margin-left: 40px">
        <asp:Label ID="lUsuarioEq" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblUsuarioEq" runat="server" Text="" Font-Bold="true" Style="margin-right: 15px"></asp:Label>
        <asp:Label ID="ltipEq" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblTipoEquipo" runat="server" Text="" Font-Bold="true" Style="margin-right: 15px"></asp:Label>
        <asp:Label ID="lNomEq" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblNombreEq" runat="server" Text="" Font-Bold="true" Style="margin-right: 15px"></asp:Label>
        <asp:Label ID="lMarca" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblMarca" runat="server" Text="" Font-Bold="true"></asp:Label>

    </div>
    <br />
    <div style="margin-left: 40px">
        <asp:Label ID="lModelo" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblModelo" runat="server" Text="" Font-Bold="true" Style="margin-right: 15px"></asp:Label>
        <asp:Label ID="lRam" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblRam" runat="server" Text="" Font-Bold="true" Style="margin-right: 15px"></asp:Label>
        <asp:Label ID="lproce" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblProcesa" runat="server" Text="" Font-Bold="true"></asp:Label>
    </div>
    <br />
    <div style="margin-left: 40px">
        <asp:Label ID="lSo" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblSO" runat="server" Text="" Font-Bold="true" Style="margin-right: 15px"></asp:Label>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalleMantencionInf" KeyFieldName="Id_InfTipoMantencion" OnRowInserting="GvDatos_RowInserting" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InfTipoMantencion" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Tipo" VisibleIndex="2">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Mantencion Hardware" Value="1" />
                            <dx:ListEditItem Text="Mantencion Software" Value="2" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="ID_MantInfEnc" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Mantencion" FieldName="MantencionDet" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsMantencion" TextField="MantencionDescr" ValueField="MantencionDescr">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
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
        <asp:LinqDataSource ID="LqsDetalleMantencionInf" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_Mantencion_Tipo" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="ID_MantInfEnc == @ID_MantInfEnc">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_MantInfEnc" SessionField="ID_MantInfEnc" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsMantencion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_Mantencion_Descripcion">
        </asp:LinqDataSource>
    </div>
</asp:Content>
