﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DevolucionDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.DevolucionDetalle" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
        .style2
        {
            width: 170px;
        }
        .style3
        {
            height: 23px;
            width: 170px;
        }
        .style4
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>WMS</a></li>
        <li><span id="current">Devolucion</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Devolucion: 
        <dx:ASPxLabel ID="lbl_recepcion" runat="server" Text="">
        </dx:ASPxLabel>
    </span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px"/> Exportar Excel</a> 
         <a>
          <asp:ImageButton ID="cmdImprimir" runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-print.png" onclick="cmdImprimir_Click" 
              style="width: 20px"/> Imprimir Devolucion</a> 
    </div>
</div>
<div>

    <table class="dxeBinImgCPnlSys">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                <dx:ASPxButton ID="btn_reported" runat="server" Height="18px" 
                    onclick="btn_reported_Click" Text="Det. Productos" Width="46px">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cod Producto">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_producto" runat="server" DataSourceID="LqDsReported" 
                    ValueField="ArticleProvider_Id">
                    <Columns>
                        <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient" 
                            Width="150px">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description" 
                            Width="300px">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsReported" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
                    TableName="CVT_VW_ReceptionReported" Where="Reception_Id == @Reception_Id">
                    <WhereParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="Reception_Id" 
                            SessionField="RecepcionId" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Cantidad">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_cantidad" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="F. Produccion">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxDateEdit ID="cb_fproduccion" runat="server">
                </dx:ASPxDateEdit>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="F. Vencimiento">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cb_fvencimiento" runat="server">
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Lote Proveedor">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_loteproveedor" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Lote">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="DUN14">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_dun14" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Comentario">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_comentario" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Motivo Devolucion">
                </dx:ASPxLabel>
            </td>
            <td class="style3">
                <dx:ASPxComboBox ID="cbo_MotDevolucion" runat="server" 
                    DataSourceID="LqDsMotDevolucion" ValueField="Code">
                    <Columns>
                        <dx:ListBoxColumn Caption="Codigo" FieldName="Code">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Motivo" FieldName="Name" Width="400px">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsMotDevolucion" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" 
                    TableName="_MOTIVO_DEVOL">
                </asp:LinqDataSource>
            </td>
            <td class="style1">
            </td>
            <td class="style1">
            </td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
            <td class="style1">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_agregarbulto" runat="server" Text="AGREGAR BULTO" 
                    onclick="btn_agregarbulto_Click">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="7">
                <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LqDsPackage" KeyFieldName="Package_Id" 
                    onhtmlrowcreated="GvDatos_HtmlRowCreated" 
                    onrowcommand="GvDatos_RowCommand">
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Columns>
                        <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" 
                            ShowDeleteButton="True">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True" 
                            Visible="False" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Id" ReadOnly="True" 
                            Visible="False" VisibleIndex="2">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Supportive_Id" Visible="False" 
                            VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Reception_Id" Visible="False" 
                            VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Layout_Id" Visible="False" 
                            VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ArticleProvider_GrossWeight" 
                            Visible="False" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Barcode" Visible="False" 
                            VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Cantidad" 
                            FieldName="Package_QuantityInitial" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Quantity" Visible="False" 
                            VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_NetWeightInitial" Visible="False" 
                            VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_NetWeight" Visible="False" 
                            VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_GrossWeightInitial" 
                            Visible="False" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_GrossWeight" Visible="False" 
                            VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Height" Visible="False" 
                            VisibleIndex="16">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Status" Visible="False" 
                            VisibleIndex="17">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_QualityStatus" Visible="False" 
                            VisibleIndex="18">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Owner" Visible="False" 
                            VisibleIndex="19">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC" 
                            VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_SSCCParent" Visible="False" 
                            VisibleIndex="20">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_SSCCParent_Id" Visible="False" 
                            VisibleIndex="21">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot" 
                            VisibleIndex="22">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="F Produccion" 
                            FieldName="Package_ProductionDate" VisibleIndex="23">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn Caption="F Vencimiento" 
                            FieldName="Package_ExpiresDate" VisibleIndex="24">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Mixed" Visible="False" 
                            VisibleIndex="25">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Package_InDate" Visible="False" 
                            VisibleIndex="26">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="Package_OutDate" Visible="False" 
                            VisibleIndex="27">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="DUN 14" FieldName="Package_SN" 
                            VisibleIndex="29">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_PN" Visible="False" 
                            VisibleIndex="30">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_ReserveQuantity" Visible="False" 
                            VisibleIndex="31">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Reserve" Visible="False" 
                            VisibleIndex="32">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lote Proveedor" FieldName="Package_Data1" 
                            VisibleIndex="28">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Data2" Visible="False" 
                            VisibleIndex="33">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PackageState_Id" Visible="False" 
                            VisibleIndex="34">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Accounts_Id" Visible="False" 
                            VisibleIndex="35">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_FoilPP" Visible="False" 
                            VisibleIndex="36">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="EntryType" Visible="False" 
                            VisibleIndex="37">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Origin" Visible="False" 
                            VisibleIndex="38">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Destination" Visible="False" 
                            VisibleIndex="39">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_DependencesTotal" Visible="False" 
                            VisibleIndex="40">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_CrossDocking" Visible="False" 
                            VisibleIndex="41">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="PackageState_Id_Initial" Visible="False" 
                            VisibleIndex="42">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Producto" 
                            FieldName="ArticleProvider_Id" VisibleIndex="7">
                            <PropertiesComboBox DataSourceID="LqDsReported" ValueField="ArticleProvider_Id">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="44">
                 <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server" 
                    ImageUrl="~/Images/confirm.png" onclientclick="LoadingPanel.Show();"/>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Motivo Devolucion" 
                            FieldName="DevolucionMotivo_Id" VisibleIndex="43">
                            <PropertiesComboBox DataSourceID="LqDsMotDevolucion" TextField="Name" 
                                ValueField="Code">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDsPackage" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EnableUpdate="True" 
                    EntityTypeName="" OrderBy="Package_SSCC desc" TableName="Package" 
                    Where="Reception_Id == @Reception_Id" EnableDelete="True">
                    <WhereParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="Reception_Id" 
                            SessionField="RecepcionId" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    GridViewID="GvDatos">
                </dx:ASPxGridViewExporter>
