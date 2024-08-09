<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MantenedorEstadisticasdeVenta.aspx.cs" Inherits="CVT_MermasRecepcion.SAP.MantenedorEstadisticasdeVenta" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>SAP</a></li>
            <li><span id="current">Datos Estadisticas de Venta</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estadisticas de Venta</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>

        </div>
    </div>
    <br />
    <div style="padding:25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Año">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_ano" runat="server">
                        <Items>
                            <dx:ListEditItem Text="2015" Value="2015" />
                            <dx:ListEditItem Text="2016" Value="2016" />
                            <dx:ListEditItem Text="2017" Value="2017" />
                            <dx:ListEditItem Text="2018" Value="2018" />
                            <dx:ListEditItem Text="2019" Value="2019" />
                            <dx:ListEditItem Text="2020" Value="2020" />
                            <dx:ListEditItem Text="2021" Value="2021" />
                            <dx:ListEditItem Text="2022" Value="2022" />
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Mes">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_mes" runat="server">
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                            <dx:ListEditItem Text="8" Value="8" />
                            <dx:ListEditItem Text="9" Value="9" />
                            <dx:ListEditItem Text="10" Value="10" />
                            <dx:ListEditItem Text="11" Value="11" />
                            <dx:ListEditItem Text="12" Value="12" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>

            </tr>
            <tr>
                <td><dx:ASPxButton ID="ASPxButton1" runat="server" Text="Filtrar">
                </dx:ASPxButton></td>                
            </tr>
        </table>       
    </div>

    <br />
    <div>
            <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
        DataSourceID="LqDsEstadisticasVentas" KeyFieldName="ID" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
        <SettingsPager PageSize="100">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True"
                ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tipo" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha_Contab" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha_Venc" VisibleIndex="6">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Comp_Contable" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Num_Interno" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cod_Cliente" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Razon_Social" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Grupo_Producto" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nombre_Grupo_Producto" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="15">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="16">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Precio_Unitario" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Costo" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Total_Linea" VisibleIndex="19">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Indicador" VisibleIndex="20">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Procentaje_RAPEL" VisibleIndex="21">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Precio_Sin_Rapel" VisibleIndex="22">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Direccion_Envio" VisibleIndex="23">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Ciudad" VisibleIndex="24">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tipo_Venta" VisibleIndex="25">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Costo_Final" VisibleIndex="26">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Peso" VisibleIndex="27">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="28">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Canal" VisibleIndex="29">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tipo_Negocio" VisibleIndex="30">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="31">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Tipo_Marca" VisibleIndex="32">
            </dx:GridViewDataTextColumn>
        </Columns>
                <Styles>
                    <FocusedRow BackColor="#FF9933">
                    </FocusedRow>
                </Styles>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsEstadisticasVentas" runat="server"
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
        TableName="Estadistica_Ventas" EnableDelete="True"
        EnableUpdate="True" Where="Año == @Año &amp;&amp; Mes == @Mes">
        <WhereParameters>
            <asp:ControlParameter ControlID="cbo_ano" DefaultValue="1990" Name="Año" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="Mes" PropertyName="Value" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
        GridViewID="GvDatos">
    </dx:ASPxGridViewExporter>
    </div>

</asp:Content>
