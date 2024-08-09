<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMImpresionEtiquetaQR.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMImpresionEtiquetaQR" %>

<%@ Register Assembly="DevExpress.XtraReports.v22.1.Web.WebForms, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <script>
        function documentViewer_Print() {
            btnPrint.DoClick();
        } 
       </script>
      <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista OP</a></li>
            <li><span id="current">Impresion Etiquetas</span></li>
        </ul>
    </div>    
    <div id="tableHeader">
        <span class="tableTitle">Impresion Etiquetas</span>
        <span class="tab-end"></span>
    </div>
       <div style="margin-left:150px">
        <dx:ASPxRadioButtonList ID="rb_tipo" runat="server" SelectedIndex="0" Border-BorderStyle="None" Height="99px" Theme="Glass" Width="135px" Font-Bold="true" Font-Size="Medium">
            <Items>
                <dx:ListEditItem Selected="True" Text="Pallet" Value="1" />
                <dx:ListEditItem Text="Recepcion" Value="2" />
                <dx:ListEditItem Text="Transferencia" Value="3" />
                <dx:ListEditItem Text="Ubicacion" Value="4" />
            </Items>
        </dx:ASPxRadioButtonList>
    </div>
    <br />
    <div style="margin-left:150px">        
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Numero" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNumero" runat="server" Width="150px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_imprimir" runat="server" Text="IMPRIMIR" Font-Bold="true" Font-Size="Medium" Height="46px" Theme="Glass" OnClick="btn_imprimir_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" DisableHttpHandlerValidation="False" Height="900px">         
    </dx:ASPxWebDocumentViewer>
</asp:Content>
