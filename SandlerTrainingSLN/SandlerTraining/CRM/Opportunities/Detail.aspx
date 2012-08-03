<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Detail.aspx.cs" Inherits="OpportunityDETAIL" %>

<%@ Register TagPrefix="ew" Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
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
                            Contact Name :
                        </td>
                        <td>
                            <asp:Label ID="lblContact" runat="server" />
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Contact Phone :
                        </td>
                        <td>
                            <asp:Label ID="lblPhone" Width="380px" runat="server" Enabled="False"></asp:Label>
                        </td>
                    </tr>
                    <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                        <td style="white-space: nowrap;">
                            Contact E-mail :
                        </td>
                        <td>
                            <asp:Label ID="lblEmail" runat="server" Enabled="false"></asp:Label>
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
                            Close Date :
                        </td>
                        <td>
                            <asp:Label ID="lblCloseDate" runat="server" />
                        </td>
                        <tr>
                            <td colspan="2">
                                <asp:LinkButton ID="lbtnEdit" runat="server" CausesValidation="True" 
                                    Text="Edit" ForeColor="Blue"
                                    Font-Bold="true" onclick="lbtnEdit_Click"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="lbtnCancel" runat="server" CausesValidation="False" Text="Back To Opportunities"
                                    ForeColor="Blue" Font-Bold="true" onclick="lbtnCancel_Click"></asp:LinkButton>
                            </td>
                        </tr>
                    </tr>
                </table>
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
            //$('#<%=lbtnCancel.ClientID%>').click(function () { window.location.href = '../CRM/Opportunities/Index.aspx'; });
        });
    </script>
</asp:Content>
