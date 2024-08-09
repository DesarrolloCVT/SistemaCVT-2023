<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistroAmonestacion.aspx.cs" Inherits="CVT_MermasRecepcion.PRiesgo.RegistroAmonestacion" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Prevencion de Riesgos</a></li>
        <li><span id="current">Registro de Incidencia</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Registro de Incidencia</span>
    <span class="tab-end"></span>

 <div id="options"> 
    <a>             <asp:ImageButton ID="cmdNuevo"    runat="server" 
         ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" 
         onclick="cmdNuevo_Click"  /> </a>
 </div>
 </div>
 <div>
 
     <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
         DataSourceID="LqDsRegistroAmonestacion" KeyFieldName="Id_Amonestacion" 
         onrowinserting="GvDatos_RowInserting" onrowcommand="GvDatos_RowCommand" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
         <SettingsEditing Mode="PopupEditForm">
         </SettingsEditing>
         <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
         <SettingsPopup>
             <EditForm MinWidth="850px" Width="850px">
             </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
         </SettingsPopup>
         <Columns>
             <dx:GridViewDataTextColumn FieldName="Id_Amonestacion" 
                 ReadOnly="True" VisibleIndex="0" Caption="Folio">
                 <EditFormSettings Visible="False" />
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn FieldName="Fecha_Amonestacion" VisibleIndex="1">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn FieldName="Incumplimiento" VisibleIndex="6">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="AccionCorrectiva" VisibleIndex="7">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataDateColumn FieldName="PlazoEvaluacion" VisibleIndex="9">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="10">
             </dx:GridViewDataDateColumn>
             <dx:GridViewDataTextColumn FieldName="Verificacion" VisibleIndex="11">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Seguimiento" VisibleIndex="12">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataComboBoxColumn FieldName="Tipo_Incidencia" VisibleIndex="2">
                 <PropertiesComboBox ValueField="Tipo_Incidencia">
                     <Items>
                         <dx:ListEditItem Text="Individual" Value="1"/>
                         <dx:ListEditItem Text="Grupal" Value="2"/>
                     </Items>
                 </PropertiesComboBox>
             </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataHyperLinkColumn Caption="Informe" VisibleIndex="52">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Anula" CommandName="cmdInforme" runat="server" ImageUrl="~/Images/pdf.png" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
             <dx:GridViewDataHyperLinkColumn Caption="Personas" VisibleIndex="53">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Anula" CommandName="cmdPersonas" runat="server" ImageUrl="~/Images/clientes.png" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
             <dx:GridViewDataComboBoxColumn Caption="Persona" FieldName="Id_Personal" VisibleIndex="3">
                 <PropertiesComboBox DataSourceID="LqDsPersonal" ValueField="pin">
                     <Columns>
                         <dx:ListBoxColumn FieldName="name" Name="Nombre">
                         </dx:ListBoxColumn>
                         <dx:ListBoxColumn FieldName="last_name" Name="Apellido">
                         </dx:ListBoxColumn>
                     </Columns>
                 </PropertiesComboBox>
             </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="Id_Area" VisibleIndex="4">
                 <PropertiesComboBox DataSourceID="LqDsAreaTrabajo" TextField="Nombre" ValueField="Id_Area">
                 </PropertiesComboBox>
             </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataComboBoxColumn Caption="Empresa" FieldName="DEPTID" VisibleIndex="5">
                 <PropertiesComboBox DataSourceID="LqDsEmpresa" TextField="name" ValueField="code">
                 </PropertiesComboBox>
             </dx:GridViewDataComboBoxColumn>
             <dx:GridViewDataComboBoxColumn Caption="Amonestador" FieldName="Id_Amonestador" VisibleIndex="8">
                 <PropertiesComboBox DataSourceID="LqDsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                 </PropertiesComboBox>
             </dx:GridViewDataComboBoxColumn>
         </Columns>
         <Styles>
             <FocusedRow BackColor="#FF9933">
             </FocusedRow>
         </Styles>
     </dx:ASPxGridView>
     <asp:LinqDataSource ID="LqDsRegistroAmonestacion" runat="server" 
         ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
         TableName="CVT_RegistroAmonestacion" EnableDelete="True" 
         EnableInsert="True" EnableUpdate="True" OrderBy="Id_Amonestacion desc">
     </asp:LinqDataSource>
 
     <asp:LinqDataSource ID="LqDsPersonal" runat="server" 
         ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" 
         TableName="pers_person" Select="new (name, last_name, pin)">
     </asp:LinqDataSource>
     <asp:LinqDataSource ID="LqDsEmpresa" runat="server" 
         ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" 
         EntityTypeName="" TableName="auth_department" Select="new (code, name)">
     </asp:LinqDataSource>
     <asp:LinqDataSource ID="LqDsAreaTrabajo" runat="server" 
         ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
         TableName="CVT_AreaTrabajo">
     </asp:LinqDataSource>
     <asp:LinqDataSource ID="LqDsUsuario" runat="server" 
         ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
         TableName="CVT_Usuarios">
     </asp:LinqDataSource>
 
 </div>
</asp:Content>
