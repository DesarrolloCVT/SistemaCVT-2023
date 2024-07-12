<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Respuesta.aspx.cs" Inherits="CVT_MermasRecepcion.Respuesta" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx1" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a href="Contacto.aspx">Contacto</a></li>
            <li><span id="current">Responder</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Responder</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>

        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Escriba su respuesta al tiquet N°: " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblFolio" runat="server" Text="" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <br />

    <div style="margin-left: 30px">
        <dx:ASPxMemo ID="txtRespuesta" runat="server" Height="200px" Width="500px">
            <ValidationSettings>
                <RequiredField IsRequired="True" />
            </ValidationSettings>
        </dx:ASPxMemo>
        <%--  <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Height="100px" Width="356px" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox>--%>
    </div>

    <%--    <div style="margin-left:50px">
        <dx:ASPxHtmlEditor ID="htmlRespuesta" runat="server" Theme="iOS">
            <Settings AllowHtmlView="False" AllowPreview="False">
            </Settings>
<SettingsHtmlEditing>
<PasteFiltering Attributes="class"></PasteFiltering>
</SettingsHtmlEditing>
        </dx:ASPxHtmlEditor>
    </div>--%>
    <br />
    <br />
    <div runat="server" id="divUpload">
        <div style="margin-left: 30px">
            <asp:Label ID="Label4" runat="server" Text="Adjuntar Archivo" Font-Size="Medium"></asp:Label><asp:Label ID="Label5" runat="server" Text=" (Captura de pantalla,Video,Archivo, etc.)"></asp:Label>
        </div>
        <br />
        <div style="margin-left: 30px">
            <dx:ASPxUploadControl ID="FileUpload1" runat="server" Width="293px" Height="71px" OnFileUploadComplete="FileUpload1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Theme="iOS">
                <ValidationSettings MaxFileSize="4194304" MaxFileSizeErrorText="Excede el tamaño maximo, which is {0} bytes" GeneralErrorText="Excede el tamaño maximo">
                </ValidationSettings>
                <AdvancedModeSettings PacketSize="4194304">
                </AdvancedModeSettings>
            </dx:ASPxUploadControl>
            <%--<asp:FileUpload ID="FileUpload1" runat="server" />--%>
        </div>

        <div style="margin-left: 50px">
            <dx:ASPxButton ID="btnSubir" runat="server" Text="Documentos Adjuntos" OnClick="btnSubir_Click" Height="31px" Width="179px" Theme="iOS" CausesValidation="False"></dx:ASPxButton>
        </div>
        <div style="margin-left: 50px">
            <dx:ASPxGridView ID="GvAdjunto" runat="server" AutoGenerateColumns="False" DataSourceID="LqsAdjuntos" KeyFieldName="Id_AdjTicketResp" Theme="Office2010Silver" OnRowDeleting="GvAdjunto_RowDeleting">
                <SettingsCommandButton>
                    <DeleteButton>
                        <Image Url="~/Images/delete2.png">
                        </Image>
                    </DeleteButton>
                </SettingsCommandButton>
                <SettingsText CommandDelete=" " />
                <Columns>
                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Id_AdjuntoTicket" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Id_Ticket" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Ruta" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Extencion" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqsAdjuntos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Ticket_AdjuntoRespuesta" Where="Id_RespTiquet == @Id_RespTiquet" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                <WhereParameters>
                    <asp:SessionParameter DefaultValue="0" Name="Id_RespTiquet" SessionField="IdRespuesta" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </div>
    </div>

    <br />
    <div style="margin-left: 50px">
        <asp:Label ID="Label1" runat="server" Text="Cerrar Ticket" Font-Size="Medium" Font-Bold="true"></asp:Label>
        <asp:CheckBox ID="chckCerrarTicket" runat="server" />
    </div>
    <br />
    <div style="margin-left: 150px">
        <dx:ASPxButton ID="btnEnviarRespuesta" runat="server" Text="Enviar Respuesta" Height="36px" Width="163px" Theme="iOS" OnClick="btnEnviarRespuesta_Click"></dx:ASPxButton>
    </div>
</asp:Content>
