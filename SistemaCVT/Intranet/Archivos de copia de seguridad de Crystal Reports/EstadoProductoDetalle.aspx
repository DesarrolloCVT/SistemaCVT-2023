<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EstadoProductoDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.EstadoProductoDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>
            <li><span id="current">Estado Producto</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estado Productos Detalle</span>
        <span class="tab-end"></span>
        <%--  <div id="options">         
          &nbsp;<a><asp:ImageButton ID="cmdNew"      runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click"/>Nuevo</a>
    </div>--%>
    </div>

    <br />
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsDetEstado" KeyFieldName="InventarioEstadoDet_Id"
            OnRowInserting="ASPxGridView1_RowInserting">
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
<Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                        <%--<dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
                        </dx:GridViewToolbarItem>--%>
                        <%--<dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>--%>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                    VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="ID" FieldName="InventarioEstadoDet_Id"
                    ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InventarioEstado_Id" Visible="False"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="WMS" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SAP" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Inventariado" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Bodega" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_ShortDescription"
                        ValueField="Site_ShortDescription">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsDetEstado" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="CVT_InventarioEstadoDet"
            Where="InventarioEstado_Id == @InventarioEstado_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="InventarioEstado_Id"
                    SessionField="EstProd_ID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsSite" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            Select="new (Site_ShortDescription)" TableName="Site">
        </asp:LinqDataSource>
    </div>
</asp:Content>
