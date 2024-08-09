<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ControlDetenciones.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.ControlDetenciones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 47px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Control Detenciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detenciones por OF</span>
        <span class="tab-end"></span>
    </div>
    <div>
        <a>
            <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
            Exportar Excel</a>
    </div>
    <div>
        <table class="dxeBinImgCPnlSys">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="OF">
                    </dx:ASPxLabel>
                </td>
                <td>

                    <dx:ASPxComboBox runat="server" DataSourceID="LqDsOF" ValueField="OF"
                        Width="300px" ID="cbo_of" AutoPostBack="true"
                        OnSelectedIndexChanged="cbo_of_SelectedIndexChanged">
                        <Columns>
                            <dx:ListBoxColumn FieldName="OF"></dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="CodProducto"></dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Producto"></dx:ListBoxColumn>
                        </Columns>

                        <ValidationSettings ValidationGroup="a" Display="Dynamic">
                            <RequiredField IsRequired="True"></RequiredField>
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                    <asp:LinqDataSource runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" OrderBy="OF"
                        TableName="CVT_LISTADO_OF_DETENCION" EntityTypeName="" ID="LqDsOF">
                    </asp:LinqDataSource>

                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Hr Inicio">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style5">
                    <dx:ASPxTextBox ID="txt_hrini" runat="server" Height="22px" Width="50px" NullText="HH" MaxLength="2">
                    </dx:ASPxTextBox>
                </td>
                <td colspan="4">
                    <dx:ASPxTextBox ID="txt_minini" runat="server" Height="22px" Width="50px" NullText="MM" MaxLength="2">
                    </dx:ASPxTextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>

                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Producto">
                    </dx:ASPxLabel>

                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_producto" runat="server">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Hr Termino">
                    </dx:ASPxLabel>
                </td>
                <td colspan="2">
                    <dx:ASPxTextBox ID="txt_hrter" runat="server" Height="22px" Width="50px" NullText="HH" MaxLength="2">
                    </dx:ASPxTextBox>
                </td>
                <td colspan="2">
                    <dx:ASPxTextBox ID="txt_minter" runat="server" Height="22px" Width="50px" NullText="MM" MaxLength="2">
                    </dx:ASPxTextBox>
                </td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td>

                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Linea">
                    </dx:ASPxLabel>

                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_maquina" runat="server">
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                            <dx:ListEditItem Text="1-2" Value="11" />
                            <dx:ListEditItem Text="3-4" Value="12" />
                            <dx:ListEditItem Text="5-6" Value="13" />
                            <dx:ListEditItem Text="SORTEX" Value="8" />
                            <dx:ListEditItem Text="PAGE" Value="9" />
                            <dx:ListEditItem Text="PELADORA" Value="10" />
                            <dx:ListEditItem Text="General" Value="0" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    &nbsp;</td>
                <td colspan="3">
                    &nbsp;</td>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td>

                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Tipo">
                    </dx:ASPxLabel>

                </td>
                <td>
                    
                    <dx:ASPxComboBox ID="cbo_tipo" runat="server">
                        <Items>
                            <dx:ListEditItem Text="Programada" Value="1" />
                            <dx:ListEditItem Text="No Programada" Value="2" />
                        </Items>
                    </dx:ASPxComboBox>
                    
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Observacion">
                    </dx:ASPxLabel>
                </td>
                <td colspan="3">
                    <dx:ASPxMemo ID="txt_comentario" runat="server" Height="71px" Width="170px">
                    </dx:ASPxMemo>
                </td>
                <td colspan="3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>

                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Categoria">
                    </dx:ASPxLabel>

                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_categoria" runat="server" AutoPostBack="True"
                        DataSourceID="LqDsCategorias"
                        OnSelectedIndexChanged="cbo_categoria_SelectedIndexChanged"
                        TextField="Categoria_Nombre" ValueField="Categoria_Id">
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsCategorias" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_CategoriaDetenciones" Where="Estado == @Estado">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_agregar" runat="server" Text="Agregar"
                        OnClick="btn_agregar_Click">
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Motivo">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_motivo" runat="server" DataSourceID="LqDsMotivos"
                        TextField="Detencion_Motivo" ValueField="Motivo_Cod">
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsMotivos" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_MotivoDentecion" Where="Categoria_Id == @Categoria_Id &amp;&amp; Estado == @Estado &amp;&amp; Tipo == @Tipo">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_categoria" DefaultValue="0"
                                Name="Categoria_Id" PropertyName="Value" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                            <asp:ControlParameter ControlID="cbo_tipo" DefaultValue="0" Name="Tipo" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Maquina">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_Maq" runat="server" AutoPostBack="True" DataSourceID="LqDsMaquina" TextField="Descricion" ValueField="ID">
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsMaquina" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente" Where="Padre_ID == @Padre_ID">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="0" Name="Padre_ID" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Parte">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_parte" runat="server" AutoPostBack="True" DataSourceID="LqDsParte" TextField="Descricion" ValueField="ID">
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsParte" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente" Where="Padre_ID == @Padre_ID">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_Maq" DefaultValue="-1" Name="Padre_ID" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Componente">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_componente" runat="server" AutoPostBack="True" DataSourceID="LqDsComponente" TextField="Descricion" ValueField="ID">
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsComponente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente" Where="Padre_ID == @Padre_ID">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_parte" DefaultValue="-1" Name="Padre_ID" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="margin-left: 35px">
        <dx:ASPxButton ID="btnVeri" runat="server" Text="Validar Seleccion" Height="40px" Theme="Glass" Width="150px" OnClick="btnVeri_Click"></dx:ASPxButton>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsDetenciones" KeyFieldName="Detencion_Id" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize" OnRowUpdating="GvDatos_RowUpdating" OnRowDeleting="GvDatos_RowDeleting">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" AllowGroup="False" AllowHeaderFilter="False" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsText Title="Detenciones" ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <%--       <dx:GridViewDataHyperLinkColumn Caption="Verificado" VisibleIndex="13">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Verificado" CommandName="cmdVerificado" runat="server" ImageUrl="~/Images/activo.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>--%>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="1">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Detencion_Id" ReadOnly="True"
                    Visible="False" VisibleIndex="2" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="OF" FieldName="OF_Id" VisibleIndex="3" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Maquina" VisibleIndex="4" ShowInCustomizationForm="True" Caption="Linea">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="10" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hr_Termino" FieldName="Hr_Termino"
                    VisibleIndex="8" ShowInCustomizationForm="True">
                    <PropertiesTextEdit>
                        <MaskSettings Mask="HH:mm:ss" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Hr_Inicio" FieldName="Hr_Inicio"
                    VisibleIndex="7" ShowInCustomizationForm="True">
                    <PropertiesTextEdit>
                        <MaskSettings Mask="HH:mm:ss" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Categoria" FieldName="Categoria_Id"
                    VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqDsCategorias" TextField="Categoria_Nombre"
                        ValueField="Categoria_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Motivo" FieldName="Motivo_Cod"
                    VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqDsMotivos0" TextField="Detencion_Motivo"
                        ValueField="Motivo_Cod">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Total Minutos "
                    FieldName="TotalMinutosDetencion" VisibleIndex="9" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierto" Value="1" />
                            <dx:ListEditItem Text="Cerrado" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Validador" FieldName="UserConfirma" VisibleIndex="12">
                    <PropertiesComboBox DataSourceID="LqsUsuarios" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Caption="Validado">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="Maquina" FieldName="Maq" VisibleIndex="13">
                    <PropertiesComboBox DataSourceID="LqDsMaquina" TextField="Descricion" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Parte" FieldName="Parte" VisibleIndex="14">
                    <PropertiesComboBox DataSourceID="LqDsParte0" TextField="Descricion" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Componente" FieldName="Componente" VisibleIndex="15">
                    <PropertiesComboBox DataSourceID="LqDsComponente0" TextField="Descricion" ValueField="ID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <TitlePanel BackColor="#FF3300">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsMotivos0" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_MotivoDentecion" Where="Estado == @Estado">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsDetenciones" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_Detencion" Where="OF_Id == @OF_Id" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_of" DefaultValue="0" Name="OF_Id"
                    PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuarios" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsParte0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsComponente0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_MaquinaComponente">
        </asp:LinqDataSource>
    </div>
    <br />

    <dx:ASPxPopupControl ID="popVerificar" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Verificacion " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <br />
                <div>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Usuario" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtUsuario" runat="server" Width="170px" Height="25px" Theme="Default">
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Contraseña" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                <asp:TextBox ID="txtContrasena" runat="server" CausesValidation="True" Height="25px" TextMode="Password" Width="170px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div style="margin-left: 35px">
                    <dx:ASPxButton ID="btnVerificar" runat="server" Text="Validar" Theme="MaterialCompact" OnClick="btnVerificar_Click"></dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>
