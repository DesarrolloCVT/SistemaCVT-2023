<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QrPreview.ascx.cs" Inherits="CVT_MermasRecepcion.UtilidadCVT.QrPreview" %>

<%@ Register assembly="DevExpress.XtraReports.v22.1.Web.WebForms, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>

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
      <dx:ASPxDocumentViewer ID="DocumentViewer" runat="server" ClientInstanceName="ClientDocumentViewer" EnableTheming="True" Height="500px" Theme="iOS">
          <settingsreportviewer printusingadobeplugin="False" />
          <settingstoolbar>
              <captionsettings verticalalign="Middle" />
          </settingstoolbar>
          <toolbaritems>
              <dx:ReportToolbarButton ItemKind="Search" />
              <dx:ReportToolbarSeparator />
              <dx:ReportToolbarSeparator />
              <dx:ReportToolbarSeparator />
              <dx:ReportToolbarButton ItemKind="SaveToDisk" />
              <dx:ReportToolbarButton ItemKind="SaveToWindow" />
       <%--       <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
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
              <dx:ReportToolbarButton ItemKind="PrintReport" />--%>
          </toolbaritems>
        <ClientSideEvents PageLoad="function(s, e) { window.setTimeout('OnClientDocumentViewerLoad()', 0) }" />
       
    </dx:ASPxDocumentViewer>     
</div>