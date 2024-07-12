<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PlanMantencion.aspx.cs" Inherits="CVT_MermasRecepcion.Mantencion.PlanMantencion" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">

    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mantencion</a></li>
            <li><span id="current">Plan Mantencion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Plan Mantencion</span>
        <span class="tab-end"></span>


        <div id="options">
            <a>
                <asp:ImageButton ID="cmdNuevo" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png"
                    OnClick="cmdNuevo_Click" />
            </a>
        </div>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvEncabezado" runat="server" AutoGenerateColumns="False" DataSourceID="LqsEncabezado" KeyFieldName="Id_PlanMantencion" OnRowInserting="GvEncabezado_RowInserting" OnRowCommand="GvEncabezado_RowCommand" OnHtmlRowCreated="GvEncabezado_HtmlRowCreated" OnCommandButtonInitialize="GvEncabezado_CommandButtonInitialize" OnRowDeleting="GvEncabezado_RowDeleting" OnRowUpdating="GvEncabezado_RowUpdating">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Id_PlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Inicio" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Termino" ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Limite" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Cant_Horas" ShowInCustomizationForm="True" VisibleIndex="6">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Registro" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Alarma" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" ShowInCustomizationForm="True" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" ShowInCustomizationForm="True" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Creado" Value="Creado" />
                            <dx:ListEditItem Text="Terminado" Value="Terminado" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Responsable" ShowInCustomizationForm="True" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqsRespon" ValueField="pin">
                        <Columns>
<dx:ListBoxColumn FieldName="pin" Caption="Run"></dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="name" Name="Nombre" Caption="Nombre">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="last_name" Name="Apellido" Caption="Apellido">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalles" VisibleIndex="13">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tipo Mantencion" FieldName="Asunto" VisibleIndex="2">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Correctiva" Value="Correctiva" />
                            <dx:ListEditItem Text="Semanal" Value="Semanal" />
                            <dx:ListEditItem Text="Mensual" Value="Mensual" />
                            <dx:ListEditItem Text="Anual" Value="Anual" />
                            <dx:ListEditItem Text="Preventiva" Value="Preventiva" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Cerrar" VisibleIndex="17">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsEncabezado" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Encabezado" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="Fecha_Inicio desc, Estado">
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" Select="new (name, last_name, pin)" TableName="pers_person" EntityTypeName="" ID="LqsRespon"></asp:LinqDataSource>

    </div>

    <div>
    </div>
</asp:Content>
