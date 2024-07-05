<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FormularioEntregaCelulares.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.FormularioEntregaCelulares" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }

        .auto-style6 {
            width: 25px;
        }

        .auto-style7 {
            width: 30px;
        }

        .auto-style8 {
            width: 517px;
        }
        .auto-style9 {
            width: 35px;
        }
        .auto-style10 {
            width: 36px;
            height: 31px;
        }
        .auto-style11 {
            height: 31px;
        }
        .auto-style12 {
            width: 20px;
            height: 31px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Entrega Celulares</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Entrega Celulares</span>
        <span class="tab-end"></span>
        <%--  <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="height: 16px;" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxComboBox ID="cboUsuario" runat="server" DataSourceID="LqsPersonalAsignado" AutoPostBack="True" OnSelectedIndexChanged="cboUsuario_SelectedIndexChanged" ValueField="USERID" Width="283px" Height="30px" NullText="Seleccionar">
                        <Columns>
                            <dx:ListBoxColumn Caption="Run" FieldName="Badgenumber">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="Name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Apellido" FieldName="lastname">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>

                </td>

            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Area:" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblArea" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>

                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Linea N°: " Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="lblNlinea" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Dispositivo:" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblDispositivo" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style9"></td>
                <td>
                    <dx:ASPxLabel ID="lblVerificado" runat="server" Text="" Font-Size="Large" Font-Bold="true" ForeColor="Red"></dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td class="auto-style11">
                    <dx:ASPxLabel ID="lblAreaRF" runat="server" Text="Area:" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style11">
                    <dx:ASPxLabel ID="labelAreaRF" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style12"></td>
                <td class="auto-style11">

                    <dx:ASPxLabel ID="lblModeloRF" runat="server" Text="Modelo: " Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style11"></td>
                <td class="auto-style11">
                    <dx:ASPxLabel ID="labelModeloRF" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style12"></td>

                <td class="auto-style11">
                    <dx:ASPxLabel ID="lblDispoRF" runat="server" Text="Dispositivo:" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style11">
                    <dx:ASPxLabel ID="labelDispoRF" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td class="auto-style10"></td>
                <td class="auto-style11">
                    <dx:ASPxLabel ID="lblVerificadoRF" runat="server" Text="" Font-Size="Large" Font-Bold="true" ForeColor="Red"></dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxLabel ID="labelTipoForm" runat="server" Text="Formulario para:" Font-Size="X-Large" Font-Bold="true"></dx:ASPxLabel>
    </div>
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <%--   <asp:Label ID="lblOp1RF" runat="server" Text=""></asp:Label>
                    <asp:RadioButton ID="rdOp1RF" runat="server" />
                    
                    <asp:Label ID="lblOp2RF" runat="server" Text=""></asp:Label>
                    <asp:RadioButton ID="rdOp2RF" runat="server" />--%>

                    <dx:ASPxRadioButtonList ID="rbtOpcionRFQ" runat="server" ValueType="System.String" Visible="False" Height="71px" Width="234px" Font-Size="Medium" Font-Bold="true">
                        <RadioButtonStyle Font-Size="Medium">
                        </RadioButtonStyle>
                    </dx:ASPxRadioButtonList>
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
               <%-- <td class="auto-style6"></td>--%>
                <td class="auto-style8">
                    <asp:CheckBox ID="chkCableDatos" runat="server" Text="Cable Datos USB" TextAlign="Left" />
                </td>              

            </tr>
        </table>
    </div>
    <br />

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
    <br />
    <div style="margin-left: 50px">
        <table>
          <tr>
              <td>
                  <asp:Label ID="Label1" runat="server" Text="desde"></asp:Label>
                  <dx:ASPxDateEdit ID="dteDesde" runat="server"></dx:ASPxDateEdit>
              </td>
              <td class="auto-style7">

              </td>
              <td>
                  <asp:Label ID="Label2" runat="server" Text="desde"></asp:Label>
                  <dx:ASPxDateEdit ID="dteHasta" runat="server"></dx:ASPxDateEdit>
              </td>
          </tr>
        </table>
    </div>
    <br />

    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtOtros" runat="server" Width="319px" Height="30px" NullText="Otros" Theme="iOS"></dx:ASPxTextBox>
                </td>
                <td class="auto-style7"></td>
                <td>
                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="36px" OnClick="btnGuardar_Click" Theme="iOS"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBControlAccesoDataContext" Select="new (USERID, Badgenumber, Name, lastname)" TableName="USERINFO" EntityTypeName="" ID="LqsPersonalAsignado">
    </asp:LinqDataSource>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosEntregaCelulares" KeyFieldName="ID_FormEntregaCelulares" OnRowCommand="GvDatos_RowCommand">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_FormEntregaCelulares" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NLinea" VisibleIndex="4" Caption="N° linea">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="8">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IMEI" VisibleIndex="9">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="CajaOriginal" VisibleIndex="10">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="TarjetaSIM" VisibleIndex="11">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="CargadorBateria" VisibleIndex="12">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="TarjetaMicroSD" VisibleIndex="13" Caption="Micro SD">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="Auriculares" VisibleIndex="14">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="Carcasa" VisibleIndex="15">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="CableDatosUSB" VisibleIndex="16">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="LaminaVidrio" VisibleIndex="17" Caption="Lamina">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Otro" VisibleIndex="18" Caption="Otros">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Entrega" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="TipoDispo" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="idUsuario" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsPersonalAsignado0" ValueField="USERID">
                        <Columns>
                            <dx:ListBoxColumn Caption="RUT" FieldName="Badgenumber">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="NOMBRE" FieldName="Name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="APELLIDO" FieldName="lastname">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Marca" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="lqsMarca7" TextField="MARCA" ValueField="ID">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="Formulario" VisibleIndex="19">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdDetallePdf" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Hasta" VisibleIndex="6">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosEntregaCelulares" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" OrderBy="ID_FormEntregaCelulares desc" TableName="CVT_INF_FORM_EntregaCelulares" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>
        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBControlAccesoDataContext" Select="new (USERID, Badgenumber, Name, lastname)" TableName="USERINFO" EntityTypeName="" ID="LqsPersonalAsignado0">
        </asp:LinqDataSource>
        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_INF_MARCA" EntityTypeName="" ID="lqsMarca7">
        </asp:LinqDataSource>
    </div>
</asp:Content>
