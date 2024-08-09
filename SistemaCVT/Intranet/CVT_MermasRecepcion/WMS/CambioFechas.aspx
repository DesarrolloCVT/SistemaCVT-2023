<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CambioFechas.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.CambioFechas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Edita Fechas</span></li>
        </ul>
    </div>


    <div id="tableHeader">
        <span class="tableTitle">Edita Fechas</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <div style="display: flex; align-items: center;" class="auto-style14">
            <div style="display: inline-block">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N Pallet" Font-Bold="true" Font-Size="Medium">
                </dx:ASPxLabel>
                <dx:ASPxTextBox ID="txt_pallet" runat="server" Width="170px" Height="31px">
                    <ValidationSettings Display="Dynamic">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </div>
            <div style="display: inline-block; margin-top: 12px; margin-left: 10px">
                <dx:ASPxButton ID="btn_buscar" runat="server" OnClick="btn_buscar_Click"
                    Text="Buscar" Height="31px" Width="70px" Theme="MaterialCompact">
                </dx:ASPxButton>
            </div>

        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <div style="display: flex; align-items: center;" class="auto-style14">
            <div style="display: inline-block">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Producto" Font-Bold="true" Font-Size="Medium">
                </dx:ASPxLabel>
            </div>
            <div style="display: inline-block; margin-left: 10px">
                <dx:ASPxLabel ID="lbl_producto" runat="server">
                </dx:ASPxLabel>
            </div>

        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <div style="display: flex; align-items: center;" class="auto-style14">
            <div style="display: inline-block">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Cantidad" Font-Bold="true" Font-Size="Medium">
                </dx:ASPxLabel>
            </div>
            <div style="display: inline-block; margin-left: 10px">
                <dx:ASPxLabel ID="lbl_cantidad" runat="server">
                </dx:ASPxLabel>
            </div>

        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <div style="display: flex; align-items: center;" class="auto-style14">
            <div style="display: inline-block">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Lote " Font-Bold="true" Font-Size="Medium">
                </dx:ASPxLabel>
            </div>
            <div style="display: inline-block; margin-left: 90px">               
                  <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px" Height="31px">
                </dx:ASPxTextBox>
            </div>
        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <div style="display: flex; align-items: center;" class="auto-style14">
            <div style="display: inline-block">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="F Produccion" Font-Bold="true" Font-Size="Medium">
                </dx:ASPxLabel>
            </div>
            <div style="display: inline-block; margin-left: 20px">
                <dx:ASPxDateEdit ID="cb_fp" runat="server" Theme="MaterialCompact">
                </dx:ASPxDateEdit>
            </div>

        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <div style="display: flex; align-items: center;" class="auto-style14">
            <div style="display: inline-block">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="F Vencimiento" Font-Bold="true" Font-Size="Medium">
                </dx:ASPxLabel>
            </div>
            <div style="display: inline-block; margin-left: 15px">
                <dx:ASPxDateEdit ID="cb_fv" runat="server" Theme="MaterialCompact">
                </dx:ASPxDateEdit>
            </div>

        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <div style="display: flex; align-items: center;" class="auto-style14">
            <div style="display: inline-block">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Lote Proveedor" Font-Bold="true" Font-Size="Medium">
                </dx:ASPxLabel>
            </div>
            <div style="display: inline-block; margin-left: 10px">
                <dx:ASPxTextBox ID="txt_lp" runat="server" Width="170px" Height="31px">
                </dx:ASPxTextBox>
            </div>
        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxButton ID="btn_cambiar" runat="server" OnClick="btn_cambiar_Click"
            Text="Cambiar" Height="45px" Theme="iOS" Width="142px">
        </dx:ASPxButton>
    </div>

</asp:Content>
