<%@ Page Title="Send Email" Language="C#" MasterPageFile="~/CRM.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="BlastEmail.aspx.cs" Inherits="Email_BlastEmail" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<table width="100%">
 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
    <th class="tdTC" style="width: 280px" align="left">Send Email : </th>
 </tr>
 <tr>
 <td colspan="2">
    <asp:Label id="lblError" ForeColor="Red" Font-Bold="True" Font-Size="12pt" Runat="server"></asp:Label>
 </td>
 </tr>
 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Subject:</td>
 <td>
 <asp:TextBox ID="txtSubject" MaxLength="150"  Width="480px"  runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="rfvSubject" ControlToValidate="txtSubject" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Subject to proceed.">*</asp:RequiredFieldValidator>
 </td>
 </tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
 <td>Select receiving group(s):</td>
 <td>
 <asp:CheckBoxList ID="chkListGroup"  DataSourceID="BlastEmailGroupsDS"  CellSpacing="8" CellPadding="8" DataTextField="BlastGroupName" DataValueField="Id"  RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>
 <asp:CustomValidator runat="server" ID="cvListGroup" ClientValidationFunction="ValidateModuleList" ErrorMessage="Please select at least one Group as Email receiver or type Email address(es).">*</asp:CustomValidator>
 </td>
 </tr>

 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Select your own group(s):</td>
 <td>
    <asp:ListBox ID="lstUserEmailGroup" Rows="4" SelectionMode="Multiple" DataSourceID="UserGroupDS" DataTextField="GroupName" DataValueField="Id" runat="server" OnDataBound="lstUserEmailGroup_DataBound"></asp:ListBox>
 </td>
 </tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td colspan="2" style="height:3px"></td></tr>

 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Enter recipient's Email Address(s):</td>
 <td>
 <asp:TextBox ID="txtEmailAdrs" runat="server" Width="480px" ></asp:TextBox></td>
 </tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td colspan="2"><b>Note: Please use comma (,) seperator for multiple addresses.</b></td></tr>

 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;"><td colspan="2">Attach Document/Downloaded Report:&nbsp;&nbsp;<asp:FileUpload ID="EmailUpLoad" runat="server" /></td></tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td colspan="2" style="height:3px"></td></tr>

 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;"><td colspan="2">Type your message text here:</td></tr>
 <tr>
 <td colspan="2">
    <FTB:FreeTextBox id="msgFreeTB" EnableHtmlMode="false"  ButtonSet="Office2003" 
    BreakMode="LineBreak" RenderMode="Rich" Language="en-US" 
    toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;CreateLink,Unlink,InsertImage|Cut,Copy,Paste,Delete;Undo,Redo,Print,Save|SymbolsMenu|InsertRule,InsertDate,InsertTime|InsertTable,EditTable;InsertTableRowAfter,InsertTableRowBefore,DeleteTableRow;InsertTableColumnAfter,InsertTableColumnBefore,DeleteTableColumn|InsertForm,InsertTextBox,InsertTextArea,InsertRadioButton,InsertCheckBox,InsertDropDownList,InsertButton|InsertDiv,EditStyle,Preview,SelectAll,WordClean"
    runat="Server" Width="100%" /> 
    <asp:RequiredFieldValidator ID="rfvFreeTextBoxTB" ControlToValidate="msgFreeTB" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Email Message to proceed.">*</asp:RequiredFieldValidator>
 </td>
</tr>

<tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td colspan="2" style="height:3px"></td></tr>

<tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;"><td align="center" colspan="2"><asp:Button id="btnSend" Runat="server" Text="Send Email" Style="background-color:#3366cc;
                                color: #FFFFFF; margin-left:10px" Height="40" Width="120" onclick="btnSend_Click"></asp:Button></td></tr>

<tr><td colspan="2"><asp:Label id="lblInfo" ForeColor="Red" runat="server"></asp:Label></td></tr>

<tr>
<td colspan="2">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
</td>
</tr>

<tr>
<td>
<asp:ObjectDataSource ID="BlastEmailGroupsDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetBlastEmailGroupsByRole"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="UserGroupDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetUserEmailGroup"></asp:ObjectDataSource>
</td>
</tr>

</table>
</asp:Content>

