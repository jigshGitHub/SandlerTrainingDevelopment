﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Add.aspx.cs" Inherits="ContactADD" %>

<%@ Register TagPrefix="ew" Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                Add Contact :
            </th>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:DetailsView ID="dvContact" runat="server" Height="50px" Width="300px" AutoGenerateRows="False"
                    DataSourceID="ContactDataSource" DefaultMode="Insert" CellPadding="3" BorderStyle="None"
                    BorderWidth="1px" BackColor="White" BorderColor="#999999" GridLines="Vertical"
                    OnItemInserted="dvContact_ItemInserted" OnModeChanging="dvContact_ModeChanging"
                    OnDataBound="dvContact_DataBound" OnItemInserting="dvContact_ItemInserting">
                    <Fields>
                        <asp:TemplateField HeaderText="Select Company:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" DataTextField="COMPANYNAME"
                                    DataValueField="COMPANIESID" SelectedValue='<%# Bind("COMPANIESID") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvLastNameTB" ControlToValidate="txtLastName" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Last Name to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvFirstNameTB" ControlToValidate="txtFirstName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter First Name to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPhone" onkeypress="EnterOnlyNumeric()" MaxLength="50" Width="380"
                                    runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPhoneTB" ControlToValidate="txtPhone" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Phone to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="E-mail :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtEmail" MaxLength="50" Width="380" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmailTB" ControlToValidate="txtEmail" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Email to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="New Appointment?:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description"
                                    DataValueField="Value" SelectedValue='<%# Bind("Value") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Appointment Source:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlApptSource" runat="server" DataSourceID="ApptSourceDS" DataTextField="ApptSourceName"
                                    DataValueField="ApptSourceId" SelectedValue='<%# Bind("ApptSourceId") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Registered for Training?:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlRegForTraining" runat="server" DataSourceID="RegForTrainingDS"
                                    DataTextField="Description" DataValueField="RegForTrainingId" SelectedValue='<%# Bind("RegForTrainingId") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Type:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlCourse" runat="server" DataSourceID="CourseDS" DataTextField="CourseName"
                                    DataValueField="CourseId" SelectedValue='<%# Bind("CourseId") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Training Date :">
                            <InsertItemTemplate>
                                <ew:CalendarPopup ID="CourseTrngDate" Nullable="True" DisplayPrevNextYearSelection="True"
                                    SelectedDate='<%# Bind("CourseTrngDate") %>' runat="server" AllowArbitraryText="False"
                                    CellPadding="2px" CellSpacing="0px" Culture="English (United States)" JavascriptOnChangeFunction=""
                                    LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="~/images/calendar.gif"
                                    ControlDisplay="TextBoxImage">
                                    <TodayDayStyle BackColor="LightGoldenrodYellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <WeekendStyle BackColor="LightGray" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <OffMonthStyle BackColor="AntiqueWhite" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Gray" />
                                    <WeekdayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <SelectedDateStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <MonthHeaderStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <HolidayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <GoToTodayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <ClearDateStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                </ew:CalendarPopup>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDiscTopic" Width="380" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDiscTopicTB" ControlToValidate="txtDiscTopic"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Discussion Topic to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Step :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtActStep" Width="380" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvActStepTB" ControlToValidate="txtActStep" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Action Step to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Contact Date :">
                            <InsertItemTemplate>
                                <ew:CalendarPopup ID="LastContactDate" Nullable="True" DisplayPrevNextYearSelection="True"
                                    SelectedDate='<%# Bind("Last_Contact_Date") %>' runat="server" AllowArbitraryText="False"
                                    CellPadding="2px" CellSpacing="0px" Culture="English (United States)" JavascriptOnChangeFunction=""
                                    LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="~/images/calendar.gif"
                                    ControlDisplay="TextBoxImage">
                                    <TodayDayStyle BackColor="LightGoldenrodYellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <WeekendStyle BackColor="LightGray" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <OffMonthStyle BackColor="AntiqueWhite" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Gray" />
                                    <WeekdayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <SelectedDateStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <MonthHeaderStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <HolidayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <GoToTodayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <ClearDateStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                </ew:CalendarPopup>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Next Contact Date :">
                            <InsertItemTemplate>
                                <ew:CalendarPopup ID="NextContactDate" Nullable="True" DisplayPrevNextYearSelection="True"
                                    SelectedDate='<%# Bind("Next_Contact_Date") %>' runat="server" AllowArbitraryText="False"
                                    CellPadding="2px" CellSpacing="0px" Culture="English (United States)" JavascriptOnChangeFunction=""
                                    LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="~/images/calendar.gif"
                                    ControlDisplay="TextBoxImage">
                                    <TodayDayStyle BackColor="LightGoldenrodYellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <WeekendStyle BackColor="LightGray" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <OffMonthStyle BackColor="AntiqueWhite" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Gray" />
                                    <WeekdayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <SelectedDateStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <MonthHeaderStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <HolidayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <GoToTodayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <ClearDateStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                </ew:CalendarPopup>
                                <asp:RequiredFieldValidator ID="NextContactDateRFV" ControlToValidate="NextContactDate"
                                    runat="server" ErrorMessage="Please Enter Next Contact Date to proceed.">
                                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Add" Font-Bold="true" ForeColor="Blue"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Back To Contacts" Font-Bold="true" ForeColor="Blue"></asp:LinkButton>
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
            <td style="width: 280px">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
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
                <asp:ObjectDataSource ID="ContactDataSource" runat="server" InsertMethod="Insert"
                    TypeName="SandlerRepositories.ContactsRepository">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="dvContact" Name="COMPANIESID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="LastName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="FirstName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Phone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Email" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Value" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="ApptSourceId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="RegForTrainingId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="CourseId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="CourseTrngDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="DiscussionTopic" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="ACTIONSTEP" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Last_Contact_Date" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Next_Contact_Date" PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
