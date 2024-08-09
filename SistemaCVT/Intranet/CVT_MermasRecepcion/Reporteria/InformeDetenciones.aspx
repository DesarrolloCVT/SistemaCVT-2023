<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeDetenciones.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InformeDetenciones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 20px;
        }

        .auto-style6 {
            width: 99px;
        }

        .auto-style7 {
            width: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Informe Detenciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Detenciones</span>
        <span class="tab-end"></span>
     <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" Style="width: 20px" />
                Exportar Excel DETALLE</a>
        </div>--%>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table class="style1">
            <tr>
                <td class="auto-style5">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Desde">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6">
                    <dx:ASPxDateEdit ID="cb_finicio" runat="server">
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style7">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Hasta">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="cb_fhasta" runat="server">
                    </dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-left: 80px">
        <table>
            <tr>

                <td>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click"
                        Text="GENERAR">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>

    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsDetenciones" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords" PageSize="1000">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
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
                <dx:GridViewDataTextColumn FieldName="OF" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Categoria_Nombre" VisibleIndex="5" Caption="Categoria">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Motivo_Cod" VisibleIndex="6" Caption="Cod Motivo">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Detencion_Motivo" VisibleIndex="7" Caption="Motivo">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalMinutosDetencion" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="3" Caption="Cod Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="4" Caption="Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItmsGrpCod" VisibleIndex="12" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItmsGrpNam" VisibleIndex="2" Caption="Grupo Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="U_NumSala" VisibleIndex="13" Caption="Sala">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="U_Linea" VisibleIndex="14" Caption="Linea">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="U_Operador" VisibleIndex="15" Caption="Operador">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DueDate" VisibleIndex="1" Caption="Fecha">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Maquina" FieldName="Maquina" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechConfirma" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UsuarioConfirma" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Hr_Inicio" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Hr_Termino" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <br />
        <asp:LinqDataSource ID="LqDsDetenciones" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_VW_InformeDetenciones" OrderBy="DueDate"
            Where="DueDate &gt;= @DueDate &amp;&amp; DueDate &lt;= @DueDate1">
            <WhereParameters>
                <asp:ControlParameter ControlID="cb_finicio" Name="DueDate" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="cb_fhasta" Name="DueDate1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>
