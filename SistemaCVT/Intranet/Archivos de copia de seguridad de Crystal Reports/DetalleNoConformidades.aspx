<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DetalleNoConformidades.aspx.cs" Inherits="CVT_MermasRecepcion.NoConformidades.DetalleNoConformidades" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxRichEdit.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxRichEdit" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
        .auto-style2 {
            width: 170px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">No Conformidades</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle No Conformidades</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--<a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
              <a style="margin-left:150px">
                  <asp:ImageButton ID="cmdVolver" runat="server"
                      ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Height="28px" Width="32px"/>
                  volver</a>&nbsp;
            <a>
                <asp:ImageButton ID="cmdGuardar" runat="server"
                    ImageUrl="~/Images/disk.png" OnClick="cmdGuardar_Click" Height="30px" Width="32px" />Guardar</a>
        </div>
    </div>
    <br />
    <div style="margin-left: 10px">
        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="7" Width="100%" Theme="MetropolisBlue" EnableTabScrolling="True">
            <TabPages>
                <dx:TabPage Name="identificacion" Text="IDENTIFICACIÓN" ToolTip="Identificacion">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div>
                                <br />
                                <br />
                                <table>
                                    <tr>
                                        <td>
                                            <label>Tipo:</label>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="lblTipo" runat="server" Text="" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <label>Área relacionada:</label></td>
                                        <td class="auto-style2">
                                            <dx:ASPxLabel ID="lblArea" runat="server" Text="" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <label>Documento N°</label></td>
                                        <td>
                                            <dx:ASPxLabel ID="lblNumFolio" runat="server" Text="" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <label>Fecha:</label></td>
                                        <td>
                                            <dx:ASPxLabel ID="lblFecha" runat="server" Text="" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>

                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
                                            </asp:LinqDataSource>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>Origen</label></td>
                                        <td>
                                            <dx:ASPxComboBox ID="cboOrigen" runat="server" ValueType="System.String">
                                                <Items>
                                                    <dx:ListEditItem Text="Rev. por la Direccion" Value="Rev. por la Direccion" />
                                                    <dx:ListEditItem Text="Auditoria/Inspeccion" Value="Auditoria/Inspeccion" />
                                                    <dx:ListEditItem Text="Reclamo" Value="Reclamo" />
                                                    <dx:ListEditItem Text="Otro" Value="Otro" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <label>Responsable Solucion</label></td>
                                        <td class="auto-style2">
                                            <dx:ASPxComboBox ID="cboResponsable" runat="server" ValueType="System.String" DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>

                                </table>
                                <br />
                                <br />
                            </div>

                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="Descripcion" Text="DESCRIPCIÓN">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                         <dx:ASPxHtmlEditor ID="htmlDescripcion" runat="server">
                             <Settings AllowHtmlView="False" AllowPreview="False">
                             </Settings>
                             <SettingsHtmlEditing>
                                 <PasteFiltering Attributes="class" />
                             </SettingsHtmlEditing>
                            </dx:ASPxHtmlEditor>
                        
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="CausaOrigen" Text="CAUSA/ORIGEN">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxHtmlEditor ID="htmlCausaOrigen" runat="server">
                                <Settings AllowHtmlView="False" AllowPreview="False">
                                </Settings>
                                <SettingsHtmlEditing>
                                    <PasteFiltering Attributes="class" />
                                </SettingsHtmlEditing>
                            </dx:ASPxHtmlEditor>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="DescripcionAccionInmediata" Text="DESCRIPCIÓN ACCIÓN INMEDIATA">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha plazo" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="dteFechaPlazoAcInmediata" runat="server">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:CheckBox ID="ChkCumpleACIN" runat="server" />
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cumple" Font-Size="Large"></dx:ASPxLabel>
                                        </td>

                                    </tr>
                                </table>
                            </div>
                            <br />
                            <div>
                                <dx:ASPxHtmlEditor ID="htmlAccioninmediata" runat="server">
                                    <Settings AllowHtmlView="False" AllowPreview="False">
                                    </Settings>
                                    <SettingsHtmlEditing>
                                        <PasteFiltering Attributes="class" />
                                    </SettingsHtmlEditing>
                                </dx:ASPxHtmlEditor>
                            </div>
                        </dx:ContentControl>

                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="descripcionAccionCorrectiva" Text="DESCRIPCIÓN ACCIÓN CORRECTIVA">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha Plazo" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="dtFechaPlazoAcCorrectiva" runat="server">
                                            </dx:ASPxDateEdit>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chkCumpleACCO" runat="server" />
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="labelCumpleACC" runat="server" Text="Cumple" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <div>
                                <dx:ASPxHtmlEditor ID="htmlAccionCorrectiva" runat="server">
                                    <Settings AllowHtmlView="False" AllowPreview="False">
                                    </Settings>
                                    <SettingsHtmlEditing>
                                        <PasteFiltering Attributes="class" />
                                    </SettingsHtmlEditing>
                                </dx:ASPxHtmlEditor>
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="SuperviciondelaEjecucion" Text="SUPERVISIÓN DE LA EJECUCIÓN">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="dteSupervisionEjecucion" runat="server">
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <div>
                                <dx:ASPxHtmlEditor ID="htmlEjecucion" runat="server">
                                    <Settings AllowHtmlView="False" AllowPreview="False">
                                    </Settings>
                                    <SettingsHtmlEditing>
                                        <PasteFiltering Attributes="class" />
                                    </SettingsHtmlEditing>
                                    <SettingsDialogs>
                                        <InsertFlashDialog ShowFileUploadSection="False" ShowMoreOptionsButton="False" ShowSaveFileToServerButton="False" ShowStyleSettingsSection="False">
                                        </InsertFlashDialog>
                                    </SettingsDialogs>
                                </dx:ASPxHtmlEditor>
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="EficaciaAccion" Text="EFICACIA DE LA ACCIÓN">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Fecha Evaluacion Eficacia" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="dtFechaEficacia" runat="server">
                                            </dx:ASPxDateEdit>
                                        </td>
                                         <td>
                                            <asp:CheckBox ID="chkCumpleEficaciaAccion" runat="server" />
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Cumple" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                           <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <dx:ASPxButton ID="btnFinalizar" runat="server" Text="Dar Termino No Conformidad" OnClick="btnFinalizar_Click"></dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <div>
                                <dx:ASPxHtmlEditor ID="htmlEficaciaAccion" runat="server">
                                    <Settings AllowHtmlView="False" AllowPreview="False">
                                    </Settings>
                                    <SettingsHtmlEditing>
                                        <PasteFiltering Attributes="class" />
                                    </SettingsHtmlEditing>
                                </dx:ASPxHtmlEditor>
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="archivosAdjuntos" Text="ARCHIVOS ADJUNTOS">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Observaciones " Font-Size="Large"></dx:ASPxLabel>  &nbsp;</td>
                                        <td class="auto-style1">
                                            <dx:ASPxTextBox ID="txtObservacion" runat="server" Width="404px" Height="40px">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox></td>
                                    </tr>
                                </table>
                               </div>
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                              <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </td>
                                        <td>
                                            <dx:ASPxButton ID="btnSubir" runat="server" Text="Guardar" OnClick="btnSubir_Click"></dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>                              
                            </div>
                            <br />
                            <div>
                                <table>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Documentos Cargados" Font-Size="Large"></dx:ASPxLabel>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <div>
                                <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" KeyFieldName="Id_RutaArchivoNoConformidad" DataSourceID="LqsArchivos" OnRowDeleting="GvDatos_RowDeleting">
                                    <SettingsBehavior ConfirmDelete="True" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id_RutaArchivoNoConformidad" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Id_NoConformidad" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Ruta" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Extencion" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Observacion" ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:LinqDataSource ID="LqsArchivos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_RutaArchivoNoConformidad" Where="Id_NoConformidad == @Id_NoConformidad" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                                    <WhereParameters>
                                        <asp:SessionParameter Name="Id_NoConformidad" SessionField="Id_NoConformidad" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </div>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
            <TabStyle Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                ForeColor="Black">
            </TabStyle>
        </dx:ASPxPageControl>
    </div>
</asp:Content>
