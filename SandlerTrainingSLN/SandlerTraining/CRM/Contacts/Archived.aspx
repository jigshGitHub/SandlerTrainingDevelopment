<%@ Page Title="CRM - View Archived Contact Records" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" 
CodeFile="Archived.aspx.cs" Inherits="ContactArchived" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <table id="tblCompMain" width="100%">
        <tr>
            <th style="float: left">
                <asp:Label ID="lblModuleActionHeading" runat="server"></asp:Label>
            </th>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td>
                Select Company Name:
                <asp:DropDownList ID="ddlCompanies" runat="server" DataSourceID="CompaniesDS" AutoPostBack="True"
                    DataTextField="COMPANYNAME" DataValueField="COMPANIESID" OnDataBound="ddlCompanies_DataBound">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                    ID="btnExportExcel" OnClick="btnExportExcel_Click" />&nbsp;
                    <asp:Label runat="server" Text="Export To Excel" ID="lblExportToExcel"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView Width="100%" ID="gvArchivedContacts" runat="server" DataSourceID="ContactDS"
                    AutoGenerateColumns="False" DataKeyNames="contactsid" AllowSorting="true" AllowPaging="true"
                    PageSize="20" OnDataBound="gvArchivedContacts_DataBound"
                    OnRowDataBound="gvArchivedContacts_RowDataBound" onrowdeleted="gvArchivedContacts_RowDeleted">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" CssClass="gvPager" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:HiddenField ID="hdnUserId" runat="server" Value='<%# Eval("CreatedBy") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="contactsid" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="FullName" HeaderText="Name" HeaderStyle-ForeColor="Blue" SortExpression="FullName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Phone" HeaderText="Phone"   HeaderStyle-ForeColor="Blue" SortExpression="Phone" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Email" HeaderText="E-mail"  HeaderStyle-ForeColor="Blue" SortExpression="Email" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="COMPANYNAME" HeaderText="Company" HeaderStyle-ForeColor="Blue" SortExpression="COMPANYNAME" />
                        <asp:TemplateField  HeaderText="Archive" HeaderStyle-HorizontalAlign="Left">
                            <ItemTemplate>
                                <asp:LinkButton ID="unarchiveButton" runat="server" CausesValidation="False" CommandName="Delete" 
                                    Text="UnArchive"  OnClientClick="return confirm ('Are you sure to unarchive this Contact record? All Pipeline records for this Contact will be unarchived too.');" ></asp:LinkButton>
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
            <td>
                <div id="Report" runat="server">
                    <asp:GridView Width="100%" ID="gvArchivedContactsExport" runat="server" DataSourceID="ContactDS"
                        AutoGenerateColumns="False" DataKeyNames="contactsid">
                        <Columns>
                            <asp:BoundField DataField="contactsid"  HeaderText="ID" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="FullName" HeaderText="Name"
                                HeaderStyle-ForeColor="Blue" SortExpression="FullName" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Phone" HeaderText="Phone" HeaderStyle-ForeColor="Blue" SortExpression="Phone" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left"  HeaderStyle-HorizontalAlign="Left" DataField="Email" HeaderText="E-mail" HeaderStyle-ForeColor="Blue" SortExpression="Email" />
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
            <td>
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="ContactDS" runat="server" 
                TypeName="SandlerRepositories.ContactsRepository" SelectMethod="GetAllArchived"
                DeleteMethod="UnArchiveContact"
                 OnSelecting="ContactDS_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCompanies" Name="COMPANIESID" PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="_user"  />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="contactsid" Type="Int32" />
                        <asp:ControlParameter Name="CurrentUserId"  ControlID="hidCurrentUserId"/>
                    </DeleteParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="CompaniesDS" runat="server" 
                TypeName="SandlerRepositories.CompaniesRepository" 
                SelectMethod="GetCompaniesForDDL" OnSelecting="CompaniesDS_Selecting">
                    <SelectParameters><asp:Parameter Name="_user"  /></SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hidContactID" runat="server" />
                <asp:HiddenField ID="hidCurrentUserId" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>

