<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ControlAseoDiarioPT.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.ControlAseoDiarioPT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Aseo Diario</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle" id="lblti" runat="server">Aseo Diario</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" OnClick="cmdNew_Click" Height="38px" Width="86px" />
                </a>&nbsp; 
            &nbsp; 
            &nbsp; 
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>

        </div>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsControlAseoDiario" KeyFieldName="id_AseoDiarioPT" OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm Width="700px">
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id_AseoDiarioPT" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaVerificacion" VisibleIndex="3">
                    <PropertiesDateEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Observaciones" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Verificador" VisibleIndex="4">
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
                <dx:GridViewDataComboBoxColumn FieldName="BarridoPisoSala" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="CUMPLE" Value="1" />
                            <dx:ListEditItem Text="NO CUMPLE" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SoplarMaquina" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="CUMPLE" Value="1" />
                            <dx:ListEditItem Text="NO CUMPLE" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SacosDeBarrido" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="CUMPLE" Value="1" />
                            <dx:ListEditItem Text="NO CUMPLE" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="PesadosAmarrados" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="CUMPLE" Value="1" />
                            <dx:ListEditItem Text="NO CUMPLE" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SacosReenvasado" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="CUMPLE" Value="1" />
                            <dx:ListEditItem Text="NO CUMPLE" Value="2" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsControlAseoDiario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_AseoDiario" Where="ID_ControlEnvPT == @ID_ControlEnvPT">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_ControlEnvPT" SessionField="IdControlEnvPT" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPersonal" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Personal">
        </asp:LinqDataSource>

    </div>
    <div>
        <dx:ASPxPopupControl ID="popAseoDiarioPT" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Theme="iOS" Width="500px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div style="margin-left:30px">
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Verificador" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboVerificador" runat="server" ValueType="System.String" DataSourceID="LqsPersonal0" ValueField="Id_Personal">
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
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fech.Verificacion" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteFechVerificacion" runat="server"></dx:ASPxDateEdit>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Barrido Piso Sala" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboBarridoPisoSala" runat="server" ValueType="System.String" SelectedIndex="0">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Cumple" Value="1" />
                                                <dx:ListEditItem Text="No Cumple" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Soplar Maquina" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSoplarMaquina" runat="server" ValueType="System.String" SelectedIndex="0">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Cumple" Value="1" />
                                                <dx:ListEditItem Text="No Cumple" Value="2" />
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
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Sacos de Barrido" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSacosdeBarrido" runat="server" ValueType="System.String" SelectedIndex="0">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Cumple" Value="1" />
                                                <dx:ListEditItem Text="No Cumple" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                 <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Pesados y Amarrados" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboPesadosAmarrados" runat="server" ValueType="System.String" SelectedIndex="0">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Cumple" Value="1" />
                                                <dx:ListEditItem Text="No Cumple" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Sacos Reenvasados" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSacosReenvasados" runat="server" ValueType="System.String" SelectedIndex="0">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="Cumple" Value="1" />
                                                <dx:ListEditItem Text="No Cumple" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                         <td>
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Observaciones" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                         <dx:ASPxMemo ID="MeObservaciones" runat="server" Height="71px" Width="170px"></dx:ASPxMemo>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left:145px">
                            <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Theme="iOS" OnClick="btnGuardar_Click"></dx:ASPxButton>
                        </div>
                    </div>
                    <asp:LinqDataSource ID="LqsPersonal0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Personal">
                    </asp:LinqDataSource>
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
