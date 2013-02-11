<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="Detail.aspx.cs" Inherits="DocumentDETAIL" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table>
        <tr>
            <th align="left" class="tdTC" colspan="2" style="width: 680px">
                View / Edit Document :
            </th>
        </tr>
        <tr>
            <td>
                <asp:DetailsView AutoGenerateRows="False" DataKeyNames="DocsID" ID="DocumentDW" runat="server"
                    Width="675px" OnItemCommand="DocumentDW_ItemCommand" OnModeChanging="DocumentDW_ModeChanging"
                    OnItemUpdating="DocumentDW_ItemUpdating" OnDataBound="DocumentDW_DataBound">
                    <Fields>
                        <asp:BoundField DataField="DocsID" Visible="False" />
                        <asp:TemplateField HeaderText="Company :">
                            <ItemTemplate>
                                <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("CompanyName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Opp Name :">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlOpportunity" SelectedValue='<%# Bind("OppsID") %>' runat="server"
                                    DataSourceID="OpprtunityDS" DataTextField="OppName" DataValueField="OppsID">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOppName" runat="server" Text='<%# Eval("OppName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Document Status :">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlDocStatus" runat="server" SelectedValue='<%# Bind("DocStatusId") %>'
                                    DataSourceID="DocStatusDS" DataTextField="DocStatusText" DataValueField="DocStatusId">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDocStatus" runat="server" Text='<%# Bind("DocStatusText") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Modified Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="LastModifyDate" Text='<%# Bind("LastModifyDate","{0:d}") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageLMD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender runat="server" TargetControlID="LastModifyDate" PopupButtonID="calanderImageLMD"
                                    CssClass="calendar">
                                </asp:CalendarExtender>
                                <label id="mandlbl1" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="LastContactDateRFV" ControlToValidate="LastModifyDate"
                                    runat="server" ErrorMessage="Please Enter Last Modify Date to proceed.">Required field</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastContactDate" runat="server" Text='<%# Bind("LastModifyDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attached Document:">
                            <EditItemTemplate>
                                <asp:FileUpload ID="UpLoad" Width="275px" runat="server" />
                                <label id="mandlbl3" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvUpLoad" ControlToValidate="UpLoad" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Select upload document to proceed.">Required field</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="ModuleLink" runat="server" ForeColor="Blue" Target="_blank" Text='<%# Eval("DocName") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ControlStyle Font-Bold="true" />
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit"></asp:LinkButton>&nbsp;&nbsp;<a href="Index.aspx" style="font-weight: bold">Go
                                        Back to Documents</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:DetailsView>
            </td>
        </tr>
        <tr>
            <td style="height: 70">
                <br />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label CssClass="resultLabel" ID="LblStatus" ForeColor="Red" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HiddenField ID="hidDocumentID" runat="server" />
                <asp:HiddenField ID="hidCompanyID" runat="server" />
                <asp:HiddenField ID="hidDocumentName" runat="server" />
                <asp:HiddenField ID="hdnDocFullName" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:ObjectDataSource ID="DocStatusDS" runat="server" TypeName="SandlerRepositories.DocumentsRepository"
                    SelectMethod="GetDocStatus"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="OpprtunityDS" runat="server" TypeName="SandlerRepositories.OpportunityRepository"
                    SelectMethod="GetByCompId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hidCompanyID" Name="COMPANIESID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
