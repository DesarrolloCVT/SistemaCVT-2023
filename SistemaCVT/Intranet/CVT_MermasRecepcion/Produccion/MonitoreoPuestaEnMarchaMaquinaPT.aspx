<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MonitoreoPuestaEnMarchaMaquinaPT.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.MonitoreoPuestaEnMarchaMaquinaPT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }

        .auto-style10 {
            width: 158px;
        }

        .auto-style11 {
            width: 168px;
        }

        .auto-style12 {
            width: 167px;
        }

        .auto-style13 {
            width: 121px;
        }

        .auto-style19 {
            width: 125px;
        }

        .auto-style20 {
            width: 139px;
        }

        .auto-style21 {
            width: 114px;
        }

        .auto-style22 {
            width: 99px;
        }

        .auto-style23 {
            width: 22px;
        }

        .auto-style24 {
            width: 148px;
        }

        .auto-style25 {
            width: 147px;
        }

        .auto-style26 {
            width: 12px;
        }

        .auto-style27 {
            width: 11px;
        }

        .auto-style28 {
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Monitoreo y Puesta en Marcha Maquinas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle" id="lblti" runat="server">Monitoreo y Puesta en Marcha Maquinas</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--     <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px;" />
                Nuevo</a>
            &nbsp; 
            &nbsp; 
            &nbsp; 
            &nbsp; --%>
            <%--     <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px;" />
                Nuevo</a>
            &nbsp; 
            &nbsp; 
            &nbsp; 
            &nbsp; --%>
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>

        </div>
    </div>
    <br />
    <br />
    <div style="margin-left: 40px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Puesta en Marcha" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <a>
                        <asp:ImageButton ID="cmdNew" runat="server"
                            ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" OnClick="cmdNew_Click" Height="32px" Width="79px" />
                    </a></td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="GvEncabezado" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPuestaEnMarcha" KeyFieldName="Id_MonPuestaMarcha_Maq" OnCommandButtonInitialize="GvEncabezado_CommandButtonInitialize" OnRowDeleting="GvEncabezado_RowDeleting" OnRowUpdating="GvEncabezado_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" Width="700px">
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_MonPuestaMarcha_Maq" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" VisibleIndex="10" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Operador" FieldName="Operador1" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsPersonal" ValueField="Id_Personal">
                        <Columns>
                            <dx:ListBoxColumn Caption="NOMBRE" FieldName="Nombre">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="APELLIDO" FieldName="apellido">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Operador 2" FieldName="Operador2" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsPersonal" ValueField="Id_Personal">
                        <Columns>
                            <dx:ListBoxColumn Caption="NOMBRE" FieldName="Nombre">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="APELLIDO" FieldName="apellido">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LineaOperativa" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsSalaEnvasado" TextField="Cant_Linea" ValueField="Cant_Linea">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TTO1" VisibleIndex="5" Caption="TTO1 CINTA">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="BUENO" Value="BUENO" />
                            <dx:ListEditItem Text="MALO" Value="MALO" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TTO2" VisibleIndex="7" Caption="TTO2 CINTA">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="BUENO" Value="BUENO" />
                            <dx:ListEditItem Text="MALO" Value="MALO" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TermoEnfardadora" VisibleIndex="9" Caption="Termo Enfardadora Cinta">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="BUENO" Value="BUENO" />
                            <dx:ListEditItem Text="MALO" Value="MALO" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="TT01 Limp.Cabezal" FieldName="TTO1LimPiezaCabezal" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="BUENO" Value="BUENO" />
                            <dx:ListEditItem Text="MALO" Value="MALO" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="TTO 2 Limp.Cabezal" FieldName="TTO2LimPiezaCabezal" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="BUENO" Value="BUENO" />
                            <dx:ListEditItem Text="MALO" Value="MALO" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Termo Enf. Limp:Cabezal" FieldName="TermoEnfardadoraLimpiezaCab" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="BUENO" Value="BUENO" />
                            <dx:ListEditItem Text="MALO" Value="MALO" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPuestaEnMarcha" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_PuestaEnMarchaMaquina" Where="ID_ControlEnvPT == @ID_ControlEnvPT">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPersonal" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Personal">
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="LqsSalaEnvasado" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_SALASENVASADO">
        </asp:LinqDataSource>

    </div>
    <br />
    <div style="margin-left: 40px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Monitoreo" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <a>
                        <asp:ImageButton ID="ImageButton2" runat="server"
                            ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" OnClick="cmdNew_Click2" Height="32px" Width="79px" />
                    </a></td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="GvMonitoreo" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPuestaEnMarchaMonitoreo" KeyFieldName="ID_PuestaEnMarchaMonitoreo" OnRowInserting="GvMonitoreo_RowInserting" OnCommandButtonInitialize="GvMonitoreo_CommandButtonInitialize" OnRowDeleting="GvMonitoreo_RowDeleting" OnRowUpdating="GvMonitoreo_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True">
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_PuestaEnMarchaMonitoreo" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Golpes_Min" VisibleIndex="5">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Turno" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Inicio" Value="Inicio" />
                            <dx:ListEditItem Text="Mitad Turno" Value="Mitad Turno" />
                            <dx:ListEditItem Text="Fin Turno" Value="Fin Turno" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Hora" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="HH:mm" />
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPuestaEnMarchaMonitoreo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_PuestaEnMarchaMonitoreo" Where="ID_ControlEnvPT == @ID_ControlEnvPT">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <table style="margin-left: 40px">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Linea" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <a>
                        <asp:ImageButton ID="ImageButton1" runat="server"
                            ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" OnClick="cmdNew_Click1" Height="32px" Width="79px" />
                    </a>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatosLinea" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPuestaEnMarchaLinea" KeyFieldName="ID_PuestaEnMarchaLinea" OnCommandButtonInitialize="GvDatosLinea_CommandButtonInitialize" OnRowDeleting="GvDatosLinea_RowDeleting" OnRowUpdating="GvDatosLinea_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm Width="700px" HorizontalAlign="WindowCenter" Modal="True">
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_PuestaEnMarchaLinea" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Film a Mano" FieldName="TieneFilmAMano" VisibleIndex="2">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CambioTeflones" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CambioNicrones" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ParadaEmergencia" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ProteccionesFuncionando" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="FijacionesdeBigote" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="FijacionesConoAlimentador1" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="FijacionesConoAlimentador2" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="FijacionCopaTubo1" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="FijacionCopaTubo2" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPuestaEnMarchaLinea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ContorlEnvasadoPT_PuestaEnMarchaLinea" Where="ID_ControlEnvPT == @ID_ControlEnvPT">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <table style="margin-left: 40px">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Envasadora-Enfardadora" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <a>
                        <asp:ImageButton ID="ImageButton3" runat="server"
                            ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" OnClick="cmdNew_Click3" Height="32px" Width="79px" />
                    </a>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatosEnvasadora" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPuestaEnMarchaEnvasadora" KeyFieldName="ID_PuestaEnMarchaEnvasadora" OnCommandButtonInitialize="GvDatosEnvasadora_CommandButtonInitialize" OnRowDeleting="GvDatosEnvasadora_RowDeleting" OnRowUpdating="GvDatosEnvasadora_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm HorizontalAlign="WindowCenter" Modal="True" Width="1000px">
                </EditForm>

                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_PuestaEnMarchaEnvasadora" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LimpiezaCorreasTraccionadoras" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LimpiezaHombrosFormadores" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LimpiezaRodillosTraccionadores" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LimpiezaMordazas" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EstadoVasosDosificadores" VisibleIndex="8" Visible="False">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LimpiezaCintaTransportadora" VisibleIndex="9" Visible="False">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EstadoGomaApoyoVertHor" VisibleIndex="10" Visible="False">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Equipo_Monitoreo" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Envasadora" Value="Envasadora" />
                            <dx:ListEditItem Text="Enfardadora" Value="Enfardadora" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EstadoConexionComponentesNeumaticos" VisibleIndex="11" Visible="False">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPuestaEnMarchaEnvasadora" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_PuestaEnMarchaEnvasadora" Where="ID_ControlEnvPT == @ID_ControlEnvPT">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popPuestaEnMarcha" runat="server" Width="500px" Theme="iOS" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div style="margin-left: 25px">
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Operador" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboOperador" runat="server" ValueType="System.String" DataSourceID="LqsPersonal0" ValueField="Id_Personal">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="NOMBRE" FieldName="Nombre">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="APELLIDO" FieldName="apellido">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Operador 2" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboOperador2" runat="server" ValueType="System.String" DataSourceID="LqsPersonal0" ValueField="Id_Personal">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="NOMBRE" FieldName="Nombre">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="APELLIDO" FieldName="apellido">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                            <ValidationSettings Display="Dynamic">
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Linea" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboLinea" runat="server" DataSourceID="LqsSalaEnvasado0" TextField="Cant_Linea" ValueField="Cant_Linea" Width="60px" NullText="Seleccione">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>

                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Cinta TTO1" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCintaTTO1" runat="server" ValueType="System.String" SelectedIndex="0" Width="90px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Bueno" Value="Bueno" />
                                                <dx:ListEditItem Text="Malo" Value="Malo" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="TTO1 Limp.Cabezal" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboTTO1limCabezal" runat="server" ValueType="System.String" SelectedIndex="0" Width="90px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Bueno" Value="Bueno" />
                                                <dx:ListEditItem Text="Malo" Value="Malo" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cinta TTO2" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCintaTTO2" runat="server" ValueType="System.String" SelectedIndex="0" Width="90px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Bueno" Value="Bueno" />
                                                <dx:ListEditItem Text="Malo" Value="Malo" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="TTO2 Limp.Cabezal" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboTTO2LimpCabezal" runat="server" ValueType="System.String" SelectedIndex="0" Width="90px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Bueno" Value="Bueno" />
                                                <dx:ListEditItem Text="Malo" Value="Malo" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Termo Enfar.Cinta" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cbotermo" runat="server" ValueType="System.String" SelectedIndex="0" Width="90px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Bueno" Value="Bueno" />
                                                <dx:ListEditItem Text="Malo" Value="Malo" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Termo Enfar. Limp.Cabezal" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cbotermoLimcabezal" runat="server" ValueType="System.String" SelectedIndex="0" Width="90px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Bueno" Value="Bueno" />
                                                <dx:ListEditItem Text="Malo" Value="Malo" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left: 150px">
                            <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Theme="iOS" OnClick="btnGuardar_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />

                    <asp:LinqDataSource ID="LqsPersonal0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Personal">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqsSalaEnvasado0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_SALASENVASADO">
                    </asp:LinqDataSource>
                    <br />

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="PopLinea" runat="server" Theme="iOS" Width="660px" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div style="margin-left: 25px">
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Film a Mano" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboFilmMano" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Cambio Teflones" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCambioTeflones" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Cambio Nicrones" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCambioNicrones" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>

                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style22">
                                        <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Parada Emergencia" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboParadaEmergencia" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td class="auto-style21">
                                        <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Protecciones Funcionando" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboProteccionesFuncionando" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style23"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Figaciones Bigote" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboFijacionesBigote" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style24">
                                        <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Fijaciones Cono Alimentador1" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboConoAlimentador1" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style26"></td>
                                    <td class="auto-style25">
                                        <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Fijaciones Cono Alimentador2" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboConoAlimentador2" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style26"></td>
                                    <td class="auto-style19">
                                        <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Fijacion Copa Tubo1" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCopaTubo1" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style26"></td>
                                    <td class="auto-style20">
                                        <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Fijacion Copa Tubo2" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCopatubo2" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left: 100px">
                            <dx:ASPxButton ID="btnGuardar2" runat="server" Text="Guardar" Theme="iOS" OnClick="btnGuardar2_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <div>
        <dx:ASPxPopupControl ID="popEnvFard" runat="server" Width="795px" Theme="iOS" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div style="margin-left: 25px">
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Equipo a Monitorear" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboEquipoMon" runat="server" ValueType="System.String" OnSelectedIndexChanged="cboEquipoMon_SelectedIndexChanged" AutoPostBack="True">
                                            <Items>
                                                <dx:ListEditItem Text="Envasadora" Value="Envasadora" />
                                                <dx:ListEditItem Text="Enfardadora" Value="Enfardadora" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>

                                    <td class="auto-style10">
                                        <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Limpieza Correas Traccionadoras" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCorrTrac" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style27"></td>
                                    <td class="auto-style11">
                                        <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Limpieza Hombros Formadores" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboHomTraccion" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style28"></td>
                                    <td class="auto-style12">
                                        <dx:ASPxLabel ID="ASPxLabel27" runat="server" Text="Limpieza rodillos Traccionadores" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cborrodillosTracc" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style28"></td>
                                    <td class="auto-style13">
                                        <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="Limpieza Mordazas" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboMordazas" runat="server" ValueType="System.String" SelectedIndex="0" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left: 100px">
                            <dx:ASPxButton ID="btnGuardar3" runat="server" Text="Guardar" Theme="iOS" OnClick="btnGuardar3_Click"></dx:ASPxButton>
                        </div>
                        <br />
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <br />
        <div>
        <table style="margin-left: 40px">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel29" runat="server" Text="Cinta Impresión" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <a>
                        <asp:ImageButton ID="btnCintaImp" runat="server"
                            ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png"  Height="32px" Width="79px" OnClick="btnCintaImp_Click" />
                    </a>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="GvCintaImp" runat="server" AutoGenerateColumns="False" DataSourceID="LqsCintaImpr" KeyFieldName="ID_UsoCintaImp" Width="306px" OnRowDeleting="GvCintaImp_RowDeleting" OnRowUpdating="GvCintaImp_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" Visible="False" VisibleIndex="1">
                    <PropertiesTextEdit Width="100px">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_UsoCintaImp" ReadOnly="True" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3" MaxWidth="100" MinWidth="100" Width="100px">
                    <PropertiesTextEdit Width="100px">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="4" MaxWidth="200" MinWidth="200" Width="200px">
                    <PropertiesTextEdit Width="200px">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Usuario" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro" Visible="False" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsCintaImpr" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_UsoCintaImpresion" Where="ID_ControlEnvPT == @ID_ControlEnvPT" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
     <div>
        <dx:ASPxPopupControl ID="PopCintaImpre" runat="server" Width="500px" Theme="iOS" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div style="margin-left: 25px">
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel30" runat="server" Text="Cantidad" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCantCintaImp" runat="server" Width="170px" Height="30px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="z1">
                                                <RegularExpression ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="Lote" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtLoteCintImp" runat="server" Width="170px" Height="30px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="z1">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>                               
                                </tr>
                            </table>
                        </div>                
                        <br />
                        <div style="margin-left: 150px">
                            <dx:ASPxButton ID="btnGuardarCintImp" runat="server" Text="Guardar" Theme="iOS" Height="48px" OnClick="btnGuardarCintImp_Click" ValidationGroup="z1"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>

</asp:Content>
