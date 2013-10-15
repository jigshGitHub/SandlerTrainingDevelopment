<%@ Page Title="QuickStart - Add" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Index.aspx.cs" Inherits="CRM_QuickStart_Index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('.txtMultlines').keyup(function (e) {
                var maxLength = 1000;
                var textlength = this.value.length;
                if (textlength >= maxLength) {
                    alert("The Notes field only accepts the first 1000 characters, the rest of them will be truncated. Current Length: " + textlength);
                    //$('#charStatus').html('You cannot write more then ' + maxLength + ' characters!');
                    this.value = this.value.substring(0, maxLength);
                    e.preventDefault();
                }
                else {
                    //alert("The Notes field only accepts the first 1000 characters, the rest of them will be truncated. Current Length: "+textlength);
                    //$('#charStatus').html('You have ' + (maxLength - textlength) + ' characters left.');
                }
            });
        });
    </script>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="updPnlQuickStart" runat="server">
        <ContentTemplate>
            <table width="100%">
                <tr>
                    <th class="tdTC" style="width: 280px" align="left">
                        Quick Start -Company, Contact and Opportunity All-in-One :
                    </th>
                </tr>
                <tr>
                    <td>
                        <table id="tblInformation" width="40%">
                            <tr>
                                <td>
                                    <asp:DetailsView ID="dvQuickStart" runat="server" Height="50px" Width="300px" AutoGenerateRows="False"
                                        DataSourceID="QuickStartDataSource" DefaultMode="Insert" CellPadding="3" BorderStyle="None"
                                        BorderWidth="1px" BackColor="White" BorderColor="#999999" GridLines="Vertical"
                                        OnDataBound="dvQuickStart_DataBound" OnModeChanging="dvQuickStart_ModeChanging"
                                        OnItemInserted="dvQuickStart_ItemInserted">
                                        <Fields>
                                            <asp:TemplateField HeaderText="Company Name :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtCompName" MaxLength="50" Width="300" runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:TextBox>
                                                    <label id="mandlbl36" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="reqFieldValCompNameTB" ControlToValidate="txtCompName"
                                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="POC First Name :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtFirstName" MaxLength="50" Width="300" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                                                    <label id="mandlbl37" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rfvFirstNameTB" ControlToValidate="txtFirstName"
                                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter First Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="POC Last Name :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtLastName" MaxLength="50" Width="300" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                                                    <label id="mandlbl38" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rfvLastNameTB" ControlToValidate="txtLastName" Display="Static"
                                                        InitialValue="" runat="server" ErrorMessage="Please Enter Last Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Phone :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtPhone" MaxLength="50" Width="300" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="E-mail :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtEmail" MaxLength="50" Width="300" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                                    <asp:RegularExpressionValidator ID="regExpVal" runat="server" ControlToValidate="txtEmail"
                                                        ErrorMessage="Please Enter Valid Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Opportunity Name :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtOppName" MaxLength="50" runat="server" Width="300" Text='<%# Bind("OPPNAME") %>'></asp:TextBox>
                                                    <label id="mandlbl39" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rFVOppNameTB" ControlToValidate="txtOppName" Display="Static"
                                                        InitialValue="" runat="server" ErrorMessage="Please Enter Opportunity Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sales Rep Last Name :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtSalesRepLastName" MaxLength="50" runat="server" Width="300" Text='<%# Bind("SalesRepLastName") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sales Rep First Name :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtSalesRepFirstName" MaxLength="50" runat="server" Width="300"
                                                        Text='<%# Bind("SalesRepFirstName") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pain :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtPain" MaxLength="100" runat="server" Width="300" Text='<%# Bind("Pain") %>'></asp:TextBox>
                                                    <label id="mandlbl69" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rFVtxtPain" ControlToValidate="txtPain" Display="Static"
                                                        InitialValue="" runat="server" ErrorMessage="Please Enter Pain to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Length of Problem? :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtLengthOfProblem" MaxLength="30" runat="server" Width="300" Text='<%# Bind("LengthProblem") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Alternatives? :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtAlternatives" MaxLength="100" runat="server" Width="300" Text='<%# Bind("Alternatives") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Perceived Cost to Fix? :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtCostToFix" MaxLength="30" runat="server" Width="300" Text='<%# Bind("CostToFix") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Budget Identified?:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlBudgeIdentified" runat="server" DataSourceID="GetYesNoOptionsDS"
                                                        DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("BudgeIdentifiedValue") %>'>
                                                    </asp:DropDownList>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Move Forward?:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlMoveForward" runat="server" DataSourceID="GetYesNoOptionsDS"
                                                        DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("MoveForwardValue") %>'>
                                                    </asp:DropDownList>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlProducts" runat="server" DataSourceID="ProductTypesDS" DataTextField="ProductTypeName"
                                                        DataValueField="Id" SelectedValue='<%# Bind("ProductID") %>'>
                                                    </asp:DropDownList>
                                                    <label id="mandlbl40" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rfvProduct" ControlToValidate="ddlProducts" Display="Dynamic"
                                                        InitialValue="0" runat="server" ErrorMessage="Please Select Product to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Opportunity Status:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlOppStatus" runat="server" DataSourceID="OpportunityStatusDS"
                                                        DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("OppStatusID") %>'>
                                                    </asp:DropDownList>
                                                    <label id="mandlbl41" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rfvOppStatus" ControlToValidate="ddlOppStatus" Display="Dynamic"
                                                        InitialValue="0" runat="server" ErrorMessage="Please Select Opportunity Status to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Opportunity Source:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlOppSource" runat="server" DataSourceID="OpportunitySourceDS"
                                                        DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("OppSourceID") %>'>
                                                    </asp:DropDownList>
                                                    <label id="mandlbl42" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rfvOppSource" ControlToValidate="ddlOppSource" Display="Dynamic"
                                                        InitialValue="0" runat="server" ErrorMessage="Please Select Opportunity Source to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Opportunity Type:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlOppType" runat="server" DataSourceID="OpportunityTypesDS"
                                                        DataTextField="Name" DataValueField="ID" SelectedValue='<%# Bind("OppTypeID") %>'>
                                                    </asp:DropDownList>
                                                    <label id="mandlbl43" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rfvOppType" ControlToValidate="ddlOppType" Display="Dynamic"
                                                        InitialValue="0" runat="server" ErrorMessage="Please Select Opportunity Type to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Estimated Opportunity Value :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtOpportunityValue" onkeypress="EnterOnlyNumeric()" runat="server"
                                                        Text='<%# Bind("OPPVALUE") %>'></asp:TextBox>
                                                    <label id="mandlbl44" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="reqFieldValTAVTB" ControlToValidate="txtOpportunityValue"
                                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Estimated Opportunity Value to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Next Step :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtActStep" Width="300" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="New Appointment?:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description"
                                                        DataValueField="Value" SelectedValue='<%# Bind("Value") %>'>
                                                    </asp:DropDownList>
                                                    <%--<label id="mandlbl45" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvAccount" ControlToValidate="ddlAccount" Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Please Select New Appointment to proceed.">Required Field</asp:RequiredFieldValidator>--%>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Appointment Source:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlApptSource" runat="server" DataSourceID="ApptSourceDS" DataTextField="ApptSourceName"
                                                        DataValueField="ApptSourceId" SelectedValue='<%# Bind("ApptSourceId") %>'>
                                                    </asp:DropDownList>
                                                    <label id="mandlbl46" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rfvApptSource" ControlToValidate="ddlApptSource"
                                                        Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Please Select Appointment Source to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Registered for Training?:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlRegForTraining" runat="server" DataSourceID="RegForTrainingDS"
                                                        AutoPostBack="true" DataTextField="Description" OnSelectedIndexChanged="ddlRegForTraining_SelectedIndexChanged"
                                                        DataValueField="RegForTrainingId" SelectedValue='<%# Bind("RegForTrainingId") %>'>
                                                    </asp:DropDownList>
                                                    <%--<label id="mandlbl47" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvRegForTraining" ControlToValidate="ddlRegForTraining" Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Please Select Registered for Training to proceed.">Required Field</asp:RequiredFieldValidator>--%>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Course Type:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlCourse" runat="server" DataSourceID="CourseDS" DataTextField="CourseName"
                                                        DataValueField="CourseId" SelectedValue='<%# Bind("CourseId") %>'>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="mandlbl48" Style="color: Red" Visible="false" runat="server">*</asp:Label>
                                                    <asp:RequiredFieldValidator ID="rfvCourse" Enabled="false" ControlToValidate="ddlCourse"
                                                        Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Please Select Course Type to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Course Training Date :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="CourseTrngDate" Text='<%# Bind("CourseTrngDate") %>' runat="server" />&nbsp;<asp:Image
                                                        ID="calanderImageCTD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="CourseTrngDate"
                                                        PopupButtonID="calanderImageCTD" CssClass="calendar">
                                                    </asp:CalendarExtender>
                                                    <asp:Label ID="mandlbl49" Style="color: Red" Visible="false" runat="server">*</asp:Label>
                                                    <asp:RequiredFieldValidator ID="reqFieldCourseTrngDate" Enabled="false" ControlToValidate="CourseTrngDate"
                                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Course Training Date Date to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Training Course Name :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtTrngCourseName" Width="300" runat="server" Text='<%# Bind("TrainingCourseName") %>'></asp:TextBox>
                                                    <asp:Label ID="mandlbl50" Style="color: Red" Visible="false" runat="server">*</asp:Label>
                                                    <asp:RequiredFieldValidator ID="rFVTrngCourseName" Enabled="false" ControlToValidate="txtTrngCourseName"
                                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Training Course Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Class Head Count :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtHowManyAttended" onkeypress="EnterOnlyNumeric()" MaxLength="5"
                                                        Width="300" runat="server" Text='<%# Bind("HowManyAttended") %>'></asp:TextBox>
                                                    <asp:Label ID="mandlbl51" Style="color: Red" Visible="false" runat="server">*</asp:Label>
                                                    <asp:RequiredFieldValidator ID="rFVHowManyAttended" Enabled="false" ControlToValidate="txtHowManyAttended"
                                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Class Head Count to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="New Company?:">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description"
                                                        DataValueField="Value" SelectedValue='<%# Bind("IsNewCompany") %>'>
                                                    </asp:DropDownList>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Industry :">
                                                <InsertItemTemplate>
                                                    <asp:DropDownList ID="ddlIndustry" runat="server" DataSourceID="IndustryDS" DataTextField="IndustryTypeName"
                                                        DataValueField="IndID" SelectedValue='<%# Bind("IndID") %>'>
                                                    </asp:DropDownList>
                                                    <label id="mandlbl52" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:RequiredFieldValidator ID="rfvIndustry" ControlToValidate="ddlIndustry" Display="Dynamic"
                                                        InitialValue="0" runat="server" ErrorMessage="Please Select Industry to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Next Contact Date :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="NextContactDate" Text='<%# Bind("NextContactDate") %>' runat="server" />&nbsp;<asp:Image
                                                        ID="calanderImageNCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender runat="server" TargetControlID="NextContactDate" PopupButtonID="calanderImageNCD"
                                                        CssClass="calendar">
                                                    </asp:CalendarExtender>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Est. Opportunity Close Date :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="OppCloseDate" Text='<%# Bind("OppCloseDate") %>' runat="server" />&nbsp;<asp:Image
                                                        ID="calanderImageOCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <label id="mandlbl53" style="color: Red" runat="server">
                                                        *</label>
                                                    <asp:CalendarExtender runat="server" TargetControlID="OppCloseDate" PopupButtonID="calanderImageOCD"
                                                        CssClass="calendar">
                                                    </asp:CalendarExtender>
                                                    <asp:RequiredFieldValidator ID="reqFieldOppCloseDate" ControlToValidate="OppCloseDate"
                                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Est. Opportunity Close Date to proceed.">Required Field</asp:RequiredFieldValidator>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Notes :">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="txtNotes" MaxLength="1000" Width="300" Height="50" class="txtMultlines"
                                                        TextMode="MultiLine" Text='<%# Bind("Notes") %>' runat="server" />&nbsp;
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ShowHeader="False">
                                                <InsertItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                                        Text="Save" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                        Text="Cancel" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
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
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 280px">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                        <asp:ObjectDataSource ID="ProductTypesDS" runat="server" SelectMethod="GetProductTypeByRole"
                            TypeName="SandlerRepositories.QuickStartRepository" OnSelecting="ProductTypesDS_Selecting">
                            <SelectParameters>
                                <asp:Parameter Name="_user" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="OpportunityStatusDS" runat="server" SelectMethod="GetAll"
                            TypeName="SandlerRepositories.OpprtunityStatusRepository"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="OpportunitySourceDS" runat="server" SelectMethod="GetAll"
                            TypeName="SandlerRepositories.OpprtunitySourceRepository"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="OpportunityTypesDS" runat="server" SelectMethod="GetAll"
                            TypeName="SandlerRepositories.OpprtunityTypesRepository"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="GetYesNoOptionsDS" runat="server" SelectMethod="GetYesNoOptions"
                            TypeName="SandlerRepositories.QuickStartRepository"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                            SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ApptSourceDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                            SelectMethod="GetApptSourceOptions"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="RegForTrainingDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                            SelectMethod="GetRegForTrainingOptions"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="CourseDS" runat="server" TypeName="SandlerRepositories.ContactsRepository"
                            SelectMethod="GetCourseInfo"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="IndustryDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                            SelectMethod="GetAllIndustries"></asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="QuickStartDataSource" runat="server" InsertMethod="InsertQuickStartRecord"
                            TypeName="SandlerRepositories.QuickStartRepository" OnInserting="InsertOperation_Selecting">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="dvQuickStart" Name="COMPANYNAME" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="FirstName" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="LastName" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="Phone" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="Email" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="OPPNAME" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="SalesRepLastName" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="SalesRepFirstName" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="Pain" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="LengthProblem" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="Alternatives" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="CostToFix" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="BudgeIdentifiedValue" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="MoveForwardValue" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="ProductID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="OppStatusID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="OppSourceID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="OppTypeID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="OPPVALUE" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="ACTIONSTEP" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="Value" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="ApptSourceId" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="RegForTrainingId" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="CourseId" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="CourseTrngDate" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="TrainingCourseName" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="HowManyAttended" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="IsNewCompany" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="IndID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="NextContactDate" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="OppCloseDate" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="dvQuickStart" Name="Notes" PropertyName="SelectedValue" />
                                <asp:Parameter Name="_user" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
