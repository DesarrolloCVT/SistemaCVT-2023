<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PlanMantencionDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Mantencion.PlanMantencionDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 141px;
        }
        .auto-style2 {
            width: 107px;
        }
        .auto-style3 {
            width: 105px;
        }
        .auto-style4 {
            float: left;
            width: 274px;
        }
        .auto-style5 {
            width: 930px;
            height: 131px;
        }
        .auto-style6 {
            margin-left: 38px;
        }
        .auto-style7 {
            width: 82px;
        }
        .auto-style8 {
            width: 88px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a href="PlanMantencion.aspx">Mantencion</a></li>
            <li><span id="current">Plan Mantencion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Plan Mantencion Detalle</span>
        <span class="tab-end"></span>


        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdNuevo" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png"
                    OnClick="cmdNuevo_Click" />
            </a>
        </div>--%>
    </div>
           
    <br />
    <br />
    <div style="min-width:1050px">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Maquina"></asp:Label>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_Maquina" runat="server" ValueType="System.String" DataSourceID="LqsMaquina" TextField="Descricion" ValueField="ID" AutoPostBack="True">
                        <ValidationSettings ErrorText="">
                            <RequiredField IsRequired="True" ErrorText="" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsMaquina" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente" Where="Padre_ID == @Padre_ID">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="0" Name="Padre_ID" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td class="auto-style7">
                    <%--<a>--%>
                        <asp:ImageButton ID="cmdAgregarMaquina" runat="server"
                            ImageUrl="~/Images/add.png" OnClick="cmdAgregarMaquina_Click1" Style="width: 16px" AlternateText="Agregar"/>
                       <%-- Agregar</a>--%>
                    <asp:Label ID="Label1" runat="server" Text="Agregar"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Partes"></asp:Label>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_Partes" runat="server" ValueType="System.String" DataSourceID="LqsPartes" TextField="Descricion" ValueField="ID" AutoPostBack="True"></dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsPartes" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente" Where="Padre_ID == @Padre_ID">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_Maquina" DefaultValue="0" Name="Padre_ID" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td class="auto-style8">
             <%--    <a>--%>
                        <asp:ImageButton ID="cmdAgregarPartes" runat="server"
                            ImageUrl="~/Images/add.png" Style="width: 16px;" OnClick="cmdAgregarPartes_Click"/>
                 <%-- Agregar</a>--%><asp:Label ID="Label2" runat="server" Text="Agregar"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    Desglose</td>
                <td>
                    <dx:ASPxComboBox ID="cbo_Pieza" runat="server" ValueType="System.String" DataSourceID="LqsPieza" TextField="Descricion" ValueField="ID"></dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsPieza" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente" Where="Padre_ID == @Padre_ID">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_Partes" DefaultValue="0" Name="Padre_ID" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                   <%-- <a>--%>
                        <asp:ImageButton ID="cmdAgregarPieza" runat="server"
                            ImageUrl="~/Images/add.png" Style="width: 16px; height: 16px;" OnClick="cmdAgregarPieza_Click" />
                        <%--Agregar</a>--%><asp:Label ID="Label3" runat="server" Text="Agregar"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div style="float:left;margin-left:5px" >

        <dx:ASPxGridView ID="GvDatoMaquina" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatoMaquina" KeyFieldName="id_Maquina_PlanMantencion" Width="300px" OnRowUpdating="GvDatoMaquina_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id_Maquina_PlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodMaquina" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Codigo">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Descripcion" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsMaquina" TextField="Descricion" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatoMaquina" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Maquina" Where="Id_PlanMantencion == @Id_PlanMantencion" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter Name="Id_PlanMantencion" SessionField="Id_PlanMantencion" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div style="float:left;margin-left:5px">

        <dx:ASPxGridView ID="GvDatoParte" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatoParte" KeyFieldName="id_PartePlanMantencion" CssClass="auto-style6" Width="270px" OnRowUpdating="GvDatoParte_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id_PartePlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodParte" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Codigo">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" TextField="Descricion" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente" Where="Padre_ID != @Padre_ID">
            <WhereParameters>
                <asp:Parameter DefaultValue="0" Name="Padre_ID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsDatoParte" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Parte" Where="Id_PlanMantencion == @Id_PlanMantencion" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter Name="Id_PlanMantencion" SessionField="Id_PlanMantencion" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

    </div>
    <div style="float:left;margin-left:55px;display:inline-block" >
        <dx:ASPxGridView ID="GvDatoPieza" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatoPieza" KeyFieldName="id_Pieza_PlanMantencion" Width="281px" OnRowUpdating="GvDatoPieza_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id_Pieza_PlanMantencion" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodPieza" VisibleIndex="2" Caption="Codigo">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Descripcion" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" TextField="Descricion" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatoPieza" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Pieza" Where="Id_PlanMantencion == @Id_PlanMantencion" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_PlanMantencion" SessionField="Id_PlanMantencion" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</div>
    <br />
    <br />
  <table>
      <tr>
          <td class="auto-style5">
              <br />
          </td>
      </tr>
  </table>
<div style="min-width:1050px">
  <div>  
      <table>
             <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="Herramienta"></asp:Label>
                </td>
                <td>
                    <dx:aspxtextbox id="txt_herramienta" runat="server" width="170px"></dx:aspxtextbox>
                </td>
                <td class="auto-style1">
                   <%-- <a>--%>
                        <asp:ImageButton ID="cmdAgregarHerramienta" runat="server"
                            ImageUrl="~/Images/add.png" Style="width: 16px;" OnClick="cmdAgregarHerramienta_Click" />
                      <%--  Agregar</a>--%><asp:Label ID="Label4" runat="server" Text="Agregar"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="Repuestos"></asp:Label>
                </td>
                <td>
                    <dx:aspxtextbox id="txtRepuesto" runat="server" width="170px"></dx:aspxtextbox>
                </td>
                <td class="auto-style2">
                    <%--<a>--%>
                        <asp:ImageButton ID="cmdAgregarRepuesto" runat="server"
                            ImageUrl="~/Images/add.png" Style="width: 16px;" OnClick="cmdAgregarRepuesto_Click" />
                       <%-- Agregar</a>--%><asp:Label ID="Label5" runat="server" Text="Agregar"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <asp:Label ID="Label13" runat="server" Text="RRHH"></asp:Label>
                </td>
                <td>
                    <dx:aspxcombobox id="cboRRHH" runat="server" datasourceid="LqsRRHH" valuefield="pin">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="pin" Name="Rut">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn FieldName="name" Name="Nombre">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn FieldName="last_name" Name="Apellido">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                </dx:aspxcombobox>
                    <asp:LinqDataSource ID="LqsRRHH" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
                    </asp:LinqDataSource>
                </td>
                <td class="auto-style3">
                   <%-- <a>--%>
                        <asp:ImageButton ID="cmdAgregarRRHH" runat="server"
                            ImageUrl="~/Images/add.png" OnClick="cmdAgregarRRHH_Click" />
                      <%--  Agregar</a>--%><asp:Label ID="Label6" runat="server" Text="Agregar"></asp:Label>
                </td>

            </tr>
      </table>
  </div>


 <div style="float:left;margin-left:10px;margin-right:40px">
        <dx:aspxgridview id="GvDatosHerramienta" runat="server" autogeneratecolumns="False" datasourceid="LqsDatoHerramienta" keyfieldname="id_HerramientaPlanMantencion" Width="316px">
                                    <SettingsEditing Mode="PopupEditForm">
                                    </SettingsEditing>
                                    <SettingsBehavior ConfirmDelete="True" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="id_HerramientaPlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:aspxgridview>
                    <asp:LinqDataSource ID="LqsDatoHerramienta" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Herramienta" Where="Id_PlanMantencion == @Id_PlanMantencion" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                        <WhereParameters>
                            <asp:SessionParameter Name="Id_PlanMantencion" SessionField="Id_PlanMantencion" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
 </div>
<div style="float:left;margin-left:10px">
     <dx:aspxgridview id="GvDatosRepuestos" runat="server" autogeneratecolumns="False" datasourceid="LqsDatoRepuesto" keyfieldname="Id_RepuestoPlanMantencion" Width="301px">
                                    <SettingsEditing Mode="PopupEditForm">
                                    </SettingsEditing>
                                    <SettingsBehavior ConfirmDelete="True" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id_RepuestoPlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:aspxgridview>
                    <asp:LinqDataSource ID="LqsDatoRepuesto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Repuesto" Where="Id_PlanMantencion == @Id_PlanMantencion" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                        <WhereParameters>
                            <asp:SessionParameter Name="Id_PlanMantencion" SessionField="Id_PlanMantencion" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
</div>
    <div style="margin-left:40px" class="auto-style4">
              <dx:aspxgridview id="GvDatosRRHH" runat="server" autogeneratecolumns="False" datasourceid="LqsDatoRRHH" keyfieldname="id_RHHPlanMantencion" width="345px">
                                    <SettingsEditing Mode="PopupEditForm">
                                    </SettingsEditing>
                                    <SettingsBehavior ConfirmDelete="True" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="id_RHHPlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Run" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Apellido" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:aspxgridview>
                    <asp:LinqDataSource ID="LqsDatoRRHH" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_RRHH" Where="Id_PlanMantencion == @Id_PlanMantencion" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                        <WhereParameters>
                            <asp:SessionParameter Name="Id_PlanMantencion" SessionField="Id_PlanMantencion" Type="Int32" />
                        </WhereParameters>
                          </asp:LinqDataSource>
    </div>
    </div>
</asp:Content>
