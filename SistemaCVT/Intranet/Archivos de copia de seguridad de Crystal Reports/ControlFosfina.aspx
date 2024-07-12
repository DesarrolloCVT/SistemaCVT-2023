<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ControlFosfina.aspx.cs" Inherits="CVT_MermasRecepcion.PRiesgo.ControlFosfina" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 39px;
        }
        .auto-style6 {
            height: 39px;
            width: 15px;
        }
        .auto-style7 {
            height: 39px;
            width: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
      <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Prevencion de Riesgos</a></li>
            <li><span id="current">Control Fosfina</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Control Fosfina</span>
        <span class="tab-end"></span>
        <%--       <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <br />

    <div>
        <table>
            <tr>
                <td class="auto-style5">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="fInicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style7"></td>
                <td class="auto-style5">
                     <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="fTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style5">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="41px" Theme="MaterialCompact" Width="95px" OnClick="btnBuscar_Click">
                        <Image IconID="functionlibrary_lookupreference_16x16">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left:100px">
        <dx:ASPxButton ID="btnInforme" runat="server" Text="Ver Informe" OnClick="btnInforme_Click" Theme="iOS">
            <Image IconID="export_exporttopdf_16x16">
            </Image>
        </dx:ASPxButton>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsControlFosfina" KeyFieldName="IdControlFosfina">
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="IdControlFosfina" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaReg" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Hora" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaFumigacion" VisibleIndex="4">
                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MayorPPM" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DistanciaFumigacion" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="A1_A2" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="A1" Value="A1" />
                            <dx:ListEditItem Text="A2" Value="A2" />
                            <dx:ListEditItem Text="N/A" Value="N/A" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsControlFosfina" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_CONTROL_FOSFINA" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="FechaReg desc" Where="FechaReg &gt;= @FechaReg &amp;&amp; FechaReg &lt;= @FechaReg1">
            <WhereParameters>
                <asp:ControlParameter ControlID="fInicio" DefaultValue="01-01-1990" Name="FechaReg" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="fTermino" DefaultValue="01-01-1990" Name="FechaReg1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
