<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PedidosConfirmados.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.PedidosConfirmados" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Logistica</a></li>
        <li><span id="current">Informe Pedidos Confirmados</span></li>
    </ul>
</div>
<br />
<br />
<div id="tableHeader">
    <span class="tableTitle">Informe Pedidos Confirmados</span>
    <span class="tab-end"></span>
   
    <br />
</div>
    <div>
        <h1> Filtro</h1>
        
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha">
        </dx:ASPxLabel>
        <dx:ASPxDateEdit ID="de_fecha" runat="server"></dx:ASPxDateEdit>
        <dx:ASPxButton ID="btn_Refrescar" runat="server" Text="Refrescar" OnClick="btn_Refrescar_Click"></dx:ASPxButton>
    </div>
<div>

    <dx:ASPxGridView ID="Gv_PedidorConfirmados" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsResumenRuta" OnRowCommand="Gv_PedidorConfirmados_RowCommand" KeyFieldName="DocNum">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Camion_ID" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaEntrega" VisibleIndex="1">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Pedido" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DocNum" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cliente" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Direccion" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CantidadPallet" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="PesoPallet" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="U_Hora_entrega" VisibleIndex="8" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="U_Agendamiento" VisibleIndex="9" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Hora" VisibleIndex="10" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Minuto" VisibleIndex="11" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaEntregaAgendada" VisibleIndex="12">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DocStatus" Visible="False" VisibleIndex="14">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="O Carga" VisibleIndex="15">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="OCarga" CommandName="cmdpdf" runat="server" ImageUrl="~/Images/pdf.png" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsResumenRuta" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_AsignacionRutaAgenda" Where="FechaEntrega == @FechaEntrega &amp;&amp; DocStatus == @DocStatus">
        <WhereParameters>
            <asp:ControlParameter ControlID="de_fecha" Name="FechaEntrega" PropertyName="Value" Type="DateTime" DefaultValue="01-01-1990" />
            <asp:Parameter DefaultValue="O" Name="DocStatus" Type="Char" />
        </WhereParameters>
</asp:LinqDataSource>

</div>
</asp:Content>
