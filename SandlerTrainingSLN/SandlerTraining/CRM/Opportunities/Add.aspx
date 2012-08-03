<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Add.aspx.cs" Inherits="OpportunityADD" %>

<%@ Register TagPrefix="ew" Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                Add Opportunity :
            </th>
        </tr>
        <tr>
            <td style="width: 280px">
                <table cellspacing="0" cellpadding="3" rules="cols" id="MainContent_dvOpportunity"
                    style="background-color: White; border-color: #999999; border-width: 1px; border-style: solid;
                    height: 50px; width: 300px; border-collapse: collapse;">
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Company :
                        </td>
                        <td style="white-space: nowrap;">
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
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity ID :
                        </td>
                        <td>
                            <asp:TextBox ID="txtOpportunityID" Enabled="false" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Name :
                        </td>
                        <td>
                            <asp:TextBox ID="txtOppName" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rFVOppNameTB" ControlToValidate="txtOppName" Display="Static"
                                InitialValue="" runat="server" ErrorMessage="Please Enter Oppty Name to proceed.">*
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Sales Rep Last Name :
                        </td>
                        <td>
                            <asp:TextBox ID="txtSalesRepLName" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqFieldValSRLN" ControlToValidate="txtSalesRepLName"
                                Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Sales Rep to proceed.">*
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Sales Rep First Name :
                        </td>
                        <td>
                            <asp:TextBox ID="txtSalesRepFName" MaxLength="50" runat="server" Width="380"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqFieldValSRFN" ControlToValidate="txtSalesRepFName"
                                Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Sales Rep to proceed.">*
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Sales Rep Phone :
                        </td>
                        <td>
                            <asp:TextBox ID="txtSalesRepPhone" onkeypress="EnterOnlyNumeric()" MaxLength="50"
                                Width="380" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Product :
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlProducts" runat="server" DataSourceID="ProductTypesDS" DataTextField="ProductTypeName"
                                DataValueField="Id">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ProductTypesDS" runat="server" SelectMethod="GetAll" TypeName="SandlerRepositories.ProductTypesRepository">
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Status :
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlProductStatus" runat="server" DataSourceID="OpportunityStatusDS"
                                DataTextField="Name" DataValueField="ID">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="OpportunityStatusDS" runat="server" SelectMethod="GetAll"
                                TypeName="SandlerRepositories.OpprtunityStatusRepository"></asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Contact Name :
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlContacts" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlContacts_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvContact" ControlToValidate="ddlContacts" Display="Dynamic"
                                InitialValue="0" runat="server" ErrorMessage="Please Select A Contact From The List."
                                Text="*">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Contact Phone :
                        </td>
                        <td>
                            <asp:TextBox ID="txtContactPhone" onkeypress="EnterOnlyNumeric()" MaxLength="50"
                                Width="380" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Contact E-mail :
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" MaxLength="50" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Value :
                        </td>
                        <td>
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
                        <td>
                            <asp:TextBox ID="txtWinProbability" onkeypress="EnterOnlyNumeric()" MaxLength="3"
                                runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqFieldValWinTB" ControlToValidate="txtWinProbability"
                                Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Win Probability.">
*
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Weighted Value :
                        </td>
                        <td>
                            <asp:TextBox ID="txtWeightedValue" onkeypress="EnterOnlyNumeric()" runat="server"
                                Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Close Date :
                        </td>
                        <td>
                            <ew:CalendarPopup ID="CloseDate" Nullable="True" DisplayPrevNextYearSelection="True"
                                runat="server" AllowArbitraryText="False" CellPadding="2px" CellSpacing="0px"
                                Culture="English (United States)" JavascriptOnChangeFunction="" LowerBoundDate=""
                                ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="~/Images/calendar.gif"
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
                        </td>
                        <tr>
                            <td colspan="2">
                                <asp:LinkButton ID="lbtnAdd" runat="server" CausesValidation="True" Text="Add" ForeColor="Blue"
                                    Font-Bold="true" OnClick="lbtnAdd_Click"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="lbtnCancel" runat="server" CausesValidation="False" Text="Back To Opportunities"
                                    ForeColor="Blue" Font-Bold="true" OnClick="lbtnCancel_Click"></asp:LinkButton>
                            </td>
                        </tr>
                    </tr>
                </table>
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
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {
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
        });
    </script>
</asp:Content>
