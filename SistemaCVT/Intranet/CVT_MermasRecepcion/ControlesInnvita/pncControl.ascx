<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="pncControl.ascx.cs"
    Inherits="InnvitaONEStarter.Controles.pncControl" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>



<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>


<script language="javascript" type="text/javascript">
    function FileUploadStart(s, e) {
        uploadValidFlag = true;
        uploadCompleteFlag = false;
    }

    function FilesUploadComplete(s, e) {
        uploadCompleteFlag = true;
        if (uploadValidFlag)
            window.setTimeout("alert('Archivo subido correctamente. A continuación presione el botón Grabar.')", 0);
    }

    function Uploader_OnUploadComplete(args) {
        if (args.isValid) {

        }
        else {
            uploadValidFlag = false;
        }
    }

    var textSeparator = ";";
    function OnListBoxSelectionChanged(listBox, args) {

        if (args.index == 0)
            args.isSelected ? listBox.SelectAll() : listBox.UnselectAll();
        UpdateSelectAllItemState();
        UpdateText();
    }
    function UpdateSelectAllItemState() {
        IsAllSelected() ? checkListBox.SelectIndices([0]) : checkListBox.UnselectIndices([0]);
    }
    function IsAllSelected() {
        var selectedDataItemCount = checkListBox.GetItemCount() - (checkListBox.GetItem(0).selected ? 0 : 1);
        return checkListBox.GetSelectedItems().length == selectedDataItemCount;
    }
    function UpdateText() {
        var selectedItems = checkListBox.GetSelectedItems();
        checkComboBox.SetText(GetSelectedItemsText(selectedItems));
    }
    function SynchronizeListBoxValues(dropDown, args) {
        checkListBox.UnselectAll();
        var texts = dropDown.GetText().split(textSeparator);
        var values = GetValuesByTexts(texts);
        checkListBox.SelectValues(values);
        UpdateSelectAllItemState();
        UpdateText(); // for remove non-existing texts
    }
    function GetSelectedItemsText(items) {
        var texts = [];
        for (var i = 0; i < items.length; i++)
            if (items[i].index != 0)
                texts.push(items[i].text);
        return texts.join(textSeparator);
    }
    function GetValuesByTexts(texts) {
        var actualValues = [];
        var item;
        for (var i = 0; i < texts.length; i++) {
            item = checkListBox.FindItemByText(texts[i]);
            if (item != null)
                actualValues.push(item.value);
        }
        return actualValues;
    }
    // ]]>
    
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div id="breadcrumbs">
            <ul>
                <li><a href="/blank.aspx">Inicio</a></li>
                <li><a>Calidad</a></li>
                <li><span id="current">PNC</span></li>
            </ul>
        </div>
        <div id="tableHeader">
            <span class="tableTitle">PNC
                <asp:Label ID="Label1" runat="server"></asp:Label></span> <span class="tab-end">
            </span>
            <div id="options">
                <a id="agregar">
                    <asp:ImageButton ImageUrl="~/App_Themes/IDA/ui/ico-agregar.png" ID="cmdGrabar" runat="server"
                        Text="" ToolTip="Grabar" OnClick="cmdGrabar_Click" />Grabar</a>
                <asp:Button ID="cmdPDF" runat="server" Text="" ToolTip="Informe a PDF" CssClass="Innvita_Boton_PDF"
                    OnClick="cmdPDF_Click" />
                <asp:Button ID="btnAtras" runat="server" Text="" ToolTip="Regresar a Maestro PNC"
                    CssClass="Innvita_Boton_Back" OnClick="btnAtras_Click1" Width="131px" />
            </div>
        </div>
        <dx:ASPxPageControl ID="TabControl" runat="server" ActiveTabIndex="8" ClientIDMode="AutoID"
            LoadingPanelText="Cargando&amp;hellip;" Width="100%" Height="350px" TabAlign="Justify"
            EnableTabScrolling="true">
            <TabStyle Paddings-PaddingLeft="50px" Paddings-PaddingRight="50px" >
                <Paddings PaddingLeft="50px" PaddingRight="50px" />
            </TabStyle>
            <ContentStyle>
                <Paddings PaddingLeft="40px" />
            </ContentStyle>
            <TabPages>
                <dx:TabPage Text="Identificación">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientIDMode="AutoID" CssPostfix="PlasticBlue"
                                            Text="Tipo">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="ddlType" runat="server" ClientIDMode="AutoID" ValueType="System.String">
                                            <ValidationSettings ErrorText="*">
                                                <RequiredField IsRequired="True" />
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" ClientIDMode="AutoID" Text="Documento N°">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="lblNumDoc" runat="server" ClientIDMode="AutoID">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" ClientIDMode="AutoID" Text="Documento Relacionado">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" ClientIDMode="AutoID" Text="Área Relacionada">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="ddlAreaRel" runat="server" ClientIDMode="AutoID" ValueType="System.String">
                                            <ValidationSettings>
                                                <RequiredField IsRequired="True" />
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" ClientIDMode="AutoID" Text="Responsable de Área">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="ddlResponsible" runat="server" ClientIDMode="AutoID" ValueType="System.Int32"
                                            LoadingPanelText="Cargando&amp;hellip;">
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" ClientIDMode="AutoID" Text="Norma">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="ddlNorma" runat="server" ClientIDMode="AutoID" ValueType="System.String">
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" ClientIDMode="AutoID" Text="Origen">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="ddlOrigen" runat="server" ClientIDMode="AutoID" ValueType="System.String">
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" ClientIDMode="AutoID" Text="Objeto">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="ddlObject" runat="server" ClientIDMode="AutoID" ValueType="System.String">
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="lbl_socio" runat="server" ClientIDMode="AutoID" Text="Cliente o Interesado">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="ddlBusinessP" runat="server" ClientIDMode="AutoID" ValueType="System.String">
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" ClientIDMode="AutoID" Text="Fecha">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="DtFecha" runat="server" ClientIDMode="AutoID">
                                            <CalendarProperties ClearButtonText="Vaciar" TodayButtonText="Hoy">
                                                <FastNavProperties CancelButtonText="Cancelar" OkButtonText="Aceptar" />
                                            </CalendarProperties>
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RequiredField IsRequired="True" />
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinqDataSource ID="LqResponsable" runat="server" ContextTypeName="InnvitaONEFramework.InnvitaONELinqSQLDataContext"
                                            EntityTypeName="" TableName="Staff" Where="Company_Id == @Company_Id">
                                            <WhereParameters>
                                                <asp:SessionParameter DefaultValue="0" Name="Company_Id" SessionField="Inv_Company"
                                                    Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Descripción">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxHtmlEditor ID="htmlDescription" runat="server" SettingsLoadingPanel-Text="Cargando&hellip;">
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <Styles>
                                                <ViewArea>
                                                    <Border BorderColor="#CCCCCC" />
                                                </ViewArea>
                                            </Styles>
                                            <Toolbars>
                                                <dx:HtmlEditorToolbar Caption="StandardToolbar1" Name="StandardToolbar1">
                                                    <Items>
                                                        <dx:ToolbarCutButton>
                                                        </dx:ToolbarCutButton>
                                                        <dx:ToolbarCopyButton>
                                                        </dx:ToolbarCopyButton>
                                                        <dx:ToolbarPasteButton>
                                                        </dx:ToolbarPasteButton>
                                                        <dx:ToolbarPasteFromWordButton>
                                                        </dx:ToolbarPasteFromWordButton>
                                                        <dx:ToolbarUndoButton BeginGroup="True">
                                                        </dx:ToolbarUndoButton>
                                                        <dx:ToolbarRedoButton>
                                                        </dx:ToolbarRedoButton>
                                                        <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                                        </dx:ToolbarRemoveFormatButton>
                                                        <dx:ToolbarSuperscriptButton BeginGroup="True">
                                                        </dx:ToolbarSuperscriptButton>
                                                        <dx:ToolbarSubscriptButton>
                                                        </dx:ToolbarSubscriptButton>
                                                        <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                                        </dx:ToolbarInsertOrderedListButton>
                                                        <dx:ToolbarInsertUnorderedListButton>
                                                        </dx:ToolbarInsertUnorderedListButton>
                                                        <dx:ToolbarIndentButton BeginGroup="True">
                                                        </dx:ToolbarIndentButton>
                                                        <dx:ToolbarOutdentButton>
                                                        </dx:ToolbarOutdentButton>
                                                        <dx:ToolbarInsertLinkDialogButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarInsertLinkDialogButton>
                                                        <dx:ToolbarUnlinkButton Visible="False">
                                                        </dx:ToolbarUnlinkButton>
                                                        <dx:ToolbarInsertImageDialogButton Visible="false">
                                                        </dx:ToolbarInsertImageDialogButton>
                                                        <dx:ToolbarCheckSpellingButton BeginGroup="True">
                                                        </dx:ToolbarCheckSpellingButton>
                                                        <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                            <Items>
                                                                <dx:ToolbarInsertTableDialogButton ViewStyle="ImageAndText" BeginGroup="True">
                                                                </dx:ToolbarInsertTableDialogButton>
                                                                <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                                </dx:ToolbarTablePropertiesDialogButton>
                                                                <dx:ToolbarTableRowPropertiesDialogButton>
                                                                </dx:ToolbarTableRowPropertiesDialogButton>
                                                                <dx:ToolbarTableColumnPropertiesDialogButton>
                                                                </dx:ToolbarTableColumnPropertiesDialogButton>
                                                                <dx:ToolbarTableCellPropertiesDialogButton>
                                                                </dx:ToolbarTableCellPropertiesDialogButton>
                                                                <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableRowAboveButton>
                                                                <dx:ToolbarInsertTableRowBelowButton>
                                                                </dx:ToolbarInsertTableRowBelowButton>
                                                                <dx:ToolbarInsertTableColumnToLeftButton>
                                                                </dx:ToolbarInsertTableColumnToLeftButton>
                                                                <dx:ToolbarInsertTableColumnToRightButton>
                                                                </dx:ToolbarInsertTableColumnToRightButton>
                                                                <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                                </dx:ToolbarSplitTableCellHorizontallyButton>
                                                                <dx:ToolbarSplitTableCellVerticallyButton>
                                                                </dx:ToolbarSplitTableCellVerticallyButton>
                                                                <dx:ToolbarMergeTableCellRightButton>
                                                                </dx:ToolbarMergeTableCellRightButton>
                                                                <dx:ToolbarMergeTableCellDownButton>
                                                                </dx:ToolbarMergeTableCellDownButton>
                                                                <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                                </dx:ToolbarDeleteTableButton>
                                                                <dx:ToolbarDeleteTableRowButton>
                                                                </dx:ToolbarDeleteTableRowButton>
                                                                <dx:ToolbarDeleteTableColumnButton>
                                                                </dx:ToolbarDeleteTableColumnButton>
                                                            </Items>
                                                        </dx:ToolbarTableOperationsDropDownButton>
                                                        <dx:ToolbarFullscreenButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarFullscreenButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                            </Toolbars>
                                            <SettingsImageUpload>
                                                <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png">
                                                </ValidationSettings>
                                            </SettingsImageUpload>
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <SettingsSpellChecker Culture="es-ES">
                                                <Dictionaries>
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-ES/es_ES.aff" Culture="es-ES"
                                                        DictionaryPath="~/SpellCheck/es-ES/es_ES.dic" EncodingName="Unicode (UTF-8)"
                                                        CacheKey="OpenOffice" />
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-MX/es_MX.aff" CacheKey="OpenOffice"
                                                        Culture="es-MX" DictionaryPath="~/SpellCheck/es-MX/es_MX.dic" />
                                                </Dictionaries>
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                            </SettingsSpellChecker>
                                            <SettingsValidation>
                                                <RequiredField IsRequired="True" />
                                            </SettingsValidation>
                                            <SettingsImageSelector>
                                                <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" />
                                            </SettingsImageSelector>
                                            <SettingsDocumentSelector>
                                                <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp" />
                                            </SettingsDocumentSelector>
                                            <Images>
                                                <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                                                </LoadingPanel>
                                            </Images>
                                        </dx:ASPxHtmlEditor>
                                    </td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Causa/Origen">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxHtmlEditor ID="htmlCause" runat="server" SettingsLoadingPanel-Text="Cargando&hellip;">
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <Styles>
                                                <ViewArea>
                                                    <Border BorderColor="#CCCCCC" />
                                                </ViewArea>
                                            </Styles>
                                            <SettingsImageUpload>
                                                <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png">
                                                </ValidationSettings>
                                            </SettingsImageUpload>
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <SettingsSpellChecker Culture="es-ES">
                                                <Dictionaries>
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-ES/es_ES.aff" Culture="es-ES"
                                                        DictionaryPath="~/SpellCheck/es-ES/es_ES.dic" EncodingName="Unicode (UTF-8)"
                                                        CacheKey="OpenOffice" />
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-MX/es_MX.aff" CacheKey="OpenOffice"
                                                        Culture="es-MX" DictionaryPath="~/SpellCheck/es-MX/es_MX.dic" />
                                                </Dictionaries>
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                            </SettingsSpellChecker>
                                            <SettingsImageSelector>
                                                <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" />
                                            </SettingsImageSelector>
                                            <SettingsDocumentSelector>
                                                <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp" />
                                            </SettingsDocumentSelector>
                                            <Toolbars>
                                                <dx:HtmlEditorToolbar Caption="StandardToolbar1" Name="StandardToolbar1">
                                                    <Items>
                                                        <dx:ToolbarCutButton>
                                                        </dx:ToolbarCutButton>
                                                        <dx:ToolbarCopyButton>
                                                        </dx:ToolbarCopyButton>
                                                        <dx:ToolbarPasteButton>
                                                        </dx:ToolbarPasteButton>
                                                        <dx:ToolbarPasteFromWordButton>
                                                        </dx:ToolbarPasteFromWordButton>
                                                        <dx:ToolbarUndoButton BeginGroup="True">
                                                        </dx:ToolbarUndoButton>
                                                        <dx:ToolbarRedoButton>
                                                        </dx:ToolbarRedoButton>
                                                        <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                                        </dx:ToolbarRemoveFormatButton>
                                                        <dx:ToolbarSuperscriptButton BeginGroup="True">
                                                        </dx:ToolbarSuperscriptButton>
                                                        <dx:ToolbarSubscriptButton>
                                                        </dx:ToolbarSubscriptButton>
                                                        <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                                        </dx:ToolbarInsertOrderedListButton>
                                                        <dx:ToolbarInsertUnorderedListButton>
                                                        </dx:ToolbarInsertUnorderedListButton>
                                                        <dx:ToolbarIndentButton BeginGroup="True">
                                                        </dx:ToolbarIndentButton>
                                                        <dx:ToolbarOutdentButton>
                                                        </dx:ToolbarOutdentButton>
                                                        <dx:ToolbarInsertLinkDialogButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarInsertLinkDialogButton>
                                                        <dx:ToolbarUnlinkButton Visible="False">
                                                        </dx:ToolbarUnlinkButton>
                                                        <dx:ToolbarInsertImageDialogButton Visible="false">
                                                        </dx:ToolbarInsertImageDialogButton>
                                                        <dx:ToolbarCheckSpellingButton BeginGroup="True">
                                                        </dx:ToolbarCheckSpellingButton>
                                                        <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                            <Items>
                                                                <dx:ToolbarInsertTableDialogButton ViewStyle="ImageAndText" BeginGroup="True">
                                                                </dx:ToolbarInsertTableDialogButton>
                                                                <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                                </dx:ToolbarTablePropertiesDialogButton>
                                                                <dx:ToolbarTableRowPropertiesDialogButton>
                                                                </dx:ToolbarTableRowPropertiesDialogButton>
                                                                <dx:ToolbarTableColumnPropertiesDialogButton>
                                                                </dx:ToolbarTableColumnPropertiesDialogButton>
                                                                <dx:ToolbarTableCellPropertiesDialogButton>
                                                                </dx:ToolbarTableCellPropertiesDialogButton>
                                                                <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableRowAboveButton>
                                                                <dx:ToolbarInsertTableRowBelowButton>
                                                                </dx:ToolbarInsertTableRowBelowButton>
                                                                <dx:ToolbarInsertTableColumnToLeftButton>
                                                                </dx:ToolbarInsertTableColumnToLeftButton>
                                                                <dx:ToolbarInsertTableColumnToRightButton>
                                                                </dx:ToolbarInsertTableColumnToRightButton>
                                                                <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                                </dx:ToolbarSplitTableCellHorizontallyButton>
                                                                <dx:ToolbarSplitTableCellVerticallyButton>
                                                                </dx:ToolbarSplitTableCellVerticallyButton>
                                                                <dx:ToolbarMergeTableCellRightButton>
                                                                </dx:ToolbarMergeTableCellRightButton>
                                                                <dx:ToolbarMergeTableCellDownButton>
                                                                </dx:ToolbarMergeTableCellDownButton>
                                                                <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                                </dx:ToolbarDeleteTableButton>
                                                                <dx:ToolbarDeleteTableRowButton>
                                                                </dx:ToolbarDeleteTableRowButton>
                                                                <dx:ToolbarDeleteTableColumnButton>
                                                                </dx:ToolbarDeleteTableColumnButton>
                                                            </Items>
                                                        </dx:ToolbarTableOperationsDropDownButton>
                                                        <dx:ToolbarFullscreenButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarFullscreenButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                            </Toolbars>
                                        </dx:ASPxHtmlEditor>
                                    </td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Descripción Acción Inmediata">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl4" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" ClientIDMode="AutoID" Text="Fecha Plazo:">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="dtActEndDate" runat="server" ClientIDMode="AutoID">
                                            <CalendarProperties ClearButtonText="Vaciar" TodayButtonText="Hoy">
                                                <FastNavProperties CancelButtonText="Cancelar" OkButtonText="Aceptar" />
                                            </CalendarProperties>
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dx:ASPxCheckBox ID="ChkActStat" runat="server" Text="Cumple">
                                            <ValidationSettings ErrorText="Valor inválido">
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxCheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <dx:ASPxHtmlEditor ID="htmlAction" runat="server" SettingsLoadingPanel-Text="Cargando&hellip;">
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <Styles>
                                                <ViewArea>
                                                    <Border BorderColor="#CCCCCC" />
                                                </ViewArea>
                                            </Styles>
                                            <SettingsImageUpload>
                                                <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png">
                                                </ValidationSettings>
                                            </SettingsImageUpload>
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <SettingsSpellChecker Culture="es-ES">
                                                <Dictionaries>
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-ES/es_ES.aff" Culture="es-ES"
                                                        DictionaryPath="~/SpellCheck/es-ES/es_ES.dic" EncodingName="Unicode (UTF-8)"
                                                        CacheKey="OpenOffice" />
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-MX/es_MX.aff" CacheKey="OpenOffice"
                                                        Culture="es-MX" DictionaryPath="~/SpellCheck/es-MX/es_MX.dic" />
                                                </Dictionaries>
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                            </SettingsSpellChecker>
                                            <SettingsImageSelector>
                                                <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" />
                                            </SettingsImageSelector>
                                            <SettingsDocumentSelector>
                                                <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp" />
                                            </SettingsDocumentSelector>
                                            <Toolbars>
                                                <dx:HtmlEditorToolbar Caption="StandardToolbar1" Name="StandardToolbar1">
                                                    <Items>
                                                        <dx:ToolbarCutButton>
                                                        </dx:ToolbarCutButton>
                                                        <dx:ToolbarCopyButton>
                                                        </dx:ToolbarCopyButton>
                                                        <dx:ToolbarPasteButton>
                                                        </dx:ToolbarPasteButton>
                                                        <dx:ToolbarPasteFromWordButton>
                                                        </dx:ToolbarPasteFromWordButton>
                                                        <dx:ToolbarUndoButton BeginGroup="True">
                                                        </dx:ToolbarUndoButton>
                                                        <dx:ToolbarRedoButton>
                                                        </dx:ToolbarRedoButton>
                                                        <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                                        </dx:ToolbarRemoveFormatButton>
                                                        <dx:ToolbarSuperscriptButton BeginGroup="True">
                                                        </dx:ToolbarSuperscriptButton>
                                                        <dx:ToolbarSubscriptButton>
                                                        </dx:ToolbarSubscriptButton>
                                                        <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                                        </dx:ToolbarInsertOrderedListButton>
                                                        <dx:ToolbarInsertUnorderedListButton>
                                                        </dx:ToolbarInsertUnorderedListButton>
                                                        <dx:ToolbarIndentButton BeginGroup="True">
                                                        </dx:ToolbarIndentButton>
                                                        <dx:ToolbarOutdentButton>
                                                        </dx:ToolbarOutdentButton>
                                                        <dx:ToolbarInsertLinkDialogButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarInsertLinkDialogButton>
                                                        <dx:ToolbarUnlinkButton Visible="False">
                                                        </dx:ToolbarUnlinkButton>
                                                        <dx:ToolbarInsertImageDialogButton Visible="false">
                                                        </dx:ToolbarInsertImageDialogButton>
                                                        <dx:ToolbarCheckSpellingButton BeginGroup="True">
                                                        </dx:ToolbarCheckSpellingButton>
                                                        <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                            <Items>
                                                                <dx:ToolbarInsertTableDialogButton ViewStyle="ImageAndText" BeginGroup="True">
                                                                </dx:ToolbarInsertTableDialogButton>
                                                                <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                                </dx:ToolbarTablePropertiesDialogButton>
                                                                <dx:ToolbarTableRowPropertiesDialogButton>
                                                                </dx:ToolbarTableRowPropertiesDialogButton>
                                                                <dx:ToolbarTableColumnPropertiesDialogButton>
                                                                </dx:ToolbarTableColumnPropertiesDialogButton>
                                                                <dx:ToolbarTableCellPropertiesDialogButton>
                                                                </dx:ToolbarTableCellPropertiesDialogButton>
                                                                <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableRowAboveButton>
                                                                <dx:ToolbarInsertTableRowBelowButton>
                                                                </dx:ToolbarInsertTableRowBelowButton>
                                                                <dx:ToolbarInsertTableColumnToLeftButton>
                                                                </dx:ToolbarInsertTableColumnToLeftButton>
                                                                <dx:ToolbarInsertTableColumnToRightButton>
                                                                </dx:ToolbarInsertTableColumnToRightButton>
                                                                <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                                </dx:ToolbarSplitTableCellHorizontallyButton>
                                                                <dx:ToolbarSplitTableCellVerticallyButton>
                                                                </dx:ToolbarSplitTableCellVerticallyButton>
                                                                <dx:ToolbarMergeTableCellRightButton>
                                                                </dx:ToolbarMergeTableCellRightButton>
                                                                <dx:ToolbarMergeTableCellDownButton>
                                                                </dx:ToolbarMergeTableCellDownButton>
                                                                <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                                </dx:ToolbarDeleteTableButton>
                                                                <dx:ToolbarDeleteTableRowButton>
                                                                </dx:ToolbarDeleteTableRowButton>
                                                                <dx:ToolbarDeleteTableColumnButton>
                                                                </dx:ToolbarDeleteTableColumnButton>
                                                            </Items>
                                                        </dx:ToolbarTableOperationsDropDownButton>
                                                        <dx:ToolbarFullscreenButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarFullscreenButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                            </Toolbars>
                                        </dx:ASPxHtmlEditor>
                                    </td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Descripción de la Acción Correctiva">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl5" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" ClientIDMode="AutoID" Text="Fecha Plazo:">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="dtActdesDate" runat="server" ClientIDMode="AutoID">
                                            <CalendarProperties ClearButtonText="Vaciar" TodayButtonText="Hoy">
                                                <FastNavProperties CancelButtonText="Cancelar" OkButtonText="Aceptar" />
                                            </CalendarProperties>
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td>
                                        <dx:ASPxCheckBox ID="ChkActDesStat" runat="server" Text="Cumple">
                                            <ValidationSettings ErrorText="Valor inválido">
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxCheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <dx:ASPxHtmlEditor ID="htmlDescAcc" runat="server" ClientIDMode="AutoID">
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <Styles>
                                                <ViewArea>
                                                    <Border BorderColor="#CCCCCC" />
                                                </ViewArea>
                                            </Styles>
                                            <Toolbars>
                                                <dx:HtmlEditorToolbar Caption="StandardToolbar1" Name="StandardToolbar1">
                                                    <Items>
                                                        <dx:ToolbarCutButton>
                                                        </dx:ToolbarCutButton>
                                                        <dx:ToolbarCopyButton>
                                                        </dx:ToolbarCopyButton>
                                                        <dx:ToolbarPasteButton>
                                                        </dx:ToolbarPasteButton>
                                                        <dx:ToolbarPasteFromWordButton>
                                                        </dx:ToolbarPasteFromWordButton>
                                                        <dx:ToolbarUndoButton BeginGroup="True">
                                                        </dx:ToolbarUndoButton>
                                                        <dx:ToolbarRedoButton>
                                                        </dx:ToolbarRedoButton>
                                                        <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                                        </dx:ToolbarRemoveFormatButton>
                                                        <dx:ToolbarSuperscriptButton BeginGroup="True">
                                                        </dx:ToolbarSuperscriptButton>
                                                        <dx:ToolbarSubscriptButton>
                                                        </dx:ToolbarSubscriptButton>
                                                        <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                                        </dx:ToolbarInsertOrderedListButton>
                                                        <dx:ToolbarInsertUnorderedListButton>
                                                        </dx:ToolbarInsertUnorderedListButton>
                                                        <dx:ToolbarIndentButton BeginGroup="True">
                                                        </dx:ToolbarIndentButton>
                                                        <dx:ToolbarOutdentButton>
                                                        </dx:ToolbarOutdentButton>
                                                        <dx:ToolbarInsertLinkDialogButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarInsertLinkDialogButton>
                                                        <dx:ToolbarUnlinkButton Visible="False">
                                                        </dx:ToolbarUnlinkButton>
                                                        <dx:ToolbarInsertImageDialogButton Visible="False">
                                                        </dx:ToolbarInsertImageDialogButton>
                                                        <dx:ToolbarCheckSpellingButton BeginGroup="True">
                                                        </dx:ToolbarCheckSpellingButton>
                                                        <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                            <Items>
                                                                <dx:ToolbarInsertTableDialogButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableDialogButton>
                                                                <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                                </dx:ToolbarTablePropertiesDialogButton>
                                                                <dx:ToolbarTableRowPropertiesDialogButton>
                                                                </dx:ToolbarTableRowPropertiesDialogButton>
                                                                <dx:ToolbarTableColumnPropertiesDialogButton>
                                                                </dx:ToolbarTableColumnPropertiesDialogButton>
                                                                <dx:ToolbarTableCellPropertiesDialogButton>
                                                                </dx:ToolbarTableCellPropertiesDialogButton>
                                                                <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableRowAboveButton>
                                                                <dx:ToolbarInsertTableRowBelowButton>
                                                                </dx:ToolbarInsertTableRowBelowButton>
                                                                <dx:ToolbarInsertTableColumnToLeftButton>
                                                                </dx:ToolbarInsertTableColumnToLeftButton>
                                                                <dx:ToolbarInsertTableColumnToRightButton>
                                                                </dx:ToolbarInsertTableColumnToRightButton>
                                                                <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                                </dx:ToolbarSplitTableCellHorizontallyButton>
                                                                <dx:ToolbarSplitTableCellVerticallyButton>
                                                                </dx:ToolbarSplitTableCellVerticallyButton>
                                                                <dx:ToolbarMergeTableCellRightButton>
                                                                </dx:ToolbarMergeTableCellRightButton>
                                                                <dx:ToolbarMergeTableCellDownButton>
                                                                </dx:ToolbarMergeTableCellDownButton>
                                                                <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                                </dx:ToolbarDeleteTableButton>
                                                                <dx:ToolbarDeleteTableRowButton>
                                                                </dx:ToolbarDeleteTableRowButton>
                                                                <dx:ToolbarDeleteTableColumnButton>
                                                                </dx:ToolbarDeleteTableColumnButton>
                                                            </Items>
                                                        </dx:ToolbarTableOperationsDropDownButton>
                                                        <dx:ToolbarFullscreenButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarFullscreenButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                            </Toolbars>
                                            <SettingsImageUpload>
                                                <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png">
                                                </ValidationSettings>
                                            </SettingsImageUpload>
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <SettingsSpellChecker Culture="es-ES">
                                                <Dictionaries>
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-ES/es_ES.aff" CacheKey="OpenOffice"
                                                        Culture="es-ES" DictionaryPath="~/SpellCheck/es-ES/es_ES.dic" EncodingName="Unicode (UTF-8)" />
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-MX/es_MX.aff" CacheKey="OpenOffice"
                                                        Culture="es-MX" DictionaryPath="~/SpellCheck/es-MX/es_MX.dic" />
                                                </Dictionaries>
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                            </SettingsSpellChecker>
                                            <SettingsImageSelector>
                                                <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" />
                                            </SettingsImageSelector>
                                            <SettingsDocumentSelector>
                                                <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp" />
                                            </SettingsDocumentSelector>
                                        </dx:ASPxHtmlEditor>
                                    </td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Supervisión de la Ejecución">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl6" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" ClientIDMode="AutoID" Text="Fecha">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="dtSupEje" runat="server" ClientIDMode="AutoID">
                                            <CalendarProperties ClearButtonText="Vaciar" TodayButtonText="Hoy">
                                                <FastNavProperties CancelButtonText="Cancelar" OkButtonText="Aceptar" />
                                            </CalendarProperties>
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <dx:ASPxHtmlEditor ID="htmlSupervision" runat="server" SettingsLoadingPanel-Text="Cargando…">
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <Styles>
                                                <ViewArea>
                                                    <Border BorderColor="#CCCCCC" />
                                                </ViewArea>
                                            </Styles>
                                            <SettingsImageUpload>
                                                <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png">
                                                </ValidationSettings>
                                            </SettingsImageUpload>
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <SettingsSpellChecker Culture="es-ES">
                                                <Dictionaries>
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-ES/es_ES.aff" CacheKey="OpenOffice"
                                                        Culture="es-ES" DictionaryPath="~/SpellCheck/es-ES/es_ES.dic" EncodingName="Unicode (UTF-8)" />
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-MX/es_MX.aff" CacheKey="OpenOffice"
                                                        Culture="es-MX" DictionaryPath="~/SpellCheck/es-MX/es_MX.dic" />
                                                </Dictionaries>
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                            </SettingsSpellChecker>
                                            <SettingsImageSelector>
                                                <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" />
                                            </SettingsImageSelector>
                                            <SettingsDocumentSelector>
                                                <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp" />
                                            </SettingsDocumentSelector>
                                            <Toolbars>
                                                <dx:HtmlEditorToolbar Caption="StandardToolbar1" Name="StandardToolbar1">
                                                    <Items>
                                                        <dx:ToolbarCutButton>
                                                        </dx:ToolbarCutButton>
                                                        <dx:ToolbarCopyButton>
                                                        </dx:ToolbarCopyButton>
                                                        <dx:ToolbarPasteButton>
                                                        </dx:ToolbarPasteButton>
                                                        <dx:ToolbarPasteFromWordButton>
                                                        </dx:ToolbarPasteFromWordButton>
                                                        <dx:ToolbarUndoButton BeginGroup="True">
                                                        </dx:ToolbarUndoButton>
                                                        <dx:ToolbarRedoButton>
                                                        </dx:ToolbarRedoButton>
                                                        <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                                        </dx:ToolbarRemoveFormatButton>
                                                        <dx:ToolbarSuperscriptButton BeginGroup="True">
                                                        </dx:ToolbarSuperscriptButton>
                                                        <dx:ToolbarSubscriptButton>
                                                        </dx:ToolbarSubscriptButton>
                                                        <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                                        </dx:ToolbarInsertOrderedListButton>
                                                        <dx:ToolbarInsertUnorderedListButton>
                                                        </dx:ToolbarInsertUnorderedListButton>
                                                        <dx:ToolbarIndentButton BeginGroup="True">
                                                        </dx:ToolbarIndentButton>
                                                        <dx:ToolbarOutdentButton>
                                                        </dx:ToolbarOutdentButton>
                                                        <dx:ToolbarInsertLinkDialogButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarInsertLinkDialogButton>
                                                        <dx:ToolbarUnlinkButton Visible="False">
                                                        </dx:ToolbarUnlinkButton>
                                                        <dx:ToolbarInsertImageDialogButton Visible="false">
                                                        </dx:ToolbarInsertImageDialogButton>
                                                        <dx:ToolbarCheckSpellingButton BeginGroup="True">
                                                        </dx:ToolbarCheckSpellingButton>
                                                        <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                            <Items>
                                                                <dx:ToolbarInsertTableDialogButton BeginGroup="True" ViewStyle="ImageAndText">
                                                                </dx:ToolbarInsertTableDialogButton>
                                                                <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                                </dx:ToolbarTablePropertiesDialogButton>
                                                                <dx:ToolbarTableRowPropertiesDialogButton>
                                                                </dx:ToolbarTableRowPropertiesDialogButton>
                                                                <dx:ToolbarTableColumnPropertiesDialogButton>
                                                                </dx:ToolbarTableColumnPropertiesDialogButton>
                                                                <dx:ToolbarTableCellPropertiesDialogButton>
                                                                </dx:ToolbarTableCellPropertiesDialogButton>
                                                                <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableRowAboveButton>
                                                                <dx:ToolbarInsertTableRowBelowButton>
                                                                </dx:ToolbarInsertTableRowBelowButton>
                                                                <dx:ToolbarInsertTableColumnToLeftButton>
                                                                </dx:ToolbarInsertTableColumnToLeftButton>
                                                                <dx:ToolbarInsertTableColumnToRightButton>
                                                                </dx:ToolbarInsertTableColumnToRightButton>
                                                                <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                                </dx:ToolbarSplitTableCellHorizontallyButton>
                                                                <dx:ToolbarSplitTableCellVerticallyButton>
                                                                </dx:ToolbarSplitTableCellVerticallyButton>
                                                                <dx:ToolbarMergeTableCellRightButton>
                                                                </dx:ToolbarMergeTableCellRightButton>
                                                                <dx:ToolbarMergeTableCellDownButton>
                                                                </dx:ToolbarMergeTableCellDownButton>
                                                                <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                                </dx:ToolbarDeleteTableButton>
                                                                <dx:ToolbarDeleteTableRowButton>
                                                                </dx:ToolbarDeleteTableRowButton>
                                                                <dx:ToolbarDeleteTableColumnButton>
                                                                </dx:ToolbarDeleteTableColumnButton>
                                                            </Items>
                                                        </dx:ToolbarTableOperationsDropDownButton>
                                                        <dx:ToolbarFullscreenButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarFullscreenButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                            </Toolbars>
                                        </dx:ASPxHtmlEditor>
                                    </td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Eficacia de la acción">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl7" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" ClientIDMode="AutoID" Text="Fecha">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxDateEdit ID="dtEfect" runat="server" ClientIDMode="AutoID">
                                            <CalendarProperties ClearButtonText="Vaciar" TodayButtonText="Hoy">
                                                <FastNavProperties CancelButtonText="Cancelar" OkButtonText="Aceptar" />
                                            </CalendarProperties>
                                            <ValidationSettings>
                                                <ErrorFrameStyle ImageSpacing="4px">
                                                    <ErrorTextPaddings PaddingLeft="4px" />
                                                </ErrorFrameStyle>
                                                <RegularExpression ErrorText="*" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="5">
                                        <dx:ASPxHtmlEditor ID="htmlEffectivity" runat="server" ClientIDMode="AutoID">
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <Styles>
                                                <ViewArea>
                                                    <Border BorderColor="#CCCCCC" />
                                                </ViewArea>
                                            </Styles>
                                            <Toolbars>
                                                <dx:HtmlEditorToolbar Caption="StandardToolbar1" Name="StandardToolbar1">
                                                    <Items>
                                                        <dx:ToolbarCutButton>
                                                        </dx:ToolbarCutButton>
                                                        <dx:ToolbarCopyButton>
                                                        </dx:ToolbarCopyButton>
                                                        <dx:ToolbarPasteButton>
                                                        </dx:ToolbarPasteButton>
                                                        <dx:ToolbarPasteFromWordButton>
                                                        </dx:ToolbarPasteFromWordButton>
                                                        <dx:ToolbarUndoButton BeginGroup="True">
                                                        </dx:ToolbarUndoButton>
                                                        <dx:ToolbarRedoButton>
                                                        </dx:ToolbarRedoButton>
                                                        <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                                        </dx:ToolbarRemoveFormatButton>
                                                        <dx:ToolbarSuperscriptButton BeginGroup="True">
                                                        </dx:ToolbarSuperscriptButton>
                                                        <dx:ToolbarSubscriptButton>
                                                        </dx:ToolbarSubscriptButton>
                                                        <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                                        </dx:ToolbarInsertOrderedListButton>
                                                        <dx:ToolbarInsertUnorderedListButton>
                                                        </dx:ToolbarInsertUnorderedListButton>
                                                        <dx:ToolbarIndentButton BeginGroup="True">
                                                        </dx:ToolbarIndentButton>
                                                        <dx:ToolbarOutdentButton>
                                                        </dx:ToolbarOutdentButton>
                                                        <dx:ToolbarInsertLinkDialogButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarInsertLinkDialogButton>
                                                        <dx:ToolbarUnlinkButton Visible="False">
                                                        </dx:ToolbarUnlinkButton>
                                                        <dx:ToolbarInsertImageDialogButton Visible="False">
                                                        </dx:ToolbarInsertImageDialogButton>
                                                        <dx:ToolbarCheckSpellingButton BeginGroup="True">
                                                        </dx:ToolbarCheckSpellingButton>
                                                        <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                            <Items>
                                                                <dx:ToolbarInsertTableDialogButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableDialogButton>
                                                                <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                                </dx:ToolbarTablePropertiesDialogButton>
                                                                <dx:ToolbarTableRowPropertiesDialogButton>
                                                                </dx:ToolbarTableRowPropertiesDialogButton>
                                                                <dx:ToolbarTableColumnPropertiesDialogButton>
                                                                </dx:ToolbarTableColumnPropertiesDialogButton>
                                                                <dx:ToolbarTableCellPropertiesDialogButton>
                                                                </dx:ToolbarTableCellPropertiesDialogButton>
                                                                <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableRowAboveButton>
                                                                <dx:ToolbarInsertTableRowBelowButton>
                                                                </dx:ToolbarInsertTableRowBelowButton>
                                                                <dx:ToolbarInsertTableColumnToLeftButton>
                                                                </dx:ToolbarInsertTableColumnToLeftButton>
                                                                <dx:ToolbarInsertTableColumnToRightButton>
                                                                </dx:ToolbarInsertTableColumnToRightButton>
                                                                <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                                </dx:ToolbarSplitTableCellHorizontallyButton>
                                                                <dx:ToolbarSplitTableCellVerticallyButton>
                                                                </dx:ToolbarSplitTableCellVerticallyButton>
                                                                <dx:ToolbarMergeTableCellRightButton>
                                                                </dx:ToolbarMergeTableCellRightButton>
                                                                <dx:ToolbarMergeTableCellDownButton>
                                                                </dx:ToolbarMergeTableCellDownButton>
                                                                <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                                </dx:ToolbarDeleteTableButton>
                                                                <dx:ToolbarDeleteTableRowButton>
                                                                </dx:ToolbarDeleteTableRowButton>
                                                                <dx:ToolbarDeleteTableColumnButton>
                                                                </dx:ToolbarDeleteTableColumnButton>
                                                            </Items>
                                                        </dx:ToolbarTableOperationsDropDownButton>
                                                        <dx:ToolbarFullscreenButton BeginGroup="True" Visible="False">
                                                        </dx:ToolbarFullscreenButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                            </Toolbars>
                                            <SettingsImageUpload>
                                                <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png">
                                                </ValidationSettings>
                                            </SettingsImageUpload>
                                            <Settings AllowHtmlView="False" AllowInsertDirectImageUrls="False" AllowPreview="False" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsText DesignViewTab="Diseño" />
                                            <SettingsSpellChecker Culture="es-ES">
                                                <Dictionaries>
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-ES/es_ES.aff" CacheKey="OpenOffice"
                                                        Culture="es-ES" DictionaryPath="~/SpellCheck/es-ES/es_ES.dic" EncodingName="Unicode (UTF-8)" />
                                                    <dx:ASPxSpellCheckerDictionary AlphabetPath="~/SpellCheck/es-MX/es_MX.aff" CacheKey="OpenOffice"
                                                        Culture="es-MX" DictionaryPath="~/SpellCheck/es-MX/es_MX.dic" />
                                                </Dictionaries>
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                                <SettingsText FinishSpellChecking="La revisión ortográfica ha finalizado." NoSuggestionsText="(Sin sugerencias)"
                                                    OptionsFormCaption="Opciones de ortografía" SpellCheckFormCaption="Comprobar ortografía" />
                                            </SettingsSpellChecker>
                                            <SettingsImageSelector>
                                                <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" />
                                            </SettingsImageSelector>
                                            <SettingsDocumentSelector>
                                                <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp" />
                                            </SettingsDocumentSelector>
                                            <Images>
                                                <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                                                </LoadingPanel>
                                            </Images>
                                        </dx:ASPxHtmlEditor>
                                    </td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Archivos Adjuntos">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl8" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Button ID="cmdNew" runat="server" ToolTip="Añadir Archivo" CssClass="Innvita_Boton_Nuevo"
                                            OnClick="cmdNew_Click" Text="Añadir Archivo" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblAtachErr" runat="server" CssClass="Innvita_Texto_Error"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxGridView ID="GvAttach" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID"
                                            DataSourceID="LqArchivos" EnableRowsCache="False" EnableViewState="False" KeyFieldName="Files_Id"
                                            OnRowInserting="GvAttach_RowInserting" OnRowUpdating="GvAttach_RowUpdating" OnHtmlRowCreated="GvAttach_HtmlRowCreated"
                                            ClientInstanceName="GvAttach" OnCustomJSProperties="GvAttach_CustomJSProperties"
                                            OnCancelRowEditing="GvAttach_CancelRowEditing" OnRowDeleting="GvAttach_RowDeleting"
                                            OnPageIndexChanged="GvAttach_PageIndexChanged">
                                            <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowVerticalScrollBar="True"
                                                VerticalScrollableHeight="250" />
                                            <SettingsText CommandCancel="Cancelar" CommandClearFilter="Limpiar filtros" CommandDelete="Eliminar"
                                                CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Grabar" ConfirmDelete="¿Seguro desea eliminar este item?"
                                                EmptyDataRow="No hay información para mostrar" GroupContinuedOnNextPage="Continua en la página siguiente"
                                                GroupPanel="Arrastre una columna aquí para agrupar" HeaderFilterShowAll="Todo"
                                                PopupEditFormCaption="Archivos PNC - InnvitaONE" Title="Archivos PNC - InnvitaONE" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsCookies CookiesID="GrillaPNCAdjunts" Enabled="True" Version="6" />
                                            <ClientSideEvents EndCallback="function(s, e) { if (GvAttach.cperrMsg!=' ') { alert(GvAttach.cperrMsg); } }" />
                                            <ClientSideEvents EndCallback="function(s, e) { if (GvAttach.cperrMsg!=' ') { alert(GvAttach.cperrMsg); } }" />
                                            <Columns>
                                                <dx:GridViewCommandColumn Caption=" " VisibleIndex="0" ButtonType="Image" ClearFilterButton-Visible="True"
                                                    ClearFilterButton-Text="Limpiar">
                                                    <DeleteButton Visible="True" Text="Eliminar">
                                                        <Image ToolTip="Eliminar" Url="~/Images/elimina.gif">
                                                        </Image>
                                                    </DeleteButton>
                                                    <CancelButton>
                                                        <Image ToolTip="Cancelar" Url="~/Images/delete.png">
                                                        </Image>
                                                    </CancelButton>
                                                    <UpdateButton>
                                                        <Image ToolTip="Grabar" Url="~/Images/disk.png">
                                                        </Image>
                                                    </UpdateButton>
                                                    <ClearFilterButton>
                                                        <Image ToolTip="Limpiar Filtro" Url="../Images/clearFilter.png">
                                                        </Image>
                                                    </ClearFilterButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True" ShowInCustomizationForm="True"
                                                    Visible="False" VisibleIndex="1">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Site_Id" ReadOnly="True" ShowInCustomizationForm="True"
                                                    Visible="False" VisibleIndex="2">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Files_Id" ReadOnly="True" ShowInCustomizationForm="True"
                                                    Visible="False" VisibleIndex="3">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="InvEntity_Id" ShowInCustomizationForm="True"
                                                    Visible="False" VisibleIndex="5">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="InvObject_Id" ShowInCustomizationForm="True"
                                                    Visible="False" VisibleIndex="6">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="PNC_Id" ShowInCustomizationForm="True" Visible="False"
                                                    VisibleIndex="7">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataMemoColumn Caption="Notas" FieldName="Files_Memo" ShowInCustomizationForm="True"
                                                    VisibleIndex="8">
                                                    <PropertiesMemoEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesMemoEdit>
                                                    <EditFormSettings RowSpan="3" />
                                                </dx:GridViewDataMemoColumn>
                                                <dx:GridViewDataDateColumn FieldName="Files_Date" ShowInCustomizationForm="True"
                                                    VisibleIndex="9" Visible="false">
                                                    <PropertiesDateEdit>
                                                        <CalendarProperties ClearButtonText="Vaciar" TodayButtonText="Hoy">
                                                            <FastNavProperties CancelButtonText="Cancelar" OkButtonText="Aceptar" />
                                                        </CalendarProperties>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesDateEdit>
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Files_Name" ShowInCustomizationForm="True"
                                                    Visible="False" VisibleIndex="10">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Files_Ext" ShowInCustomizationForm="True" Visible="False"
                                                    VisibleIndex="11">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Files_MimeType" ShowInCustomizationForm="True"
                                                    Visible="False" VisibleIndex="12">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataBinaryImageColumn Caption=" " FieldName="File" VisibleIndex="13"
                                                    Visible="false">
                                                    <EditFormSettings Visible="True" />
                                                    <EditItemTemplate>
                                                        <dx:ASPxUploadControl ID="uplImage" runat="server" OnFileUploadComplete="upl_FileUploadComplete"
                                                            ShowProgressPanel="True" ShowUploadButton="True" ShowAddRemoveButtons="False"
                                                            UploadButton-Text="Subir Archivo" ValidationSettings-FileDoesNotExistErrorText="El Archivo que intenta cargar no existe"
                                                            ValidationSettings-GeneralErrorText="Falla en la subida" ValidationSettings-MaxFileSizeErrorText="El archivo excede el máximo permitido"
                                                            ValidationSettings-NotAllowedContentTypeErrorText="Este tipo de archivo no está permitido"
                                                            ProgressBarIndicatorStyle-BackColor="Blue" Font-Size="Medium" AddUploadButtonsHorizontalPosition="Center"
                                                            FileUploadMode="OnPageLoad" ProgressBarStyle-Cursor="auto" ProgressBarStyle-ForeColor="#009933">
                                                            <ClientSideEvents FileUploadStart="FileUploadStart" FileUploadComplete="function(s, e) { Uploader_OnUploadComplete(e); }"
                                                                FilesUploadComplete="FilesUploadComplete" />
                                                            <ClientSideEvents FilesUploadComplete="FilesUploadComplete" FileUploadComplete="function(s, e) { Uploader_OnUploadComplete(e); }"
                                                                FileUploadStart="FileUploadStart" />
                                                            <ValidationSettings MaxFileSize="3500000">
                                                            </ValidationSettings>
                                                        </dx:ASPxUploadControl>
                                                        <dx:ASPxLabel ID="Ruta" runat="server" Text=" ">
                                                        </dx:ASPxLabel>
                                                    </EditItemTemplate>
                                                </dx:GridViewDataBinaryImageColumn>
                                                <dx:GridViewDataHyperLinkColumn Caption="Vista" VisibleIndex="14" Visible="true"
                                                    EditFormCaptionStyle-HorizontalAlign="Center">
                                                    <EditFormSettings Visible="false" />
                                                    <EditFormCaptionStyle HorizontalAlign="Center">
                                                    </EditFormCaptionStyle>
                                                    <DataItemTemplate>
                                                        <asp:ImageButton ToolTip="Abrir Archivo" ID="btnVer" runat="server" ImageUrl="~/Images/attach.png" /></DataItemTemplate>
                                                </dx:GridViewDataHyperLinkColumn>
                                            </Columns>
                                            <SettingsBehavior AllowSort="False" ColumnResizeMode="Control" ConfirmDelete="True" />
                                            <SettingsPager ShowDefaultImages="False" AlwaysShowPager="True">
                                                <AllButton Text="Todo">
                                                </AllButton>
                                                <NextPageButton Text="Siguiente">
                                                </NextPageButton>
                                                <PrevPageButton Text="Previo">
                                                </PrevPageButton>
                                                <Summary Text="Páginas {0} de {1} ({2} items)" />
                                            </SettingsPager>
                                            <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHeight="220px"
                                                PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormModal="True" PopupEditFormVerticalAlign="Middle"
                                                PopupEditFormWidth="450px" />
                                            <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowVerticalScrollBar="True"
                                                VerticalScrollableHeight="250" />
                                            <SettingsText CommandCancel="Cancelar" CommandClearFilter="Limpiar filtros" CommandDelete="Eliminar"
                                                CommandEdit="Editar" CommandNew="Nuevo" CommandUpdate="Grabar" ConfirmDelete="¿Seguro desea eliminar este item?"
                                                EmptyDataRow="No hay información para mostrar" GroupContinuedOnNextPage="Continua en la página siguiente"
                                                GroupPanel="Arrastre una columna aquí para agrupar" HeaderFilterShowAll="Todo"
                                                PopupEditFormCaption="Archivos PNC - InnvitaONE" Title="Archivos PNC - InnvitaONE" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                            <SettingsCookies CookiesID="GrillaPNCAdjunts" Enabled="True" Version="6" />
                                            <Styles>
                                                <Header ImageSpacing="10px" SortingImageSpacing="10px">
                                                </Header>
                                            </Styles>
                                            <StylesEditors>
                                                <CalendarHeader Spacing="11px">
                                                </CalendarHeader>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </StylesEditors>
                                        </dx:ASPxGridView>
                                        <asp:LinqDataSource ID="LqArchivos" runat="server" ContextTypeName="InnvitaONEFramework.InnvitaONELinqSQLDataContext"
                                            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                                            TableName="Files" Where="PNC_Id == @PNC_Id">
                                            <WhereParameters>
                                                <asp:Parameter DefaultValue="0" Name="PNC_Id" Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="Bultos Asociados">
                    <ContentCollection>
                        <dx:ContentControl ID="Contencontrol9" runat="server" SupportsDisabledAttribute="True">
                            <table>
                                <tr>
                                    <td>
                                    </td>
                                    <td dir="rtl">
                                        <dx:ASPxButton ID="btn_LlamarPopUp0" runat="server" OnClick="btn_LlamarPopUp_Click1"
                                            Text="Agregar SSCC">
                                        </dx:ASPxButton>
                                    </td>
                                    <td dir="rtl">
                                        <dx:ASPxButton ID="btn_liberar0" runat="server" OnClick="btn_liberar0_Click" Text="Liberar Bultos">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <dx:ASPxGridView ID="GvBultoAsoc" runat="server" AutoGenerateColumns="False" DataSourceID="LqGvBultosAsoc"
                                            KeyFieldName="PNC_Id;Package_Id" OnHtmlRowCreated="GvBultoAsoc_HtmlRowCreated"
                                            OnRowCommand="GvBultoAsoc_RowCommand">
                                            <Columns>
                                                <dx:GridViewCommandColumn Caption=" " ShowInCustomizationForm="True" VisibleIndex="0"
                                                    Visible="true" ButtonType="Image" ClearFilterButton-Visible="True" ClearFilterButton-Text="Limpiar">
                                                    <ClearFilterButton>
                                                        <Image ToolTip="Limpiar Filtro" Url="../Images/clearFilter.png">
                                                        </Image>
                                                    </ClearFilterButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="PNC_Id" ShowInCustomizationForm="True" Visible="False"
                                                    VisibleIndex="1">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Package_Id" ShowInCustomizationForm="True"
                                                    Visible="False" VisibleIndex="2">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Producto" FieldName="ArticleProvider_Description"
                                                    ShowInCustomizationForm="True" VisibleIndex="4">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="Falló la validación de expresión Regular" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="SSCC" FieldName="Package_SSCC" ShowInCustomizationForm="True"
                                                    VisibleIndex="3">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="No Conformidad" FieldName="NonconformingProductList_Description"
                                                    ShowInCustomizationForm="True" VisibleIndex="5">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Liberado Por" FieldName="Staff_Name" ShowInCustomizationForm="True"
                                                    VisibleIndex="6">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn Caption="Fecha Liberación" FieldName="PncDetail_ReleaseDate"
                                                    ShowInCustomizationForm="True" VisibleIndex="7">
                                                    <PropertiesDateEdit>
                                                        <CalendarProperties ClearButtonText="Vaciar" TodayButtonText="Hoy">
                                                            <FastNavProperties CancelButtonText="Cancelar" OkButtonText="Aceptar" />
                                                        </CalendarProperties>
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </PropertiesDateEdit>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataHyperLinkColumn Caption="Liberar" VisibleIndex="8" Width="40px">
                                                    <EditFormSettings Visible="False" />
                                                    <DataItemTemplate>
                                                        <dx:ASPxButton ID="btnLiberar" CommandName="Liberar" runat="server" EnableTheming="false"
                                                            EnableDefaultAppearance="false">
                                                        </dx:ASPxButton>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataHyperLinkColumn>
                                            </Columns>
                                            <SettingsPager NumericButtonCount="5" PageSize="5">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                        </dx:ASPxGridView>
                                        <asp:LinqDataSource ID="LqGvBultosAsoc" runat="server" ContextTypeName="InnvitaONEFramework.InnvitaONELinqSQLDataContext"
                                            EntityTypeName="" TableName="ViewPNCBultosAsoc" Where="PNC_Id == @PNC_Id">
                                            <WhereParameters>
                                                <asp:SessionParameter Name="PNC_Id" SessionField="idpnc" Type="Int32" />
                                            </WhereParameters>
                                        </asp:LinqDataSource>
                                    </td>
                                </tr>
                            </table>
                            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Agregar Bultos"
                                Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                                Width="430px">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                                        <table class="style1">
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="btn_AgregarSSCC" runat="server" Text="Agregar" OnClick="btn_AgregarSSCC_Click">
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                    <dx:ASPxDropDownEdit ClientInstanceName="checkComboBox" ID="ASPxDropDownEdit1" SkinID="CheckComboBox"
                                                        Width="288px" runat="server" EnableAnimation="False" Style="margin-bottom: 1px"
                                                        OnTextChanged="ASPxDropDownEdit1_TextChanged" Height="16px">
                                                        <DropDownWindowStyle BackColor="#EDEDED" />
                                                        <DropDownWindowTemplate>
                                                            <dx:ASPxListBox OnDataBound="AspxListBox_DataBound" Width="100%" ID="listBox" ClientInstanceName="checkListBox"
                                                                SelectionMode="CheckColumn" runat="server" SkinID="CheckComboBoxListBox" DataSourceID="LqNCList"
                                                                TextField="NonconformingProductList_Description" ValueField="NonconformingProductList_Id">
                                                                <Border BorderStyle="None" />
                                                                <BorderBottom BorderStyle="Solid" BorderWidth="1px" BorderColor="#DCDCDC" />
                                                                <Items>
                                                                    <dx:ListEditItem Text="Seleccionar todos" Selected="true" />
                                                                </Items>
                                                                <ClientSideEvents SelectedIndexChanged="OnListBoxSelectionChanged" />
                                                            </dx:ASPxListBox>
                                                            <table cellspacing="0" cellpadding="4">
                                                                <tr>
                                                                    <td align="right">
                                                                        <dx:ASPxButton ID="ASPxButton1" AutoPostBack="False" runat="server" Text="Cerrar">
                                                                            <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                                                                            <ClientSideEvents Click="function(s, e){ checkComboBox.HideDropDown(); }" />
                                                                        </dx:ASPxButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </DropDownWindowTemplate>
                                                        <ClientSideEvents TextChanged="SynchronizeListBoxValues" DropDown="SynchronizeListBoxValues" />
                                                        <DropDownWindowStyle BackColor="#EDEDED" />
                                                        <ValidationSettings ErrorText="Valor inválido">
                                                            <RegularExpression ErrorText="*" />
                                                        </ValidationSettings>
                                                    </dx:ASPxDropDownEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <dx:ASPxButton ID="ASPxButton2" runat="server" OnClick="ASPxButton2_Click" Text="Seleccionar Todo">
                                                    </dx:ASPxButton>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <dx:ASPxGridView ID="GvAgBultos" runat="server" AutoGenerateColumns="False" KeyFieldName="Package_Id"
                                                        ClientIDMode="AutoID" EnableViewState="false" Width="372px" OnInit="GvAgBultos_Init">
                                                        <Columns>
                                                            <dx:GridViewCommandColumn ButtonType="Image" Caption=" " ShowInCustomizationForm="True"
                                                                ShowSelectCheckbox="True" VisibleIndex="0" Width="40px" ClearFilterButton-Visible="True"
                                                                ClearFilterButton-Text="Limpiar">
                                                                <ClearFilterButton>
                                                                    <Image ToolTip="Limpiar Filtro" Url="../Images/clearFilter.png">
                                                                    </Image>
                                                                </ClearFilterButton>
                                                            </dx:GridViewCommandColumn>
                                                            <dx:GridViewDataTextColumn FieldName="Package_Id" ShowInCustomizationForm="True"
                                                                VisibleIndex="1" Visible="False">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings ErrorText="Valor inválido">
                                                                        <RegularExpression ErrorText="*" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="SSCC" FieldName="Package_SSCC" ShowInCustomizationForm="True"
                                                                VisibleIndex="2" Width="200px">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings ErrorText="Valor inválido">
                                                                        <RegularExpression ErrorText="*" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <Settings AutoFilterCondition="Contains" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Producto" FieldName="ArticleProvider_Description"
                                                                ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <PropertiesTextEdit>
                                                                    <ValidationSettings ErrorText="Valor inválido">
                                                                        <RegularExpression ErrorText="*" />
                                                                    </ValidationSettings>
                                                                </PropertiesTextEdit>
                                                                <Settings AutoFilterCondition="Contains" />
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                        <Settings ShowVerticalScrollBar="True" ShowFilterRow="True" />
                                                        <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                                    </dx:ASPxGridView>
                                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetBultosfromPNCbyId"
                                                        TypeName="InnvitaONEFramework.PNCClass">
                                                        <SelectParameters>
                                                            <asp:SessionParameter DefaultValue="0" Name="IdPNC" SessionField="idpnc" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                    <asp:LinqDataSource ID="LqNCList" runat="server" ContextTypeName="InnvitaONEFramework.InnvitaONELinqSQLDataContext"
                                                        EntityTypeName="" TableName="NonconformingProductList" OrderBy="NonconformingProductList_Description">
                                                    </asp:LinqDataSource>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
            <ScrollLeftButtonImage AlternateText="Tab Anterior">
            </ScrollLeftButtonImage>
            <ScrollRightButtonImage AlternateText="Siguiente Tab">
            </ScrollRightButtonImage>
        </dx:ASPxPageControl>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="cmdPDF" />
    </Triggers>
</asp:UpdatePanel>
