<%@ Page Title="CRM - Search Contacts" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="CRM_Contacts_Search" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<asp:UpdatePanel ID="updPnl" runat="server">
    <ContentTemplate>
   <table id="tblSearchCriteria">
    <tr>
       <th class="tdTC" align="left">
                Search Contact : Please enter/select at least one criteria to search.
       </th>
     </tr>
     <tr>
            <td>
                <asp:DetailsView ID="dvContact" runat="server" Height="50px" Width="300px" AutoGenerateRows="False"
                    DefaultMode="Insert" CellPadding="3" BorderStyle="None"
                    BorderWidth="1px" BackColor="White" BorderColor="#999999" GridLines="Vertical"
                    OnModeChanging="dvContact_ModeChanging"
                    OnItemInserting="dvContact_ItemInserting">
                    <Fields>
                        <asp:TemplateField HeaderText="Select Company:">
                            <InsertItemTemplate>
                                <asp:ListBox ID="lbCompany" runat="server" SelectionMode="Multiple"  Rows="5"  Width="280" DataSourceID="CompanyDS" DataTextField="COMPANYNAME" DataValueField="COMPANIESID"></asp:ListBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtLastName" MaxLength="50" Width="380" runat="server"></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtFirstName" MaxLength="50" Width="380" runat="server"></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPhone"  MaxLength="50" Width="380" runat="server" ></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="E-mail :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtEmail" MaxLength="50" Width="380" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="regExpVal" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Valid Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="New Appointment?:">
                            <InsertItemTemplate>
                                <asp:ListBox ID="lbAccount" runat="server" SelectionMode="Multiple"  Rows="2"  Width="280" DataSourceID="NewItemInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Appointment Source:">
                            <InsertItemTemplate>
                                <asp:ListBox ID="lbApptSource" SelectionMode="Multiple"  Rows="5" Width="280" runat="server" DataSourceID="ApptSourceDS" DataTextField="ApptSourceName" DataValueField="ApptSourceId"></asp:ListBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Registered for Training?:">
                            <InsertItemTemplate>
                                <asp:ListBox ID="lbRegForTraining" runat="server" SelectionMode="Multiple"  Rows="2" Width="280" DataSourceID="RegForTrainingDS" DataTextField="Description" DataValueField="RegForTrainingId" ></asp:ListBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Type:">
                            <InsertItemTemplate>
                                <asp:ListBox ID="lbCourseType" runat="server" SelectionMode="Multiple"  Rows="4" Width="280" DataSourceID="CourseDS" DataTextField="CourseName" DataValueField="CourseId" ></asp:ListBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Training Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="CourseTrngDate" runat="server" />&nbsp;<asp:Image ID="calanderImageCTD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="CourseTrngDate" PopupButtonID="calanderImageCTD" CssClass="calendar"></asp:CalendarExtender>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDiscTopic" Width="380" runat="server"></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Step :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtActStep" Width="380" runat="server"></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Years :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCompYears" onkeypress="EnterOnlyNumeric()" Width="380" runat="server"></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Boss Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtBossName" Width="380" runat="server"></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Birthday :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="BirthDayDate" runat="server" />&nbsp;<asp:Image ID="calanderImageBDD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="BirthDayDate" PopupButtonID="calanderImageBDD" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Anniversary :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="AnniversaryDate" runat="server" />&nbsp;<asp:Image ID="calanderImageAND" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="AnniversaryDate" PopupButtonID="calanderImageAND" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Contact Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="LastContactDate" runat="server" />&nbsp;<asp:Image ID="calanderImageLCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="LastContactDate" PopupButtonID="calanderImageLCD" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Next Contact Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="NextContactDate" runat="server" />&nbsp;<asp:Image ID="calanderImageNCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="NextContactDate" PopupButtonID="calanderImageNCD" CssClass="calendar"></asp:CalendarExtender>
                             </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email Subscription:">
                            <InsertItemTemplate>
                                <asp:ListBox ID="lbEmailSubscription" runat="server" SelectionMode="Multiple"  Rows="2" Width="280" DataSourceID="BlastEmailDS" DataTextField="Description" DataValueField="BlastEmailId" ></asp:ListBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Need to Call Back?:">
                            <InsertItemTemplate>
                                <asp:ListBox ID="lbCallBack" runat="server" SelectionMode="Multiple"  Rows="2" Width="280" DataSourceID="CallBackInfoDS" DataTextField="CallBackDescription" DataValueField="CallBackValue" ></asp:ListBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Search" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Clear" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
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
                <asp:ObjectDataSource ID="BlastEmailDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"   SelectMethod="GetBlastEmailOptions"></asp:ObjectDataSource>
           </td>
        </tr>
     </table> 
     </ContentTemplate>
     </asp:UpdatePanel>  

</asp:Content>

