<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMTrazabilidadPallet.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMTrazabilidadPallet" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Trazabilidad Pallet SMM</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Trazabilidad Pallet SMM</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td class="auto-style5">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Pallet" Font-Bold="true" Font-Size="Medium">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_pallet" runat="server" Width="170px" Height="29px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btn_buscar" runat="server" Text="Buscar" Theme="MaterialCompact" Height="59px" Width="113px">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxVerticalGrid ID="GvBusqueda" runat="server" AutoGenerateRows="False"
            DataSourceID="LqDsBusqueda" Width="700px" Settings-ShowTitlePanel="true" SettingsText-Title="DETALLE PALLET" Styles-TitlePanel-BackColor="CadetBlue">
            <Rows>
                <dx:VerticalGridTextRow FieldName="Site_Id"
                    VisibleIndex="14" Visible="False">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow Caption="Bodega" FieldName="Site_Description" VisibleIndex="8">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="Layout_Id" Visible="False"
                    VisibleIndex="15">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="Package_Id" Visible="False" VisibleIndex="16">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="CodProducto" VisibleIndex="4">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="NRecepcion"
                    VisibleIndex="17" Visible="False">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="FRecepcion"
                    VisibleIndex="7">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="Proveedor" VisibleIndex="12">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="NPallet"
                    VisibleIndex="0">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="Cantidad"
                    VisibleIndex="1">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="Lote"
                    VisibleIndex="3">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="CodBarr" Visible="False"
                    VisibleIndex="18">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="CantReserva"
                    VisibleIndex="2">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="Ubicacion"
                    VisibleIndex="9">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow Caption="Fecha Produccion"
                    FieldName="Package_ProductionDate" VisibleIndex="10">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="Info1" Visible="False"
                    VisibleIndex="19">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow Caption="Info" FieldName="Info2"
                    VisibleIndex="13">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridTextRow FieldName="CantInicial" Visible="False" VisibleIndex="20">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow FieldName="Package_InDate" Visible="False"
                    VisibleIndex="21">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridDateRow FieldName="Package_OutDate" Visible="False"
                    VisibleIndex="22">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridTextRow FieldName="Producto" VisibleIndex="5">
                </dx:VerticalGridTextRow>
                <dx:VerticalGridDateRow Caption="Fecha Vencimiento"
                    FieldName="Package_ExpiresDate" VisibleIndex="11">
                </dx:VerticalGridDateRow>
                <dx:VerticalGridComboBoxRow FieldName="Estado" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Activo" Value="2" />
                            <dx:ListEditItem Text="Despachado" Value="7" />
                        </Items>
                    </PropertiesComboBox>
                </dx:VerticalGridComboBoxRow>
            </Rows>
            <SettingsPager Mode="ShowPager"></SettingsPager>

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
        </dx:ASPxVerticalGrid>
        <asp:LinqDataSource ID="LqDsBusqueda" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            TableName="SMM_VW_TRAZABILIDAD_BUSQUEDA" Where="NPallet == @NPallet">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_pallet" DefaultValue="0"
                    Name="NPallet" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsTrazabilidad" SettingsText-Title="DETALLE MOVIMIENTOS" Settings-ShowTitlePanel="true" Styles-TitlePanel-BackColor="CadetBlue" Theme="Default" >
            <SettingsPager AlwaysShowPager="True">
            </SettingsPager>

            <Settings ShowTitlePanel="True"></Settings>

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <SettingsText Title="DETALLE MOVIMIENTOS"></SettingsText>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Package_Id" Visible="False"
                    VisibleIndex="15" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="2" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Entidad" VisibleIndex="3" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Operacion" VisibleIndex="5" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="IDentidad"
                    VisibleIndex="4" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Tipo"
                    VisibleIndex="9" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ndocumento" VisibleIndex="10" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadInicial" VisibleIndex="11" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreUsuario"
                    VisibleIndex="8" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Fecha" FieldName="fecha" ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Package_ProductionDate" Visible="False"
                    VisibleIndex="16" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Package_ExpiresDate" Visible="False"
                    VisibleIndex="17" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Note"
                    VisibleIndex="6" Caption="Informacion" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Lot" Visible="False"
                    VisibleIndex="18" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto"
                    VisibleIndex="12" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Article_Description"
                    VisibleIndex="13" Caption="Producto" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado"
                    VisibleIndex="14" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega"
                    VisibleIndex="7" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Hora" FieldName="fecha" VisibleIndex="1">
                    <PropertiesDateEdit DisplayFormatString="HH:mm:ss">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
            </Columns>

            <Styles>
                <TitlePanel BackColor="CadetBlue"></TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsTrazabilidad" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            OrderBy="fecha desc" TableName="SMM_VW_TRAZABILIDAD_PALLET"
            Where="NPallet == @NPallet">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_pallet" DefaultValue="0"
                    Name="NPallet" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>

    </div>
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvReserva" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsReserva" Settings-ShowTitlePanel="true" SettingsText-Title="DETALLE RESERVA" Styles-TitlePanel-BackColor="CadetBlue">
<Settings ShowTitlePanel="True"></Settings>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

<SettingsText Title="DETALLE RESERVA"></SettingsText>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Npallet" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Operacion" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Transfer_Id" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreUsuario"
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_ReserveQuantity"
                    VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="0">
                </dx:GridViewDataDateColumn>
            </Columns>

<Styles>
<TitlePanel BackColor="CadetBlue"></TitlePanel>
</Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsReserva" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            TableName="SMM_VW_TRAZABILIDAD_BULTOS_CON_RESERVA" Where="Npallet == @Npallet">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_pallet" DefaultValue="0" Name="Npallet"
                    PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
