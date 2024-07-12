<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InspeccionLentejaDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Inspecciones.InspeccionLentejaDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Inspeccion Lentejas Detalle</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Inspeccion Lentejas Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;
           <%-- <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsLentejasDetalle" KeyFieldName="Id_InspeccionPT_LentejaDetalle" OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../../Images/pn-add-source-copy.gif" >              
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
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

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionPT_LentejaDetalle" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionPT_Lenteja" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Granos Manchados" FieldName="GranosManchados" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Granos Quebrados" FieldName="GranosQuebrados" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Granos Arrugados" FieldName="GranosArrugados" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HoraAnalisis" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Linea" VisibleIndex="3">
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
                <dx:GridViewDataTextColumn FieldName="Impurezas" ShowInCustomizationForm="True" VisibleIndex="5" Caption="% Impurezas">
                    <PropertiesTextEdit HelpText="restos de hojas">
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MateriaExtranaAnimal" ShowInCustomizationForm="True" VisibleIndex="6" Caption="% Materia Extraña Animal">
                    <PropertiesTextEdit HelpText="Fecas de ratón e insectos">
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MateriaExtrana" ShowInCustomizationForm="True" VisibleIndex="7" Caption="% Materua Extraña">
                    <PropertiesTextEdit HelpText="restos de madera, plásticos, metales, piedras, etc">
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsLentejasDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_InspeccionPT_LentejaDetalle" Where="Id_InspeccionPT_Lenteja == @Id_InspeccionPT_Lenteja">
            <WhereParameters>
                <asp:SessionParameter Name="Id_InspeccionPT_Lenteja" SessionField="Id_InspeccionPT_Lenteja" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
