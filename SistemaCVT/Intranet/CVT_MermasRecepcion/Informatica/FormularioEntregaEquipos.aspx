<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="FormularioEntregaEquipos.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.FormularioEntregaEquipos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 25px;
        }

        .auto-style6 {
            width: 27px;
        }

        .auto-style7 {
            width: 10px;
        }

        .auto-style9 {
            width: 30px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Entrega equipos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Entrega equipos</span>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxComboBox ID="cboUsuario" runat="server" DataSourceID="LqsPersonalAsignado" ValueField="pin" Width="283px" Height="30px" NullText="Seleccionar" AutoPostBack="True" OnSelectedIndexChanged="cboUsuario_SelectedIndexChanged">
                        <Columns>
                            <dx:ListBoxColumn Caption="Run" FieldName="pin">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>

            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Tipo Equipo" Font-Bold="true"></asp:Label>
                </td>
                <td>

                    <dx:ASPxComboBox ID="cboTipoEquipo" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="cboTipoEquipo_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="MOVIL" Value="1" />
                            <dx:ListEditItem Text="RADIOFRECUENCIA" Value="2" />
                            <dx:ListEditItem Text="COMPUTADORES" Value="3" />
                            <dx:ListEditItem Text="IMPRESORAS" Value="4" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Equipo" Font-Bold="true"></asp:Label>
                </td>
                <td>

                    <dx:ASPxComboBox ID="cboEquipo" runat="server" ValueField="ID" DataSourceID="LqsEquipo" Height="30px" Width="250px">
                        <Columns>
                            <dx:ListBoxColumn Caption="COD.AF" FieldName="Cod_AF">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="MODELO" FieldName="Modelo">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="MARCA" FieldName="MARCA">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="EQUIPO" FieldName="Equipo">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>

            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="labelNlinea" runat="server" Text="N° Linea" Font-Bold="true"></asp:Label>
                    <dx:ASPxComboBox ID="cboNLinea" runat="server" DataSourceID="LqsNlinea" Height="30px" TextField="NLinea" ValueField="NLinea" NullText="0"></dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsNlinea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_LineasMoviles" Where="TipoEquipo == @TipoEquipo &amp;&amp; Asignado == @Asignado">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cboTipoEquipo" DefaultValue="0" Name="TipoEquipo" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="cboUsuario" DefaultValue="0" Name="Asignado" PropertyName="Value" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="ACCESORIOS" Font-Size="X-Large" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <asp:CheckBox ID="chkCaja" runat="server" Text="Caja Original" TextAlign="Left" />
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:CheckBox ID="chkSim" runat="server" Text="SIM(Chip)" TextAlign="Left" />
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:CheckBox ID="chkCargador" runat="server" Text="Cargador" TextAlign="Left" />
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:CheckBox ID="chkMicroSD" runat="server" Text="Micro SD" TextAlign="Left" />
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:CheckBox ID="chkCableDatos" runat="server" Text="Cable Datos USB" TextAlign="Left" />
                </td>
            </tr>
        </table>
    </div>

    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <asp:CheckBox ID="chkAuriculares" runat="server" Text="Auriculares" TextAlign="Left" />
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:CheckBox ID="chkCarcasa" runat="server" Text="Carcasa" TextAlign="Left" />
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:CheckBox ID="chkLamina" runat="server" Text="Lamina de vidrio" TextAlign="Left" />
                </td>
                <td class="auto-style6"></td>

            </tr>
        </table>
    </div>
        <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtOtros" runat="server" Width="319px" Height="30px" NullText="Otros" Theme="iOS"></dx:ASPxTextBox>
                </td>
                <td class="auto-style7"></td>
               
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    Fecha entrega a Usuario<dx:ASPxDateEdit ID="dteDesde" runat="server">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style9"></td>
              <%--  <td>
                    <asp:Label ID="Label4" runat="server" Text="Hasta"></asp:Label>
                    <dx:ASPxDateEdit ID="dteHasta" runat="server"></dx:ASPxDateEdit>
                </td>--%>
                 <td>
                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="36px" OnClick="btnGuardar_Click" Theme="iOS"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="Gvdatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosForm" KeyFieldName="ID_FormEntregaCelulares" OnRowCommand="Gvdatos_RowCommand" OnRowDeleting="Gvdatos_RowDeleting" OnRowUpdated="Gvdatos_RowUpdated">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsPopup>
                <CustomizationWindow HorizontalAlign="Center" VerticalAlign="WindowCenter" />
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_FormEntregaCelulares" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NLinea" ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="CajaOriginal" ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="TarjetaSIM" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="CargadorBateria" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="TarjetaMicroSD" ShowInCustomizationForm="True" VisibleIndex="10">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="Auriculares" ShowInCustomizationForm="True" VisibleIndex="11">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="Carcasa" ShowInCustomizationForm="True" VisibleIndex="12">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="CableDatosUSB" ShowInCustomizationForm="True" VisibleIndex="13">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="LaminaVidrio" ShowInCustomizationForm="True" VisibleIndex="14">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Otro" ShowInCustomizationForm="True" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Entrega" ShowInCustomizationForm="True" VisibleIndex="16">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Hasta" ShowInCustomizationForm="True" VisibleIndex="17">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataCheckColumn FieldName="VB" ShowInCustomizationForm="True" VisibleIndex="18">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario Asignado" FieldName="idUsuarioAsignado" ShowInCustomizationForm="True" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsPersonalAsignado" ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn Caption="RUN" FieldName="pin">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="NOMBRE" FieldName="name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="APELLIDO" FieldName="last_name">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoDispo" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="MOVIL" Value="1" />
                            <dx:ListEditItem Text="RADIO FRECUENCIA" Value="2" />
                            <dx:ListEditItem Text="CUMPUTADOR" Value="3" />
                            <dx:ListEditItem Text="IMPRESORA" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario Recibe" FieldName="IdUsuarioRecibe" ShowInCustomizationForm="True" VisibleIndex="19">
                    <PropertiesComboBox DataSourceID="LqsPersonalAsignado" ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn Caption="RUN" FieldName="pin">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="NOMBRE" FieldName="name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="APELLIDO" FieldName="last_name">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>         
                 <dx:GridViewDataHyperLinkColumn FieldName="Formulario" VisibleIndex="20">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdDetallePdf" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Equipo ID" FieldName="Equipo" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Codigo" VisibleIndex="6" Caption="Equipo">
                    <PropertiesComboBox DataSourceID="LqsEquipo0" ValueField="Codigo">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod.AF" FieldName="Cod_AF">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Equipo" FieldName="Equipo">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
           

        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosForm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="ID_FormEntregaCelulares desc" TableName="CVT_INF_FORM_EntregaCelulares">
        </asp:LinqDataSource>
    </div>
    <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_VW_PERSONAS_TORNIQUETE" EntityTypeName="" ID="LqsPersonalAsignado">
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="LqsEquipo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ListadosEquiposTipo" Where="Tipo == @Tipo">
        <WhereParameters>
            <asp:ControlParameter ControlID="cboTipoEquipo" DefaultValue="0" Name="Tipo" PropertyName="Value" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>

    <asp:LinqDataSource ID="LqsEquipo0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ListadosEquiposTipo">
    </asp:LinqDataSource>

    <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_VW_PERSONAS_TORNIQUETE" EntityTypeName="" ID="LqsPersonalAsignado0">
    </asp:LinqDataSource>

    </asp:Content>
