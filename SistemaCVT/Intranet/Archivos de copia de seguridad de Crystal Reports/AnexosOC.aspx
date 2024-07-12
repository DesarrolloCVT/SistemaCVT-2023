<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AnexosOC.aspx.cs" Inherits="CVT_MermasRecepcion.Comex.AnexosOC" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>COMEX</a></li>
            <li><span id="current">Anexos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">ANEXOS</span>
        <span class="tab-end"></span>

    </div>
    <div>

        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="OC" runat="server" Text="OC">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_oc" runat="server" Width="170px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ValidationExpression="^[0-9]+$" ErrorText="Solo Numeros" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_agregar" runat="server" Text="Buscar">
                    </dx:ASPxButton>
                </td>
            </tr>      
        </table>
    </div>
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsAnexos" KeyFieldName="AbsEntry;Line"
            OnRowCommand="ASPxGridView1_RowCommand">

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="AbsEntry" Visible="False"
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Line" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OC" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Archivo" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="ANEXO" VisibleIndex="5">
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>

                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Proyecto" FieldName="Proyecto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFooter="true" />
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="Valor" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsAnexos" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
            TableName="CVT_VW_AnexosOC" Where="OC == @OC">
            <WhereParameters>
                <asp:ControlParameter ControlID="txt_oc" DefaultValue="0" Name="OC"
                    PropertyName="Text" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
