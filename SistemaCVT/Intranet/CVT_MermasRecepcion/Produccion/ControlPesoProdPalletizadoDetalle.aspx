<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ControlPesoProdPalletizadoDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.ControlPesoProdPalletizadoDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">CONTROL PESO PRODUCTO PALLETIZADO DETALLE</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">CONTROL PESO PRODUCTO PALLETIZADO DETALLE</span>
        <span class="tab-end"></span>        
        <div id="options">            
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;    
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDtalleControlPeso" KeyFieldName="Id_DetControlPesoPallet" OnRowInserting="GvDatos_RowInserting" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize" OnInit="GvDatos_Init">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>              
            </SettingsPopup>
              <toolbars >
                    <dx:GridViewToolbar Position="Top" Name="tools">
                        <items>
                            <dx:GridViewToolbarItem Command="New" Name="Nuevo" Image-Url="../Images/pn-add-source-copy.gif">
                                <image url="../Images/pn-add-source-copy.gif"></image>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Alignment="Left">
                                <template>
                                    <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                        <buttons>
                                            <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                        </buttons>
                                    </dx:ASPxButtonEdit>
                                </template>
                            </dx:GridViewToolbarItem>
                        </items>
                    </dx:GridViewToolbar>
                </toolbars>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_DetControlPesoPallet" ReadOnly="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_ContrPesoPallet" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoPallet" VisibleIndex="6">                  
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SSCC" VisibleIndex="7">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccionCorrectiva" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observaciones" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HoraPeso" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesTextEdit>
                        <MaskSettings Mask="H:mm" />
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="HoraTermPallet" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                    <PropertiesTextEdit>
                        <MaskSettings Mask="H:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SaldoPallet" VisibleIndex="9" Caption="Saldo ">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NLinea" VisibleIndex="8">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Merma" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDtalleControlPeso" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ControlPeso_ProductoPalletizado_Detalle" Where="Id_ContrPesoPallet == @Id_ContrPesoPallet">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_ContrPesoPallet" SessionField="ControlID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
