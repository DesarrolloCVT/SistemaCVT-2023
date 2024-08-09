<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ImpEtiquetasQR.aspx.cs" Inherits="CVT_MermasRecepcion.UtilidadCVT.ImpEtiquetasQR" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraReports.v22.1.Web.WebForms, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v22.1.Web.WebForms, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web.WebDocumentViewer" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    <style type="text/css">
        .auto-style5 {
            width: 10px;
        }
        .auto-style6 {
            width: 7px;
        }
    </style>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Utilidades</a></li>
            <li><span id="current">Impresion Etiquetas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Impresion Etiquetas</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>               
                <td>
                    <dx:ASPxRadioButtonList ID="rb_tipo" runat="server" SelectedIndex="0" Border-BorderStyle="None" Theme="MaterialCompact">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Pallet" Value="1" />
                            <dx:ListEditItem Text="Recepcion" Value="2" />
                            <dx:ListEditItem Text="Transferencia" Value="3" />
                            <dx:ListEditItem Text="Ubicacion" Value="4" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Numero:" Font-Size="Large" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_npallet" runat="server" Width="170px" Height="33px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>

        </table>
        <asp:LinqDataSource ID="LqsImp" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_ImpresoraServ">
        </asp:LinqDataSource>

    </div>
    <div style="margin-left:50px">
        <table>
            <tr>
                <td>
                     <dx:ASPxButton ID="btnLocal" runat="server" Text="Imprimir Local" Height="60px" Theme="iOS" Width="130px" OnClick="btnLocal_Click">
                         <Image IconID="outlookinspired_defaultprinter_svg_white_32x32">
                         </Image>
                     </dx:ASPxButton>
                </td>
                    <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnRemoto" runat="server" Text="Impresion Remota" Height="60px" Theme="iOS" Width="130px" BackColor="ForestGreen" OnClick="btnRemoto_Click">
                        <Image IconID="outlookinspired_printquick_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
            
                
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div runat="server" id="divRemoto" visible="false" style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="l1" runat="server" Text="Selecciona Impresora" Font-Size="Large" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboList" runat="server" Height="32px" Width="259px" DataSourceID="LqsImp" TextField="NombreVista" ValueField="NombreImp">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cant Copias" Font-Size="Large" Font-Bold="true">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantCopias" runat="server" Width="151px" Height="32px" Text="1">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btn_imprimir" runat="server"
                        Text="Imprimir" OnClick="btn_imprimir_Click" Height="40px" Theme="iOS" ValidationGroup="a1">
                        <Image IconID="outlookinspired_defaultprinter_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
        <br />
        <div>
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Puntos a considerar para impresión Remota: 

                                                                       •	Verificar que la impresora este encendida.
                                                                       •	Verificar conexión del cable de red de la impresora.
                                                                       •	Si la impresora solo tiene conexión USB debe verificar que este correctamente conectada al computador y que este se encuentre encendido." Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
        </div>
    </div>
    <br />
   <%-- <script>
        function documentViewer_Print() {
            btnPrint.DoClick();
        } 
    </script>
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Utilidades</a></li>
            <li><span id="current">Impresion Etiquetas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Impresion Etiquetas</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxRadioButtonList ID="rb_tipo" runat="server" SelectedIndex="0" Border-BorderStyle="None" Theme="MaterialCompact">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Pallet" Value="1" />
                            <dx:ListEditItem Text="Recepcion" Value="2" />
                            <dx:ListEditItem Text="Transferencia" Value="3" />
                            <dx:ListEditItem Text="Ubicacion" Value="4" />
                        </Items>
                    </dx:ASPxRadioButtonList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Numero:" Font-Size="Large" Font-Bold="true">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_npallet" runat="server" Width="170px" Height="33px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_imprimir" runat="server"
                        Text="Ver" OnClick="btn_imprimir_Click" Height="40px" Theme="iOS">
                    </dx:ASPxButton>
                </td>              
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>

    </div>
    <br />
    <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" DisableHttpHandlerValidation="False" Height="900px">         
    </dx:ASPxWebDocumentViewer>--%>
</asp:Content>
