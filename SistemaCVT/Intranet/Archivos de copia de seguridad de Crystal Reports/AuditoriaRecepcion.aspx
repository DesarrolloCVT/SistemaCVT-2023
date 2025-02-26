﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AuditoriaRecepcion.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.AuditoriaRecepcion" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
 <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>WMS</a></li>
        <li><span id="current">Recepcion</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Auditoria Recepcion</span>
    <span class="tab-end"></span>
</div>
<div>

                <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LqDSAuditoria" KeyFieldName="Id_Auditoria" 
                    onrowupdating="GvDatos_RowUpdating" EnablePagingGestures="False">
                    <SettingsPager PageSize="100" EnableAdaptivity="True">
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm">
                    </SettingsEditing>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPopup>
                        <CustomizationWindow HorizontalAlign="WindowCenter" 
                            VerticalAlign="WindowCenter" />
                    </SettingsPopup>
                    <EditFormLayoutProperties RequiredMarkDisplayMode="None">
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="Id_Auditoria" VisibleIndex="1" 
                            Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Reception_Id" 
                            VisibleIndex="2" Caption="Recepcion">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Id" 
                            VisibleIndex="3" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Layout_Id" 
                            VisibleIndex="4" Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Layout_Description" 
                            VisibleIndex="5" Caption="Posicion">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_SSCC" 
                            VisibleIndex="6" Caption="SSCC">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ArticleProvider_CodClient" 
                            VisibleIndex="7" Caption="Cod. Producto">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ArticleProvider_Description" 
                            VisibleIndex="8" Caption="Producto">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Gruero_Asignado_1" VisibleIndex="9" 
                            Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Gruero_Asig_1" VisibleIndex="10" 
                            Caption="Gruero Asignado">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Gruero_Asignado_2" VisibleIndex="11" 
                            Caption="Gruero Asignado 2">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Recepcionista" VisibleIndex="12" 
                            Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Recepcionista" FieldName="Staff_Name" 
                            VisibleIndex="13">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="14" 
                            Caption="Cierre Recepcion">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="17">
                            <EditFormSettings Caption="Comentario" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="18" 
                            Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Fecha_Auditoria" VisibleIndex="19" 
                            Visible="False">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataCheckColumn FieldName="Posicionamiento" VisibleIndex="15">
                            <EditFormSettings Caption="Posicionamiento" />
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataCheckColumn FieldName="Rotulado" VisibleIndex="16">
                            <EditFormSettings Caption="Rotulado" />
                        </dx:GridViewDataCheckColumn>
                    </Columns>
                    <Styles>
                        <FocusedRow BackColor="#FF9933">
                        </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDSAuditoria" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableUpdate="True" 
                    EntityTypeName="" TableName="CVT_VW_AuditoriaRecepcion">
                </asp:LinqDataSource>

</div>
</asp:Content>

