<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="ContactDETAIL" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <table>
        <tr>
            <th style="float: left">
                <asp:Label ID="lblModuleActionHeading" runat="server"></asp:Label>
            </th>
        </tr>
        <tr>
            <td>
                <asp:DetailsView AutoGenerateRows="False" DataKeyNames="CONTACTSID" ID="ContactDW"
                    runat="server" Width="675px" OnItemCommand="ContactDW_ItemCommand" OnModeChanging="ContactDW_ModeChanging"
                    OnItemUpdating="ContactDW_ItemUpdating" OnDataBound="ContactDW_DataBound" OnItemCreated="ContactDW_ItemCreated">
                    <Fields>
                        <asp:BoundField DataField="CONTACTSID" Visible="False" />
                        <asp:TemplateField HeaderText="Company :">
                            <ItemTemplate>
                                <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("COMPANYNAME") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList DataSourceID="CompanyDS" DataTextField="COMPANYNAME" DataValueField="COMPANIESID"
                                    ID="ddlCompany" runat="server" SelectedValue='<%# Bind("COMPANIESID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLastName" MaxLength="50" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLNTB" ControlToValidate="txtLastName" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Last Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFirstName" MaxLength="50" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFNTB" ControlToValidate="txtFirstName" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter First Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPhone" MaxLength="50" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhoneTB" ControlToValidate="txtPhone" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Phone to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="E-mail :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" MaxLength="50" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmailTB" ControlToValidate="txtEmail" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Email to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="New Appointment?:">
                            <ItemTemplate>
                                <asp:Label ID="lblNewAppt" runat="server" Text='<%# Eval("NewApptDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description"
                                    DataValueField="Value" SelectedValue='<%# Bind("Value") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Appointment Source:">
                            <ItemTemplate>
                                <asp:Label ID="lblApptSource" runat="server" Text='<%# Eval("ApptSourceName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlApptSource" runat="server" DataSourceID="ApptSourceDS" DataTextField="ApptSourceName"
                                    DataValueField="ApptSourceId" SelectedValue='<%# Bind("ApptSourceId") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Registered for Trng?:">
                            <ItemTemplate>
                                <asp:Label ID="lblRegTrng" runat="server" Text='<%# Eval("RegForTrngDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlRegForTraining" runat="server" DataSourceID="RegForTrainingDS"
                                    DataTextField="Description" DataValueField="RegForTrainingId" SelectedValue='<%# Bind("RegForTrainingId") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Type:">
                            <ItemTemplate>
                                <asp:Label ID="lblCourseType" runat="server" Text='<%# Eval("CourseName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCourse" runat="server" DataSourceID="CourseDS" DataTextField="CourseName"
                                    DataValueField="CourseId" SelectedValue='<%# Bind("CourseId") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Training Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="CourseTrngDate" Text='<%# Bind("CourseTrainingDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageCTD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender runat="server" TargetControlID="CourseTrngDate" PopupButtonID="calanderImageCTD" CssClass="calendar"></asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCourseTrngDate" runat="server" Text='<%# Bind("CourseTrainingDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDiscTopic" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDiscTopicTB" ControlToValidate="txtDiscTopic"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Discussion Topic to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDiscTopic" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Step :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtActStep" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvActionStepTB" ControlToValidate="txtActStep" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Action Step to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblActStep" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Contact Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="LastContactDate" Text='<%# Bind("Last_Contact_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender runat="server" TargetControlID="LastContactDate" PopupButtonID="calanderImageLCD" CssClass="calendar"></asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastContactDate" runat="server" Text='<%# Bind("Last_Contact_Date","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Next Contact Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="NextContactDate" Text='<%# Bind("Next_Contact_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageNCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender runat="server" TargetControlID="NextContactDate" PopupButtonID="calanderImageNCD" CssClass="calendar"></asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="NextContactDateRFV" ControlToValidate="NextContactDate" runat="server" ErrorMessage="Please Enter Next Contact Date to proceed.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNextContactDate" runat="server" Text='<%# Bind("Next_Contact_Date","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ControlStyle ForeColor="Red" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td style="height: 70">
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="Cancel" CssClass="menuButton" runat="server" Text="Go Back to All Contacts"
                    OnClick="Cancel_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label CssClass="resultLabel" ID="LblStatus" ForeColor="Red" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetCompaniesForDDL"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ApptSourceDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                    SelectMethod="GetApptSourceOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="RegForTrainingDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                    SelectMethod="GetRegForTrainingOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CourseDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                    SelectMethod="GetCourseInfo"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HiddenField ID="hidContactID" runat="server" />
                <asp:HiddenField ID="hidCourseName" runat="server" />
                <asp:HiddenField ID="hidApptSourceName" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
