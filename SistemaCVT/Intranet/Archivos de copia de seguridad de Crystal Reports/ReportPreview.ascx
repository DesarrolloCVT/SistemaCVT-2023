<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReportPreview.ascx.cs" Inherits="CVT_MermasRecepcion.Mantencion.ReportPreview" %>
<%@ Register Assembly="DevExpress.XtraReports.v22.1.Web.WebForms, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<div id="ClientArea" style="overflow: auto; overflow-x: hidden; padding-right: 20px;">
    <script type="text/javascript" id="dxss_s1">
        // <![CDATA[
        window.OnClientDocumentViewerLoad = function() {
            var maxSizeRatio = 0.8;
            var maxPCWidth = document.documentElement.clientWidth * maxSizeRatio;
            var maxPCHeight = document.documentElement.clientHeight * maxSizeRatio;
            scheduler.HideLoadingPanel();
            ASPxPopupControl1.Show();
            ClientDocumentViewer.AdjustControl();
            if(ASPxClientUtils.touchUI)
                ASPxPopupControl1.SetSize(0, 0);
            ASPxPopupControl1.UpdatePosition();
        }
        // ]]>
    </script>
      <dx:ASPxDocumentViewer ID="DocumentViewer" runat="server" ClientInstanceName="ClientDocumentViewer" EnableTheming="True" Height="900px" Theme="Office2010Blue">
          <toolbaritems>
              <dx:ReportToolbarButton ItemKind="Search" />
              <dx:ReportToolbarSeparator />
              <dx:ReportToolbarSeparator />
              <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
              <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
              <dx:ReportToolbarLabel ItemKind="PageLabel" />
              <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
              </dx:ReportToolbarComboBox>
              <dx:ReportToolbarLabel ItemKind="OfLabel" />
              <dx:ReportToolbarTextBox IsReadOnly="True" ItemKind="PageCount" />
              <dx:ReportToolbarButton ItemKind="NextPage" />
              <dx:ReportToolbarButton ItemKind="LastPage" />
              <dx:ReportToolbarSeparator />
              <dx:ReportToolbarButton ItemKind="SaveToDisk" />
              <dx:ReportToolbarButton ItemKind="SaveToWindow" />
              <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                  <elements>
                      <dx:ListElement Value="pdf" />
                      <dx:ListElement Value="xls" />
                      <dx:ListElement Value="xlsx" />
                      <dx:ListElement Value="rtf" />
                      <dx:ListElement Value="docx" />
                      <dx:ListElement Value="mht" />
                      <dx:ListElement Value="html" />
                      <dx:ListElement Value="txt" />
                      <dx:ListElement Value="csv" />
                      <dx:ListElement Value="png" />
                  </elements>
              </dx:ReportToolbarComboBox>
          </toolbaritems>
        <ClientSideEvents PageLoad="function(s, e) { window.setTimeout('OnClientDocumentViewerLoad()', 0) }" />
    </dx:ASPxDocumentViewer>  
   
</div>