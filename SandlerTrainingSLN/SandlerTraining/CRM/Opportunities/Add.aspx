<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Add.aspx.cs" Inherits="OpportunityADD" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                Add Opportunity :
            </th>
        </tr>
        <tr>
            <td style="width: 380px">
                <asp:UpdatePanel ID="updPnl" runat="server">
                    <ContentTemplate>
                        <table cellspacing="0" cellpadding="3" rules="cols" id="MainContent_dvOpportunity"
                            style="background-color: White; border-color: #999999; border-width: 1px; border-style: solid;
                            height: 50px; width: 100%; border-collapse: collapse;">
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Company :
                                </td>
                                <td style="white-space: nowrap;" colspan="3">
                                    <asp:DropDownList DataSourceID="CompanyDS" DataTextField="CompanyName" DataValueField="CompaniesID"
                                        ID="ddlCompany" runat="server" AutoPostBack="True" OnDataBound="ddlCompany_DataBound"
                                        OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvDDLCompany" ControlToValidate="ddlCompany" Display="Dynamic"
                                        InitialValue="0" runat="server" ErrorMessage="Please Select A Company From The List."
                                        Text="*">
                                    </asp:RequiredFieldValidator>
                                    <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                                        SelectMethod="GetCompaniesForDDL"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;" id="trOpportunityID"
                                runat="server" visible="false">
                                <td style="white-space: nowrap;">
                                    Opportunity ID :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtOpportunityID" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Name :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtOppName" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rFVOppNameTB" ControlToValidate="txtOppName" Display="Static"
                                        InitialValue="" runat="server" ErrorMessage="Please Enter Oppty Name to proceed.">*
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Description :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtDescription" TextMode="MultiLine" runat="server" Width="380"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Notes :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtNotes" TextMode="MultiLine" runat="server" Width="380"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Sales Rep Last Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSalesRepLName" MaxLength="30" runat="server" Width="180"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFieldValSRLN" ControlToValidate="txtSalesRepLName"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Sales Rep to proceed.">*
                                    </asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    Pain:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPain" MaxLength="30" runat="server" Width="280"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="txtPainRF" ControlToValidate="txtPain" Display="Static"
                                        InitialValue="" runat="server" ErrorMessage="Please Enter Pain.">*
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Sales Rep First Name :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSalesRepFName" MaxLength="50" runat="server" Width="180"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFieldValSRFN" ControlToValidate="txtSalesRepFName"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Sales Rep to proceed.">*
                                    </asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    Length of Problem:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPainLengthProblem" MaxLength="30" runat="server" Width="280"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Sales Rep Phone :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtSalesRepPhone" MaxLength="50" Width="180" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    Alternatives?:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAlternatives" MaxLength="30" runat="server" Width="280"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Product :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProducts" runat="server" DataSourceID="ProductTypesDS" DataTextField="ProductTypeName"
                                        DataValueField="Id" OnDataBound="ddlCreateDefaultSelection">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvProduct" ControlToValidate="ddlProducts" Display="Dynamic"
                                        InitialValue="0" runat="server" ErrorMessage="Please Select At Least One Product From The List.">*
                                    </asp:RequiredFieldValidator>
                                    <asp:ObjectDataSource ID="ProductTypesDS" runat="server" SelectMethod="GetWithFranchiseeId"
                                        TypeName="SandlerRepositories.ProductTypesRepository">
                                        <SelectParameters>
                                            <asp:Parameter Name="franchiseeId" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td>
                                    Perceived Cost to Fix?:
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCostToFix" MaxLength="30" runat="server" Width="180"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Product Cost :
                                </td>
                                <td>
                                    <asp:TextBox ID="txtProductCost" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    Budget Identified?:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlBudgetIdentified" runat="server">
                                        <asp:ListItem Value="true" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="false" Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Status :
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlProductStatus" runat="server" DataSourceID="OpportunityStatusDS"
                                        DataTextField="Name" DataValueField="ID" OnDataBound="ddlCreateDefaultSelection">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="OpportunityStatusDS" runat="server" SelectMethod="GetAll"
                                        TypeName="SandlerRepositories.OpprtunityStatusRepository"></asp:ObjectDataSource>
                                </td>
                                <td>
                                    Move Forward?:
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlMoveForward" runat="server">
                                        <asp:ListItem Value="true" Text="Yes"></asp:ListItem>
                                        <asp:ListItem Value="false" Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Source :
                                </td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlSource" runat="server" DataSourceID="OpportunitySourceDS"
                                        DataTextField="Name" DataValueField="ID" OnDataBound="ddlCreateDefaultSelection">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="OpportunitySourceDS" runat="server" SelectMethod="GetAll"
                                        TypeName="SandlerRepositories.OpprtunitySourceRepository"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Types :
                                </td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlTypes" runat="server" DataSourceID="OpportunityTypesDS"
                                        DataTextField="Name" DataValueField="ID" OnDataBound="ddlCreateDefaultSelection">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="OpportunityTypesDS" runat="server" SelectMethod="GetAll"
                                        TypeName="SandlerRepositories.OpprtunityTypesRepository"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Why Lost? :
                                </td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddlWhyLost" runat="server" DataSourceID="OpportunityWhyLostDS"
                                        DataTextField="Name" DataValueField="ID" OnDataBound="ddlCreateDefaultSelection">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="OpportunityWhyLostDS" runat="server" SelectMethod="GetAll"
                                        TypeName="SandlerRepositories.OpprtunityWhyLostRepository"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Opportunity Value :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtOpportunityValue" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqFieldValTAVTB" ControlToValidate="txtOpportunityValue"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Opportunity Value.">*
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Win Probability % :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtWinProbability" onkeypress="EnterOnlyNumeric()" MaxLength="3"
                                        runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Weighted Value :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtWeightedValue" runat="server" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Actual Value :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtActualValue" onkeypress="EnterOnlyNumeric()" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Creation Date :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="txtBxCreationDate" runat="server" />&nbsp;<asp:Image ID="Image1"
                                        runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtBxCreationDate"
                                        PopupButtonID="Image1" CssClass="calendar">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                <td style="white-space: nowrap;">
                                    Est. Close Date :
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="CloseDate" runat="server" />&nbsp;<asp:Image ID="calanderImage"
                                        runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                    <asp:CalendarExtender ID="estCloseDtExtender" runat="server" TargetControlID="CloseDate" PopupButtonID="calanderImage"
                                        CssClass="calendar">
                                    </asp:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="reqFieldValCloseDt" ControlToValidate="CloseDate"
                                        Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Est. Close Date.">
