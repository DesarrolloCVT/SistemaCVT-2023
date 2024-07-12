<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TomaInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.TomaInventario" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        <%--<div id="options">         
          <a><asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px" /> Exportar Excel</a>
     <a>             <asp:ImageButton ID="cmdNew"      runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click" style="width: 16px"/>Nuevo</a>
    </div>--%>
    </div>
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
                        Width="400px" DataSourceID="LqsFolio" TextField="Inventario_Id" ValueField="Inventario_Id">
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsFolio" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_CabeceraInventario" Where="Estado == @Estado">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Size="XX-Large"
                        Text="Tipo Pallet">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cboTipoPallet" runat="server"
                        Font-Size="XX-Large" Height="100px"
                        Width="400px" DataSourceID="lqsTipoPallet" TextField="Supportive_Description" ValueField="Supportive_Id">
                        <ValidationSettings SetFocusOnError="True">
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="lqsTipoPallet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="Supportive" Select="new (Supportive_Id, Supportive_Description)">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="XX-Large"
                        Text="N Pallet">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_pallet" runat="server" ClientInstanceName="txt_pallet"
                        Font-Size="XX-Large" Height="100px" OnTextChanged="txt_pallet_TextChanged1"
                        Width="500px" AutoPostBack="True">
                        <ValidationSettings ValidationGroup="a">
                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="^[0-9]+$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="XX-Large"
                        Text="Producto">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_producto" runat="server"
                        ClientInstanceName="txt_producto" Font-Size="XX-Large" Height="100px"
                        OnTextChanged="txt_producto_TextChanged1" Width="500px"
                        AutoPostBack="True">
                        <ValidationSettings ValidationGroup="a">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="XX-Large" Text="Lote">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_lote" runat="server" ClientInstanceName="txt_lote"
                        Font-Size="XX-Large" Height="100px" Width="500px" AutoPostBack="True"
                        OnTextChanged="txt_lote_TextChanged1">
                        <ValidationSettings ValidationGroup="a">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
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
                txt_ubicacion.Focus();
            }

}" />
                        <ValidationSettings ValidationGroup="a">
                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="^[0-9]+$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="XX-Large"
                        Text="Ubicacion">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_ubicacion" runat="server"
                        ClientInstanceName="txt_ubicacion" Font-Size="XX-Large" Height="100px"
                        Width="500px" AutoPostBack="True"
                        OnTextChanged="txt_ubicacion_TextChanged1">
                        <ValidationSettings ValidationGroup="a">
                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="^[0-9]+$" />
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
                        OnClick="btn_agregar_Click" Text="AGREGAR" ValidationGroup="a"
                        Font-Size="XX-Large" Height="100px" Width="300px">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
