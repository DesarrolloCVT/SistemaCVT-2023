<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CalculoPeriodo.aspx.cs" Inherits="CVT_MermasRecepcion.Contabilidad.CalculoPeriodo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Contabilidad</a></li>
            <li><span id="current">Calculo Periodo</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Calculo Periodo</span>
        <span class="tab-end"></span>
        <%--      <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;         
        </div>--%>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatos" KeyFieldName="Año">
            <SettingsPager PageSize="200">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
               <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--<dx:GridViewToolbarItem Command="New" />--%>
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" FileName="Calculo Periodo"/>
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Año" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" ReadOnly="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Periodo" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="ID_Activo" ReadOnly="True" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Placa" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Nombre_Activo" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Compra" VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="N_Factura" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cuenta_Contable" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vida_Util_Meses" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vida_Util_Restante" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vida_Util_Transcurrida" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valor_Compra_Neto" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CMAC" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CMEJ" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DEPAC" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DEPEJ" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Beneficio_33BIS" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto_Beneficio_33BIS" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valor_Final_Activo_ANT" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="valor_para_CM" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CM_EJE" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CM_EJE_Aprox" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CMDA" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CMDA_Aprox" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto_a_Depreciar" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto_a_Depreciar_APROX" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Factor" VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Depresiacion_Eje" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Depresiacion_Eje_APROX" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valor_Final_Activo_Nuevo" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Dvision" VisibleIndex="32">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Unid_Administrativa" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Centro_Costo" VisibleIndex="34">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lugar_Fisico" VisibleIndex="35">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AF_CalculoPeriodo">
        </asp:LinqDataSource>
    </div>
</asp:Content>
