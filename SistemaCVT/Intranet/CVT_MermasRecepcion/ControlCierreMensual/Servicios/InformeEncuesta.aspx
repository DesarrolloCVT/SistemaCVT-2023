<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeEncuesta.aspx.cs" Inherits="CVT_MermasRecepcion.ControlCierreMensual.Servicios.InformeEncuesta" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 33px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <%--     <li><a>Control Cierre</a></li>--%>
            <li><span id="current">Control Cierre</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Encuesta</span>
        <span class="tab-end"></span>
        <%--     <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;
              <a>
          <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" />Nuevo</a>  </a> 
        </div>--%>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td><label>Mes</label></td>
                <td>
                    <dx:ASPxComboBox ID="cbo_Mes" runat="server">
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
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>Año</td>
                <td>
                    <dx:ASPxComboBox ID="cbo_ano" runat="server">
                        <Items>
                            <dx:ListEditItem Text="2019" Value="2019" />
                            <dx:ListEditItem Text="2020" Value="2020" />
                            <dx:ListEditItem Text="2021" Value="2021" />
                            <dx:ListEditItem Text="2022" Value="2022" />
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                            <dx:ListEditItem Text="2026" Value="2026" />
                        </Items>                     
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style1">Area</td>
                <td>
                    <dx:ASPxComboBox ID="cbo_area" runat="server" DataSourceID="LqsArea" TextField="Nombre" ValueField="Id_Area">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_ver" runat="server" Text="Ver informe" OnClick="btn_ver_Click">
                    </dx:ASPxButton>
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
                    <label>Resumen Por Aspecto</label>
                </td>
            </tr>
        </table>
        <br />

        <dx:ASPxGridView ID="GvDatosAspecto" runat="server" AutoGenerateColumns="False" DataSourceID="LqsResumenAspecto">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id_Area" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Aspecto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SumCalificaciones" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Promedio" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantRespuestas" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsResumenAspecto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_EncuestasResumenAspectos" Where="Año == @Año &amp;&amp; Mes == @Mes &amp;&amp; Id_Area == @Id_Area">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_ano" DefaultValue="1990" Name="Año" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_Mes" DefaultValue="0" Name="Mes" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_area" DefaultValue="0" Name="Id_Area" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <label>Resumen Por Preguntas</label>
                </td>
            </tr>
        </table>
        <br />
         <dx:ASPxGridView ID="GvDatospreguntas" runat="server" AutoGenerateColumns="False" DataSourceID="LqsResumenPreguntas">
             <Columns>
                 <dx:GridViewDataTextColumn FieldName="Id_Area" Visible="False" VisibleIndex="0">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="1">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Aspecto" VisibleIndex="2">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Id_Pregunta" VisibleIndex="3" Caption="ID Pregunta">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Pregunta" VisibleIndex="4">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="SumCalificaciones" VisibleIndex="5">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Promedio" VisibleIndex="6">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="CantRespuestas" VisibleIndex="7">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="8">
                 </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="9">
                 </dx:GridViewDataTextColumn>
             </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsResumenPreguntas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_EncuestasResumenPreguntas" Where="Año == @Año &amp;&amp; Mes == @Mes &amp;&amp; Id_Area == @Id_Area">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_ano" DefaultValue="1990" Name="Año" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_Mes" DefaultValue="0" Name="Mes" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_area" DefaultValue="0" Name="Id_Area" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <br />
    </div>
    <br />
    <div>
          <table>
            <tr>
                <td>
                    <label>Detalle Respuestas</label>
                </td>
            </tr>
        </table>
        <br />
        <dx:ASPxGridView ID="GvDatoRespuestas" runat="server" AutoGenerateColumns="False" DataSourceID="LqsResumenRespuestas">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id_Area" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Aspecto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Pregunta" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pregunta" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Calificacion" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
          </dx:ASPxGridView>
          <asp:LinqDataSource ID="LqsResumenRespuestas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_EncuestasDetalle" Where="Año == @Año &amp;&amp; Mes == @Mes &amp;&amp; Id_Area == @Id_Area">
              <WhereParameters>
                  <asp:ControlParameter ControlID="cbo_ano" DefaultValue="1990" Name="Año" PropertyName="Value" Type="Int32" />
                  <asp:ControlParameter ControlID="cbo_Mes" DefaultValue="0" Name="Mes" PropertyName="Value" Type="Int32" />
                  <asp:ControlParameter ControlID="cbo_area" DefaultValue="0" Name="Id_Area" PropertyName="Value" Type="Int32" />
              </WhereParameters>
          </asp:LinqDataSource>
    </div>
</asp:Content>
