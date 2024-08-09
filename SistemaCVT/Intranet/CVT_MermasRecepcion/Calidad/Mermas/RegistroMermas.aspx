<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistroMermas.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Mermas.RegistroMermas" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">

<div>
<a><strong>Registro Mermas</strong></a>
</div>
<div>


    <table class="style1">
        <tr>
            <td colspan="8">
                <a>Criterios de Busqueda</a>
                6&nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Font-Size="Small" Text="Guia Despacho"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Size="Small" 
                    Text="Ref. Cliente (Factura Cliente)"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Size="Small" Text="Orden de Compra"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Size="Small" Text="Recepcion WMS"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Size="Small" Text="Lote Interno"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" Font-Size="Small" Text="Fecha Recepcion"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dx:ASPxTextBox ID="txt_GDesp" runat="server" Width="70px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_Factura" runat="server" Width="70px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_OCompra" runat="server" Width="70px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_RecepWms" runat="server" Width="70px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_Lote" runat="server" Width="70px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxDateEdit ID="txt_FRecep" runat="server" Width="70px">
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" Text="Buscar" Width="70px" 
                    onclick="btn_buscar_Click">
                </dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton ID="btn_imprimir" runat="server" Text="Imprimir" Width="70px" 
                    onclick="btn_imprimir_Click">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>

</div>
<div>
<a>Recepciones</a>
    <dx:ASPxGridView ID="GvRecepciones" runat="server" AutoGenerateColumns="False" 
        KeyFieldName="DocEntryRec;Rec_Wms;OC;GuiaDesp" 
        onrowcommand="GvRecepciones_RowCommand">
        <Columns>
            <dx:GridViewDataTextColumn Caption="O. Compra" FieldName="OC" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Proveedor" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Factura" FieldName="RefCli" 
                VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Recepcion Sap" FieldName="Rec_Sap" 
                VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="G. Despacho" FieldName="GuiaDesp" 
                VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Recepcion WMS" FieldName="Rec_Wms" 
                VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Lote Interno" FieldName="BatchNum" 
                VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DocEntryRec" Visible="False" 
                VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="8">
                <DataItemTemplate>
                    <asp:ImageButton ID="detalle" CommandName="cmdDetRecep" runat="server" ImageUrl="~/Images/edita.png" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
</div>
<div>
    <a>Detalle Recepcion</a>
    <dx:ASPxGridView ID="GvDetRecepcion" runat="server" AutoGenerateColumns="False" 
        KeyFieldName="DocNum;LineNum;ItemCode;Manifiesto;Comentario;Ind_ReclamoSeguro;TipoMerma;Cant_Merma" 
        onrowupdating="GvDetRecepcion_RowUpdating" 
        ondatabinding="GvDetRecepcion_DataBinding" 
        onhtmlrowcreated="GvDetRecepcion_HtmlRowCreated" 
        SettingsBehavior-AllowDragDrop="false" 
        onrowcommand="GvDetRecepcion_RowCommand" 
        onhtmlrowprepared="GvDetRecepcion_HtmlRowPrepared">
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>

<SettingsBehavior AllowDragDrop="False"></SettingsBehavior>

        <SettingsCommandButton>
            <EditButton Text="Editar">
            </EditButton>
        </SettingsCommandButton>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Recepcion SAP" FieldName="DocNum" 
                VisibleIndex="2">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Quantity" 
                VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cant. Merma" FieldName="Cant_Merma" 
                VisibleIndex="7">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="LineNum" FieldName="LineNum" 
                Visible="False" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="ItemCode" FieldName="ItemCode" 
                Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TipoMerma" Visible="False" 
                VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Manifiesto" VisibleIndex="11" 
                FieldName="Manifiesto">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Comentario" VisibleIndex="12" 
                FieldName="Comentario">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Motivo Merma" FieldName="Cod_TipoMerma" 
                VisibleIndex="6">
                <PropertiesComboBox DataSourceID="LqDsMotivoMerma" TextField="Descr" 
                    ValueField="FldValue">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Recl. Seguro" 
                FieldName="Ind_ReclamoSeguro" VisibleIndex="5">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="SI" Value="S" />
                        <dx:ListEditItem Text="No" Value="N" />
                    </Items>
                </PropertiesComboBox>
                <Settings AllowDragDrop="False" />
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Detalle Seguro" VisibleIndex="13">
            <DataItemTemplate>
                    <asp:ImageButton ID="DetSeg" CommandName="cmdDetSeg" runat="server" ImageUrl="~/Images/edita.png" />
            </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Editar" VisibleIndex="1">
            <DataItemTemplate>
                    <asp:ImageButton ID="Editar"  CommandName="cmdEditar" runat="server" ImageUrl="~/Images/edita.png" />
            </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsMotivoMerma" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" 
        TableName="UFD1" Where="TableID == @TableID &amp;&amp; FieldID == @FieldID">
        <WhereParameters>
            <asp:Parameter DefaultValue="@MERMARECEPCION" Name="TableID" Type="String" />
            <asp:Parameter DefaultValue="8" Name="FieldID" Type="Int16" />
        </WhereParameters>
    </asp:LinqDataSource>
    <dx:ASPxPopupControl ID="PopUp_Editar" runat="server" AllowDragging="True" 
        HeaderText="Editar" Width="700px" PopupAction="None" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        
        <ContentCollection>
         
<dx:PopupControlContentControl runat="server">
   
  
    <table class="style1">
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Recl. Seguro">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_reclsegE" runat="server">
                    <Items>
                        <dx:ListEditItem Text="SI" Value="S" />
                        <dx:ListEditItem Text="NO" Value="N" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Motivo Merma">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_motmermaE" runat="server" 
                    DataSourceID="LqDsMotivoMerma" TextField="Descr" ValueField="FldValue">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cant. Merma">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_cantmermaE" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Manifiesto">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_manifiestoE" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Comentario">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_comentE" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_ActualizarE" runat="server" Text="Actualizar" 
                    OnClick="btn_ActualizarE_Click">
                </dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton ID="btn_CancelarE" runat="server" Text="Cancelar" 
                    OnClick="btn_CancelarE_Click">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
     
            </dx:PopupControlContentControl>
</ContentCollection>
  
    </dx:ASPxPopupControl>
    
    <dx:ASPxPopupControl ID="PopUp_Seguro" runat="server" AllowDragging="True" 
        HeaderText="Datos Seguro" Width="700px" PopupAction="None" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        
        <ContentCollection>
         
<dx:PopupControlContentControl runat="server">
   
  
    <table class="style1">
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Fecha Reclamo">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cb_frecl" runat="server">
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Monto Deducible">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_montodeducible" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="N° Poliza">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_npoliza" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Monto Pago Siniestro">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_montopagosini" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cantidad del Reclamo">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_cantreclamo" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Fecha Pago Siniestro">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cb_fpagosini" runat="server">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Monto Siniestro">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxTextBox ID="txt_montosini" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td class="style2">
                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Comentarios">
                </dx:ASPxLabel>
            </td>
            <td class="style2">
                <dx:ASPxTextBox ID="txt_comentariosiniestro" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="% Deducible">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_porcdeducible" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_ActualizarSiniestro" runat="server" 
                    OnClick="btn_ActualizarSiniestro_Click" Text="Actualizar">
                </dx:ASPxButton>
            </td>
            <td>
                <dx:ASPxButton ID="btn_CancelarSiniestro" runat="server" Text="Cancelar">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
     
            </dx:PopupControlContentControl>
</ContentCollection>
  
    </dx:ASPxPopupControl>
    
    <br />
</div>


</asp:Content>
