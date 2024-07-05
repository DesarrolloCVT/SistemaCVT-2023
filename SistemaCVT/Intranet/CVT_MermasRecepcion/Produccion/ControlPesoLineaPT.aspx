<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ControlPesoLineaPT.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.ControlPesoLineaPT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            height: 45px;
        }

        .auto-style7 {
            width: 20px;
            height: 45px;
        }

        .auto-style8 {
            height: 45px;
            width: 145px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Control Peso</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle" id="lblti" runat="server">Control Peso</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" OnClick="cmdNew_Click" Height="38px" Width="86px" />
                </a>&nbsp;&nbsp; 
            &nbsp; 
            &nbsp; 
            &nbsp; 
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>

        </div>
    </div>
    <br />
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cada 1/2 hr Verificar balanza con patron 1K limite critico :+/- 0,1 gr" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsControlPesoLineaPT" KeyFieldName="Id_ControlEnvasadoPT_ContPeso" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdated="GvDatos_RowUpdated" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsPager PageSize="150">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsCookies CookiesID="ControlPesoEnvasado" Version="2" />
            <SettingsPopup>
                <EditForm Width="650px">
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_ControlEnvasadoPT_ContPeso" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Elaboracion" VisibleIndex="5">
                    <PropertiesDateEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Vencimiento" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Vaso1" VisibleIndex="14">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vaso2" VisibleIndex="15">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vaso3" VisibleIndex="16">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vaso4" VisibleIndex="17">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Hora" VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="HH:mm" />
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Linea" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" Selected="True" />
                            <dx:ListEditItem Text="2" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SelloHorizontal" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <EditFormSettings VisibleIndex="0" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SelloVertical" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="OrigenInjet" VisibleIndex="9" Caption="Origen TTO">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="OrigenImpreso" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="HoraCorrecta" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="LoteCorrecto" VisibleIndex="12">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TurnoCorrecto" VisibleIndex="13">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Cod_Barra_Bolsa" VisibleIndex="18">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Cod_Barra_Contenedora" VisibleIndex="19">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" Selected="True" />
                            <dx:ListEditItem Text="NO" Value="2" />
                            <dx:ListEditItem Text="N/A" Value="0" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsControlPesoLineaPT" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_ControlPesoLinea" Where="ID_ControlEnvPT == @ID_ControlEnvPT">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popControlPeso" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="750px" Theme="iOS">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div style="margin-left: 20px">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Hora " Font-Size="Medium" Font-Bold="true" Visible="False"></dx:ASPxLabel>
                                        <asp:TextBox ID="txtHora" runat="server" TextMode="Time" Height="22px" Width="84px" Visible="False"></asp:TextBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Linea" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboLinea" runat="server" ValueType="System.String" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Text="1" Value="1" />
                                                <dx:ListEditItem Text="2" Value="2" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="F.Elaboracion" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteFechElab" runat="server" Width="100px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="F.Vencimiento" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteFechVenc" runat="server" Width="100px">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style8">
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Sello Horizontal" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSelloHori" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Sello Vertical" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSelloVert" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
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
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Origen TTO" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboOrigenTTO" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Origen Impreso" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboOrigenImpreso" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Hora Correcta" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboHoraCorreta" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Lote Correcto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboLoteCorrecto" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Turno Correcto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboTurnoCorrecto" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
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
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Vaso 1" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtVaso1" runat="server" Width="80px" Height="25px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="*" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Vaso 2" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtVaso2" runat="server" Width="80px" Height="25px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="*" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Vaso 3" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtVaso3" runat="server" Width="80px" Height="25px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="*" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Vaso 4" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtVaso4" runat="server" Width="80px" Height="25px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="*" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                   
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Cod.Barra Bolsa" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCodBarraBolsa" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                     <td class="auto-style7"></td>
                                            <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Cod.Barra Contenedora" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCodBarraContenedora" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Si" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                                <dx:ListEditItem Text="N/A" Value="0" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                     <td class="auto-style7"></td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                       <div style="margin-left:100px">
                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Style="width: 62px" Theme="iOS"></dx:ASPxButton>
                    </div>
                    </div>
                 <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>

</asp:Content>
