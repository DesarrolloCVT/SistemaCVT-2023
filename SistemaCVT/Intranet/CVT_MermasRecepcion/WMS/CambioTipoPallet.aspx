<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CambioTipoPallet.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.CambioTipoPallet" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
        .auto-style6 {
            width: 119px;
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Cambio Tipo Pallet</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Cambio Tipo Pallet</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <br />
    <div style="margin-left:50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Pallet" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNPallet" runat="server" Width="130px" Height="35px" AutoPostBack="True" OnTextChanged="txtNPallet_TextChanged" >
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>                   
                </td>                
                <td class="auto-style5"></td>
                <td>
                      <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tipo Pallet" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTipoPallet" runat="server" Height="35px" DataSourceID="LqsTipoPallet" TextField="Supportive_Description" ValueField="Supportive_Id">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                      </dx:ASPxComboBox>
                      <asp:LinqDataSource ID="LqsTipoPallet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Supportive_Id, Supportive_Description)" TableName="Supportive">
                      </asp:LinqDataSource>
                </td>            
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left:100px">
           <dx:ASPxLabel ID="lblTipo" runat="server" Text="" Font-Size="Medium" Font-Bold="true" ForeColor="Red"></dx:ASPxLabel>
    </div>
    <br />
    <div style="margin-left:130px" class="auto-style6">
        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Actualizar" Height="36px" Width="116px" Theme="iOS" OnClick="btnGuardar_Click">
            <Image IconID="actions_convert_16x16">
            </Image>
        </dx:ASPxButton>
    </div>
</asp:Content>
