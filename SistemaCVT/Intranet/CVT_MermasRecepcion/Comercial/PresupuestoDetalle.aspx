<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PresupuestoDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.PresupuestoDetalle" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div>
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tipo"></dx:ASPxLabel>
        <dx:ASPxComboBox ID="cbo_Tipo" runat="server">
            <Items>
                <dx:ListEditItem Text="Cliente Existente" Value="0" />
                <dx:ListEditItem Text="Captacion" Value="1" />
            </Items>
        </dx:ASPxComboBox>
    </div>
    <div>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cliente">
        </dx:ASPxLabel>
        <dx:ASPxComboBox ID="cbo_Cliente" runat="server" ValueType="System.String" DataSourceID="LqDsCliente" TextField="CardName" ValueField="CardCode"></dx:ASPxComboBox>
        <asp:LinqDataSource ID="LqDsCliente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="validFor == @validFor &amp;&amp; CardType == @CardType &amp;&amp; SlpCode == @SlpCode">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
                <asp:Parameter DefaultValue="C" Name="CardType" Type="Char" />
                <asp:SessionParameter DefaultValue="0" Name="SlpCode" SessionField="SlpCode" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" OnClick="btn_Buscar_Click"></dx:ASPxButton>
    </div>
    <div>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Canal"></dx:ASPxLabel>
        <dx:ASPxComboBox ID="cbo_Canal" runat="server">
            <Items>
                <dx:ListEditItem Text="Mercado Publico" Value="0" />
                <dx:ListEditItem Text="Tradicional" Value="1" />
                <dx:ListEditItem Text="Otro" Value="2" />
            </Items>
        </dx:ASPxComboBox>
    </div>
    <div>
        <dx:ASPxGridView ID="gv_presupuestoDet" runat="server" AutoGenerateColumns="False" KeyFieldName="PresupuestoDetalle_ID" >
            <SettingsPager AlwaysShowPager="True" PageSize="1000">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
            </SettingsEditing>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
<SettingsBehavior AllowFocusedRow="True" />
             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
<Toolbars>
    <dx:GridViewToolbar>
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
                <dx:GridViewDataTextColumn FieldName="PresupuestoDetalle_ID" VisibleIndex="0" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Presupuesto_ID" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoPresupuesto" VisibleIndex="2" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CardCode" VisibleIndex="3" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CardName" VisibleIndex="4" Caption="Cliente / Canal">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Itemcode" VisibleIndex="5" Caption="Codigo">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="6" Caption="Producto">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Enero" VisibleIndex="7" Caption="1">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EneroPA" VisibleIndex="8" Caption="1 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Febrero" VisibleIndex="9" Caption="2">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FebreroPA" VisibleIndex="10" Caption="2 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Marzo" VisibleIndex="11" Caption="3">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MarzoPA" VisibleIndex="12" Caption="3 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Abril" VisibleIndex="13" Caption="4">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AbrilPA" VisibleIndex="14" Caption="4 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mayo" VisibleIndex="15" Caption="5">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MayoPA" VisibleIndex="16" Caption="5 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Junio" VisibleIndex="17" Caption="6">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="JunioPA" VisibleIndex="18" Caption="6 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Julio" VisibleIndex="19" Caption="7">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="JulioPA" VisibleIndex="20" Caption="7 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Agosto" VisibleIndex="21" Caption="8">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AgostoPA" VisibleIndex="22" Caption="8 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Septiembre" VisibleIndex="23" Caption="9">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SeptiembrePA" VisibleIndex="24" Caption="9 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Octubre" VisibleIndex="25" Caption="10">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OctubrePA" VisibleIndex="26" Caption="10 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Noviembre" VisibleIndex="27" Caption="11">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NoviembrePA" VisibleIndex="28" Caption="11 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Diciembre" VisibleIndex="29" Caption="12">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DiciembrePA" VisibleIndex="30" Caption="12 PA">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsPresupuestoDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableUpdate="True" EntityTypeName="" TableName="CVT_PresupuestoDetalle" Where="CardCode == @CardCode &amp;&amp; Presupuesto_ID == @Presupuesto_ID">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_Cliente" DefaultValue="&quot;&quot;" Name="CardCode" PropertyName="Value" Type="String" />
                <asp:SessionParameter Name="Presupuesto_ID" SessionField="PresupuestoID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsPresupuestoDetalleCanal" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableUpdate="True" EntityTypeName="" TableName="CVT_PresupuestoDetalle" Where="Presupuesto_ID == @Presupuesto_ID &amp;&amp; CardCode == @CardCode">
            <WhereParameters>
                <asp:SessionParameter Name="Presupuesto_ID" SessionField="PresupuestoID" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_Canal" DefaultValue="-1" Name="CardCode" PropertyName="Value" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
