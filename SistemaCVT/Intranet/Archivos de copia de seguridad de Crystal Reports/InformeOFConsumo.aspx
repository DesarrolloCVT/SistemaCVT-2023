<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeOFConsumo.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.InformeOFConsumo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            height: 23px;
        }

        .style2 {
            height: 201px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Informe Consumo por OF</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Consumo por OF</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <%--<dx:ASPxLabel runat="server" Text="Orden Fabricacion" ID="ASPxLabel1" Font-Size="Medium"></dx:ASPxLabel>--%>
                    <dx:ASPxComboBox runat="server" DataSourceID="LqDsOF" ValueField="OF"
                        Width="375px" ID="cbo_of" Caption="Orden de Fabricacion " EnableTheming="True" Height="45px" Theme="iOS">
                        <Columns>
                            <dx:ListBoxColumn FieldName="OF"></dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="CodProducto" Width="150px"></dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Producto" Width="450px"></dx:ListBoxColumn>
                        </Columns>

                        <CaptionSettings HorizontalAlign="Center" Position="Top" />

                        <ValidationSettings ValidationGroup="a">
                            <RequiredField IsRequired="True"></RequiredField>
                        </ValidationSettings>
                        <CaptionStyle Font-Bold="True" Font-Size="15pt">
                        </CaptionStyle>
                    </dx:ASPxComboBox>
                </td>
            </tr>
        </table>
        <asp:LinqDataSource runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" OrderBy="OF"
            TableName="CVT_ListaOFLiberadas" EntityTypeName="" ID="LqDsOF">
        </asp:LinqDataSource>
    </div>
    <br />
    <div style="margin-left: 150px">
        <dx:ASPxButton ID="btn_Generar" runat="server" OnClick="btn_Generar_Click"
            Text="Generar" Height="54px" Theme="iOS" Width="169px">
        </dx:ASPxButton>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvResumen" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsResumen" Theme="Default">
            <SettingsPager Mode="ShowAllRecords" Visible="False">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText Title="RESUMEN" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Transfer_U_Folio_Entidad" Visible="False"
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Codigo"
                    FieldName="ArticleProvider_CodClient" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="ArticleProvider_Description" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant. Transferida"
                    FieldName="Cantidad_Transferida" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant. Merma" FieldName="Cantidad_Merma"
                    VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="N1">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant. Consumida"
                    FieldName="Cantidad_Consumida" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant. Disponible" FieldName="Cantidad"
                    VisibleIndex="6">
                    <PropertiesTextEdit DisplayFormatString="N1">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
                <TitlePanel Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="15pt" Font-Strikeout="False" Font-Underline="True" ForeColor="Black" HorizontalAlign="Left">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsResumen" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="CVT_ResumenConsumoOF_Produccion"
            Where="Transfer_U_Folio_Entidad == @Transfer_U_Folio_Entidad">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_of" DefaultValue="0"
                    Name="Transfer_U_Folio_Entidad" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <br />

    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsTransferido">
            <SettingsPager Mode="ShowAllRecords" Visible="False">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <SettingsText Title="DETALLE TRANSFERIDO" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Transfer_U_Folio_Entidad" Visible="False"
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BOrigen" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BDestino" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Codigo"
                    FieldName="ArticleProvider_CodClient" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="ArticleProvider_Description" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot"
                    VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
                <TitlePanel Font-Bold="True" Font-Size="15pt" Font-Underline="True" ForeColor="Black" HorizontalAlign="Left">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsTransferido" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            OrderBy="ArticleProvider_CodClient, BOrigen" TableName="CVT_TransferidoOF_ConsumoProduccion"
            Where="Transfer_U_Folio_Entidad == @Transfer_U_Folio_Entidad">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_of" DefaultValue="0"
                    Name="Transfer_U_Folio_Entidad" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
