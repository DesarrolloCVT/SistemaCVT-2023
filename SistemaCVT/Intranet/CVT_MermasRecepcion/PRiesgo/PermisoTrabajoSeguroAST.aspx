<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PermisoTrabajoSeguroAST.aspx.cs" Inherits="CVT_MermasRecepcion.PRiesgo.PermisoTrabajoSeguroAST" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Prevencion de Riesgos</a></li>
            <li><span id="current">Permiso Trabajo Seguro AST</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Permiso Trabajo Seguro AST</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" />
                volver</a>&nbsp;
         <%--   <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <br />

    <div style="margin-left: 30px">       
        <div>
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Subir Archivo AST" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
        </div>
        <dx:ASPxUploadControl ID="FileUpload1" runat="server" Width="400px" Height="80px" OnFileUploadComplete="FileUpload1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Theme="iOS" AddUploadButtonsHorizontalPosition="Center">
            <ValidationSettings MaxFileSize="4194304" MaxFileSizeErrorText="Excede el tamaño maximo, which is {0} bytes" GeneralErrorText="Excede el tamaño maximo">
            </ValidationSettings>
            <UploadButton Text="Subir PTS">
                <Image IconID="pdfviewer_previous_svg_32x32">
                </Image>
            </UploadButton>
            <AdvancedModeSettings PacketSize="4194304">
            </AdvancedModeSettings>
        </dx:ASPxUploadControl>
    </div>
    <br />
    <div>
         <div>
            <dx:ASPxButton ID="btnRecargaGrilla" runat="server" Text="Recargar Vista" Height="47px"  Theme="Material" Width="199px" OnClick="btnRecargaGrilla_Click"></dx:ASPxButton>            
        </div>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsAST" KeyFieldName="Id_Ast" OnRowCommand="GvDatos_RowCommand">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn Caption="N° AST" FieldName="Id_Ast" ReadOnly="True" VisibleIndex="2" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N° PTS" FieldName="Id_Pts" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UrlAst" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Archivo" FieldName="NombreArchivo" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCarga" Visible="False" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                  <dx:GridViewDataHyperLinkColumn Caption="Ver AST" VisibleIndex="15">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="verAST" CommandName="cmdVerAST" runat="server" ImageUrl="~/Images/portapapeles.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Num AST" FieldName="ASTOrder" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsAST" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PermisoTrabajoSeguro_AST" Where="Id_Pts == @Id_Pts">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_Pts" SessionField="IdPTS" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
