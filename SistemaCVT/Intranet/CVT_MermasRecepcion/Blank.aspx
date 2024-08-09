<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Blank.aspx.cs" Inherits="CVT_MermasRecepcion.Blank" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 18px;
        }
        .auto-style6 {
            width: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <video src="../Multimedia/COLISEO%20VERSIÓN%20INDUSTRIAL.avi" controls autoplay width="98%" id="video" muted></video>
    <div>
        <dx:ASPxPopupControl ID="popAviso" runat="server" CloseAction="CloseButton" CloseAnimationType="Slide" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="iOS" HeaderText="AVISO" Width="500px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />

                    <div>
                        <div style="margin-left:50px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="TIENES" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                                    </td>
                                    <td></td>
                                    <td>
                                        <dx:ASPxLabel ID="lblPendientes" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="MANTENCION(S) PENDIENTES" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left:50px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnIrAgenda" runat="server" Text="VER AGENDA" Height="35px" Theme="iOS" OnClick="btnIrAgenda_Click"></dx:ASPxButton>
                                    </td>
                                    <td class="auto-style6">

                                    </td>
                                    <td>
                                         <dx:ASPxButton ID="btnPlanificador" runat="server" Text="VER PLANIFICADOR" Height="35px" Theme="iOS" OnClick="btnPlanificador_Click"></dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>   
</asp:Content>
