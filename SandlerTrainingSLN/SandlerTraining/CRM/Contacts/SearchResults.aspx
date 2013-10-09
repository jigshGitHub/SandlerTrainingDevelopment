<%@ Page Title="CRM - Search Contacts - Results" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="CRM_Contacts_SearchResults" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" width="100%">
        <tr>
            <th colspan="2" class="tdTC" align="left">
                Search Results : Contact
            </th>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <a runat="server" id="searchAnchor" href="Search.aspx">Back to Search</a>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />&nbsp;Export To Excel
            </td>
            <td align="right">
                <asp:Label ID="lblInfo" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView Width="100%" ID="gvContacts" runat="server" DataSourceID="SearchContactDS"
                    AutoGenerateColumns="False" DataKeyNames="contactsid" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnSelectedIndexChanged="gvContacts_SelectedIndexChanged" OnDataBound="gvContacts_DataBound"
                    OnRowDataBound="gvContacts_RowDataBound" onrowdeleted="gvContacts_RowDeleted">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" CssClass="gvPager" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="contactsid" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="FullName" HeaderText="Name"
                            HeaderStyle-ForeColor="Blue" SortExpression="FullName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Phone" HeaderText="Phone"
                            HeaderStyle-ForeColor="Blue" SortExpression="Phone" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Email" HeaderText="E-mail"
                            HeaderStyle-ForeColor="Blue" SortExpression="Email" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="COMPANYNAME" HeaderText="Company"
                            HeaderStyle-ForeColor="Blue" SortExpression="COMPANYNAME" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                    Text="View Detail.."></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField  HeaderText="Archive" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="archiveButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                    Text="Archive"  OnClientClick="return confirm ('Are you sure to archive this Contact record? All Pipeline records for this Contact will be archived too.');" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
            </td>
        </tr>
        <%--For Export to Excel--%>
        <tr id="trExport" runat="server" visible="false">
            <td colspan="2">
                <div id="Report" runat="server">
                    <asp:GridView Width="100%" ID="gvContactsExport" runat="server" DataSourceID="SearchContactDS"
                        AutoGenerateColumns="False" DataKeyNames="contactsid">
                        <Columns>
                            <asp:BoundField DataField="contactsid" Visible="False" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="FullName" HeaderText="Name"
                                HeaderStyle-ForeColor="Blue" SortExpression="FullName" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Phone" HeaderText="Phone"
                                HeaderStyle-ForeColor="Blue" SortExpression="Phone" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Email" HeaderText="E-mail"
                                HeaderStyle-ForeColor="Blue" SortExpression="Email" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="COMPANYNAME" HeaderText="Company"
                                HeaderStyle-ForeColor="Blue" SortExpression="COMPANYNAME" />
                            <%--For Export to Excel--%>
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="FranchiseeName" HeaderText="Franchisee" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="RegionName" HeaderText="Region" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Title" HeaderText="Title" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="ContactsDepartment" HeaderText="Contact's Department" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="ContactsRole" HeaderText="Contact's Role" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="MobilePhone" HeaderText="Mobile Phone" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="HomePhone" HeaderText="Home Phone"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Fax" HeaderText="Fax" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="PersonalEmail" HeaderText="Personal Email" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Address" HeaderText="Address" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="City" HeaderText="City" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="State" HeaderText="State" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Zip" HeaderText="Zip" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Country" HeaderText="Country" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="NewApptDesp" HeaderText="New Appointment?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="ApptSourceName" HeaderText="Appt Source" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="IsRegisteredForTraining" HeaderText="Registered for Training?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CourseName" HeaderText="Course" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CourseTrainingDate" HeaderText="Course Training Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="DiscussionTopic" HeaderText="Discussion Topic" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="ActionStep" HeaderText="Action Step" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="LAST_CONTACT_DATE" HeaderText="Last Contact Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="NEXT_CONTACT_DATE" HeaderText="Next Contact Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="StartTime" HeaderText="Start Time" DataFormatString="{0:t}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="LastAttemptedDate" HeaderText="Last Attempted Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="LastEmailedDate" HeaderText="Last Emailed Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="LastMeetingDate" HeaderText="Last Meeting Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="LetterSentDate" HeaderText="Letter Sent Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="IsEmailSubscription" HeaderText="Blast Email Subscription?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="NeedCallBack" HeaderText="Need Call Back?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Birthday" HeaderText="Birth Day" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Anniversary" HeaderText="Anniversary" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="BossName" HeaderText="Boss Name" HeaderStyle-ForeColor="Blue"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="SpouseName" HeaderText="Spouse Name" HeaderStyle-ForeColor="Blue"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="ReferredBy" HeaderText="ReferredBy" HeaderStyle-ForeColor="Blue"/>
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Notes" HeaderText="Notes" HeaderStyle-ForeColor="Blue"/>
                        </Columns>
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="SearchContactDS" runat="server" TypeName="SandlerRepositories.ContactsRepository" SelectMethod="GetAllForSearch" 
                  DeleteMethod="ArchiveContact" OnSelecting="SearchContactDS_Selecting">
                    <SelectParameters><asp:Parameter Name="_user"  /></SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="contactsid" Type="Int32" />
                        <asp:ControlParameter Name="CurrentUserId"  ControlID="hidCurrentUserId"/>
                    </DeleteParameters>
                    </asp:ObjectDataSource>
                <asp:HiddenField ID="hidContactID" runat="server" />
                <asp:HiddenField ID="hidCurrentUserId" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
