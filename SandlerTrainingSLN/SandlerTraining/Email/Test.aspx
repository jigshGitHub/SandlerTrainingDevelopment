<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Email_Test" %>
<%@ Register TagPrefix="Ajaxified" Assembly="Ajaxified" Namespace="Ajaxified" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server"> 

<script language="javascript" type="text/javascript">
    function clientShowing(sender) {

    }
    function clientShown(sender) {

    }
    function clientHiding(sender) {

    }
    function clientHidden(sender) {

    }
    function selectionChanged(sender) {
        //alert(sender._selectedTime);
    }
    </script>


<table>
<tr>
<td>
<asp:Button ID="btnTest" runat="server"  Text="Send Email" onclick="btnTest_Click" />
<br />
<br />
<asp:Button ID="btnSendMeetingEnvite" runat="server"  Text="Send Meeting Envite" onclick="btnSendMeetingEnvite_Click"  />
<br />
<br />
<%--<asp:Button ID="btnUsingDDayIcal" runat="server"  Text="Send Envite using DDay" onclick="btnUsingDDayIcal_Click"  />--%>

      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:TextBox ID="TextBox2" runat="server" Text=""></asp:TextBox>
      <Ajaxified:TimePicker ID="TimePicker1" runat="server" TargetControlID="TextBox2" 
   	        TitleCssClass="title" 
            MinuteStep="15" 
            CloseOnSelection="true">
      </Ajaxified:TimePicker>     

<br />
<br />

<%--CssClass="timepicker"
           HeaderCssClass="header" 
           TitleCssClass="title" 
           ItemCssClass="item" 
           SelectedItemCssClass="selecteditem"
           TabCssClass="tab" 
           SelectedTabCssClass="selectedtab"
           OnClientShowing="clientShowing"
            OnClientShown="clientShown" 
            OnClientHiding="clientHiding" 
            OnClientHidden="clientHidden"
            OnClientSelectionChanged="selectionChanged"
            --%>

<asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
</td>
</tr>
</table>
</asp:Content>

