<%@ Page Title="Create Email Group" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="ManageGroup.aspx.cs" Inherits="Email_ManageGroup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<asp:UpdatePanel ID="updPnl" runat="server">
<ContentTemplate>

<table id="NonCorporate" runat="server" width="100%">
     <tr style="color: Black; background-color: #DCDCDC;">
        <th class="tdTC" style="width: 280px" align="left">Create Email Group : </th>
     </tr>
     
     <tr style="color: Black; background-color: #EEEEEE;  height:30px">
     <td>Franchisee Name :</td>
     <td>
        <asp:Label ID="lblFranchisee" runat="server"></asp:Label>
     </td>
     </tr>
     
     <tr style="color: Black; background-color: #DCDCDC;  height:30px">
     <td>Group Name :</td>
     <td>
        <asp:TextBox ID="txtGroupName" MaxLength="50" Width="280px" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="txtGroupNameRFV" ControlToValidate="txtGroupName" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Group Name to proceed.">*</asp:RequiredFieldValidator>
     </td>
     </tr>
     
     <tr style="color: Black; background-color: #EEEEEE;  height:30px">
     <td>Select Email address(es) from the below list:</td>
     </tr>

     <tr style="color: Black; background-color: #DCDCDC; ">
         <td>Coach:</td>
         <td>
            <asp:CheckBoxList ID="chkListCoach"  DataSourceID="CoachEmailDS"  CellSpacing="8" CellPadding="8" DataTextField="CoachEmail" DataValueField="CoachID" RepeatColumns="3"   RepeatLayout="Table"  runat="server"></asp:CheckBoxList>
         </td>
     </tr>

     <tr style="color: Black; background-color: #EEEEEE; ">
         <td>Franchisee Owner:</td>
         <td>
            <asp:CheckBoxList ID="chkListFrOwner"  DataSourceID="FrOwnerEmailDS"  CellSpacing="8" CellPadding="8" DataTextField="Email" DataValueField="UserID" RepeatColumns="3"   RepeatLayout="Table"  runat="server"></asp:CheckBoxList>
         </td>
     </tr>

     <tr style="color: Black; background-color: #DCDCDC; ">
         <td>Franchisee Users:</td>
         <td>
            <asp:CheckBoxList ID="chkListFrUsers"  DataSourceID="FrUsersEmailDS"  CellSpacing="8" CellPadding="8" DataTextField="Email" DataValueField="UserID" RepeatColumns="3"   RepeatLayout="Table"  runat="server"></asp:CheckBoxList>
         </td>
     </tr>

     <tr style="color: Black; background-color: #EEEEEE; ">
         <td>Franchisee Contacts:</td>
         <td>
            <asp:CheckBoxList ID="chkListFrContacts"  DataSourceID="FrContactsEmailDS"  CellSpacing="8" CellPadding="8" DataTextField="Email" DataValueField="ContactsId" RepeatColumns="3"   RepeatLayout="Table"  runat="server"></asp:CheckBoxList>
         </td>
     </tr>

     <tr style="color: Black; background-color: #DCDCDC;"><td colspan="2">
     <asp:CustomValidator runat="server" ID="cvListGroup" ClientValidationFunction="ValidateUserGroupList" ErrorMessage="Please select at least one Email Address to be included in the Group.">*</asp:CustomValidator>
     </td></tr>

     <tr style="color: Black; background-color: #EEEEEE;"><td align="center" colspan="2"><asp:Button id="btnCreateGroup" Runat="server" Text="Create Group" Style="background-color:#336699;
                                color: #FFFFFF; margin-left:10px" Height="40" 
             Width="120" onclick="btnCreateGroup_Click"></asp:Button></td></tr>

      <tr>
     <td colspan="2">
        <asp:Label id="lblError" ForeColor="Red" Font-Size="12pt" Runat="server"></asp:Label>
     </td>
     </tr>

     <tr><td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ForeColor="Red" ShowMessageBox="True" />
          </td>
     </tr>

     <tr>
        <td colspan="2">
          
          <asp:ObjectDataSource ID="CoachEmailDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetAllCoachAddressesByFrId"></asp:ObjectDataSource>
          <asp:ObjectDataSource ID="FrOwnerEmailDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetAllFrOwnerAddressesByFrId"></asp:ObjectDataSource>
          <asp:ObjectDataSource ID="FrUsersEmailDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetAllFrUsersAddressesByFrId"></asp:ObjectDataSource>
          <asp:ObjectDataSource ID="FrContactsEmailDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetAllFrContactsAddressesByFrId"></asp:ObjectDataSource>
        </td>
     </tr>
              
</table>

