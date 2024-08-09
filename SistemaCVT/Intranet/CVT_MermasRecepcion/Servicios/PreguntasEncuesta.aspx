<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PreguntasEncuesta.aspx.cs" Inherits="CVT_MermasRecepcion.Servicios.PreguntasEncuesta" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Servicios</a></li>
            <li><span id="current">Peguntas Encuesta</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Peguntas Encuesta</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a><asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px" /> Exportar Excel</a>&nbsp;
              <a>   --%>
     <%--       <asp:ImageButton ID="cmdNew" runat="server"
                ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px;" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <table>
        <tr>
            <td class="auto-style1">
                <label>Area</label></td>
            <td class="auto-style1">
                <dx:ASPxComboBox ID="cb_Area" runat="server" ValueType="System.Int32" DataSourceID="LqsArea" TextField="Nombre" ValueField="Id_Area"></dx:ASPxComboBox>

            </td>
            <td class="auto-style1">
                <dx:ASPxButton ID="Ver" runat="server" Text="Ver Preguntas" OnClick="Ver_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPreguntas" KeyFieldName="Id_Pregunta" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />                        
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
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Pregunta" ReadOnly="True" VisibleIndex="1" Caption="ID">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pregunta" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="Id_Area" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsArea" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Aspecto" FieldName="Id_AspectoPregunta" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsAspectoPregunta" TextField="Aspecto" ValueField="Id_AspectoPregunta">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoPregunta" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Satisfaccion" Value="1" />
                            <dx:ListEditItem Text="Si/No" Value="2" />
                            <dx:ListEditItem Text="Texto Libre" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPreguntas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PreguntaEncuesta" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="Id_Area == @Id_Area">
            <WhereParameters>
                <asp:ControlParameter ControlID="cb_Area" DefaultValue="0" Name="Id_Area" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsAspectoPregunta" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AspectoPreguntas">
        </asp:LinqDataSource>
    </div>


</asp:Content>
