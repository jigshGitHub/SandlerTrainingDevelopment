<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMDocuments.aspx.cs" Inherits="CRMDocuments" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<table>

<tr>
<td><b>View Documents:</b></td>
<td align="right" colspan="2">
    <asp:LinkButton id="btnAddDocument" runat="server" Font-Size="Large" onclick="btnAddDocument_Click" ForeColor="blue">Attach New Document</asp:LinkButton>
</td>
</tr>
<tr>
<td><label for="ddlCompany"><b>Select Company :</b></label>
    <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" 
        AutoPostBack="True" DataTextField="Company_Name"  DataValueField="ID" 
        ondatabound="ddlCompany_DataBound" 
        onselectedindexchanged="ddlCompany_SelectedIndexChanged"></asp:DropDownList></td>
    <td style="Width:30"></td>
    <td align="right"><label for="ddlOpportunity"><b>Select Opportunity :</b></label>
    <asp:DropDownList ID="ddlOpportunity" runat="server" DataSourceID="OpprtunityDS" 
            AutoPostBack="True" DataTextField="Opp_Name"  DataValueField="Opp_ID" 
            ondatabound="ddlOpportunity_DataBound" 
            onselectedindexchanged="ddlOpportunity_SelectedIndexChanged"></asp:DropDownList>
</td></tr>

<tr><td colspan="3">

<asp:GridView  Width="100%" ID="gvDocuments" runat="server" 
        DataSourceID="DocumentsDS" AutoGenerateColumns="False"
DataKeyNames="Doc_ID" AllowSorting="True" AllowPaging="True" PageSize="20"
 onselectedindexchanged="gvDocuments_SelectedIndexChanged"
         ondatabound="gvDocuments_DataBound">
         <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
<Columns> 
    <asp:TemplateField HeaderText="Document Name" SortExpression="Doc_Name">
        
        <ItemTemplate>
            
            <asp:HyperLink ID="ModuleLink" runat="server" Target="_blank" ForeColor="Blue" NavigateUrl='<%# Eval("Doc_Name", "Documents\\{0}") %>'
                Text='<%# Eval("Doc_Name") %>'></asp:HyperLink>
            
        </ItemTemplate>
        <ItemStyle HorizontalAlign="Center" />
    </asp:TemplateField>
    <asp:BoundField DataField="Doc_ID" visible="False"/>
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  DataField="Company_Name"  HeaderStyle-ForeColor="Blue"
        HeaderText="Company Name" SortExpression="Company_Name" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  DataField="Opp_Name"  HeaderStyle-ForeColor="Blue"
        HeaderText="Opportunity Name" SortExpression="Opp_Name" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  
        DataField="Document_Status" HeaderText="Document Status"  HeaderStyle-ForeColor="Blue"
        SortExpression="Document_Status" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  
        DataField="Document_Loaded" HeaderText="Document Loaded"  HeaderStyle-ForeColor="Blue"
        SortExpression="Document_Loaded" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>
    <asp:BoundField  ItemStyle-HorizontalAlign="Center"  
        DataField="Last_Modify_Date" HeaderText="Last Modify Date"  HeaderStyle-ForeColor="Blue"
        SortExpression="Last_Modify_Date" DataFormatString="{0:d}" >
    
<ItemStyle HorizontalAlign="Center"></ItemStyle>
    </asp:BoundField>
    
    <asp:TemplateField ShowHeader="False">
         <ControlStyle ForeColor="Maroon" />
         <ItemTemplate>
             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                 Text="View Detail.."></asp:LinkButton>
         </ItemTemplate>
     </asp:TemplateField>
    
</Columns> 
</asp:GridView> 


</td></tr>


<tr><td colspan="3"><asp:Label  ForeColor="Red" ID="LblStatus" runat="server"></asp:Label></td></tr>

<tr><td colspan="3">
<asp:ObjectDataSource ID="CompanyDS" Runat="server" TypeName="SandlerRepositories.ContactsRepository" SelectMethod="GetAllCompanies"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="DocumentsDS" Runat="server" TypeName="SandlerRepositories.DocumentsRepository" SelectMethod="GetById">
   <SelectParameters>
          <asp:ControlParameter ControlID ="ddlOpportunity" Name="Opp_ID" Type="Int32" />
   </SelectParameters>
</asp:ObjectDataSource> 

</td></tr>
<tr><td colspan="3">
<asp:ObjectDataSource ID="OpprtunityDS" Runat="server" TypeName="SandlerRepositories.OpportunityRepository" SelectMethod="GetById">
   <SelectParameters>
          <asp:ControlParameter ControlID ="ddlCompany" Name="ID" Type="Int32" />
   </SelectParameters>
</asp:ObjectDataSource>  
<asp:HiddenField ID="hidDocumentID" runat="server" />
</td>
</tr>
</table>
</asp:Content>

