﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMImpPrecios.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.SMMImpPrecios" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
        function printReport() {
            window.open("ReportImpPrecios.aspx", "PrintingFrame")
            var frameElement = document.getElementById("FrameToPrint");
            frameElement.addEventListener("load", function (e) {
                if (frameElement.contentDocument.contentType !== "text/html")
                    frameElement.contentWindow.print();
            });
        }
     </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Imprimir Precios</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Imprimir Precios</span>
        <span class="tab-end"></span>
        <%--     <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
     <br />
    <div>
        <header> Impresion Masiva Categoria - Subcategoria</header>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="Catgoria" runat="server" Text="Catgoria"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_Catgoria" runat="server" AutoPostBack="True" DataSourceID="LqDsCategoria" TextField="Min_U_Categoria" ValueField="U_CodCategoria">
                        <ValidationSettings ValidationGroup="Masivo">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsCategoria" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" GroupBy="U_CodCategoria" Select="new (key as U_CodCategoria, it as _SCATEGORIA_PRODUCTO, Min(Name) as Min_Name, Min(U_Categoria) as Min_U_Categoria)" TableName="_SCATEGORIA_PRODUCTO"></asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxLabel ID="SubCategoria" runat="server" Text="SubCategoria"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_Subcategoria" runat="server" DataSourceID="LqDsSubcategoria" TextField="U_SubCategoria" ValueField="U_CodSubCategoria">
                        <ValidationSettings ValidationGroup="Masivo">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsSubcategoria" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="_SCATEGORIA_PRODUCTO" Where="U_CodCategoria == @U_CodCategoria">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_Catgoria" DefaultValue="0" Name="U_CodCategoria" PropertyName="Value" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_Imprimir" runat="server" Text="Imprimir" OnClick="btn_Imprimir_Click" ValidationGroup="Masivo"></dx:ASPxButton>
                </td>
             </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="Gvdat" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPreciosMayorista" OnRowCommand="Gvdat_RowCommand" KeyFieldName="ItemCode">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Columns>
                <dx:GridViewDataTextColumn Caption="Cod.Producto" FieldName="ItemCode" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="ItemName" ReadOnly="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn VisibleIndex="3" Caption="Etiqueta Flejera">
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Etiqueta" CommandName="cmdEtiqueta" runat="server"
                            ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
               
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPreciosMayorista" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="MMetro_OITM" Where="QryGroup10 == @QryGroup10">
            <WhereParameters>
                <asp:Parameter DefaultValue="N" Name="QryGroup10" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
         <iframe id="FrameToPrint" name="PrintingFrame" style="position: absolute; left: -10000px; top: -10000px;"></iframe>
    </div>
    
</asp:Content>
