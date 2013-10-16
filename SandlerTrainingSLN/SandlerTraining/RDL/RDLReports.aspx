<%@ Page Title="CRM - Reports List" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    EnableEventValidation="false" CodeFile="RDLReports.aspx.cs" Inherits="CRM_RDL_RDLReports" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <style>
    .HeaderStyle
{
    text-align:left; 
    }
.HeaderStyle th
{
    text-align:left; 
    }
</style>

    <table id="tblMain" width="70%">   
     <tr>
     <td align="right" style="width:25">
     </td>
            <td align="left">
                       <asp:Label ForeColor="Red" Font-Bold="true"  ID="lblErrorMessage" runat="server"></asp:Label>
                      
            </td>   
        </tr>  
        <tr>
            <td align="right" style="width:25">
                       <asp:Label ForeColor="Black" Font-Bold="true" Text="Report Name:"  ID="lblreportDisplayName" runat="server"></asp:Label>
                        </td>
            <td align="left" valign="top" style="width:100">
                       <asp:DropDownList runat="server" ID="ddlreportlist" AutoPostBack="true" OnSelectedIndexChanged="ddlreportlist_SelectedIndexChanged">
                       <asp:ListItem Text="Please Select a report" Value="" Selected="True"></asp:ListItem>
                       <asp:ListItem Text="Sales Representative Report" Value="SalesRepresentativeReport"></asp:ListItem>
                       <asp:ListItem Text="Total Pipeline By Status Report" Value="TotalPipelinebyStatusAndFranchiseSpecificbyID"></asp:ListItem>
                       </asp:DropDownList>
            </td>   
        </tr>
         <tr valign="top">
            <td align="right" valign="top" style="width:25">
                       <asp:Label ForeColor="Black" Font-Bold="true" Text="Franchise:" ID="lblFranchise" Visible="false" runat="server"></asp:Label>                       
                        </td>
            <td align="left" valign="top" style="width:100">
                       <asp:ListBox runat="server" ID="lbFrachiseList" SelectionMode="Multiple" Visible="false">                       
                       </asp:ListBox>
                        <asp:RequiredFieldValidator ID="rflbFranchise" runat="server"          
    InitialValue="" Display="Dynamic"
    ControlToValidate="lbFrachiseList" 
    ErrorMessage="Please select atleast one item form the Franchise list"  
    ForeColor="Red" Enabled="false"
    Text="*Please select atleast one item form the Franchise list" > 
</asp:RequiredFieldValidator> 
            </td>   
        </tr>
        <tr valign="top">
            <td align="right" valign="top" style="width:25">
                       <asp:Label ForeColor="Black" Font-Bold="true" Text="Status:"  ID="lblStatus" Visible="false" runat="server"></asp:Label>
           </td>
            <td align="left" valign="top" style="width:100">
                       <asp:ListBox runat="server" ID="lbStatus" Visible="false" SelectionMode="Multiple" >                       
                       </asp:ListBox>
                        <asp:RequiredFieldValidator ID="rflbStatus" runat="server"          
    InitialValue="" Display="Dynamic"
    ControlToValidate="lbStatus" 
    ErrorMessage="Please select atleast one item form the Status list"  
    ForeColor="Red"  Enabled="false"
    Text="*Please select atleast one item form the Status list" > 
</asp:RequiredFieldValidator> 
            </td>   
        </tr>
         <tr valign="top">
            <td align="right" valign="top" style="width:25">
                       <asp:Label ForeColor="Black" Font-Bold="true" Text="Franchise ID:"  ID="lblFranchiseID" Visible="false" runat="server"></asp:Label>
           </td>
            <td align="left" valign="top" style="width:100">
                       <asp:DropDownList runat="server" ID="ddlFranchiseID" Visible="false">                                   
                       </asp:DropDownList>
                         <asp:RequiredFieldValidator ID="rfDDLFranchiseID" runat="server"          
    InitialValue="0" Display="Dynamic"
    ControlToValidate="ddlFranchiseID" 
    ErrorMessage="Please select atleast one item form the Franchise ID list"  
    ForeColor="Red" Enabled="false"
    Text="*Please select atleast one item form the Franchise ID list" > 
</asp:RequiredFieldValidator> 
            </td>   
        </tr>
         <tr valign="top">
            <td align="right" valign="top" style="width:25">
                      
           </td>
            <td align="left" valign="top" style="width:100">
                      <asp:Button runat="server" ID="btnSubmit"  Text="View Report" OnClick="btnSubmit_Click" />
            </td>   
        </tr>
                   
    </table>  
 

</asp:Content>
