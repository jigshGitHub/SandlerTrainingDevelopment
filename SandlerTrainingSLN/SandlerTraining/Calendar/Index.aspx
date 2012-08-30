<%@ Page Title="MyCalenar" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Calendar_Index" %>
<%@ Register TagPrefix="ECalendar" Namespace="ExtendedControls" Assembly="App_Code.EventCalendar" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<asp:UpdatePanel ID="updPnl" runat="server">
    <ContentTemplate>
    <%--Calendar and Grid showing Reminders for each day--%>
      <table width="100%" id="tblCalendarDetails">
        <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
        <td  valign="top" style="width:70%">
                <ECalendar:EventCalendar ID="EventCal" runat="server" BackColor="White" BorderColor="Silver"
                    BorderWidth="1px" Font-Names="Verdana"
                    Font-Size="9pt" ForeColor="Black" 
                    Height="700px" Width="100%"
                    FirstDayOfWeek="Monday"  
                    SelectionMode="Day" ShowGridLines="True" NextPrevFormat="FullMonth" 
                    ShowDescriptionAsToolTip="True" BorderStyle="Solid" 
                    OnSelectionChanged="EventCal_SelectionChanged">
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                    <SelectorStyle BorderColor="#404040" BorderStyle="Solid" />
                    <DayStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="#333333" Font-Bold="True" VerticalAlign="Bottom" />
                    <DayHeaderStyle BorderWidth="1px" Font-Bold="True" Font-Size="8pt" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" HorizontalAlign="Center" VerticalAlign="Middle" />
                </ECalendar:EventCalendar>

        </td>
        <td style="width:1%"></td>
        <td valign="top">
                <asp:Label ID="lblInfo" runat="server"  Font-Bold="true"></asp:Label>
                <asp:GridView ID="gvSelectedDateEvents" runat="server" AutoGenerateColumns="false" Width="100%">
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <%--<asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:d}" />--%>
                    <asp:BoundField ItemStyle-HorizontalAlign="Center" ItemStyle-Wrap="false" HeaderStyle-ForeColor="Blue" DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField ItemStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="Blue" DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                </Columns> 
                </asp:GridView>

        </td>
        </tr>
      </table>
      <br />
      <table width="70%" id="tblFollowup">
      <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
         <th style="float: left">Add Follow up item:</th>
      </tr>
      <tr>
            <td colspan="3">
                <asp:DetailsView ID="dvFollowupItem" runat="server" Height="100px" Width="300px" AutoGenerateRows="False"
                    DefaultMode="Insert" CellPadding="3" BorderStyle="None" BorderWidth="1px" BackColor="White"
                    BorderColor="#999999" GridLines="Vertical" OnModeChanging="dvFollowupItem_ModeChanging"
                    OnItemInserting="dvFollowupItem_ItemInserting">
                    <Fields>
                        
                        <asp:TemplateField HeaderText="Follow up Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="FollowUpDate" Text='<%# Bind("Follow_Up_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageFUD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="FollowUpDate" PopupButtonID="calanderImageFUD" CssClass="calendar"></asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="FollowUpDateRFV" ControlToValidate="FollowUpDate" runat="server" ErrorMessage="Please Enter Follow up Date to proceed.">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Description :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDescription" MaxLength="50" Width="280" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDescriptionTB" ControlToValidate="txtDescription" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Description to proceed.">*</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPhone" MaxLength="50" Width="280" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Clear" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <FieldHeaderStyle Wrap="False" />
                    <HeaderStyle Wrap="False" BackColor="DarkRed" Font-Bold="True" ForeColor="White" />
                    <InsertRowStyle Wrap="False" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                
            </td>
        </tr>



      </table>


    </ContentTemplate> 
</asp:UpdatePanel>


</asp:Content>

