<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMTomaInventario.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMTomaInventario" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>INVENTARIO</a></li>
            <li><span id="current">Toma Inventario</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Toma Inventario</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>

        <table class="dxeBinImgCPnlSys">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="XX-Large"
                        Text="Folio">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_Folio" runat="server"
                        Font-Size="XX-Large" Height="100px"
                        Width="400px" DataSourceID="LqsFolio" TextField="Inventario_Id" ValueField="Inventario_Id" OnSelectedIndexChanged="cbo_Folio_SelectedIndexChanged" AutoPostBack="True">
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsFolio" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_InventarioCabecera" Where="Estado == @Estado" Select="new (Inventario_Id)">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Bodega</td>
                <td>
                    <dx:ASPxTextBox ID="txt_ubicacion" runat="server"
                        ClientInstanceName="txt_ubicacion" Font-Size="XX-Large" Height="100px"
                        Width="500px" AutoPostBack="True" OnTextChanged="txt_ubicacion_TextChanged">
                        <ValidationSettings ValidationGroup="a">
                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="^[0-9]+$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Pasillo</td>
                <td>
                    <dx:ASPxComboBox ID="cboPasillo" runat="server"
                        Font-Size="XX-Large" Height="100px" Width="496px" AutoPostBack="True" OnSelectedIndexChanged="cboPasillo_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="Pasillo 1" Value="Pasillo 1" />
                            <dx:ListEditItem Text="Pasillo 2" Value="Pasillo 2" />
                            <dx:ListEditItem Text="Pasillo 3" Value="Pasillo 3" />
                            <dx:ListEditItem Text="Pasillo 4" Value="Pasillo 4" />
                            <dx:ListEditItem Text="Pasillo 5" Value="Pasillo 5" />
                            <dx:ListEditItem Text="Pasillo 6" Value="Pasillo 6" />
                            <dx:ListEditItem Text="Pasillo 7" Value="Pasillo 7" />
                            <dx:ListEditItem Text="Pasillo 8" Value="Pasillo 8" />
                            <dx:ListEditItem Text="Pasillo 9" Value="Pasillo 9" />
                            <dx:ListEditItem Text="Pasillo 10" Value="Pasillo 10" />
                            <dx:ListEditItem Text="Refrigerado" Value="Refrigerado" />
                            <dx:ListEditItem Text="Congelado" Value="Congelado" />
                            <dx:ListEditItem Text="Agricola" Value="Agricola" />
                            <dx:ListEditItem Text="Pasillo 21" Value="Pasillo 21" />
                            <dx:ListEditItem Text="Pasillo 22" Value="Pasillo 22" />
                            <dx:ListEditItem Text="Pasillo 23" Value="Pasillo 23" />
                            <dx:ListEditItem Text="Pasillo 24" Value="Pasillo 24" />
                            <dx:ListEditItem Text="Pasillo 25" Value="Pasillo 25" />
                            <dx:ListEditItem Text="Picking" Value="Picking" />
                            <dx:ListEditItem Text="Merma" Value="Merma" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Codigo</td>
                <td>
                    <dx:ASPxTextBox ID="txt_pallet" runat="server" ClientInstanceName="txt_pallet"
                        Font-Size="XX-Large" Height="100px" OnTextChanged="txt_pallet_TextChanged1"
                        Width="500px" AutoPostBack="True">
                        <ValidationSettings ValidationGroup="a">
                            <RegularExpression ErrorText="Solo Numeros" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">F.Vencimiento</td>
                <td>
                    <dx:ASPxDateEdit ID="dteFvenci" runat="server" AutoPostBack="True" Height="100px" OnDateChanged="dteFvenci_DateChanged" Width="500px"></dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="XX-Large"
                        Text="Producto">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_producto" runat="server" Font-Size="Medium" Height="100px" Width="800px" ReadOnly="True" Font-Bold="true" Border-BorderStyle="None">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="XX-Large"
                        Text="Cantidad">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_cantidad" runat="server"
                        ClientInstanceName="txt_cantidad" Font-Size="XX-Large" Height="100px"
                        Width="500px">
                        <ClientSideEvents KeyPress="function(s, e) {
	if (e.htmlEvent.keyCode == 13) {
                btn_agregar.Focus();
            }

}" />
                        <ValidationSettings ValidationGroup="a">
                            <RegularExpression ErrorText="Coma decimal &quot;,&quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red" Visible="False"
                        Font-Size="XX-Large">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxButton ID="btn_agregar" runat="server" ClientInstanceName="btn_agregar"
                        Text="AGREGAR" ValidationGroup="a"
                        Font-Size="XX-Large" Height="100px" Width="300px" OnClick="btn_agregar_Click">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
