<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformePresupuestoVentas.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.InformePresupuestoVentas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Comercial</a></li>
        <li><span id="current">Informe Presupuesto x Vendedor</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Informe Presupuesto x Vendedor</span>
    <span class="tab-end"></span>
</div>
    <div>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Vendedor"></dx:ASPxLabel> 
        <dx:ASPxComboBox ID="cbo_vendedor" runat="server" DataSourceID="LqDsVendedor" TextField="SlpName" ValueField="SlpCode"></dx:ASPxComboBox>
        <asp:LinqDataSource ID="LqDsVendedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (SlpCode, SlpName)" TableName="OSLP" Where="Active == @Active &amp;&amp; GroupCode == @GroupCode">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="Active" Type="Char" />
                <asp:Parameter DefaultValue="1" Name="GroupCode" Type="Int16" />
            </WhereParameters>
        </asp:LinqDataSource>

        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Año"></dx:ASPxLabel>
        <dx:ASPxComboBox ID="cbo_año" runat="server">
            <Items>
                <dx:ListEditItem Text="2025" Value="2025" />
                <dx:ListEditItem Text="2026" Value="2026" />
                <dx:ListEditItem Text="2027" Value="2027" />
                <dx:ListEditItem Text="2028" Value="2028" />
                <dx:ListEditItem Text="2029" Value="2029" />
                <dx:ListEditItem Text="2030" Value="2030" />
            </Items>
        </dx:ASPxComboBox>
        <dx:ASPxButton ID="Btn_Refrescar" runat="server" Text="Buscar" OnClick="Btn_Refrescar_Click"></dx:ASPxButton>
    </div>
    <div>
        <dx:ASPxGridView ID="GvInfPresupuesto" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsinfpresupuesto">
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
                                    <SettingsPager PageSize="200">
                                    </SettingsPager>
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Presupuesto_ID" VisibleIndex="0" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoPresupuesto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CardCode" VisibleIndex="4" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CardName" VisibleIndex="5" Caption="Cliente">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Itemcode" VisibleIndex="6" Caption="Codigo">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="7" Caption="Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Enero" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EneroPA" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Febrero" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FebreroPA" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Marzo" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MarzoPA" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Abril" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AbrilPA" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mayo" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MayoPA" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Junio" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="JunioPA" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Julio" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="JulioPA" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Agosto" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AgostoPA" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Septiembre" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SeptiembrePA" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Octubre" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OctubrePA" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Noviembre" VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NoviembrePA" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Diciembre" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DiciembrePA" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Vendedor" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsVendedor" TextField="SlpName" ValueField="SlpCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsinfpresupuesto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PresupuestoInformeVendedorAño" Where="Vendedor == @Vendedor &amp;&amp; Año == @Año">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_vendedor" DefaultValue="0" Name="Vendedor" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_año" DefaultValue="0" Name="Año" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
