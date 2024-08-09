<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RevisionCamionFactura.aspx.cs" Inherits="CVT_MermasRecepcion.Transporte.RevisionCamionFactura" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
             <li><a href="../Transporte/RevisionCamiones.aspx">Control Cierre</a></li><li><span id="current">Facturas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Facturas</span>
        <span class="tab-end"></span>
        <div id="options">
              <a>
               <a style="margin-left:150px">
                  <asp:ImageButton ID="cmdVolver" runat="server"
                      ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click"/>
                  volver</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" style="width: 16px" />
                  Nuevo</a>

        </div>
        
      </div>
    <br />
      
    &nbsp;<br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsFolio" KeyFieldName="Id_RevisionCamionFactura" Width="692px" OnRowInserting="GvDatos_RowInserting1">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" Width="100px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_RevisionCamionFactura" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_RevisionCamion" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Patente" FieldName="Patente_Sistema" VisibleIndex="4" Width="100px">
                    <PropertiesTextEdit Width="100px">
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Destino" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cliente" VisibleIndex="6">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <div>
        <asp:LinqDataSource ID="LqsFolio" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_RegistroRevisionCamionFactura" Where="Id_RevisionCamion == @Id_RevisionCamion">
            <WhereParameters>
                <asp:SessionParameter Name="Id_RevisionCamion" SessionField="Id_RevisionCamion" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
