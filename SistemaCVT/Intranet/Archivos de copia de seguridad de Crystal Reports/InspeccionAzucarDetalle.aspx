<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InspeccionAzucarDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Inspecciones.InspeccionAzucarDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 17px;
        }

        .auto-style6 {
            width: 79px;
        }

        .auto-style7 {
            width: 16px;
        }

        .auto-style8 {
            width: 15px;
        }

        .auto-style9 {
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Inspeccion Azucar Detalle</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Inspeccion Azucar Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;
         <%--   <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsAzucarDetalle" KeyFieldName="Id_InspeccionPT_AzucarDetalle" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdated="GvDatos_RowUpdated" OnRowUpdating="GvDatos_RowUpdating">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
                     <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionPT_AzucarDetalle" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionPT_Azucar" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HoraAnalisis" VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Linea" VisibleIndex="2">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Impuresas" VisibleIndex="4">
                    <PropertiesComboBox HelpText="restos de hojas">
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="MateriaExtranaAnimal" VisibleIndex="5">
                    <PropertiesComboBox HelpText="Fecas de ratón e insectos">
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="MateriaExtrana" VisibleIndex="6">
                    <PropertiesComboBox HelpText="restos de madera, plásticos, metales, piedras, etc">
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="observacion" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsAzucarDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_InspeccionPT_AzucarDetalle" Where="Id_InspeccionPT_Azucar == @Id_InspeccionPT_Azucar">
            <WhereParameters>
                <asp:SessionParameter Name="Id_InspeccionPT_Azucar" SessionField="Id_InspeccionPT_Azucar" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popInsAzucarDetalle" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="380px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Hora Analisis"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtHora" runat="server" Width="80px">
                                            <MaskSettings Mask="HH:mm" />
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style9"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Linea"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboLinea" runat="server" ValueType="System.String" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Text="1" Value="1" />
                                                <dx:ListEditItem Text="2" Value="2" />
                                                <dx:ListEditItem Text="3" Value="3" />
                                                <dx:ListEditItem Text="4" Value="4" />
                                                <dx:ListEditItem Text="5" Value="5" />
                                                <dx:ListEditItem Text="6" Value="6" />
                                                <dx:ListEditItem Text="7" Value="7" />
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
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Impuresas"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboImpuresas" runat="server" ValueType="System.String" HelpText="Restos De Hojas" SelectedIndex="1" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Text="SI" Value="1" />
                                                <dx:ListEditItem Selected="True" Text="NO" Value="2" />
                                            </Items>
                                            <HelpTextSettings DisplayMode="Popup">
                                            </HelpTextSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Materia Extrana Animal"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboMateriaAnimal" runat="server" ValueType="System.String" HelpText="Fecas de Ratón e Insectos" SelectedIndex="1" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Text="SI" Value="1" />
                                                <dx:ListEditItem Selected="True" Text="NO" Value="2" />
                                            </Items>
                                            <HelpTextSettings DisplayMode="Popup">
                                            </HelpTextSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style8"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Materia Extrana"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboMateriaExtrana" runat="server" ValueType="System.String" HelpText="Restos De Madera ,Plásticos,metales,piedras,etc." SelectedIndex="1" Width="70px">
                                            <Items>
                                                <dx:ListEditItem Text="SI" Value="1" />
                                                <dx:ListEditItem Selected="True" Text="NO" Value="2" />
                                            </Items>
                                            <HelpTextSettings DisplayMode="Popup">
                                            </HelpTextSettings>
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
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Observacion"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtObservacion" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Theme="iOS"></dx:ASPxButton>
                        </div>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
