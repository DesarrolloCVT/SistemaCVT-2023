<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RutaCamiones.aspx.cs" Inherits="CVT_MermasRecepcion.Transporte.RutaCamiones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
             <li><a>Transporte</a></li>
            <li><span id="current">Ruta Camiones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Ruta Camiones</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"
                    style="width: 20px" />
                Exportar Excel</a>&nbsp;
              <a>
             <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" onclick="cmdNew_Click" style="height: 16px;" />
                  Nuevo</a>
        </div>
        <br />
        <br />
        <br />
   
     <div>
         <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRutaCamiones" KeyFieldName="Id_RutaCamion">
             <SettingsEditing Mode="PopupEditForm">
             </SettingsEditing>
             <Columns>
                 <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                 </dx:GridViewCommandColumn>
                 <dx:GridViewDataTextColumn FieldName="Id_RutaCamion" ReadOnly="True" Visible="False" VisibleIndex="1">
                     <EditFormSettings Visible="False" />
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Nombre Chofer" FieldName="Nombre_Chofer" VisibleIndex="3">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Destino" FieldName="Destino" VisibleIndex="5">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="Cant Peonetas" FieldName="Cant_Peonetas" VisibleIndex="6">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataDateColumn FieldName="Fecha_Ruta" VisibleIndex="10" Caption="Fecha Ruta">
                 </dx:GridViewDataDateColumn>
                 <dx:GridViewDataComboBoxColumn Caption="Patente" FieldName="Patente" VisibleIndex="2">
                     <PropertiesComboBox DataSourceID="LqsPatente" TextField="Patente" ValueField="Patente">
                     </PropertiesComboBox>
                 </dx:GridViewDataComboBoxColumn>
                 <dx:GridViewDataComboBoxColumn Caption="Tipo Vuelta" FieldName="Tipo_vuelta" VisibleIndex="4">
                     <PropertiesComboBox>
                         <Items>
                             <dx:ListEditItem Text="Normal" Value="1" />
                             <dx:ListEditItem Text="Segunda Vuelta" Value="2" />
                         </Items>
                     </PropertiesComboBox>
                 </dx:GridViewDataComboBoxColumn>
                 <dx:GridViewDataCheckColumn Caption="Carro" FieldName="LLeva_Carro" VisibleIndex="7">
                 </dx:GridViewDataCheckColumn>
                 <dx:GridViewDataComboBoxColumn FieldName="Patente_Carro" VisibleIndex="8" Caption="Patente Carro">
                     <PropertiesComboBox DataSourceID="LqsPatente" TextField="Patente" ValueField="Patente">
                     </PropertiesComboBox>
                 </dx:GridViewDataComboBoxColumn>
                 <dx:GridViewDataCheckColumn FieldName="Traspaleta" VisibleIndex="9">
                 </dx:GridViewDataCheckColumn>
             </Columns>
         </dx:ASPxGridView>
         <asp:LinqDataSource ID="LqsRutaCamiones" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_RutaCamion">
         </asp:LinqDataSource>
         <asp:LinqDataSource ID="LqsPatente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DescripcionDeCamiones">
         </asp:LinqDataSource>
     </div>
</asp:Content>
