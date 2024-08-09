<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistroIncidenciasGrupales.aspx.cs" Inherits="CVT_MermasRecepcion.PRiesgo.Registroincidenciasgrupales" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Prevencion de Riesgos</a></li>
        <li><span id="current">Registro de Incidencias grupales</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Registro de Incidencia grupal</span>
    <span class="tab-end"></span>

 <div id="options"> 
 </div>
 </div>
 <div>
 
     <dx:aspxgridview ID="GvDatos" runat="server" AutoGenerateColumns="False" 
         DataSourceID="LqDsRegistroAmonestacionGrupal" KeyFieldName="Id_Amonestacion;Id_Personal" 
         onrowinserting="GvDatos_RowInserting" >
         <SettingsEditing Mode="PopupEditForm">
         </SettingsEditing>
         <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
         <SettingsPopup>
             <EditForm MinWidth="850px" Width="850px">
             </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
         </SettingsPopup>
         <Toolbars>
         <dx:GridViewToolbar >
                                <Items>
                                    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
                                                 <Image Url="../Images/pn-add-source-copy.gif"></Image>
                                    </dx:GridViewToolbarItem>
                                    </Items>
             </dx:GridViewToolbar>
             </Toolbars>
         <Columns>
             <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
             </dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn FieldName="Id_Amonestacion" VisibleIndex="1" Visible="False">
                 <EditFormSettings Visible="False" />
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataComboBoxColumn Caption="Persona" FieldName="Id_Personal" VisibleIndex="2">
                 <PropertiesComboBox DataSourceID="LqDsPersonal" ValueField="pin">
                     <Columns>
                         <dx:ListBoxColumn FieldName="name" Name="Nombre">
                         </dx:ListBoxColumn>
                         <dx:ListBoxColumn FieldName="last_name" Name="Apellido">
                         </dx:ListBoxColumn>
                     </Columns>
                 </PropertiesComboBox>
             </dx:GridViewDataComboBoxColumn>
         </Columns>
         <Styles>
             <FocusedRow BackColor="#FF9933">
             </FocusedRow>
         </Styles>
     </dx:aspxgridview>
     <asp:LinqDataSource ID="LqDsRegistroAmonestacionGrupal" runat="server" 
         ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
         TableName="CVT_RegistroAmonestacion_Persona" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="Id_Amonestacion == @Id_Amonestacion">
         <WhereParameters>
             <asp:SessionParameter Name="Id_Amonestacion" SessionField="AmonestacionId" Type="Int32" />
         </WhereParameters>
     </asp:LinqDataSource>
 
     <asp:LinqDataSource ID="LqDsPersonal" runat="server" 
         ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" 
         TableName="pers_person" Select="new (name, last_name, pin)">
     </asp:LinqDataSource>
 
 </div>
</asp:Content>
