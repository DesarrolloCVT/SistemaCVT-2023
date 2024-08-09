<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CargaAsistencia.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.TratoPorArea" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>RRHH</a></li>
            <li><span id="current">Areas Trato</span></li>
        </ul>
    </div>
    <br />
    <br />

    <div id="tableHeader">
        <span class="tableTitle">Carga Asistencia </span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;
           <%--   <a>
                     <asp:ImageButton ID="cmdNew"  runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click"/>Nuevo</a>--%>
        </div>
    </div>
    <br />
    <br />
    <br />

    <table>
        <tr>

            <td>
                <label>Seleccionar fecha del Documento</label>

                <dx:ASPxDateEdit ID="cb_fechaRegistro" runat="server">
                    <ValidationSettings ErrorDisplayMode="Text">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cb_fechaRegistro" ErrorMessage="Seleccionar fecha del Documento" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
    </table>
    <br />
    <br />
    <br />

    <table>
        <tr>
            <td>
                <asp:fileupload id="FileUpload1" runat="server" xmlns:asp="#unknown" validaterequestmode="Disabled" />
                <asp:button id="Button1" runat="server" text="Enviar Archivo" onclick="Button1_Click" xmlns:asp="#unknown" />
            </td>
            <td>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;<dx:ASPxButton ID="btn_ver" runat="server" Text="Ver Datos" OnClick="btn_ver_Click"></dx:ASPxButton>
                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>
                <dx:ASPxButton ID="bt_borrar" runat="server" Text="Borrar Archivo Con Errores" OnClick="bt_borrar_Click"></dx:ASPxButton>
            </td>
        </tr>


    </table>

    <br />
    <br />
    <br />

    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosRegistrados">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="0" Caption="Fecha Ingreso">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Rut" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Trabajador" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Ingreso" VisibleIndex="3" Caption="Fecha Ingreso">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Hrs_Turno" VisibleIndex="4" Caption="Hrs Turno">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valor_Pagar" VisibleIndex="5" Caption="Valor a Pagar">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <br />

    <asp:LinqDataSource ID="LqsDatosRegistrados" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_InformeValorizadoTratosxAsistencia" Where="Fecha_Ingreso == @Fecha_Ingreso">
        <WhereParameters>
            <asp:ControlParameter ControlID="cb_fechaRegistro" DefaultValue="01-01-1990" Name="Fecha_Ingreso" PropertyName="Value" Type="DateTime" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
    </asp:LinqDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
    </dx:ASPxGridViewExporter>

</asp:Content>
