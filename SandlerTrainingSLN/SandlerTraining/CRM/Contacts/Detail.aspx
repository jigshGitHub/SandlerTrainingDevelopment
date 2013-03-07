<%@ Page Title="CRM - View/Edit Contact" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="ContactDETAIL" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table style="width: 100%">
        <tr>
            <th align="left">
                <asp:Label ID="lblModuleActionHeading" runat="server"></asp:Label>
            </th>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label CssClass="resultLabel" ID="LblStatus1" ForeColor="Red" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView AutoGenerateRows="False" DataKeyNames="CONTACTSID" ID="ContactDW"
                    runat="server" Width="675px" OnItemCommand="ContactDW_ItemCommand" OnModeChanging="ContactDW_ModeChanging"
                    OnItemUpdating="ContactDW_ItemUpdating" OnDataBound="ContactDW_DataBound" OnItemCreated="ContactDW_ItemCreated">
                    <Fields>
                        <asp:BoundField DataField="CONTACTSID" Visible="False" />
                        <asp:TemplateField ShowHeader="False">
                            <ControlStyle Font-Bold="true" />
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton11" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton11" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit"></asp:LinkButton>&nbsp;&nbsp;<a href="Index.aspx" style="font-weight: bold">Back
                                        To Contacts</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
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
                                <label id="mandlbl1" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvLNTB" ControlToValidate="txtLastName" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Last Name to proceed.">Required field</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastName" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFirstName" MaxLength="50" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                <label id="mandlbl2" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvFNTB" ControlToValidate="txtFirstName" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter First Name to proceed.">Required field</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFirstName" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Title :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTitle" MaxLength="50" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Contact's Department :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDepartment" MaxLength="50" runat="server" Text='<%# Bind("ContactsDepartment") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDepartment" runat="server" Text='<%# Bind("ContactsDepartment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contact's Role :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRole" MaxLength="50" runat="server" Text='<%# Bind("ContactsRole") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRole" runat="server" Text='<%# Bind("ContactsRole") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Phone :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPhone" MaxLength="50" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Mobile Phone :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMobilePhone" MaxLength="50" runat="server" Text='<%# Bind("MobilePhone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblMobilePhone" runat="server" Text='<%# Bind("MobilePhone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Home Phone :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtHomePhone" MaxLength="50" runat="server" Text='<%# Bind("HomePhone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblHomePhone" runat="server" Text='<%# Bind("HomePhone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Fax :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFax" MaxLength="50" runat="server" Text='<%# Bind("Fax") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblFax" runat="server" Text='<%# Bind("Fax") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="E-mail :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" MaxLength="50" Width="380px" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="regExpVal" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Valid Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Personal E-mail :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPersonalEmail" MaxLength="50" Width="380px" runat="server" Text='<%# Bind("PersonalEmail") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="regExpValPE" runat="server" ControlToValidate="txtPersonalEmail" ErrorMessage="Please Enter Valid Personal Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPersonalEmail" runat="server" Text='<%# Bind("PersonalEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Contact's Address :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" Width="380" MaxLength="150" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's City :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCity" MaxLength="50" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's State :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtState"  MaxLength="50" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's Zip :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtZip"   MaxLength="7" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblZip" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's Country :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCountry"  runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
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
                                <asp:TextBox ID="CourseTrngDate" Text='<%# Bind("CourseTrainingDate") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageCTD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="CourseTrngDate"
                                    PopupButtonID="calanderImageCTD" CssClass="calendar">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCourseTrngDate" runat="server" Text='<%# Bind("CourseTrainingDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Training Course Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTrainingCourseName" Width="380" runat="server" Text='<%# Bind("TrainingCourseName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTrainingCourseName" runat="server" Text='<%# Bind("TrainingCourseName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="How Many Attended? :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtHowManyAttended" onkeypress="EnterOnlyNumeric()" MaxLength="5" runat="server"
                                    Text='<%# Bind("HowManyAttended") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblHowManyAttended" runat="server" Text='<%# Bind("HowManyAttended") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Name where Training conducted :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCompanyNameWhereTrainingConducted" Width="380" runat="server" Text='<%# Bind("CompanyNameWhereTrainingConducted") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompanyNameWhereTrainingConducted" runat="server" Text='<%# Bind("CompanyNameWhereTrainingConducted") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDiscTopic" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDiscTopic" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Action Step :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtActStep" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblActStep" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Date Last Attempted :">
                            <EditItemTemplate>
                                <asp:TextBox ID="LastAttemptedDate" Text='<%# Bind("LastAttemptedDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageDLA" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender21" runat="server" TargetControlID="LastAttemptedDate" PopupButtonID="calanderImageDLA" CssClass="calendar"></asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastAttemptedDate" runat="server" Text='<%# Bind("LastAttemptedDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="Last Contact Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="LastContactDate" Text='<%# Bind("Last_Contact_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="LastContactDate" PopupButtonID="calanderImageLCD" CssClass="calendar"></asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastContactDate" runat="server" Text='<%# Bind("Last_Contact_Date","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        
                        <asp:TemplateField HeaderText="Date Last Emailed :">
                            <EditItemTemplate>
                                <asp:TextBox ID="LastEmailedDate" Text='<%# Bind("LastEmailedDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLED" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender22" runat="server" TargetControlID="LastEmailedDate" PopupButtonID="calanderImageLED" CssClass="calendar"></asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastEmailedDate" runat="server" Text='<%# Bind("LastEmailedDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                         <asp:TemplateField HeaderText="Date of Last Meeting :">
                            <EditItemTemplate>
                                <asp:TextBox ID="LastMeetingDate" Text='<%# Bind("LastMeetingDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLMD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender23" runat="server" TargetControlID="LastMeetingDate" PopupButtonID="calanderImageLMD" CssClass="calendar"></asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastMeetingDate" runat="server" Text='<%# Bind("LastMeetingDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date Letter Sent :">
                            <EditItemTemplate>
                                <asp:TextBox ID="DateLetterSentOut" Text='<%# Bind("LetterSentDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageDLSO" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender24" runat="server" TargetControlID="DateLetterSentOut" PopupButtonID="calanderImageDLSO" CssClass="calendar"></asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDateLetterSentOut" runat="server" Text='<%# Bind("LetterSentDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Next Contact Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="NextContactDate" Text='<%# Bind("Next_Contact_Date") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageNCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="NextContactDate"
                                    PopupButtonID="calanderImageNCD" CssClass="calendar">
                                </asp:CalendarExtender>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNextContactDate" runat="server" Text='<%# Bind("Next_Contact_Date","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email Subscription?:">
                            <ItemTemplate>
                                <asp:Label ID="lblBlastEmail" runat="server" Text='<%# Eval("BlastEmailDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlBlastEmail" runat="server" DataSourceID="BlastEmailDS" DataTextField="Description"
                                    DataValueField="BlastEmailId" SelectedValue='<%# Bind("BlastEmailId") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Need to Call Back?:">
                            <ItemTemplate>
                                <asp:Label ID="lblCallBack" runat="server" Text='<%# Eval("CallBackDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCallBack" runat="server" DataSourceID="CallBackInfoDS" DataTextField="CallBackDescription"
                                    DataValueField="CallBackValue" SelectedValue='<%# Bind("CallBackValue") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Birthday :">
                            <EditItemTemplate>
                                <asp:TextBox ID="BirthdayDate" Text='<%# Bind("Birthday") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageBRD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="BirthdayDate"
                                    PopupButtonID="calanderImageBRD" CssClass="calendar">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblBirthdayDate" runat="server" Text='<%# Bind("Birthday","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                                
                        <asp:TemplateField HeaderText="Spouse's Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtSpouseName" runat="server" Text='<%# Bind("SpouseName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblSpouseName" runat="server" Text='<%# Bind("SpouseName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        
                        <asp:TemplateField HeaderText="Anniversary :">
                            <EditItemTemplate>
                                <asp:TextBox ID="AnniversaryDate" Text='<%# Bind("Anniversary") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageAVS" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="AnniversaryDate"
                                    PopupButtonID="calanderImageAVS" CssClass="calendar">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAnniversaryDate" runat="server" Text='<%# Bind("Anniversary","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Years :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCompanyYears" onkeypress="EnterOnlyNumeric()" MaxLength="3" runat="server"
                                    Text='<%# Bind("CompanyYears") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompanyYears" runat="server" Text='<%# Bind("CompanyYears") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Boss Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBossName" runat="server" Text='<%# Bind("BossName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblBossName" runat="server" Text='<%# Bind("BossName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Referred By :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtReferredBy" runat="server" Text='<%# Bind("ReferredBy") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblReferredBy" runat="server" Text='<%# Bind("ReferredBy") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Contact's Notes :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNotes" Width="380" TextMode="MultiLine" Rows="3" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField ShowHeader="False">
                            <ControlStyle Font-Bold="true" />
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit"></asp:LinkButton>&nbsp;&nbsp;<a href="Index.aspx" style="font-weight: bold">Back
                                        To Contacts</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
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
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetCompaniesForDDL" OnSelecting="CompanyDS_Selecting">
                    <SelectParameters><asp:Parameter Name="_user"  /></SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ApptSourceDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                    SelectMethod="GetApptSourceOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="RegForTrainingDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                    SelectMethod="GetRegForTrainingOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="BlastEmailDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                    SelectMethod="GetBlastEmailOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CourseDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                    SelectMethod="GetCourseInfo"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CallBackInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetCallBackOptions"></asp:ObjectDataSource>
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
