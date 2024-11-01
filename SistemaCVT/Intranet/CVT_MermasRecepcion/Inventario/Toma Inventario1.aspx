﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Toma Inventario1.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.Toma_Inventario1" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.Bootstrap.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.Bootstrap" tagprefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html5 xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="XX-Large" 
                    Text="N Pallet">
                </dx:ASPxLabel>
          
                <dx:BootstrapTextBox ID="txt_pallet" runat="server" AutoPostBack="True" 
                    ontextchanged="txt_pallet_TextChanged1" ClientInstanceName="txt_pallet" 
                    Width="400px">
                    <ValidationSettings ValidationGroup="a">
                        <RegularExpression ErrorText="Solo Numeros" ValidationExpression="^[0-9]+$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:BootstrapTextBox>
            
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="XX-Large" 
                    Text="Producto">
                </dx:ASPxLabel>
           
                <dx:BootstrapTextBox ID="txt_producto" runat="server" AutoPostBack="True" 
                    ClientInstanceName="txt_producto" 
                    ontextchanged="txt_producto_TextChanged1" Width="400px">
                    <ValidationSettings ValidationGroup="a">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:BootstrapTextBox>
            
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="XX-Large" Text="Lote">
                </dx:ASPxLabel>
            
                <dx:BootstrapTextBox ID="txt_lote" runat="server" AutoPostBack="True" 
                    ClientInstanceName="txt_lote" ontextchanged="txt_lote_TextChanged1" 
                    Width="400px">
                    <ValidationSettings ValidationGroup="a">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:BootstrapTextBox>
            
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="XX-Large" 
                    Text="Cantidad">
                </dx:ASPxLabel>
           
                <dx:BootstrapTextBox ID="txt_cantidad" runat="server" 
                    ClientInstanceName="txt_cantidad" Width="400px">
                <ClientSideEvents KeyPress="function(s, e) {
	if (e.htmlEvent.keyCode == 13) {
                txt_ubicacion.Focus();
            }

}" />
                    <ValidationSettings ValidationGroup="a">
                        <RegularExpression ErrorText="Solo Numeros" ValidationExpression="^[0-9]+$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:BootstrapTextBox>
           
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="XX-Large" 
                    Text="Ubicacion">
                </dx:ASPxLabel>
           
                <dx:BootstrapTextBox ID="txt_ubicacion" runat="server" AutoPostBack="True" 
                    ClientInstanceName="txt_ubicacion" 
                    ontextchanged="txt_ubicacion_TextChanged1" Width="400px">
                    <ValidationSettings ValidationGroup="a">
                        <RegularExpression ErrorText="Solo Numeros" ValidationExpression="^[0-9]+$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:BootstrapTextBox>
           
               
                <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red" Visible="False">
                </dx:ASPxLabel>
            
                <dx:ASPxButton ID="btn_agregar" runat="server" ClientInstanceName="btn_agregar" 
                    onclick="btn_agregar_Click" Text="AGREGAR" ValidationGroup="a">
                </dx:ASPxButton>
            
    </div>
    </form>
</body>
</html5>
