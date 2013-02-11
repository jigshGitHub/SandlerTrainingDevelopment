<%@ Page Title="CRM - Add Contact" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="ContactADD" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <asp:UpdatePanel id="updPnlContact" runat="server">
    <ContentTemplate>
    

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
                                <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" DataTextField="COMPANYNAME" DataValueField="COMPANIESID" SelectedValue='<%# Bind("COMPANIESID") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                <label id="mandlbl1" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvLastNameTB" ControlToValidate="txtLastName" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Last Name to proceed.">Required field</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                <label id="mandlbl2" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvFirstNameTB" ControlToValidate="txtFirstName" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter First Name to proceed.">Required field</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtTitle" MaxLength="50" Width="380" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's Department :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDepartment" MaxLength="50" Width="380" runat="server" Text='<%# Bind("ContactsDepartment") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's Role :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtRole" MaxLength="50" Width="380" runat="server" Text='<%# Bind("ContactsRole") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPhone"  MaxLength="50" Width="380" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Mobile Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtMobilePhone"  MaxLength="50" Width="380" runat="server" Text='<%# Bind("MobilePhone") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Home Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtHomePhone"  MaxLength="50" Width="380" runat="server" Text='<%# Bind("HomePhone") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Fax :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtFax"  MaxLength="50" Width="380" runat="server" Text='<%# Bind("Fax") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="E-mail :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtEmail" MaxLength="50" Width="380" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="regExpVal" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Valid Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Personal E-mail :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPersonalEmail" MaxLength="50" Width="380" runat="server" Text='<%# Bind("PersonalEmail") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="regExpValPE" runat="server" ControlToValidate="txtPersonalEmail" ErrorMessage="Please Enter Valid Personal Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Contact's Address :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtAddress" MaxLength="150" Width="380" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's City :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCity" MaxLength="50" Width="380" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's State :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtState" MaxLength="50" Width="380" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's Zip :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtZip"  MaxLength="7"  Width="380" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact's Country :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCountry" MaxLength="50" Width="380" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="New Appointment?:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("Value") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Appointment Source:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlApptSource" runat="server" DataSourceID="ApptSourceDS" DataTextField="ApptSourceName" DataValueField="ApptSourceId" SelectedValue='<%# Bind("ApptSourceId") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Registered for Training?:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlRegForTraining" runat="server" DataSourceID="RegForTrainingDS" DataTextField="Description" DataValueField="RegForTrainingId" SelectedValue='<%# Bind("RegForTrainingId") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Type:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlCourse" runat="server" DataSourceID="CourseDS" DataTextField="CourseName" DataValueField="CourseId" SelectedValue='<%# Bind("CourseId") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Training Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="CourseTrngDate" Text='<%# Bind("CourseTrngDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageCTD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="CourseTrngDate" PopupButtonID="calanderImageCTD" CssClass="calendar"></asp:CalendarExtender>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDiscTopic" Width="380" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                               
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Step :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtActStep" Width="380" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Date Last Attempted :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="LastAttemptedDate" Text='<%# Bind("LastAttemptedDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLAD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="LastAttemptedDate" PopupButtonID="calanderImageLAD" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Last Contact Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="LastContactDate" Text='<%# Bind("Last_Contact_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="LastContactDate" PopupButtonID="calanderImageLCD" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Date Last Emailed :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="LastEmailedDate" Text='<%# Bind("LastEmailedDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLED" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="LastEmailedDate" PopupButtonID="calanderImageLED" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date of Last Meeting :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="LastMeetingDate" Text='<%# Bind("LastMeetingDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLMD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="LastMeetingDate" PopupButtonID="calanderImageLMD" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date Letter Sent :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="DateLetterSentOut" Text='<%# Bind("LetterSentDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLSOD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender8" runat="server" TargetControlID="DateLetterSentOut" PopupButtonID="calanderImageLSOD" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Next Contact Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="NextContactDate" Text='<%# Bind("Next_Contact_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageNCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="NextContactDate" PopupButtonID="calanderImageNCD" CssClass="calendar"></asp:CalendarExtender>
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Need to Call Back?:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlCallBack" runat="server" DataSourceID="CallBackInfoDS" DataTextField="CallBackDescription" DataValueField="CallBackValue" SelectedValue='<%# Bind("CallBackValue") %>'></asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Birthday :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="BirthDayDate" Text='<%# Bind("Birthday") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageBRD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="BirthDayDate" PopupButtonID="calanderImageBRD" CssClass="calendar"></asp:CalendarExtender>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Spouse's Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtSpouseName" Width="380" runat="server" Text='<%# Bind("SpouseName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Anniversary :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="AnniversaryDate" Text='<%# Bind("Anniversary") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageAVS" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender9" runat="server" TargetControlID="AnniversaryDate" PopupButtonID="calanderImageAVS" CssClass="calendar"></asp:CalendarExtender>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Years :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCompYears" onkeypress="EnterOnlyNumeric()" MaxLength="3" Width="380" runat="server" Text='<%# Bind("CompanyYears") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Boss Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtBossName" Width="380" runat="server" Text='<%# Bind("BossName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Referred By :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtReferredBy" Width="380" runat="server" Text='<%# Bind("ReferredBy") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Contact's Notes :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtNotes"  TextMode="MultiLine" Rows="3" Width="380" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
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
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Forecolor="Red" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetCompaniesForDDL"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
                
                <asp:ObjectDataSource ID="CallBackInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetCallBackOptions"></asp:ObjectDataSource>

                <asp:ObjectDataSource ID="ApptSourceDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"  SelectMethod="GetApptSourceOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="RegForTrainingDS" runat="server" TypeName="SandlerRepositories.ContactsRepository" SelectMethod="GetRegForTrainingOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CourseDS" runat="server" TypeName="SandlerRepositories.ContactsRepository" SelectMethod="GetCourseInfo"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ContactDataSource" runat="server" InsertMethod="Insert"
                    TypeName="SandlerRepositories.ContactsRepository">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="dvContact" Name="COMPANIESID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="LastName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="FirstName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Title" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="ContactsDepartment" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="ContactsRole" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Phone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="MobilePhone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="HomePhone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Fax" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Email" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="PersonalEmail" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Address" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="City" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="State" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Zip" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Country" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Value" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="ApptSourceId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="RegForTrainingId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="CourseId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="CourseTrngDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="DiscussionTopic" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="ACTIONSTEP" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="LastAttemptedDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Last_Contact_Date" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="LastEmailedDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="LastMeetingDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="LetterSentDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Next_Contact_Date" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="CallBackValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Birthday" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="SpouseName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Anniversary" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="CompanyYears" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="BossName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="ReferredBy" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvContact" Name="Notes" PropertyName="SelectedValue" />

                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>

     </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
