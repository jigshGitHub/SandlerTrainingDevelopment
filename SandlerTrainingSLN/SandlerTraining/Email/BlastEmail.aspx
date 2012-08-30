<%@ Page Title="Send Blast Email" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="BlastEmail.aspx.cs" Inherits="Email_BlastEmail" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<table>
 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
    <th class="tdTC" style="width: 280px" align="left">Send Blast Email : </th>
 </tr>
 <tr>
 <td>
    <asp:Label id="lblError" ForeColor="Red" Font-Bold="True" Font-Size="12pt" Runat="server"></asp:Label>
 </td>
 </tr>
 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
 <td>Subject:&nbsp;&nbsp;<asp:TextBox ID="txtSubject" MaxLength="150" runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="rfvSubject" ControlToValidate="txtSubject" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Subject to proceed.">*</asp:RequiredFieldValidator>
 </td>
 </tr>

 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Select receiving group(s):&nbsp;&nbsp;
 <asp:CheckBoxList ID="chkListGroup"  DataSourceID="BlastEmailGroupsDS"  CellSpacing="8" CellPadding="8" DataTextField="BlastGroupName" DataValueField="Id"  RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>
 <asp:CustomValidator runat="server" ID="cvListGroup" ClientValidationFunction="ValidateModuleList" ErrorMessage="Please select at least one Group as Email receiver.">*</asp:CustomValidator>
 </td>
 </tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td>Type your message text here:</td></tr>
 <tr>
 <td>
    <FTB:FreeTextBox id="msgFreeTB" EnableHtmlMode="false"  ButtonSet="Office2003" 
    BreakMode="LineBreak" RenderMode="Rich" Language="en-US" 
    toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Print,Save|SymbolsMenu|InsertRule,InsertDate,InsertTime|InsertTable,EditTable;InsertTableRowAfter,InsertTableRowBefore,DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,DeleteTableColumn|InsertForm,InsertTextBox,InsertTextArea,InsertRadioButton,InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,InsertImageFromGallery,Preview,SelectAll,WordClean,NetSpell"
    runat="Server"/> 
    <asp:RequiredFieldValidator ID="rfvFreeTextBoxTB" ControlToValidate="msgFreeTB" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Email Message to proceed.">*</asp:RequiredFieldValidator>
 </td>
</tr>

<tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;"><td>Attach Document/Downloaded Report:&nbsp;&nbsp;<asp:FileUpload ID="EmailUpLoad" runat="server" /></td></tr>

<tr><td style="height:20px"></td></tr>

<tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td align="center"><asp:Button id="btnSend" Runat="server" Text="Send Blast Email" Style="background-color:#336699;
                                color: #FFFFFF; margin-left:10px" Height="40" Width="120" onclick="btnSend_Click"></asp:Button></td></tr>

<tr><td><asp:Label id="lblInfo" ForeColor="Red" runat="server"></asp:Label></td></tr>

<tr>
<td>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
</td>
</tr>

<tr>
<td>
<asp:ObjectDataSource ID="BlastEmailGroupsDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetBlastEmailGroupsByRole"></asp:ObjectDataSource>
</td>
</tr>

</table>
</asp:Content>

