<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SalidaInsumos.aspx.cs" Inherits="CVT_MermasRecepcion.Insumos.SalidaInsumos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Insumos</a></li>
        <li><span id="current">Consumo de Insumos</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Consumo de Insumos</span>
    <span class="tab-end"></span>
</div>
<div>
    <table>
        <tr>
        <td>
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Responsable/Solicitante:"></dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxComboBox ID="cbo_responsable" runat="server" DataSourceID="LqDsResponsable" ValueField="pin">
                <Columns>
                    <dx:ListBoxColumn FieldName="name" Name="Nombre">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn FieldName="last_name" Name="Apellido">
                    </dx:ListBoxColumn>
                </Columns>
            </dx:ASPxComboBox>
            <asp:LinqDataSource ID="LqDsResponsable" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (pin, name, last_name)" TableName="pers_person"></asp:LinqDataSource>
        </td>
       <td>
           <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Bodega"></dx:ASPxLabel>
       </td>
            <td>
                <dx:ASPxComboBox ID="cbo_bodega" runat="server" ValueType="System.String">
                    <Items>
                        <dx:ListEditItem Text="Bodega Insumos" Value="CV400" />
                        <dx:ListEditItem Text="Bodega Agricola" Value="CVAGRI" />
                        <dx:ListEditItem Text="Bodega Aseo" Value="CVASEO" />
                        <dx:ListEditItem Text="Bodega Mantencion" Value="CVMANT" />
                        <dx:ListEditItem Text="Bodega Informatica" Value="CVINF" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_crear" runat="server" Text="CREAR" OnClick="btn_crear_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
    <div>
        <dx:ASPxGridView ID="GvConsumoEncabezado" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsEncabezado" KeyFieldName="SalidaInsumos_ID">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="SalidaInsumos_ID" ReadOnly="True" VisibleIndex="0" Caption="Folio">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Responsable" VisibleIndex="4">
                    
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsEncabezado" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_SalidaInsumos" Where="SalidaInsumos_ID == @SalidaInsumos_ID">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="SalidaInsumos_ID" SessionField="SalidaInsumosID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
<div>
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Familia:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_familia" runat="server" AutoPostBack="True" DataSourceID="LqDsFamilia" TextField="ItmsGrpNam" ValueField="ItmsGrpCod"></dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsFamilia" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItmsGrpCod, ItmsGrpNam)" TableName="OITB" Where="ItmsGrpCod == @ItmsGrpCod OR ItmsGrpCod == @ItmsGrpCod1
                    OR ItmsGrpCod == @ItmsGrpCod2
                    OR ItmsGrpCod == @ItmsGrpCod3
                    OR ItmsGrpCod == @ItmsGrpCod4
                    OR ItmsGrpCod == @ItmsGrpCod5
                    OR ItmsGrpCod == @ItmsGrpCod6
                    OR ItmsGrpCod == @ItmsGrpCod7
                    OR ItmsGrpCod == @ItmsGrpCod8
                    OR ItmsGrpCod == @ItmsGrpCod9">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="109" Name="ItmsGrpCod" Type="Int16" />
                        <asp:Parameter DefaultValue="110" Name="ItmsGrpCod1" Type="Int16" />
                        <asp:Parameter DefaultValue="112" Name="ItmsGrpCod2" Type="Int16" />
                        <asp:Parameter DefaultValue="113" Name="ItmsGrpCod3" Type="Int16" />
                        <asp:Parameter DefaultValue="114" Name="ItmsGrpCod4" Type="Int16" />
                        <asp:Parameter DefaultValue="116" Name="ItmsGrpCod5" Type="Int16" />
                        <asp:Parameter DefaultValue="117" Name="ItmsGrpCod6" Type="Int16" />
                        <asp:Parameter DefaultValue="142" Name="ItmsGrpCod7" Type="Int16" />
                        <asp:Parameter DefaultValue="143" Name="ItmsGrpCod8" Type="Int16" />
                        <asp:Parameter DefaultValue="154" Name="ItmsGrpCod9" Type="Int16" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Articulo:"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_articulo" runat="server" DataSourceID="LqDsProducto" TextField="ItemName" ValueField="ItemCode"></dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="OITM" Where="ItmsGrpCod == @ItmsGrpCod &amp;&amp; validFor == @validFor &amp;&amp; InvntItem == @InvntItem">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="cbo_familia" DefaultValue="0" Name="ItmsGrpCod" PropertyName="Value" Type="Int16" />
                        <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
                        <asp:Parameter DefaultValue="Y" Name="InvntItem" Type="Char" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
            
             <td>
     <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Lugar Uso:"></dx:ASPxLabel>
 </td>
 <td>
     <dx:ASPxComboBox ID="cbo_ccosto" runat="server" AutoPostBack="True" DataSourceID="LqDsCCosto" TextField="PrcName" ValueField="PrcCode"></dx:ASPxComboBox>
     <asp:LinqDataSource ID="LqDsCCosto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (PrcCode, PrcName, U_Cod_CCPadre)" TableName="OPRC" Where="DimCode == @DimCode &amp;&amp; Active == @Active">
         <WhereParameters>
             <asp:Parameter DefaultValue="3" Name="DimCode" Type="Int16" />
             <asp:Parameter DefaultValue="Y" Name="Active" Type="Char" />
         </WhereParameters>
     </asp:LinqDataSource>
 </td>
 <td>
     <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Especifico:"></dx:ASPxLabel>
 </td>
 <td>
     <dx:ASPxComboBox ID="cbo_item" runat="server" DataSourceID="LqDsItem" TextField="PrcName" ValueField="PrcCode"></dx:ASPxComboBox>
     <asp:LinqDataSource ID="LqDsItem" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (PrcCode, PrcName, U_Cod_CCPadre)" TableName="OPRC" Where="Active == @Active &amp;&amp; DimCode == @DimCode &amp;&amp; U_Cod_CCPadre == @U_Cod_CCPadre">
         <WhereParameters>
             <asp:Parameter DefaultValue="Y" Name="Active" Type="Char" />
             <asp:Parameter DefaultValue="4" Name="DimCode" Type="Int16" />
             <asp:ControlParameter ControlID="cbo_ccosto" DefaultValue="a" Name="U_Cod_CCPadre" PropertyName="Value" Type="String" />
         </WhereParameters>
     </asp:LinqDataSource>
 </td><td>
    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Cantidad:"></dx:ASPxLabel>
</td>
            <td>
                <dx:ASPxTextBox ID="txt_cantidad" runat="server" Width="170px"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_agregar" runat="server" Text="AGREGAR" OnClick="btn_agregar_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
</div>
<div>
    <dx:ASPxGridView ID="GvConsumoInsumo" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsDetalle" KeyFieldName="SalidaInsumosDetalle_ID">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="SalidaInsumos_ID" VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SalidaInsumosDetalle_ID" ReadOnly="True" VisibleIndex="2" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Division" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="UAdm" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CCosto" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Item" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_SalidaInsumosDetalle" EnableDelete="True" Where="SalidaInsumos_ID == @SalidaInsumos_ID">
        <WhereParameters>
            <asp:SessionParameter DefaultValue="0" Name="SalidaInsumos_ID" SessionField="SalidaInsumosID" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</div>
<div>
    <dx:ASPxButton ID="btn_Sincronizar" runat="server" Text="SINCRONIZAR CON SAP" OnClick="btn_Sincronizar_Click"></dx:ASPxButton>
</div>
</asp:Content>
