<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DetalleControlEnvasadoPT.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.DetalleControlEnvasadoPT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }

        .auto-style6 {
            width: 21px;
        }

        .auto-style7 {
            width: 22px;
        }

        .auto-style8 {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Control Envasado PT Detalle</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle" id="lblti" runat="server">Control Envasado PT Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>

        </div>
    </div>
    <br />
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Film Impreso" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tipo"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTipoFilmImp" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="cboTipoFilmImp_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="Ingreso" Value="Ingreso" />
                            <dx:ListEditItem Text="Merma" Value="Merma" />
                            <%--      <dx:ListEditItem Text="Saldo" Value="Saldo" />
                            <dx:ListEditItem Text="No Conforme" Value="No Conforme" />--%>
                        </Items>
                        <ValidationSettings ValidationGroup="n1" Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>

            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px" id="dv2Mot" runat="server">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Proveedor"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboProveedorFilmImp" runat="server" DataSourceID="LqsProveedorFilm" TextField="CardName" ValueField="CardCode" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="cboProveedorFilmImp_SelectedIndexChanged">
                        <ValidationSettings ValidationGroup="n1" Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lblLote" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Lote"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="lotImp" runat="server" Width="70px" Height="30px" MaxLength="5">
                        <ValidationSettings ValidationGroup="n1" Display="Dynamic">
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Motivo Merma"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboMotivoMermaFilmImp" runat="server" Height="30px" DataSourceID="LqsMotivoMerma" TextField="Descripcion" ValueField="id_Motivo">
                        <Items>
                            <dx:ListEditItem Text="Puesta En Marcha" Value="1" />
                            <dx:ListEditItem Text="Problema de Impresion" Value="2" />
                            <dx:ListEditItem Text="Problema de COF" Value="3" />
                            <dx:ListEditItem Text="Cambio de Film" Value="4" />
                            <dx:ListEditItem Text="Problema Embobinado" Value="5" />
                            <dx:ListEditItem Text="De Proceso" Value="6" />
                            <dx:ListEditItem Text="Diferencia de Espesor" Value="7" />
                            <dx:ListEditItem Text="De proveedor" Value="8" />
                            <dx:ListEditItem Text="Vida Util" Value="9" />
                        </Items>
                        <ValidationSettings ValidationGroup="n1" Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsMotivoMerma" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_MotivoMerma" Where="Estado == @Estado">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Origen Merma"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboOrigenMerma" runat="server" Height="30px">
                        <Items>
                            <dx:ListEditItem Text="Proveedor" Value="Proveedor" />
                           <%-- <dx:ListEditItem Text="Dosificador" Value="Dosificador" />--%>
                            <dx:ListEditItem Text="Procesos" Value="Procesos" />
                        </Items>
                        <ValidationSettings ValidationGroup="n1" Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px" id="dv1Datos" runat="server">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="N° Bobina"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNBobina" runat="server" Width="170px" OnTextChanged="txtNBobina_TextChanged" AutoPostBack="True" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Proveedor"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtProveedor" runat="server" Width="200px" Height="30px" ReadOnly="True" Border-BorderColor="Blue"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Lote"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLoteFilmImp" runat="server" Width="170px" Height="30px" MaxLength="5" ReadOnly="True" Border-BorderColor="Blue">
                    </dx:ASPxTextBox>
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
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Cantidad"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantidadFilmImp" runat="server" Width="100px" Height="30px" ReadOnly="True" Border-BorderColor="Blue">
                        <ValidationSettings ValidationGroup="n1" Display="Dynamic">
                            <RegularExpression ValidationExpression="^[0-9]\d*(,\d+)?$" ErrorText="Decimal &quot; ,&quot;" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style7"></td>
                <td>
                    <dx:ASPxButton ID="btnAgregarFilmImp" runat="server" Text="Agregar" Height="44px" OnClick="btnAgregarFilmImp_Click" ValidationGroup="n1" Theme="iOS"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxGridView ID="GvDatosFilm" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosFilm" KeyFieldName="ID_DetalleControlEnvPT" OnRowDeleting="GvDatosFilm_RowDeleting" OnRowUpdating="GvDatosFilm_RowUpdating" OnCommandButtonInitialize="GvDatosFilm_CommandButtonInitialize">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_DetalleControlEnvPT" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="7">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="solo numeros o coma decimal ( , )" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoRegistro" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Proveedor" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsProveedorFilm" TextField="CardName" ValueField="CardCode">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Tipo" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Ingreso" Value="Ingreso" />
                            <dx:ListEditItem Text="Merma" Value="Merma" />
                            <%--  <dx:ListEditItem Text="Saldo" Value="Saldo" />
                            <dx:ListEditItem Text="No Conforme" Value="No Conforme" />--%>
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="NBobina" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OrigenMerma" VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="MotivoMerma" VisibleIndex="9">
                    <PropertiesComboBox DataSourceID="LqsMotivoMerma" TextField="Descripcion" ValueField="id_Motivo">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosFilm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_Detalle" Where="TipoRegistro == @TipoRegistro &amp;&amp; ID_ControlEnvPT == @ID_ControlEnvPT">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="TipoRegistro" Type="Int32" />
                <asp:SessionParameter Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" DefaultValue="0" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProveedorFilm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="QryGroup4 == @QryGroup4 &amp;&amp; CardType == @CardType">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="QryGroup4" Type="Char" />
                <asp:Parameter DefaultValue="S" Name="CardType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Film Enfardadora" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <br />
    <br />
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td class="auto-style8">
                    <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Tipo"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTipoFilmEnf" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="cboTipoFilmEnf_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="Ingreso" Value="Ingreso" />
                            <dx:ListEditItem Text="Merma" Value="Merma" />
                        </Items>
                        <ValidationSettings ValidationGroup="n2" Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>

            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px" id="Div1" runat="server">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Proveedor"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboProveeFilmEnf" runat="server" DataSourceID="LqsProveedorFilm" TextField="CardName" ValueField="CardCode" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="cboProveeFilmEnf_SelectedIndexChanged">
                        <ValidationSettings ValidationGroup="n2" Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="lblLote2" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="lote"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="lotEnf" runat="server" Width="70px" Height="30px" MaxLength="5">
                        <ValidationSettings ValidationGroup="n2" Display="Dynamic">
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Motivo Merma"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboMotivoMermaEnf" runat="server" Height="30px" DataSourceID="LqsMotivoMerma" TextField="Descripcion" ValueField="id_Motivo">
                        <Items>
                            <dx:ListEditItem Text="Puesta En Marcha" Value="1" />
                            <dx:ListEditItem Text="Problema de Impresion" Value="2" />
                            <dx:ListEditItem Text="Problema de COF" Value="3" />
                            <dx:ListEditItem Text="Cambio de Film" Value="4" />
                            <dx:ListEditItem Text="Problema Embobinado" Value="5" />
                            <dx:ListEditItem Text="De Proceso" Value="6" />
                            <dx:ListEditItem Text="Diferencia de Espesor" Value="7" />
                            <dx:ListEditItem Text="De proveedor" Value="8" />
                            <dx:ListEditItem Text="Vida Util" Value="9" />
                        </Items>
                        <ValidationSettings ValidationGroup="n2" Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Origen Merma"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboOrigenMermaEnf" runat="server" Height="30px">
                        <Items>
                            <dx:ListEditItem Text="Proveedor" Value="Proveedor" />
                            <%-- <dx:ListEditItem Text="Dosificador" Value="Dosificador" />--%>
                            <dx:ListEditItem Text="Procesos" Value="Procesos" />
                        </Items>
                        <ValidationSettings ValidationGroup="n2" Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px" id="Div2" runat="server">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="N° Bobina"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNbobinaEnf" runat="server" Width="170px" OnTextChanged="txtNbobinaEnf_TextChanged" AutoPostBack="True" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Proveedor"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtProveedorEnf" runat="server" Width="200px" Height="30px" ReadOnly="True" Border-BorderColor="Blue"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Lote"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLoteFilmEnf" runat="server" Width="170px" Height="30px" MaxLength="5" ReadOnly="True" Border-BorderColor="Blue">
                    </dx:ASPxTextBox>
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
                    <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Cantidad"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantFilEnf" runat="server" Width="100px" Height="30px" ReadOnly="True" Border-BorderColor="Blue">
                        <ValidationSettings ValidationGroup="n2" Display="Dynamic">
                            <RegularExpression ValidationExpression="^[0-9]\d*(,\d+)?$" ErrorText="Decimal &quot; ,&quot;" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style7"></td>
                <td>
                    <dx:ASPxButton ID="btnAgregarFimlEnf" runat="server" Text="Agregar" Height="44px" OnClick="btnAgregarFimlEnf_Click" ValidationGroup="n2" Theme="iOS"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />

    <div style="margin-left: 50px">
        <dx:ASPxGridView ID="GvDatosEnf" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosEnf" KeyFieldName="ID_DetalleControlEnvPT" OnRowDeleting="GvDatosEnf_RowDeleting" OnRowUpdating="GvDatosEnf_RowUpdating" OnCommandButtonInitialize="GvDatosEnf_CommandButtonInitialize">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowGroupPanel="True" />
            <SettingsBehavior ConfirmDelete="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_DetalleControlEnvPT" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" ShowInCustomizationForm="True" VisibleIndex="7">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Solo numeros o  coma decimal ( , )" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoRegistro" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Proveedor" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsProveedorFilm" TextField="CardName" ValueField="CardCode">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Tipo" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Ingreso" Value="Ingreso" />
                            <dx:ListEditItem Text="Merma" Value="Merma" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="NBobina" VisibleIndex="5" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OrigenMerma" VisibleIndex="10" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="MotivoMerma" VisibleIndex="9">
                    <PropertiesComboBox DataSourceID="LqsMotivoMerma" TextField="Descripcion" ValueField="id_Motivo">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosEnf" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_Detalle" Where="TipoRegistro == @TipoRegistro &amp;&amp; ID_ControlEnvPT == @ID_ControlEnvPT">
            <WhereParameters>
                <asp:Parameter DefaultValue="2" Name="TipoRegistro" Type="Int32" />
                <asp:SessionParameter Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" DefaultValue="0" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
