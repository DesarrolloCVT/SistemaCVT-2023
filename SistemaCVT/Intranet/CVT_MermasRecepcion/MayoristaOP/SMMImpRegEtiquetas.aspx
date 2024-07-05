<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMImpRegEtiquetas.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMImpRegEtiquetas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<%--    <div>
        <dx:ASPxButton ID="btnImp" runat="server" Text="imprimir todos" OnClick="btnImp_Click"></dx:ASPxButton>
    </div>--%>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRepimpEtiq" KeyFieldName="IdRegImpEtiq" OnRowCommand="GvDatos_RowCommand" Width="700px">
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="IdRegImpEtiq" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechRegistro" VisibleIndex="2" MaxWidth="150" MinWidth="150" Width="150px">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn VisibleIndex="5" Caption="Imprimir" MaxWidth="90" MinWidth="90" Width="90px">
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="ImpEtiqueta" CommandName="cmdImpEtiqueta" runat="server"
                            ImageUrl="~/Images/boxok.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodProd" MaxWidth="400" MinWidth="200" VisibleIndex="1" Width="400px">
                    <PropertiesComboBox DataSourceID="LqsProd" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ItemCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="ItemName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsRepimpEtiq" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_RegImpEtiqueta" Where="Estado == @Estado">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProd" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="MMetro_OITM">
        </asp:LinqDataSource>
    </div>
</asp:Content>
