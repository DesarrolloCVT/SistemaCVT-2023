<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ControlAsistenciaSupervisor.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.ControlAsistenciaSupervisor" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
        .auto-style6 {
            width: 19px;
        }
        .auto-style7 {
            margin-right: 5px;
        }
        .auto-style8 {
            width: 230px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
         <div id="tableHeader">
        <span class="tableTitle">Ingreso Asistencia</span>
        <span class="tab-end"></span>

    </div>
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>RRHH</a></li>
            <li><span id="current">Control de Asistencia</span></li>
        </ul>
    </div>
    <br />
    <div style="margin-left: 20px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Área"></dx:ASPxLabel>
                    <dx:ASPxComboBox Width="300px" ID="cb_area" runat="server" DataSourceID="LqDsArea" ValueField="Id_Area" AutoPostBack="True">
                        <Columns>
                            <dx:ListBoxColumn Caption="Area" FieldName="Nombre">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings ValidationGroup="SendMessage" Display="Dynamic">
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Trabajador"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cb_persona" runat="server" DataSourceID="LqDsPersona" ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn Caption="Run" FieldName="pin">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="Name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings ValidationGroup="SendMessage" Display="Dynamic">
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel runat="server" Text="Labores"></dx:ASPxLabel>
                    <dx:ASPxComboBox Width="300px" ID="cb_trabajo" runat="server" DataSourceID="LqDsTrabajos0" ValueField="Id_Labores">
                        <Columns>
                            <dx:ListBoxColumn Caption="Trabajo" FieldName="Nombre">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings ValidationGroup="SendMessage" Display="Dynamic">
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 20px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" Text="Fecha Asistencia"></dx:ASPxLabel>
                    <dx:ASPxDateEdit runat="server" ID="cb_fecha">
                        <ValidationSettings ValidationGroup="SendMessage" Display="Dynamic">
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel Width="60px" runat="server" Text="Turno"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTurno" runat="server">
                        <Items>
                            <dx:ListEditItem Text="Dia" Value="1" />
                            <dx:ListEditItem Text="Noche" Value="2" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Ingreso Hora"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_HoraIngreso" runat="server" Width="90px" NullText="HH" Height="25px">
                        <ValidationSettings ValidationGroup="SendMessage" Display="Dynamic">
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxLabel runat="server" Text="Ingreso Minutos"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_MinIngreso" runat="server" Width="90px" NullText="MM" Height="25px">
                        <ValidationSettings ValidationGroup="SendMessage" Display="Dynamic">
                            <RequiredField IsRequired="true" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel runat="server" Text="Salida Hora"></dx:ASPxLabel>
                    <dx:ASPxTextBox runat="server" ID="txt_HoraSalida" Width="90px" NullText="HH" Height="25px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxLabel runat="server" Text="Salida Minutos"></dx:ASPxLabel>
                    <dx:ASPxTextBox runat="server" ID="txt_MinSalida" Width="90px" NullText="MM" Height="25px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
 <br />
    <div style="margin-left: 20px">
        <table>
            <tr>
                <td class="auto-style8">
                    <%--<asp:TextBox ID="txt_Comentarios" runat="server" Height="140px" TextMode="MultiLine" Width="250px" ToolTip="Comentarios" ></asp:TextBox>--%>
                    <dx:ASPxMemo ID="txt_Comentarioss" runat="server"  Height="76px" Width="334px" AutoResizeWithContainer="True" CssClass="auto-style7" NullText="Comentarios" ToolTip="Comentarios"></dx:ASPxMemo>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btn_agregar" runat="server" Text="Agregar" Height="50px" OnClick="btn_agregar_Click">
                        <ClientSideEvents Click="function(s, e){
                                    ASPxClientEdit.ValidateGroup('SendMessage');    
                               }" />
                    </dx:ASPxButton>
                    <td>
            </tr>
        </table>
    </div> 
    <br />
    <br />
        <div style="margin-left:15px">
        <table>
            <tr>
                <td>
                  <dx:ASPxLabel Font-Bold="True" runat="server" Text="FechaAsistencia" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFechaIni" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="54px" Width="91px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <dx:ASPxLabel Font-Bold="True" runat="server" Text="Detalle Asistencia" Font-Size="Small"></dx:ASPxLabel>
        <dx:ASPxGridView runat="server" ID="GvDatos" AutoGenerateColumns="False" DataSourceID="LqDsAsistencia" KeyFieldName="Asistencia_Id" OnRowUpdated="GvDatos_RowUpdated" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Asistencia_Id" VisibleIndex="1" ReadOnly="True" ShowInCustomizationForm="True" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fecha Asistencia">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Registro" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Fecha Registro" ReadOnly="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Comentario" ShowInCustomizationForm="True" VisibleIndex="13">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Minutos Trabajados" FieldName="Minutos_Trabajados" ShowInCustomizationForm="True" VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="Id_Area" ShowInCustomizationForm="True" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsArea" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Labor" FieldName="Id_Labores" ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqDsTrabajos" TextField="Nombre" ValueField="Id_Labores">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trabajador" FieldName="Id_Personal" ShowInCustomizationForm="True" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqDsPersona" ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Responsable" FieldName="Id_Usuario" ShowInCustomizationForm="True" VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="LqDsResponsable" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Hora Entrada" FieldName="Hora_Entrada" ShowInCustomizationForm="True" VisibleIndex="8">
                    <PropertiesTextEdit>
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hora Salida" FieldName="Hora_Salida" ShowInCustomizationForm="True" VisibleIndex="9">
                    <PropertiesTextEdit>
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="RUN" FieldName="Id_Personal" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqDsPersona" TextField="pin" ValueField="pin">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Turno" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Dia" Value="1" />
                            <dx:ListEditItem Text="Noche" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="TotalHorasTrabajadas" VisibleIndex="15">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalPagoxHoras" VisibleIndex="16" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalMinTrabajados" VisibleIndex="14">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsAsistencia" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_Asistencia" OrderBy="Fecha desc, Asistencia_Id desc" Where="Fecha == @Fecha">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteFechaIni" DefaultValue="01-01-1990" Name="Fecha" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsResponsable" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (IdUsuario, NombreUsuario)" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsPersona" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsTrabajos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (Nombre, Id_Labores)" TableName="CVT_LaboresExternas">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsTrabajos0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (Nombre, Id_Labores)" TableName="CVT_LaboresExternas" Where="id_Area == @id_Area">
            <WhereParameters>
                <asp:ControlParameter ControlID="cb_area" DefaultValue="0" Name="id_Area" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <br />
    </div>
</asp:Content>
