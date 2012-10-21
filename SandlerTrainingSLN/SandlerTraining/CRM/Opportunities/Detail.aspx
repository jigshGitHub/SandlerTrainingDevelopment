<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Detail.aspx.cs" Inherits="OpportunityDETAIL" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                View Opportunity :
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
                            <asp:Label ID="lblCompany" runat="server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity ID :
                        </td>
                        <td>
                            <asp:Label ID="lblOpportunityID" Enabled="false" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Name :
                        </td>
                        <td>
                            <asp:Label ID="lblOppName" runat="server" Width="380"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Description :
                        </td>
                        <td>
                            <asp:Label ID="lblDescription" runat="server" Width="380"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Notes :
                        </td>
                        <td>
                            <asp:Label ID="lblNotes" runat="server" Width="380"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Sales Rep Last Name :
                        </td>
                        <td>
                            <asp:Label ID="lblSalesRepLName" runat="server" Width="380"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Sales Rep First Name :
                        </td>
                        <td>
                            <asp:Label ID="lblSalesRepFName" runat="server" Width="380"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Sales Rep Phone :
                        </td>
                        <td>
                            <asp:Label ID="lblSalesRepPhone" Width="380" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Product :
                        </td>
                        <td>
                            <asp:Label ID="lblProduct" runat="server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Product Cost:
                        </td>
                        <td>
                            <asp:Label ID="lblProductCost" runat="server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Status :
                        </td>
                        <td>
                            <asp:Label ID="lblStatus" runat="Server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Source :
                        </td>
                        <td>
                            <asp:Label ID="lblSource" runat="Server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Type :
                        </td>
                        <td>
                            <asp:Label ID="lblType" runat="Server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Why Lost? :
                        </td>
                        <td>
                            <asp:Label ID="lblWLost" runat="Server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Opportunity Value :
                        </td>
                        <td>
                            <asp:Label ID="lblOpportunityValue" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Win Probability % :
                        </td>
                        <td>
                            <asp:Label ID="lblWinProbability" MaxLength="3" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Weighted Value :
                        </td>
                        <td>
                            <asp:Label ID="lblWeightedValue" runat="server" Enabled="false"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Actual Value :
                        </td>
                        <td>
                            <asp:Label ID="lblActualValue" runat="server" Enabled="false"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Close Date :
                        </td>
                        <td>
                            <asp:Label ID="lblCloseDate" runat="server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Contacts :
                        </td>
                        <td>
                            <asp:Label ID="lblPrimaryContact" runat="server" /><br />
                            <asp:Label ID="lblSecondaryContact1" runat="server" /><br />
                            <asp:Label ID="lblSecondaryContact2" runat="server" /><br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <a id="anchorEdit" runat="server" style="font-weight: bold">Edit</a> &nbsp;&nbsp;
                            <a href="Index.aspx" style="font-weight: bold">Back To Opportunities</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {
            var weightedValue = '#<%=lblWeightedValue.ClientID%>';
            var winProbability = '#<%=lblWinProbability.ClientID %>';
            var opportunityValue = '#<%=lblOpportunityValue.ClientID %>';
            $(weightedValue).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' });
            $(opportunityValue).formatCurrency({ colorize: true, negativeFormat: '(%s%n)' });
        });
    </script>
</asp:Content>
