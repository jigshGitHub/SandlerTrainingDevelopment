<%@ Page Title="Send Meeting Invite" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="MeetingEnvite.aspx.cs" Inherits="Email_MeetingEnvite" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@Register TagPrefix="ew"  Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<table width="100%">
 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
    <th class="tdTC" style="width: 280px" align="left">Send Meeting Invite : </th>
 </tr>
 <tr>
 <td colspan="2">
    <asp:Label id="lblError" ForeColor="Red" Font-Bold="True" Font-Size="12pt" Runat="server"></asp:Label>
 </td>
 </tr>
 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Meeting Subject:</td>
 <td>
 <asp:TextBox ID="txtSubject" MaxLength="150"  Width="480px"  runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="rfvSubject" ControlToValidate="txtSubject" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Subject to proceed.">*</asp:RequiredFieldValidator>
 </td>
 </tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
 <td>Meeting Type:</td>
 <td>
    <asp:DropDownList ID="ddlMeetingType" DataSourceID="MeetingTypeDS" DataTextField="TypeName" DataValueField="TypeId" runat="server"></asp:DropDownList>
 </td>
 </tr>
 
 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Location:</td>
 <td>
 <asp:TextBox ID="txtLocation" MaxLength="150"  Width="480px"  runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="rfvLocation" ControlToValidate="txtLocation" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Location to proceed.">*</asp:RequiredFieldValidator>
 </td>
 </tr>

 <%--Start Time Row--%>
 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
 <td>Start Date:</td>
 <td>
    <asp:TextBox ID="StartDate" runat="server" />&nbsp;<asp:Image ID="calanderImageSTD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
    <asp:CalendarExtender ID="CalendarExtender1"  runat="server" TargetControlID="StartDate" PopupButtonID="calanderImageSTD" CssClass="calendar"></asp:CalendarExtender>
    <asp:RequiredFieldValidator ID="rfvStartDate" ControlToValidate="StartDate" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Start Date to proceed.">*</asp:RequiredFieldValidator>
    &nbsp;&nbsp;
    Start Time:
    <ew:TimePicker ID="tpStartTime" MinuteInterval="FifteenMinutes"  LowerBoundTime="5:00 AM" UpperBoundTime="11:00 PM" ControlDisplay="TextBoxImage" ImageUrl="~/Images/timepicker.gif" runat="server" >
             <TimeStyle BackColor="#336699" Font-Size="9pt" ForeColor="White"  Width="100"/>
             <ClearTimeStyle BackColor="White" Font-Size="8pt" />
             <SelectedTimeStyle BackColor="Yellow" Font-Size="8pt"/>
    </ew:TimePicker>
    <asp:RequiredFieldValidator ID="rfvStartTime" ControlToValidate="tpStartTime" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Start Time to proceed.">*</asp:RequiredFieldValidator>
 </td>
 </tr>

 <%--End time Row--%>
 <tr  id="trEndTime" runat="server" style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>End Date:</td>
 <td>
    <asp:TextBox ID="EndDate" runat="server" />&nbsp;<asp:Image ID="calanderImageEND" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
    <asp:CalendarExtender ID="CalendarExtender2"  runat="server" TargetControlID="EndDate" PopupButtonID="calanderImageEND" CssClass="calendar"></asp:CalendarExtender> 
    <asp:RequiredFieldValidator ID="rfvEndDate" ControlToValidate="EndDate" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter End Date to proceed.">*</asp:RequiredFieldValidator>
    &nbsp;&nbsp;
    End Time:
    <ew:TimePicker ID="tpEndTime" MinuteInterval="FifteenMinutes" LowerBoundTime="5:00 AM" UpperBoundTime="11:00 PM" ControlDisplay="TextBoxImage" ImageUrl="~/Images/timepicker.gif" runat="server" >
             <TimeStyle BackColor="#336699" Font-Size="9pt" ForeColor="White"  Width="100"/>
             <ClearTimeStyle BackColor="White" Font-Size="8pt" />
             <SelectedTimeStyle BackColor="Yellow" Font-Size="8pt"/>
    </ew:TimePicker>

    <asp:RequiredFieldValidator ID="rfvEndTime" ControlToValidate="tpEndTime" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter End Time to proceed.">*</asp:RequiredFieldValidator>
 </td>
 </tr>

 <%--Recurring option Information row--%>
 <tr visible="false" id="trRecInfo" runat="server" style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
    <td colspan="2"><b>Please complete below information for Recurring meeting:</b></td>
 </tr>

 <%--Recurring Options row--%>
 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
 <td>Recurring Meeting?:</td>
 <td>
    <asp:DropDownList ID="ddlRecFrequency" AutoPostBack="true" DataSourceID="NewItemInfoDS" DataTextField="Description" DataValueField="Value" runat="server" onselectedindexchanged="ddlRecFrequency_SelectedIndexChanged"></asp:DropDownList>
    &nbsp;&nbsp;
    <asp:Label ID="lblSelectFreq" runat="server" Text="Select Frequency:" Visible="false"></asp:Label>
    <asp:DropDownList ID="ddlMeetingFrequency" DataSourceID="MeetingFrequencyTypeDS" DataTextField="FreqType" DataValueField="FreqId" runat="server" Visible="false"></asp:DropDownList>
    &nbsp;&nbsp;
    <asp:Label ID="lblDuration" runat="server" Text="Enter Duration(in Hours):" Visible="false"></asp:Label>
    <asp:TextBox ID="txtDuration" runat="server" Width="100px" Visible="false"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvDuration" ControlToValidate="txtDuration" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Meeting duration in Hours to proceed." Enabled="false">*</asp:RequiredFieldValidator>
    &nbsp;&nbsp;
    <asp:Label ID="lblRecurrence" runat="server" Text="Enter Recurrence count:" Visible="false"></asp:Label>
    <asp:TextBox ID="txtRecurrenceCount" runat="server" Width="100px" Visible="false"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvRecurrenceCount" ControlToValidate="txtDuration" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Recurrence count to proceed." Enabled="false">*</asp:RequiredFieldValidator>
 </td>
 </tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td colspan="2" style="height:3px"></td></tr>

 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Select your own group(s):</td>
 <td>
    <asp:ListBox ID="lstUserEmailGroup" Rows="4" SelectionMode="Multiple" DataSourceID="UserGroupDS" DataTextField="GroupName" DataValueField="Id" runat="server" OnDataBound="lstUserEmailGroup_DataBound"></asp:ListBox>
    <asp:CustomValidator runat="server" ID="cvListGroup" ClientValidationFunction="ValidateModuleList" ErrorMessage="Please select at least one Group as Email receiver or type Email address(es).">*</asp:CustomValidator>
 </td>
 </tr>

 <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td colspan="2" style="height:3px"></td></tr>

 <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
 <td>Enter recipient's Email Address(s):</td>
 <td>
    <asp:TextBox ID="txtEmailAdrs" runat="server" Width="480px" ></asp:TextBox>
 </td>
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
    <asp:RequiredFieldValidator ID="rfvFreeTextBoxTB" ControlToValidate="msgFreeTB" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Meeting Invite Message to proceed.">*</asp:RequiredFieldValidator>
 </td>
</tr>

<tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;"><td colspan="2" style="height:3px"></td></tr>

<tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
<td align="center" colspan="2">
    <asp:Button id="btnSend" Runat="server" Text="Send Envite" Style="background-color:#336699; color: #FFFFFF; margin-left:10px" Height="40" Width="120" onclick="btnSend_Click"></asp:Button>
</td></tr>

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
    <asp:ObjectDataSource ID="MeetingTypeDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetMeetingTypeOptions"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="MeetingFrequencyTypeDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetMeetingFrequencyType"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
 </td>
 </tr>
</table>
</asp:Content>

