﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TransformacionManual.aspx.cs" Inherits="CVT_MermasRecepcion.Transformaciones.TransformacionManual" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 23px;
        }
        .style3
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li> 
        <li><a>Transformacion</a></li>
        <li><span id="current">Transformacion Detalle</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Transformacion: 
        <dx:ASPxLabel ID="lbl_Transformacion" runat="server" Text="">
        </dx:ASPxLabel>
    </span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" 
              onclick="cmdExcel_Click" /> Exportar Excel</a>
          
    </div>
</div>
    <div>
         <table class="style1">
        <tr>
            <td>

    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N de Pallets" Font-Bold="True" 
                    Font-Size="Medium">
    </dx:ASPxLabel>
            </td>
            <td>
    <dx:ASPxTextBox ID="txt_origen" runat="server" Width="200px" AutoPostBack="True" 
                    Font-Size="Medium" Height="50px" ontextchanged="txt_origen_TextChanged">
    </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>

                &nbsp;</td>
            <td>
                <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red" 
                    Text="N de pallet no existe, no posicionado o de otra bodega" Visible="False">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cod. Producto">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_codproducto" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Producto">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_producto" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Lote">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_lote" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Cantidad">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_cantidad" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cod Ubicacion">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_posicion" runat="server">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Id Producto" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_idproducto" runat="server" Visible="False">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>

                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Id Pallet" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_idpallet" runat="server" Visible="False">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style3">
                <dx:ASPxLabel ID="lbl_destino" runat="server" ClientInstanceName="lbl_destino" 
                    Text="Destino" ClientVisible="false" Font-Bold="True" Font-Size="Medium">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lbl_cantrepaletizar0" runat="server" Font-Bold="True" 
                    Font-Size="Medium" Text="Producto Destino">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_producto" runat="server" DataSourceID="LqDsArticulo" 
                    ValueField="ArticleProvider_Id" OnSelectedIndexChanged="cbo_producto_SelectedIndexChanged">
                    <Columns>
                        <dx:ListBoxColumn Caption="Codigo" FieldName="ArticleProvider_CodClient">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsArticulo" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
                    TableName="ArticleProvider" 
                    
                    Where="Family_Id == @Family_Id &amp;&amp; ArticleProvider_CodClient != @ArticleProvider_CodClient &amp;&amp; ArticleProvider_Status == @ArticleProvider_Status" 
                    OrderBy="ArticleProvider_CodClient, ArticleProvider_Description">
                    <WhereParameters>
                        <asp:SessionParameter DefaultValue="0" Name="Family_Id" SessionField="Familia" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="lbl_codproducto" DefaultValue="0" 
                            Name="ArticleProvider_CodClient" PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="1" Name="ArticleProvider_Status" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="lbl_cantrepaletizar" runat="server" Font-Bold="True" 
                    Font-Size="Medium" Text="Cantidad a Transformar">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxTextBox ID="txt_cantidad" runat="server" Font-Size="Medium" 
                    Height="50px" Width="200px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_generar" runat="server" Text="AGREGAR" 
                    ClientInstanceName="btn_generar" Font-Size="Medium" 
                    onclick="btn_generar_Click" Enabled="False" style="height: 29px">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    </div>
    <div>
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LqDsTransformaciones" KeyFieldName="TransformacionDet_Id" 
        onrowdeleting="GvDatos_RowDeleting">
        <SettingsPager PageSize="25">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="TransformacionDet_Id" 
                VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NPallet_Destino" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Codigo_Destino" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Producto_Destino" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad_Destino" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Posicion" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Transformacion_Id" Visible="False" 
                VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Package_Id" Visible="False" 
                VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ArticleProvider_Id" Visible="False" 
                VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PackageDestiny_Id" Visible="False" 
                VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ArticleProviderDestiny_Id" 
                Visible="False" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Layout_Id" Visible="False" 
                VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot" 
                VisibleIndex=" 3">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsTransformaciones" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" 
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" 
        TableName="CVT_View_TransformacionDetalle" 
        Where="Transformacion_Id == @Transformacion_Id">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="0" Name="Transformacion_Id" 
                SessionField="TransformacionId" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
    </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
