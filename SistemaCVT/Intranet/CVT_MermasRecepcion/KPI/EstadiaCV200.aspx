<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EstadiaCV200.aspx.cs" Inherits="CVT_MermasRecepcion.KPI.EstadiaCV200" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a></a></li>
            <li><span id="current">Estadia CV200</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estadia CV200</span>
        <span class="tab-end"></span>
<%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="height: 16px;" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <div>
        <iframe width="1024" height="1060" src="https://app.powerbi.com/view?r=eyJrIjoiOGJkNDg2M2UtYWFlNi00ODE2LTlmYTQtMGY4NzEzYWM2NmQ0IiwidCI6ImNlZTgzY2VmLWY2ZDUtNGUyYS04NTUxLTNmZDQ0NjhlOTU3YSJ9" frameborder="0" allowFullScreen="true"></iframe>
    </div>
</asp:Content>
