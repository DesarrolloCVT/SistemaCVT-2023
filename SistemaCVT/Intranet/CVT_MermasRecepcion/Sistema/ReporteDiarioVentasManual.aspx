<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ReporteDiarioVentasManual.aspx.cs" Inherits="CVT_MermasRecepcion.Sistema.ReporteDiarioVentasManual" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Reporte Diario Ventas</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Reporte Diario Ventas</span>
        <span class="tab-end"></span>
        <%--    <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <div style="margin-left:50px">
         <dx:ASPxButton ID="btnEnviar" runat="server" Text="Enviar Informe" OnClick="btnEnviar_Click" Height="62px" Theme="iOS" Width="146px"></dx:ASPxButton>   
    </div>
   

</asp:Content>