*
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <asp:Panel ID="pnlContacts" runat="server" Visible="false">
                                <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                    <td style="white-space: nowrap;">
                                        Select Contacts :
                                    </td>
                                    <td colspan="3">
                                        <asp:ListBox ID="lstBxContacts" SelectionMode="Multiple" runat="server"></asp:ListBox>
                                        <asp:RequiredFieldValidator ID="rfvForContacts" ControlToValidate="lstBxContacts"
                                            Display="Static" InitialValue="" runat="server" ErrorMessage="Please select at least one contact.">*
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td colspan="4">
                                    <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="lbtnAdd" runat="server" CausesValidation="True" Text="Add" ForeColor="Blue"
                    Font-Bold="true" OnClick="lbtnAdd_Click"></asp:LinkButton>&nbsp;&nbsp;
                <asp:LinkButton ID="lbtnCancel" runat="server" CausesValidation="False" ForeColor="Blue"
                    Font-Bold="true" OnClick="lbtnCancel_Click"></asp:LinkButton>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function BindEvents() {

            var weightedValue = '#<%=txtWeightedValue.ClientID%>';
            var winProbability = '#<%=txtWinProbability.ClientID %>';
            var opportunityValue = '#<%=txtOpportunityValue.ClientID %>';
            $(winProbability).blur(function () { calculateWeightedValue() });
            $(opportunityValue)
            //.formatCurrency({ colorize: true, negativeFormat: '(%s%n)' })
                .blur(function () {
                    calculateWeightedValue();
                    // $(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: 2 });
                })
                .keyup(function (e) {
                    var e = window.event || e;
                    var keyUnicode = e.charCode || e.keyCode;
                    if (e !== undefined) {
                        switch (keyUnicode) {
                            case 16: break; // Shift
                            case 17: break; // Ctrl
                            case 18: break; // Alt
                            case 27: this.value = ''; break; // Esc: clear entry
                            case 35: break; // End
                            case 36: break; // Home
                            case 37: break; // cursor left
                            case 38: break; // cursor up
                            case 39: break; // cursor right
                            case 40: break; // cursor down
                            case 78: break; // N (Opera 9.63+ maps the "." from the number key section to the "N" key too!) (See: http://unixpapa.com/js/key.html search for ". Del")
                            case 110: break; // . number block (Opera 9.63+ maps the "." from the number block to the "N" key (78) !!!)
                            case 190: break; // .
                            default: break;
                            //$(this).formatCurrency({ colorize: true, negativeFormat: '(%s%n)', roundToDecimalPlace: -1, eventOnDecimalsEntered: true });                                                 
                        }
                    }
                })
                .bind('decimalsEntered', function (e, cents) {
                    if (String(cents).length > 2) {
                        var errorMsg = 'Please do not enter any cents (0.' + cents + ')';
                        alert(errorMsg);
                    }
                });

            function calculateWeightedValue() {
                //Reset first 
                $(weightedValue).val('');
                log($(opportunityValue).val());
                $(weightedValue).val(($(opportunityValue).val() * $(winProbability).val()) / 100);

            };

            //            $('#<%=lbtnAdd.ClientID%>').click(function () {
            //                var contactsSelected = parseInt($('#<%=lstBxContacts.ClientID%> :selected').length);
            //                log(contactsSelected);
            //                if (contactsSelected > 3) {
            //                    alert('You can not select more than 3 contacts');
            //                    return false;
            //                }
            //            });
        }
        $(document).ready(function () {
            BindEvents();

            $('#<%=lbtnAdd.ClientID%>').click(function () {
                var companySelected = $('#<%=ddlCompany.ClientID %> :selected').val();
                if (companySelected == 0) {
                    alert('Select the company from the list');
                    return false;
                }
                var contactsSelected = parseInt($('#<%=lstBxContacts.ClientID%> :selected').length);
                if (contactsSelected == 0) {
                    alert('Select at least one contact from the Select Contact list.');
                    return false;
                }
                if (contactsSelected > 3) {
                    alert('You can not select more than 3 contacts');
                    return false;
                }
            });
        });


        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function BeginRequestHandler(sender, args) {
        }
        function EndRequestHandler(sender, args) {
            BindEvents();
        }

    </script>
</asp:Content>
