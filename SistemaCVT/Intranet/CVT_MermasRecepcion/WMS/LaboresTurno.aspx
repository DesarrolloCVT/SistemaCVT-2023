<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="LaboresTurno.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.LaboresTurno" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler.Controls" TagPrefix="dxwschsc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            margin-top: 0px;
        }
        .auto-style6 {
            font-size: 12px;
        }
        .auto-style7 {
            height: 68px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Labores Turno</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Labores turno</span>
        <span class="tab-end"></span>
        
    </div>
    <div>
        <table>
            <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Turno"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cboBuscarTurno" runat="server">
                <Items>
                    <dx:ListEditItem Text="Dia" Value="1" />
                    <dx:ListEditItem Text="Tarde" Value="2" />
                </Items>
               </dx:ASPxComboBox>
            </td>
                <td>
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Fecha"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="dateBuscarFecha" runat="server">                
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" Text="BUSCAR" OnClick="btn_buscar_Click"></dx:ASPxButton>
            </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Informe"></dx:ASPxLabel>
                </td>
                <td>
                    <asp:ImageButton ID="btnInforme" runat="server" ImageUrl="~/Images/pdf.png" OnClick="btnInforme_Click" /></td>
            </tr>
        </table>

    </div>
    <table>
        <tr>
            <td>
            <dx:ASPxLabel ID="lblTurno" runat="server" Text="Turno"></dx:ASPxLabel>
            <dx:ASPxComboBox ID="cbTurno" runat="server">
                <Items>
                    <dx:ListEditItem Text="Dia" Value="1" />
                    <dx:ListEditItem Text="Tarde" Value="2" />
                </Items>
                <ValidationSettings ValidationGroup="CreaEnc">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
               </dx:ASPxComboBox>
            </td>
            <td>
            <dx:ASPxLabel ID="lblFecha" runat="server" Text="Fecha"></dx:ASPxLabel>
            <dx:ASPxDateEdit ID="dateFecha" runat="server">
                <ValidationSettings ValidationGroup="CreaEnc">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="btn_AgregarEnc" runat="server" Text="Crear" OnClick="btn_AgregarEnc_Click" ValidationGroup="CreaEnc"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="FOLIO:" Font-Bold="True" Font-Size="Large"></dx:ASPxLabel>
    <dx:ASPxLabel ID="lblFolio" runat="server" Font-Bold="True" Font-Size="Large"></dx:ASPxLabel>
    <br />
    <br />
    <div>
       <dx:ASPxLabel ID="lblDotacion" runat="server" Text="Dotacion"></dx:ASPxLabel>
    </div>
    <div>
       <table class="auto-style5">
            
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblLabVarias" runat="server" Text="Labores Varias"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblPlanta" runat="server" Text="Planta"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLabVariasP" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
                      
                </td>
                <td>
                    <dx:ASPxLabel ID="lblContratista" runat="server" Text="Contratista"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLabVarC" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblGrueros" runat="server" Text="Grueros"></dx:ASPxLabel>
                </td>
               <td>
                    <dx:ASPxTextBox ID="txtGruerosP" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
               <td>
                    <dx:ASPxTextBox ID="txtGruerosC" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
           </tr>
           <tr>
                <td>
                    <dx:ASPxLabel ID="lblApoyoPick" runat="server" Text="Apoyo Picking"></dx:ASPxLabel>
                </td>
               <td>
                    <dx:ASPxTextBox ID="txtApoPickP" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
               <td>
                    <dx:ASPxTextBox ID="txtApoPickC" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
           </tr>
           <tr>
                <td>
                    <dx:ASPxLabel ID="lblOtros" runat="server" Text="Otros"></dx:ASPxLabel>
                </td> 
               <td>
                    <dx:ASPxTextBox ID="txtOtrosP" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
               <td>
                    <dx:ASPxTextBox ID="txtOtrosC" runat="server" Width="30px" Height="30px" ></dx:ASPxTextBox>
               </td>
                <td class="auto-style7">    
                    <dx:ASPxLabel ID="lblObservOtros" runat="server" Text="Observacion"></dx:ASPxLabel>

                    <dx:ASPxMemo ID="txtObservDotacion" runat="server" Height="71px" Width="170px">
                    </dx:ASPxMemo>
                    
                 </td>
           </tr>
           <tr>
               <td>
                   <dx:ASPxLabel ID="lblInasistP" runat="server" Text="Inasistencia"></dx:ASPxLabel>
               </td>
                <td>
                    <dx:ASPxTextBox ID="txtInasistP" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
               <td>
                    <dx:ASPxTextBox ID="txtInasistC" runat="server" Width="30px" Height="30px" ></dx:ASPxTextBox>
               </td>
           </tr>
            <tr>
               <td>
                   <dx:ASPxLabel ID="lblAtrRet" runat="server" Text="Atrasos/Retiro anticipado"></dx:ASPxLabel>
               </td>
                <td>
                    <dx:ASPxTextBox ID="txtAtrRetP" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
               <td>
                    <dx:ASPxTextBox ID="txtAtrRetC" runat="server" Width="30px" Height="30px" ></dx:ASPxTextBox>
               </td>
           </tr>
        </table>
        <br />
        <br />    
        <div>
              <dx:ASPxLabel ID="txtDescargas" runat="server" Text="Descargas" AllowEllipsisInText="True"></dx:ASPxLabel>
        </div>
      </div>
    <div>
       
       <table class="auto-style5">
           <tr>
               <td>
                    <dx:ASPxLabel ID="lblCmnsTAnt" runat="server" Text="Camiones Turno Anterior"></dx:ASPxLabel>
               </td>
               <td>
                    <dx:ASPxLabel ID="lblCant" runat="server" Text="Cantidad"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCmnsTAnt" runat="server" Width="30px" Height="32px"></dx:ASPxTextBox>
               </td>
           </tr>
           <tr>
                <td>
                    <dx:ASPxLabel ID="lblCmnsLlegT" runat="server" Text="Camiones llegados turno"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtCmnsLlegT" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
                </td>
           </tr>
           <tr>
                <td>
                    <dx:ASPxLabel ID="lblCmnsDesc" runat="server" Text="Camiones Descargados"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtCmnsDesc" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
                </td>
           </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblCmnsPend" runat="server" Text="Camiones pendientes"></dx:ASPxLabel>
                </td>
               <td>
                    <dx:ASPxTextBox ID="txtCmnsPend" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
            </tr>
           
       </table>
        <br />
   </div>
    <div>
          <dx:ASPxLabel ID="lblDetalleRecep" runat="server" Text="Detalle Recepciones"></dx:ASPxLabel>
          <br />
          <br />
        <table>
            <tr>
                <td class="auto-style7">    
  
                   <dx:ASPxLabel ID="lblNrecepcion" runat="server" Text="N° Recepcion"></dx:ASPxLabel>
                    &nbsp;<dx:ASPxTextBox ID="txtNRecep" runat="server" Width="105px" Height="30px" >
                        <ValidationSettings ValidationGroup="agregarecep">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                 <td class="auto-style7">    
                    <dx:ASPxLabel ID="lblUbi" runat="server" Text="Ubicacion"></dx:ASPxLabel>
                    &nbsp;<dx:ASPxTextBox ID="txtUbicacion" runat="server" Width="105px" Height="30px" >
                         <ValidationSettings ValidationGroup="agregarecep">
                             <RequiredField IsRequired="True" />
                         </ValidationSettings>
                     </dx:ASPxTextBox>
                 </td>
                 <td class="auto-style7">    
                    <dx:ASPxLabel ID="lblObserv" runat="server" Text="Observacion"></dx:ASPxLabel>
                     <dx:ASPxMemo ID="txtObserv" runat="server" Height="71px" Width="170px">
                          <ValidationSettings ValidationGroup="agregarecep">
                             <RequiredField IsRequired="True" />
                         </ValidationSettings>
                     </dx:ASPxMemo>
                 </td>
                <td class="auto-style7">    
                    <dx:ASPxButton ID="btnAgregar" runat="server" Text="Agregar" Height="39px" Width="99px" OnClick="btnAgregar_Click" ValidationGroup="agregarecep" >
                     </dx:ASPxButton>
                </td>
            </tr>
        </table>
          <br />

          <dx:ASPxGridView ID="GvDetRecep" runat="server" AutoGenerateColumns="False" DataSourceID="LqDetRecep" KeyFieldName="Id_DetalleRecepciones">
                <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
              <Columns>
                  <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                  </dx:GridViewCommandColumn>
                  <dx:GridViewDataTextColumn FieldName="Id_DetalleRecepciones" ReadOnly="True" VisibleIndex="1">
                      <EditFormSettings Visible="False" />
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="ID_LaborTurno" VisibleIndex="2">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="OC" VisibleIndex="3">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Guia" VisibleIndex="4">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="NRecepcion" VisibleIndex="5">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Ubicacion" VisibleIndex="6">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Observaciones" VisibleIndex="7">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Productos" VisibleIndex="8">
                  </dx:GridViewDataTextColumn>
               </Columns>
          </dx:ASPxGridView>
          <asp:LinqDataSource ID="LqDetRecep" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_LaboresTurnoRecepciones" Where="ID_LaborTurno == @ID_LaborTurno" EnableDelete="True" EnableUpdate="True" EnableInsert="True">
              <WhereParameters>
                  <asp:SessionParameter DefaultValue="0" Name="ID_LaborTurno" SessionField="FolioLabor" Type="Int32" />
              </WhereParameters>
          </asp:LinqDataSource>
          <br />
          <br />
    </div>
    <div>   
         <dx:ASPxLabel ID="lblPedidos" runat="server" Text="Pedidos"></dx:ASPxLabel>
         <br />
        <br />
    </div>
        <div>
       <table class="auto-style5">
            
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblBajPed" runat="server" Text="Pedidos Bajados"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblCantBajPed" runat="server" Text="Cantidad"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantBajPed" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
                      
                </td>
                
            </tr>
           <tr>
                <td class="auto-style6">
                    Pedidos preparados</td>
               <td>
                    <dx:ASPxLabel ID="lblAp" runat="server" Text="AP"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtAp" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
               <td>
                   <dx:ASPxLabel ID="lblPicking" runat="server" Text="Picking"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPick" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
               </td>
                <td>
                    <dx:ASPxLabel ID="lblOtr" runat="server" Text="Otros"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtOtros" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
                </td>
           </tr>
           <tr>
               <td>
                   <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Observaciones Pedidos"></dx:ASPxLabel>
                   <dx:ASPxMemo ID="txtObsPedidos" runat="server" Height="71px" Width="170px"></dx:ASPxMemo>
               </td>
           </tr>
           <tr>
                <td>
                    <dx:ASPxLabel ID="lblCmnsCarg" runat="server" Text="Camiones cargados"></dx:ASPxLabel>
                </td>
               <td>
                    <dx:ASPxLabel ID="lblPl" runat="server" Text="Planta"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPlanta" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
                </td>
               <td>
                    <dx:ASPxLabel ID="lblExt" runat="server" Text="Externo"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtExt" runat="server" Width="30px" Height="30px"></dx:ASPxTextBox>
                </td>
              
           </tr>
           <tr>
               <td>
                   <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Observaciones Carga Camiones"></dx:ASPxLabel>
                   <dx:ASPxMemo ID="txtObsCargaCam" runat="server" Height="71px" Width="170px"></dx:ASPxMemo>
               </td>
           </tr>
       </table>
    </div>
        <br />
    <div>   
        <dx:ASPxLabel ID="lblLabores" runat="server" Text="Labores / Novedades"></dx:ASPxLabel>
    </div>
    <div>  
        <br />
        <table>
        <tr>
                <td class="auto-style6">
                    &nbsp;</td>
               <td>
            <dx:ASPxLabel ID="lblTipoObserv" runat="server" Text="Tipo"></dx:ASPxLabel>
            <dx:ASPxComboBox ID="cbTipoObserv" runat="server">
                <Items>
                    <dx:ListEditItem Text="Labor" Value="1" />
                    <dx:ListEditItem Text="Novedad" Value="2" />
                </Items>
                <ValidationSettings ValidationGroup="AgregaLabor">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
               </dx:ASPxComboBox>
            </td>
            <td class="auto-style7">    
                    <dx:ASPxLabel ID="lblObservLab" runat="server" Text="Observacion"></dx:ASPxLabel>
                <dx:ASPxMemo ID="txtObservLab" runat="server" Height="71px" Width="170px">
                    <ValidationSettings ValidationGroup="AgregaLabor">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                </dx:ASPxMemo>
                    
                 </td>
               
                 <td>    
                    <dx:ASPxButton ID="btnAgregarLab" runat="server" Text="Agregar" Height="39px" Width="99px" OnClick="btnAgregarLab_Click" ValidationGroup="AgregaLabor">
                     </dx:ASPxButton>
                </td>
          </tr>
       </table>
        <dx:ASPxGridView ID="GvLabores" runat="server" AutoGenerateColumns="False" DataSourceID="LqLabTurnoDet" KeyFieldName="Id_Labores">
                <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
              <Columns>
                  <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                  </dx:GridViewCommandColumn>
                  <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="2">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataComboBoxColumn FieldName="Tipo" VisibleIndex="1">
                      <PropertiesComboBox DataSourceID="LqLabTurnoDet" ValueField="Id_Labores">
                          <Items>
                              <dx:ListEditItem Text="Labor" Value="1" />
                              <dx:ListEditItem Text="Novedad" Value="2" />
                          </Items>
                      </PropertiesComboBox>
                  </dx:GridViewDataComboBoxColumn>
              </Columns>
          </dx:ASPxGridView>
    &nbsp;
        <asp:LinqDataSource ID="LqLabTurnoDet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_LaboresTurnoDetalle" Where="ID_LaborTurno == @ID_LaborTurno" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_LaborTurno" SessionField="FolioLabor" Type="Int32" />
            </WhereParameters>
          </asp:LinqDataSource>
        <br />
        
                <div>
                    <div>
                        <div style="margin-left: 30px">
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Subir Archivo " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                            </div>
                            <dx:ASPxUploadControl ID="FileUpload1" runat="server" Width="400px" Height="80px" OnFileUploadComplete="FileUpload1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Theme="iOS" AddUploadButtonsHorizontalPosition="Center" UploadMode="Auto">
                                <ValidationSettings MaxFileSize="4194304" MaxFileSizeErrorText="Excede el tamaño maximo, which is {0} bytes" GeneralErrorText="Excede el tamaño maximo">
                                </ValidationSettings>
                                <ClientSideEvents FileUploadComplete="function(s, e) {
}" />
                                <UploadButton Text="Subir archivo">
                                    <Image IconID="pdfviewer_previous_svg_32x32">
                                    </Image>
                                </UploadButton>
                                <AdvancedModeSettings PacketSize="4194304" EnableFileList="True" EnableMultiSelect="True">
                                </AdvancedModeSettings>
                            </dx:ASPxUploadControl>
                        </div>
                        <br />
                        <div>
                            <div>
                                <dx:ASPxButton ID="btnRecargaGrilla" runat="server" Text="Recargar Vista" Height="47px" Theme="Material" Width="199px" OnClick="btnRecargaGrilla_Click"></dx:ASPxButton>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div>
                        <dx:ASPxGridView ID="GvDatosAdj" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRutaAdjunto" KeyFieldName="Id_RutaArchivoLabores" OnRowCommand="GvDatosAdj_RowCommand" Theme="Aqua" Width="450px" OnRowDeleting="GvDatosAdj_RowDeleting">
                            <SettingsBehavior ConfirmDelete="True" />
                            <SettingsPopup>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="ID_LaborTurno" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="RutaArchivo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataHyperLinkColumn Caption="Archivos" VisibleIndex="5" Width="25px">
                                    <PropertiesHyperLinkEdit>
                                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                                            </Style>
                                    </PropertiesHyperLinkEdit>
                                    <EditFormSettings Visible="False" />
                                    <DataItemTemplate>
                                        <asp:ImageButton ID="archivosHistorial" CommandName="cmdArchivosHistorial" runat="server" ImageUrl="~/Images/descargar.png" />
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataHyperLinkColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreArchivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Extension" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Id_RutaArchivoLabores" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:LinqDataSource ID="LqsRutaAdjunto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_LaboresArchivos" Where="ID_LaborTurno == @ID_LaborTurno" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                            <WhereParameters>
                                <asp:SessionParameter DefaultValue="0" Name="ID_LaborTurno" SessionField="FolioLabor" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                </div>
 
    </div>
        <div>
            <dx:ASPxButton ID="btn_Guardar" runat="server" Text="GUARDAR" OnClick="btn_Guardar_Click"></dx:ASPxButton>
        </div>

</asp:Content>
