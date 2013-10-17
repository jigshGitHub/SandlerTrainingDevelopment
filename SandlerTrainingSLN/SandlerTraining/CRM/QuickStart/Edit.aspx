<%@ Page Title="QuickStart - Add" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Edit.aspx.cs" Inherits="CRM_QuickStart_Edit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);


        function BeginRequestHandler(sender, args) {
            var elem = args.get_postBackElement();
            ShowHideProgress('visible');
        }
        function EndRequestHandler(sender, args) {
            ShowHideProgress('hidden');
        }
        function ShowHideProgress(visibility) {
            var divProgress = $get('divProgress');
            divProgress.style.visibility = visibility;
        }
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
                    alert("The Notes field only accepts the first 1000 characters, the rest of them will be truncated. Current Length: " + textlength);
                    //$('#charStatus').html('You have ' + (maxLength - textlength) + ' characters left.');
                }
            });
        });
    </script>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="updPnlQuickStart" runat="server">
        <ContentTemplate>
            <table style="width: 100%; border: 0px solid red">
                <tr>
                    <th class="tdTC" colspan="2" align="left">
                        Quick Start -Company, Contact and Opportunity All-in-One :
                    </th>
                </tr>
                <tr>
                    <td style="width: 50%">
                        <asp:HiddenField ID="hdnContactID" runat="server" />
                        <table cellspacing="0" cellpadding="3" rules="cols" id="MainContent_dvQuickStart"
                            style="background-color: White; border-color: #999999; border-width: 1px; border-style: solid;
                            height: 50px; width: 100%; border-collapse: collapse;">
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Company :
                                </td>
                                <td style="white-space: nowrap;">
                                    <asp:DropDownList DataSourceID="CompanyDS" DataTextField="COMPANYNAME" DataValueField="COMPANIESID"
                                        Width="300" ID="ddlCompany" runat="server" AutoPostBack="True" OnDataBound="ddlCompany_DataBound"
                                        OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select Company--" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp; <span id="companyReqAsterik" style="visibility: visible; color: red">*</span>
                                    <asp:RequiredFieldValidator ID="rfvDDLCompany" ControlToValidate="ddlCompany" Display="Dynamic"
                                        InitialValue="0" runat="server" ErrorMessage="Please Select A Company From The List."
                                        Text="">
                                    </asp:RequiredFieldValidator>
                                    <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                                        SelectMethod="GetCompaniesForDDL" OnSelecting="CompanyDS_Selecting">
                                        <SelectParameters>
                                            <asp:Parameter Name="_user" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlOpportunity" Width="300" runat="server" AutoPostBack="True"
                                        DataTextField="OppName" DataValueField="OppsID" DataSourceID="OpportunityDS"
                                        OnSelectedIndexChanged="ddlOpportunity_SelectedIndexChanged" OnDataBound="ddlOpportunity_DataBound">
                                        <asp:ListItem Text="--Select Opportunity--" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp; <span id="opportunityReqAsterik" style="visibility: visible; color: red">*</span>
                                    <asp:RequiredFieldValidator ID="rfvDDLOpportunity" ControlToValidate="ddlOpportunity"
                                        Display="Dynamic" InitialValue="0" runat="server" Text="">
                                    </asp:RequiredFieldValidator>
                                    <asp:ObjectDataSource ID="OpportunityDS" runat="server" TypeName="SandlerRepositories.OpportunityRepository"
                                        SelectMethod="GetByCompId" OnSelecting="OpportunityDS_Selecting">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCompany" Name="CompaniesID" Type="Int32" />
                                            <asp:Parameter Name="_user" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Company Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCompName" MaxLength="50" Width="300" runat="server"></asp:TextBox>
                                    <label id="mandlbl36" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="reqFieldValCompNameTB" ControlToValidate="txtCompName"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    POC First Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFirstName" MaxLength="50" Width="300" runat="server"></asp:TextBox>
                                    <label id="mandlbl37" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rfvFirstNameTB" ControlToValidate="txtFirstName"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter First Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    POC Last Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLastName" MaxLength="50" Width="300" runat="server"></asp:TextBox>
                                    <label id="mandlbl38" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rfvLastNameTB" ControlToValidate="txtLastName" Display="Static"
                                        InitialValue="" runat="server" ErrorMessage="Please Enter Last Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Phone :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhone" MaxLength="50" Width="300" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Email :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" MaxLength="50" Width="300" runat="server"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="regExpVal" runat="server" ControlToValidate="txtEmail"
                                        ErrorMessage="Please Enter Valid Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOppName" MaxLength="50" runat="server" Width="300"></asp:TextBox>
                                    <label id="mandlbl39" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rFVOppNameTB" ControlToValidate="txtOppName" Display="Static"
                                        InitialValue="" runat="server" ErrorMessage="Please Enter Opportunity Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Sales Rep Last Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSalesRepLastName" MaxLength="50" runat="server" Width="300"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Sales Rep First Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSalesRepFirstName" MaxLength="50" runat="server" Width="300"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Pain :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPain" MaxLength="100" runat="server" Width="300"></asp:TextBox>
                                    <label id="mandlbl69" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rFVtxtPain" ControlToValidate="txtPain" Display="Static"
                                        InitialValue="" runat="server" ErrorMessage="Please Enter Pain to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Length of Problem? :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLengthOfProblem" MaxLength="30" runat="server" Width="300"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Alternatives? :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAlternatives" MaxLength="100" runat="server" Width="300"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Perceived Cost to Fix? :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCostToFix" MaxLength="30" runat="server" Width="300"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Budget Identified? :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlBudgeIdentified" runat="server" DataTextField="Description"
                                        DataValueField="Value">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Move Forward? :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlMoveForward" runat="server" DataTextField="Description"
                                        DataValueField="Value">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Product :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProducts" runat="server" DataTextField="ProductTypeName"
                                        DataValueField="Id">
                                    </asp:DropDownList>
                                    <label id="mandlbl40" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rfvProduct" ControlToValidate="ddlProducts" Display="Dynamic"
                                        InitialValue="0" runat="server" ErrorMessage="Please Select Product to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Status :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlOppStatus" runat="server" DataTextField="Name" DataValueField="ID">
                                    </asp:DropDownList>
                                    <label id="mandlbl41" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rfvOppStatus" ControlToValidate="ddlOppStatus" Display="Dynamic"
                                        InitialValue="0" runat="server" ErrorMessage="Please Select Opportunity Status to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Source :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlOppSource" runat="server" DataTextField="Name" DataValueField="ID">
                                    </asp:DropDownList>
                                    <label id="mandlbl42" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rfvOppSource" ControlToValidate="ddlOppSource" Display="Dynamic"
                                        InitialValue="0" runat="server" ErrorMessage="Please Select Opportunity Source to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Type :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlOppType" runat="server" DataTextField="Name" DataValueField="ID">
                                    </asp:DropDownList>
                                    <label id="mandlbl43" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rfvOppType" ControlToValidate="ddlOppType" Display="Dynamic"
                                        InitialValue="0" runat="server" ErrorMessage="Please Select Opportunity Type to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Estimated Opportunity Value :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOpportunityValue" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox>
                                    <label id="mandlbl44" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="reqFieldValTAVTB" ControlToValidate="txtOpportunityValue"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Estimated Opportunity Value to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Next Step :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtActStep" Width="300" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    New Appointment? :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlAccount" runat="server" DataTextField="Description" DataValueField="Value">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Appointment Source :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlApptSource" runat="server" DataTextField="ApptSourceName"
                                        DataValueField="ApptSourceId">
                                    </asp:DropDownList>
                                    <label id="mandlbl46" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rfvApptSource" ControlToValidate="ddlApptSource"
                                        Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Please Select Appointment Source to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Registered for Training? :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlRegForTraining" runat="server" AutoPostBack="true" DataTextField="Description"
                                        OnSelectedIndexChanged="ddlRegForTraining_SelectedIndexChanged" DataValueField="RegForTrainingId">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Course Type :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCourse" runat="server" DataTextField="CourseName" DataValueField="CourseId">
                                    </asp:DropDownList>
                                    <asp:Label ID="mandlbl48" Style="color: Red" Visible="false" runat="server">*</asp:Label>
                                    <asp:RequiredFieldValidator ID="rfvCourse" Enabled="false" ControlToValidate="ddlCourse"
                                        Display="Dynamic" InitialValue="0" runat="server" ErrorMessage="Please Select Course Type to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Course Training Date :
                                </td>
                                <td>
                                    <asp:TextBox ID="CourseTrngDate" runat="server" />&nbsp;<asp:Image ID="calanderImageCTD"
                                        runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="CourseTrngDate"
                                        PopupButtonID="calanderImageCTD" CssClass="calendar">
                                    </asp:CalendarExtender>
                                    <asp:Label ID="mandlbl49" Style="color: Red" Visible="false" runat="server">*</asp:Label>
                                    <asp:RequiredFieldValidator ID="reqFieldCourseTrngDate" Enabled="false" ControlToValidate="CourseTrngDate"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Course Training Date Date to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Training Course Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTrngCourseName" Width="300" runat="server"></asp:TextBox>
                                    <asp:Label ID="mandlbl50" Style="color: Red" Visible="false" runat="server">*</asp:Label>
                                    <asp:RequiredFieldValidator ID="rFVTrngCourseName" Enabled="false" ControlToValidate="txtTrngCourseName"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Training Course Name to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Class Head Count :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHowManyAttended" onkeypress="EnterOnlyNumeric()" MaxLength="5"
                                        Width="300" runat="server"></asp:TextBox>
                                    <asp:Label ID="mandlbl51" Style="color: Red" Visible="false" runat="server">*</asp:Label>
                                    <asp:RequiredFieldValidator ID="rFVHowManyAttended" Enabled="false" ControlToValidate="txtHowManyAttended"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Class Head Count to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    New Company? :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlIsNewCompany" runat="server" DataTextField="Description"
                                        DataValueField="Value">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Industry :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlIndustry" runat="server" DataTextField="IndustryTypeName"
                                        DataValueField="IndID">
                                    </asp:DropDownList>
                                    <label id="mandlbl52" style="color: Red" runat="server">
                                        *</label>
                                    <asp:RequiredFieldValidator ID="rfvIndustry" ControlToValidate="ddlIndustry" Display="Dynamic"
                                        InitialValue="0" runat="server" ErrorMessage="Please Select Industry to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Next Contact Date :
                                </td>
                                <td>
                                    <asp:TextBox ID="NextContactDate" runat="server" />&nbsp;<asp:Image ID="calanderImageNCD"
                                        runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="NextContactDate"
                                        PopupButtonID="calanderImageNCD" CssClass="calendar">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Est. Opportunity Close Date :
                                </td>
                                <td>
                                    <asp:TextBox ID="OppCloseDate" runat="server" />&nbsp;<asp:Image ID="calanderImageOCD"
                                        runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                    <label id="mandlbl53" style="color: Red" runat="server">
                                        *</label>
                                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="OppCloseDate"
                                        PopupButtonID="calanderImageOCD" CssClass="calendar">
                                    </asp:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="reqFieldOppCloseDate" ControlToValidate="OppCloseDate"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Est. Opportunity Close Date to proceed.">Required Field</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Notes :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNotes" MaxLength="1000" Width="300" Height="50" class="txtMultlines"
                                        TextMode="MultiLine" runat="server" />&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" Text="Update"
                                        ForeColor="Blue" Font-Bold="true" OnClick="LinkButton1_Click"></asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" Text="Cancel"
                                        ForeColor="Blue" Font-Bold="true" OnClick="LinkButton2_Click"></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <strong>
                            <asp:Label ID="lblNotesHistory" runat="server" Visible="false" Text="Notes History:"></asp:Label></strong>
                        <asp:GridView ID="gvNotesHistory" DataKeyNames="ID" runat="server" AutoGenerateColumns="false" AutoGenerateEditButton="true"
                            AutoGenerateDeleteButton="true" Width="100%" OnRowCancelingEdit="gvNotesHistory_CancelEditing" 
                            OnRowEditing="gvNotesHistory_Editing" OnRowUpdating="gvNotesHistory_RowUpdating"
                            OnRowDeleting="gvNotesHistory_Deleting">
                            <Columns>
                                <asp:BoundField DataField="ID" Visible="False" />
                                <asp:TemplateField HeaderText="Previous Notes">
                                    <ItemTemplate>
                                        <asp:Label ID="lblNotes" runat="server" Text='<%#Eval("Notes") %>' /></ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNotes" Width="100%" runat="server" Text='<%#Eval("Notes") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Created By" DataField="CreatedBy" ReadOnly="true" />
                                <asp:BoundField HeaderText="Created Date" DataField="CreatedDate" DataFormatString="{0:d}" ReadOnly="true" />
                            </Columns>
                            <EmptyDataTemplate>
                                There are no history records for notes.</EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
    <div id="divProgress" style="width: 150px; text-align: center; vertical-align: middle;
        position: absolute; bottom: 50%; left: 45%; visibility: hidden; color: blue;
        background-color: lightblue;">
        <asp:Image ID="ajaxLoadNotificationImage" runat="server" ImageUrl="~/images/indicator_medium.gif" />Please
        wait...
    </div>
</asp:Content>
