<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SolicitudCompra.aspx.cs" Inherits="CVT_MermasRecepcion.Compras.SolicitudCompra" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler.Controls" tagprefix="dxwschsc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>WMS</a></li>
        <li><span id="current">Recepciones</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Recepciones</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"/> Exportar Excel</a>
              <a><asp:ImageButton ID="cmdNew"  runat="server" ImageUrl="~/Images/add.png"  onclick="cmdNew_Click" style="width: 16px"/>Nuevo</a>
     
    </div>
</div>
<div>
    <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="200px">
        <PanelCollection>
<dx:PanelContent ID="PanelContent1" runat="server">
    <div>
    <p> Filtros</p>
    <table>
    <tr>
    <td>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Desde">
        </dx:ASPxLabel>
        </td>
    <td>
        <dx:ASPxDateEdit ID="cb_fdesde" runat="server">
        </dx:ASPxDateEdit>
        </td>
        <td>
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Hasta">
            </dx:ASPxLabel>
        </td>
        <td>
            <dx:ASPxDateEdit ID="cb_fhasta" runat="server">
            </dx:ASPxDateEdit>
        </td>
    </tr>
        <%--<tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Bodega Origen" 
                    Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_borigen" runat="server" DataSourceID="LqDsSite" 
                    TextField="Site_ShortDescription" ValueField="Site_Id" Visible="False">
                </dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Bodega Destino" 
                    Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_bdestino" runat="server" DataSourceID="LqDsSite" 
                    TextField="Site_ShortDescription" ValueField="Site_Id" Visible="False">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Folio" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_folio" runat="server" Width="170px" Visible="False">
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>--%>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <dx:ASPxButton ID="btn_filtrar" runat="server" Text="Filtrar" 
                    OnClick="btn_filtrar_Click">
                </dx:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>
    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" 
        DataSourceID="LqDsSolicitudes" KeyFieldName="SolicitudCompra_Id" Width="100%" 
        OnRowCommand="GvDatos_RowCommand" 
        OnHtmlRowCreated="GvDatos_HtmlRowCreated" 
        OnRowInserting="GvDatos_RowInserting" OnRowInserted="GvDatos_RowInserted">
        <SettingsPager PageSize="25">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm">
        </SettingsEditing>
        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="SolicitudCompra_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaNecesaria" ShowInCustomizationForm="True" VisibleIndex="1">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Proyecto" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Area" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MetodoPago" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CondicionPago" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Estado" ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TipoSolicitud" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="51">
                 <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
             <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="52">
                 <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="Anula" CommandName="cmdAnula" runat="server" ImageUrl="~/Images/node_delete.png" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
             <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="53">
                 <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server" 
                    ImageUrl="~/Images/confirm.png" onclientclick="LoadingPanel.Show();"/>
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsSolicitudes" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
        TableName="CVT_SolicitudCompra" EnableInsert="True" OrderBy="Reception_Id desc" 
        
        Where="Reception_DateIn &gt;= @Reception_DateIn &amp;&amp; Reception_DateIn &lt;= @Reception_DateIn1 &amp;&amp; DocType_Id != @DocType_Id &amp;&amp; DocType_Id != @DocType_Id2 &amp;&amp; DocType_Id != @DocType_Id1" 
        EnableUpdate="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="cb_fdesde" Name="Reception_DateIn" 
                PropertyName="Value" Type="DateTime" />
            <asp:ControlParameter ControlID="cb_fhasta" Name="Reception_DateIn1" 
                PropertyName="Value" Type="DateTime" />
            <asp:Parameter DefaultValue="3" Name="DocType_Id" Type="Int32" />
            <asp:Parameter DefaultValue="11" Name="DocType_Id2" Type="Int32" />
            <asp:Parameter DefaultValue="10" Name="DocType_Id1" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxPanel>
</div>
</asp:Content>
