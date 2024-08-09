<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="CVT_MermasRecepcion.Servicios.Encuesta" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Servicios</a></li>
        <li><span id="current">Encuesta Global</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Encuesta Global</span>
    <span class="tab-end"></span>
    <%--   <div id="options">         
          <a><asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px" /> Exportar Excel</a>&nbsp;
              <a>             
          <asp:ImageButton ID="cmdNew"      runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click" style="height: 16px;"/>Nuevo</a>
    </div>--%>
    </div>
    <br />
    <br />
    <div style="padding-left:15px">           
      <h1><p>Deseamos conocer su opinión acerca del nivel de desempeño de nuestro servicio dentro de la empresa, para así poder implementar 
              un mejor servicio y atención. Solicitamos a usted(es) contestar la siguiente encuesta teniendo en cuenta la siguiente calificación: 
             
             (1)= Deficiente,
             (2)= Regular,
             (3)= Buena,
             (4)= Exelente.
            </p>&nbsp;</h1>
      </div>
       <div>
     <table>
         <tr>
             <td class="auto-style1">
                 &nbsp;</td>
             <td class="auto-style1"><asp:Label runat="server" Text="Seleccione Área" Font-Size="Larger"></asp:Label></td>
             <td>&nbsp;&nbsp;</td>
             <td class="auto-style1">
                 <dx:ASPxComboBox ID="cbo_Area" runat="server" DataSourceID="LqsAreas" TextField="Nombre" ValueField="Id_Area">                  
                 </dx:ASPxComboBox>
                 <asp:LinqDataSource ID="LqsAreas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                 </asp:LinqDataSource>
             </td>
             <td>
                 <asp:Button ID="btn_Seleccion" runat="server" Text="Seleccionar" OnClick="btn_Seleccion_Click" /></td>
         </tr>
     </table>
         </div>
    <br />
    <br />
  
      <div style="padding-left:15px">      
              <asp:PlaceHolder ID="hld1" runat="server"></asp:PlaceHolder>  
              <dx:ASPxButton ID="btn_grabar" runat="server" Text="Guardar" OnClick="btn_grabar_Click" Visible="False"></dx:ASPxButton>
         
      </div>
           
      
          
  
</asp:Content>
