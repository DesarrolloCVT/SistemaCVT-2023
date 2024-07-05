<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ActivoFijo.aspx.cs" Inherits="CVT_MermasRecepcion.ActivoFijo.ActivoFijo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            width: 30px;
        }

        .auto-style7 {
            height: 48px;
        }

        .auto-style8 {
            width: 15px;
            height: 48px;
        }

        .auto-style9 {
            margin-left: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Activo Fijo</a></li>
            <li><span id="current">Activo Fijo</span></li>
            <li></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Activo Fijo</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosActivoFijo" runat="server" AutoGenerateColumns="False" DataSourceID="LqsActivoFijo" KeyFieldName="ID_Activo" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>

                        <%--<dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>--%>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                            <Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                            </Items>
                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_Activo" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Nombre_Activo" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Compra" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="N_Factura" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cuenta_Contable" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vida_Util_Meses" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vida_Util_Restante" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vida_Util_Transcurrida" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valor_Compra_Neto" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CMAC" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CMEJ" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DEPAC" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DEPEJ" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CMDA" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Beneficio_33BIS" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto_Beneficio_33BIS" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valor_Final_Activo" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Dvision" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Unid_Administrativa" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Centro_Costo" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lugar_Fisico" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsActivoFijo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_ActivoFIjo" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>
        <br />
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="PopNuevoActivo" runat="server" AllowDragging="True" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Theme="Office2010Blue" Width="704px" CloseAction="None">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div style="margin-left: 20px">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Placa"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtPlaca" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Nombre Activo"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtNombreActivo" runat="server" Width="450px" Height="30px">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style7">
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha Compra"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteFechaCompra" runat="server" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td class="auto-style8"></td>
                                    <td class="auto-style7">
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha Deprec"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteFechaIniDeprec" runat="server" Height="30px"></dx:ASPxDateEdit>
                                    </td>
                                    <td class="auto-style8"></td>
                                    <td class="auto-style7">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="N° Factura"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtNFactura" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style8"></td>
                                    <td class="auto-style7">
                                        <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Beneficio_33BIS"></dx:ASPxLabel>
                                        <dx:ASPxCheckBox ID="chkBeneficio33BIS" runat="server" Height="30px" Text=" " Width="37px"></dx:ASPxCheckBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Cta Contable"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCtaContable" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Area"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtUnidadAdmin" runat="server" Width="100px" Height="30px"></dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Division"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtDivision" runat="server" Width="100px" Height="30px"></dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Centro Costo"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCentroCosto" runat="server" Width="100px" Height="30px"></dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Lugar Fisico"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtLugarFisico" runat="server" Width="100px" Height="30px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style7">
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Vida Util Meses"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtVidaUtilMeses" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                      <td class="auto-style8"></td>
                                     <td>
                                        <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Valor Compra Neto"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtValorCompraNeto" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style8"></td>
                                <%--    <td class="auto-style7">
                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Vida Util Transcurrida"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtVidaUtilTranscurrida" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>--%>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                     <%--   <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Valor Compra Neto"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtValorCompraNeto" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="C.Monet. Acumulada"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCmac" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="C.Monet. Eiercicio"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCmej" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Deprec. Acumulada"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtDepac" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="C.M.Dep.Acumulada"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCmda" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Deprec. Ejercicio"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtDepej" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Valor Final"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtValorFinalActivo" runat="server" Width="100px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>--%>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div style="margin-left: 70px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="40px" Width="100px" OnClick="btnGuardar_Click">
                                        <Image IconID="pdfviewer_import_svg_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                                <td class="auto-style6"></td>
                                <td class="auto-style9">
                                    <dx:ASPxButton ID="btnLimpiar" runat="server" Text="Limpiar Datos" Height="40px" Width="100px" OnClick="btnLimpiar_Click" CausesValidation="False">
                                        <Image IconID="dashboards_removedataitems_svg_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Height="40px" Width="100px" CausesValidation="False" OnClick="btnCancelar_Click">
                                        <Image IconID="outlookinspired_cancel_svg_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
