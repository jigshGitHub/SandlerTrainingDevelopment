<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="DocumentADD" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                Attach New Document :
            </th>
        </tr>
        <tr>
            <td>
                <label for="ddlCompany">
                    <b>Select Company :</b></label>
                <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS" AutoPostBack="True"
                    DataTextField="COMPANYNAME" DataValueField="COMPANIESID" OnDataBound="ddlCompany_DataBound">
                </asp:DropDownList>
            </td>
            <td style="width: 30">
            </td>
            <td align="right">
                <label for="ddlOpportunity">
                    <b>Select Opportunity :</b></label>
                <asp:DropDownList ID="ddlOpportunity" runat="server" DataSourceID="OpprtunityDS"
                    AutoPostBack="True" DataTextField="OppName" DataValueField="OppsID" OnDataBound="ddlOpportunity_DataBound"
                    OnSelectedIndexChanged="ddlOpportunity_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3">
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:DetailsView ID="dvDocument" runat="server" Height="50px" Width="300px" AutoGenerateRows="False"
                    DefaultMode="Insert" CellPadding="3" BorderStyle="None" BorderWidth="1px" BackColor="White"
                    BorderColor="#999999" GridLines="Vertical" OnItemInserted="dvDocument_ItemInserted"
                    OnModeChanging="dvDocument_ModeChanging" OnItemInserting="dvDocument_ItemInserting"
                    Visible="false">
                    <Fields>
                        <asp:TemplateField HeaderText="Document Status :">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlDocStatus" runat="server" DataSourceID="DocStatusDS" DataTextField="DocStatusText"
                                    DataValueField="DocStatusId">
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Modify Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="LastModifyDate" Text='<%# Bind("Last_Modify_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLMD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender runat="server" TargetControlID="LastModifyDate" PopupButtonID="calanderImageLMD" CssClass="calendar"></asp:CalendarExtender>
                                <label id="mandlbl1" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="LastContactDateRFV" ControlToValidate="LastModifyDate" runat="server" ErrorMessage="Please Enter Last Modify Date to proceed.">Required field</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attached Document:">
                            <InsertItemTemplate>
                                <asp:FileUpload ID="UpLoad" Width="275px" runat="server" />
                                <label id="mandlbl3" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvUpLoad" ControlToValidate="UpLoad" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Select upload document to proceed.">Required field</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Add" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Back To Documents" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
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
        <tr>
            <td colspan="3">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetCompaniesForDDL" OnSelecting="CompanyDS_Selecting">
                    <SelectParameters><asp:Parameter Name="_user"  /></SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="DocStatusDS" runat="server" TypeName="SandlerRepositories.DocumentsRepository"
                    SelectMethod="GetDocStatus"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="OpprtunityDS" runat="server" TypeName="SandlerRepositories.OpportunityRepository" OnSelecting="OpprtunityDS_Selecting"
                    SelectMethod="GetByCompId">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlCompany" Name="COMPANIESID" Type="Int32" />
                        <asp:Parameter Name="_user"  />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