<%--For Corporate User Only--%>
<table id="Corporate" runat="server" width="100%">
     <tr style="color: Black; background-color: #DCDCDC; ">
        <th class="tdTC" style="width: 280px" align="left">Create Email Group : </th>
     </tr>
     
     
     <tr id="trCorporate" runat="server" style="color: Black; background-color: #DCDCDC; height:30px">
     <td>Please Select Franchisee :</td>
     <td>
        <asp:DropDownList ID="ddlFranchisee" runat="server" DataSourceID="FranchiseeDS" AutoPostBack="True" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="ddlFranchisee_SelectedIndexChanged" OnDataBound="ddlFranchisee_DataBound"></asp:DropDownList>
     </td>
     </tr>

     <tr id="trCorp1" runat="server" style="color: Black; background-color: #DCDCDC;  height:30px">
     <td>Group Name :</td>
     <td>
        <asp:TextBox ID="txtGroupNameCorp" MaxLength="50" Width="280px" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvGrpNameCorp" ControlToValidate="txtGroupNameCorp" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Group Name to proceed.">*</asp:RequiredFieldValidator>
     </td>
     </tr>

     <tr id="trCorp2" runat="server" style="color: Black; background-color: #EEEEEE;  height:30px">
     <td>Select Email address(es) from the below list:</td>
     </tr>


     <tr id="trCorp3" runat="server" style="color: Black; background-color: #DCDCDC; ">
         <td>Coach:</td>
         <td>
            <asp:CheckBoxList ID="chkListCoachCorp"  DataSourceID="CoachEmailCorpDS"  CellSpacing="8" CellPadding="8" DataTextField="CoachEmail" DataValueField="CoachID" RepeatColumns="3"   RepeatLayout="Table"  runat="server"></asp:CheckBoxList>
         </td>
     </tr>

     <tr id="trCorp4" runat="server" style="color: Black; background-color: #EEEEEE; ">
         <td>Franchisee Owner:</td>
         <td>
            <asp:CheckBoxList ID="chkListFrOwnerCorp"  DataSourceID="FrOwnerEmailCorpDS"  CellSpacing="8" CellPadding="8" DataTextField="Email" DataValueField="UserID" RepeatColumns="3"   RepeatLayout="Table"  runat="server"></asp:CheckBoxList>
         </td>
     </tr>

     <tr id="trCorp5" runat="server" style="color: Black; background-color: #DCDCDC; ">
         <td>Franchisee Users:</td>
         <td>
            <asp:CheckBoxList ID="chkListFrUsersCorp"  DataSourceID="FrUsersEmailCorpDS"  CellSpacing="8" CellPadding="8" DataTextField="Email" DataValueField="UserID" RepeatColumns="3"   RepeatLayout="Table"  runat="server"></asp:CheckBoxList>
         </td>
     </tr>

     <tr id="trCorp6" runat="server" style="color: Black; background-color: #EEEEEE; ">
         <td>Franchisee Contacts:</td>
         <td>
            <asp:CheckBoxList ID="chkListFrContactsCorp"  DataSourceID="FrContactsEmailCorpDS"  CellSpacing="8" CellPadding="8" DataTextField="Email" DataValueField="ContactsId" 
              RepeatColumns="3"   RepeatLayout="Table" 

            runat="server"></asp:CheckBoxList>
         </td>
     </tr>

     <tr id="trCorp7" runat="server" style="color: Black; background-color: #DCDCDC; "><td colspan="2">
     <asp:CustomValidator runat="server" ID="CustomValidator1" ClientValidationFunction="ValidateUserGroupListCorp" ErrorMessage="Please select at least one Email Address to be included in the Group.">*</asp:CustomValidator>
     </td></tr>

     <tr id="trCorp8" runat="server" style="color: Black; background-color: #EEEEEE; "><td align="center" colspan="2">
         <asp:Button id="btnCreateGrpCorp" Runat="server" Text="Create Group" Style="background-color:#336699;
                                color: #FFFFFF; margin-left:10px" Height="40" 
             Width="120" onclick="btnCreateGrpCorp_Click"></asp:Button></td></tr>


     <tr style="height:10px">
     <td colspan="2">
        <asp:Label id="lblErrorCorp" ForeColor="Red" Font-Size="12pt" Runat="server"></asp:Label>
     </td>
     </tr>
     <tr id="trCorp9" runat="server"><td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary2" runat="server"  ForeColor="Red" ShowMessageBox="True" />
          </td>
     </tr>

     <tr>
        <td colspan="2">
          <asp:ObjectDataSource ID="FranchiseeDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetAllFranchisee"></asp:ObjectDataSource>
          <asp:ObjectDataSource ID="CoachEmailCorpDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetAllCoachAddressesByFrId">
              <SelectParameters>
                            <asp:ControlParameter ControlID="ddlFranchisee" Name="ID" PropertyName="SelectedValue" Type="Int32" />
              </SelectParameters>
          
          </asp:ObjectDataSource>
          <asp:ObjectDataSource ID="FrOwnerEmailCorpDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetAllFrOwnerAddressesByFrId">
          <SelectParameters>
                            <asp:ControlParameter ControlID="ddlFranchisee" Name="ID" PropertyName="SelectedValue" Type="Int32" />
              </SelectParameters>
          </asp:ObjectDataSource>
          <asp:ObjectDataSource ID="FrUsersEmailCorpDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetAllFrUsersAddressesByFrId">
          <SelectParameters>
                            <asp:ControlParameter ControlID="ddlFranchisee" Name="ID" PropertyName="SelectedValue" Type="Int32" />
              </SelectParameters>
          </asp:ObjectDataSource>
          <asp:ObjectDataSource ID="FrContactsEmailCorpDS" runat="server" TypeName="SandlerRepositories.BlastEmailRepository"  SelectMethod="GetAllFrContactsAddressesByFrId">
          <SelectParameters>
                            <asp:ControlParameter ControlID="ddlFranchisee" Name="ID" PropertyName="SelectedValue" Type="Int32" />
              </SelectParameters>
          </asp:ObjectDataSource>
        </td>
     </tr>
              
</table>


</ContentTemplate> 
</asp:UpdatePanel>
</asp:Content>