</div>
<div>
<p>RESUMEN</p>
    <dx:ASPxGridView ID="GvResumen" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LqDsResumen">
        <Columns>
            <dx:GridViewDataTextColumn Caption="Codigo" 
                FieldName="ArticleProvider_CodClient" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Producto" 
                FieldName="ArticleProvider_Description" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Reception_Id" Visible="False" 
                VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsResumen" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
        TableName="CVT_VW_RecepcionResumen" Where="Reception_Id == @Reception_Id">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="-1" Name="Reception_Id" 
                SessionField="RecepcionId" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</div>
<div>
                <dx:ASPxPopupControl ID="popup_reported" runat="server" 
                    HeaderText="Detalle Productos">
                    <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
    <table class="style4">
        <tr>
            <td rowspan="2">
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Producto">
                </dx:ASPxLabel>
            </td>
            <td rowspan="2">
                <dx:ASPxComboBox ID="cbo_producto" runat="server" DataSourceID="LqDsProductos" 
                    ValueField="ArticleProvider_Id">
                    <Columns>
                        <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient" 
                            Width="150px">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description" 
                            Width="300px">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsProductos" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
                    TableName="ArticleProvider" Where="ArticleProvider_Status == @ArticleProvider_Status">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="1" Name="ArticleProvider_Status" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
            <td>
                <dx:ASPxButton ID="btn_agregar" runat="server" OnClick="btn_agregar_Click" 
                    Text="AGREGAR">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="btn_cerrarpopup" runat="server" 
                    OnClick="btn_cerrarpopup_Click" Text="CERRAR">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <dx:ASPxGridView ID="Gv_Reported" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LqDsReportedrec" 
                    KeyFieldName="Company_Id;Site_Id;Reception_Id;ArticleProvider_Id">
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" 
                            ShowInCustomizationForm="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Site_Id" ReadOnly="True" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Reception_Id" ReadOnly="True" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ReceptionReported_Quantity" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="ReceptionReported_Weigth" 
                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                            <PropertiesComboBox DataSourceID="LqDsProductos" 
                                ValueField="ArticleProvider_Id">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="Producto" 
                            FieldName="ArticleProvider_Id" ReadOnly="True" ShowInCustomizationForm="True" 
                            VisibleIndex="4">
                            <PropertiesComboBox DataSourceID="LqDsProductos" 
                                ValueField="ArticleProvider_Id">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDsReportedrec" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EnableDelete="True" 
                    EntityTypeName="" TableName="ReceptionReported" 
                    Where="Reception_Id == @Reception_Id">
                    <WhereParameters>
                        <asp:SessionParameter DefaultValue="-1" Name="Reception_Id" 
                            SessionField="RecepcionId" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>
                        </dx:PopupControlContentControl>
</ContentCollection>
                </dx:ASPxPopupControl>
            

</div>
</asp:Content>

