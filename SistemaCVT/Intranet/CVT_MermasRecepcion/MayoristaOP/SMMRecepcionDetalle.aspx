<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMRecepcionDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMRecepcionDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            margin-left: 40px;
        }

        .dxgvControl,
        .dxgvDisabled {
            border: 1px Solid #9F9F9F;
            font: 12px Tahoma, Geneva, sans-serif;
            background-color: #F2F2F2;
            color: Black;
            cursor: default;
        }

        .dxgvTable {
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }

        .dxgvTable {
            background-color: White;
            border-width: 0;
            border-collapse: separate !important;
            overflow: hidden;
        }

        .dxgvHeader {
            cursor: pointer;
            white-space: nowrap;
            padding: 4px 6px;
            border: 1px Solid #9F9F9F;
            background-color: #DCDCDC;
            overflow: hidden;
            font-weight: normal;
            text-align: left;
        }

        .dxgvCommandColumn {
            padding: 2px;
            white-space: nowrap;
        }

        .style4 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Recepciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Recepcion N°: 
        <dx:ASPxLabel ID="lbl_recepcion" runat="server" Text="" Font-Bold="true" Font-Size="Medium">
        </dx:ASPxLabel>
        </span>
        <span class="tab-end"></span>
        <div id="options">
            <%--  <a>
               <asp:ImageButton ID="cmdImprimir" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-print.png" OnClick="cmdImprimir_Click"
                    Style="width: 20px" />
                Imprimir Recepcion</a>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" CausesValidation="False" />
                volver</a>&nbsp;
         
        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cod Producto" Font-Bold="true">
        </dx:ASPxLabel>
        <dx:ASPxComboBox ID="cboProductoCompra" runat="server" DataSourceID="LqsProducto"
            ValueField="ItemCode" Height="30px" Width="510px">
            <Columns>
                <dx:ListBoxColumn Caption="CodProducto" FieldName="ItemCode" Width="160px">
                </dx:ListBoxColumn>
                <dx:ListBoxColumn Caption="Producto" FieldName="Dscription" Width="450px">
                </dx:ListBoxColumn>
                <dx:ListBoxColumn Caption="Cantidad" FieldName="OpenQty" Width="140px">
                </dx:ListBoxColumn>
                <dx:ListBoxColumn Caption="Medida" FieldName="UomCode">
                </dx:ListBoxColumn>
            </Columns>
            <ValidationSettings Display="Dynamic">
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </dx:ASPxComboBox> 
        <div>
            <dx:ASPxComboBox ID="cboProdcutoVenta" runat="server" Height="30px" DataSourceID="LqsProductoVenta" ValueField="ItemCode" Width="450px" style="margin-right: 2px">
                <Columns>
                    <dx:ListBoxColumn Caption="Cod.Producto" FieldName="ItemCode" Width="150px">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="450px">
                    </dx:ListBoxColumn>
                </Columns>
            </dx:ASPxComboBox>
            <asp:LinqDataSource ID="LqsProductoVenta" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="VW_MMETRO_PRODUCTO_RECEPCION">
            </asp:LinqDataSource>
        </div>
    </div>
    
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>             
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Cantidad" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_cantidad" runat="server" Height="30px" Width="100px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="solo numeros o coma decimal ( , )" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td class="auto-style6">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="F. Produccion" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="cb_fproduccion" runat="server" Height="30px" Width="140px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="F. Vencimiento" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="cb_fvencimiento" runat="server" Height="30px" Width="140px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
        <asp:LinqDataSource ID="LqsProducto" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName=""
            TableName="VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA" Where="DocNum == @DocNum &amp;&amp; CardCode == @CardCode">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="DocNum" SessionField="NumDocSap" Type="Int32" />
                <asp:SessionParameter DefaultValue="0" Name="CardCode" SessionField="Prove" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Lote Proveedor" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_loteproveedor" runat="server" Height="30px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Lote" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_lote" runat="server" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="DUN14" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_dun14" runat="server" Height="30">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Comentario">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_comentario" runat="server" Height="30px">
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 150px">
        <table>
            <tr>
                <td class="style1">
                    <dx:ASPxButton ID="btn_agregarbulto" runat="server" Text="AGREGAR BULTO"
                        OnClick="btn_agregarbulto_Click" Theme="Glass" Height="40px" Width="150px">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    
    <br />
    <div style="margin-left:25px">
        <dx:ASPxButton ID="btnImprimirRecepcion" runat="server" Text="Imprimir Recepcion" Height="50px" Theme="iOS" CausesValidation="False" OnClick="btnImprimirRecepcion_Click">
            <Image IconID="print_printer_16x16">
            </Image>
        </dx:ASPxButton>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsPackage" KeyFieldName="Package_Id"
            OnHtmlRowCreated="GvDatos_HtmlRowCreated"
            OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <%--   <dx:GridViewToolbarItem Command="New" />--%>
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
                <dx:GridViewCommandColumn VisibleIndex="0"
                    ShowDeleteButton="True" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Id" ReadOnly="True"
                    Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Id" Visible="False"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Id" Visible="False"
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad"
                    FieldName="Package_QuantityInitial" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Quantity" Visible="False"
                    VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Status" Visible="False"
                    VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC"
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot"
                    VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="F Produccion"
                    FieldName="Package_ProductionDate" VisibleIndex="19">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="F Vencimiento"
                    FieldName="Package_ExpiresDate" VisibleIndex="20">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Package_InDate" Visible="False"
                    VisibleIndex="22">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Package_OutDate" Visible="False"
                    VisibleIndex="23">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="DUN 14" FieldName="Package_SN"
                    VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_ReserveQuantity" Visible="False"
                    VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lote Proveedor" FieldName="Package_Data1"
                    VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Data2" Visible="False"
                    VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto"
                    FieldName="ItemCode" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqsProductoVenta" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ItemCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="ItemName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="43">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
          <%--      <dx:GridViewDataTextColumn FieldName="UnMedida" VisibleIndex="32">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataTextColumn FieldName="BaseUnMed" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Medida" FieldName="UomCode" VisibleIndex="35">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantUniTot" VisibleIndex="37">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Settings ShowFilterRow="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsPackage" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EnableUpdate="True"
            EntityTypeName="" OrderBy="Package_SSCC desc" TableName="SMM_Package"
            Where="Reception_Id == @Reception_Id" EnableDelete="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="-1" Name="Reception_Id"
                    SessionField="RecepcionId" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Resumen" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <%--<div>

        <dx:ASPxGridView ID="GvResumen" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsResumen">
            <Columns>
                <dx:GridViewDataTextColumn
                    FieldName="ItemCode" VisibleIndex="0" Caption="Cod.Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn
                    FieldName="ItemName" VisibleIndex="1" Caption="Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Id"
                    VisibleIndex="2" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsResumen" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            TableName="VW_RecepcionResumenSMM" Where="Reception_Id == @Reception_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Reception_Id"
                    SessionField="RecepcionId" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>--%>
    <div>
        <dx:ASPxGridView ID="GvDatoResumen" runat="server" AutoGenerateColumns="False" DataSourceID="LqsResum">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Cod.Producto" FieldName="ItemCode" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="ItemName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Id" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UniTotal" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BaseUnMed" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsResum" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="VW_RecepcionResumenSMM" Where="Reception_Id == @Reception_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Reception_Id" SessionField="RecepcionId" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>

</asp:Content>
