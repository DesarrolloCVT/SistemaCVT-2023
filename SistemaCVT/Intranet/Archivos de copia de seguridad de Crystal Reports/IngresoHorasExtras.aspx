<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IngresoHorasExtras.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.IngresoHorasExtras" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            width: 13px;
        }

        .auto-style7 {
            width: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>RRHH</a></li>
            <li><span id="current">Ingreso Horas Extras</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Ingreso Horas Extras</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" Style="width: 20px" />
                Exportar Excel</a>


        </div>
    </div>
    <br />
    <div style="margin-left: 20px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Empleado">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_empleado" runat="server" DataSourceID="LqDsEmpleados"
                        ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn FieldName="pin" Caption="run">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="name" Caption="nombre">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="last_name" Caption="apellido">
                            </dx:ListBoxColumn>
                        </Columns>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha">
                    </dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="cb_fecha" runat="server">
                    </dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Hora">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_hora" runat="server" Width="59px" Height="25px">
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Min">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_min" runat="server" Width="59px" Height="25px">
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="100%">
                    </dx:ASPxLabel>
                    <dx:ASPxCheckBox ID="chk_100" runat="server">
                    </dx:ASPxCheckBox>
                </td>
                <td class="auto-style7"></td>
                <td>
                    <dx:ASPxButton ID="btn_agregar" runat="server" Text="Agregar"
                        OnClick="btn_agregar_Click">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>

        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsDatosPersonal" KeyFieldName="ExcesoHE_Id"
            OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting">
            <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ExcesoHE_Id" ReadOnly="True"
                    Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Empleado" FieldName="Empleado_Id"
                    VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsEmpleados" ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn FieldName="pin" Caption="Rut">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="name" Caption="Nombre">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="last_name" Caption="Apellido">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTimeEditColumn FieldName="Horas" VisibleIndex="4">
                    <PropertiesTimeEdit DisplayFormatString="">
                    </PropertiesTimeEdit>
                </dx:GridViewDataTimeEditColumn>
                <dx:GridViewDataCheckColumn FieldName="HE_100" VisibleIndex="5">
                </dx:GridViewDataCheckColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsDatosPersonal" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EntityTypeName="" TableName="CVT_HorasExtras" EnableDelete="True"
            EnableInsert="True" EnableUpdate="True"
            OrderBy="Fecha desc, ExcesoHE_Id desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsEmpleados" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EntityTypeName="" TableName="CVT_VW_PERSONAS_TORNIQUETE">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>

