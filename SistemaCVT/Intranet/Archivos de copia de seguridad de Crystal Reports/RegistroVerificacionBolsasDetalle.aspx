<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegistroVerificacionBolsasDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.RegistroVerificacionBolsasDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }

        .auto-style6 {
            width: 88px;
        }

        .auto-style7 {
            width: 96px;
        }

        .auto-style8 {
            width: 102px;
        }

        .auto-style9 {
            width: 91px;
        }

        .auto-style10 {
            width: 147px;
        }

        .auto-style11 {
            width: 5px;
        }

        .auto-style12 {
            width: 89px;
        }

        .auto-style13 {
            width: 95px;
        }
        .auto-style14 {
            width: 155px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><a href="../Calidad/RegistroVerificacionBolsas.aspx">Verificacion Bolsas</a></li>
            <li><span id="current">Verificacion Bolsas Detalle</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Verificacion Bolsas Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--  <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" OnClick="cmdNew_Click" Height="35px" Width="80px" />
            </a>
            &nbsp; 
            &nbsp; 
            &nbsp; 
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosDetalle" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalle" KeyFieldName="Id_VerificacionBolsasDetalle" OnRowDeleting="GvDatosDetalle_RowDeleting" OnRowUpdated="GvDatosDetalle_RowUpdated" OnRowUpdating="GvDatosDetalle_RowUpdating">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_VerificacionBolsasDetalle" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_VerificacionBolsas" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Fecha Elab." FieldName="Fecha_elaboracion" VisibleIndex="4">
                    <PropertiesComboBox EnableFocusedStyle="False">
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Fecha Ven." FieldName="Fecha_vencimiento" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Lote Correcto" FieldName="Lote_Correcto" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Hora Envasado" FieldName="HoraEnvasado_Correcto" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Turno correcto" FieldName="Turno_Correcto" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Linea Correcta" FieldName="Linea_Correcta" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Origen Indicado Injeck" FieldName="Origen_indicadoInjeckt" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Sello Horizontal" FieldName="Sello_horizontal" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Sello Vertical" FieldName="Sello_vertical" VisibleIndex="12">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Fecha Elab. Lote Enfardadora" FieldName="Fecha_ElaboracionLote" VisibleIndex="13">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodigoBarraEAN13" VisibleIndex="14">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodigoBarraDUN14" VisibleIndex="15">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Hora" VisibleIndex="3" Width="50px">
                    <PropertiesTextEdit DisplayFormatString="t" Width="50px">
                        <MaskSettings Mask="H:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SelloVerti_Contenedora" VisibleIndex="16">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="Si" Value="1" />
                            <dx:ListEditItem Text="No" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SelloHoriz_Contenedora" VisibleIndex="17">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No Aplica" Value="0" />
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_RegistroVerificacionBolsasDetalle" Where="Id_VerificacionBolsas == @Id_VerificacionBolsas">
            <WhereParameters>
                <asp:SessionParameter Name="Id_VerificacionBolsas" SessionField="Id_VerificacionBolsas" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popVerificacionBolsas" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="580px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div style="margin-left: 25px">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Hora" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtHora" runat="server" Width="60px">
                                            <MaskSettings Mask="HH:mm" />
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
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Elab." Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboFechElab" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha Venc." Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboFechVenc" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Lote Correcto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboLoteCorrecto" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Hora Envasado" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboHoraEnv" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
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
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Turno Correcto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboTurnoCorrecto" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td class="auto-style7">
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Linea Correcta" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboLineaCorrecta" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td class="auto-style8">
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Origen Ind.Injeck" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboOrigenInjeck" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td class="auto-style9">
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Sello Horizontal" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSelloHorizontal" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
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

                                    <td class="auto-style9">
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Sello Vertical" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSelloVertical" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td class="auto-style10">
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Fecha Elab.Lote Enfardadora" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboFechElabEnfardadora" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style11"></td>
                                    <td class="auto-style12">
                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Cod.Barra EAN13" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCodBarra13" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td class="auto-style13">
                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Cod.Barra DUN14" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboCodBarraDUN14" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table>
                                <tr>

                                    <td class="auto-style14">
                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Sello Vertical Contenedora" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSelloVertContenedora" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td class="auto-style10">
                                        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Sello Horizontal Contenedora" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSelloHorizContenedora" runat="server" ValueType="System.String" SelectedIndex="1" Width="85px">
                                            <Items>
                                                <dx:ListEditItem Text="No Aplica" Value="0" />
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
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Observacion" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtObservacion" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Theme="iOS" OnClick="btnGuardar_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
