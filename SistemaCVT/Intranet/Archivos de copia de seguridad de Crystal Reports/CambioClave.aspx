<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CambioClave.aspx.cs" Inherits="CVT_MermasRecepcion.CambioClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <br />

<div id="tableHeader">
    <span class="tableTitle">Cambio Contraseña</span>
    <span class="tab-end"></span>
 </div>
  <br />
  <br />
     <div>   
             <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                 <tr>
                     <td>
                         <table cellpadding="0">
                             <tr>
                                 <td align="center" colspan="2">
                                    <big><b>Cambiar la contraseña</b> </big></td>
                                      
                             </tr>
                                                         <tr>
                                 <td align="right">
                                     <asp:Label ID="lbl_clave" runat="server" 
                                         AssociatedControlID="txt_clave">Contraseña Actual:</asp:Label>
                                 </td>
                                 <td>
                                     <asp:TextBox ID="txt_clave" runat="server" TextMode="Password" MaxLength="4"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="val_clave" runat="server" 
                                         ControlToValidate="txt_clave" 
                                         ErrorMessage="La contraseña es obligatoria." 
                                         ToolTip="La contraseña es obligatoria." ValidationGroup="ChangePassword1" 
                                         ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right">
                                     <asp:Label ID="lbl_nuevaClave" runat="server" 
                                         AssociatedControlID="txt_claveNueva">Nueva contraseña:</asp:Label>
                                 </td>
                                 <td>
                                     <asp:TextBox ID="txt_claveNueva" runat="server" TextMode="Password" MaxLength="4"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="val_claveNueva" runat="server" 
                                         ControlToValidate="txt_claveNueva" 
                                         ErrorMessage="La nueva contraseña es obligatoria." 
                                         ToolTip="La nueva contraseña es obligatoria." 
                                         ValidationGroup="ChangePassword1" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right">
                                     <asp:Label ID="lbl_confimaClave" runat="server" 
                                         AssociatedControlID="txt_confirmaClave">Confirmar la nueva contraseña:</asp:Label>
                                 </td>
                                 <td>
                                     <asp:TextBox ID="txt_confirmaClave" runat="server" TextMode="Password" MaxLength="4" Width="128px"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="val_confirmaClave" runat="server" 
                                         ControlToValidate="txt_confirmaClave" 
                                         ErrorMessage="Confirmar la nueva contraseña es obligatorio." 
                                         ToolTip="Confirmar la nueva contraseña es obligatorio." 
                                         ValidationGroup="ChangePassword1" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="center" colspan="2">
                                     <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                         ControlToCompare="txt_claveNueva" ControlToValidate="txt_confirmaClave" 
                                         Display="Dynamic" 
                                         ErrorMessage="Las Nuevas Contraseñas deben coincidir." 
                                         ValidationGroup="ChangePassword1" ForeColor="Red"></asp:CompareValidator>
                                 </td>
                             </tr>
                             <tr>
                                 <td align="center" colspan="2" style="color:Red;">
                                     <asp:Label ID="lbl_error" runat="server"></asp:Label>
                                     
                                 </td>
                             </tr>
                             <tr>
                                 <td align="right">
                                     &nbsp;</td>
                                 <td>
                                     <asp:Button ID="btn_Cambiar" runat="server" 
                                         CommandName="cambiar" Text="Cambiar contraseña" 
                                         ValidationGroup="ChangePassword1" onclick="btn_Cambiar_Click" />
                                 </td>
                             </tr>
                         </table>
                     </td>
                 </tr>
             </table>     
 </div>
</asp:Content>
