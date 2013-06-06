<%@ Page Title="CRM - View/Edit Company" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="CompanyDETAIL" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:UpdatePanel ID="updPnl" runat="server">
    <ContentTemplate>
    
    <table>
        <tr>
            <th style="float: left">
                <asp:Label ID="lblModuleActionHeading" runat="server"></asp:Label>
            </th>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label CssClass="resultLabel" ID="LblStatus1" ForeColor="Red" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:DetailsView AutoGenerateRows="False" DataKeyNames="COMPANIESID" ID="CompanyDW"
                    runat="server" Width="675px" OnItemCommand="CompanyDW_ItemCommand" OnModeChanging="CompanyDW_ModeChanging"
                    OnItemUpdating="CompanyDW_ItemUpdating" OnItemCreated="CompanyDW_ItemCreated"
                    OnDataBound="CompanyDW_DataBound">
                    <Fields>
                        <asp:BoundField DataField="COMPANIESID" Visible="False" />
                        
                        <asp:TemplateField ShowHeader="False">
                            <ControlStyle Font-Bold="true" />
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton11" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton12" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton11" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit"></asp:LinkButton>&nbsp;&nbsp;<a href="Index.aspx" style="font-weight:bold">Back To Companies</a>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="Company Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCompName" Width="380" MaxLength="50" runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:TextBox>
                                <label id="mandlbl" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="reqFieldValCompNameTB" ControlToValidate="txtCompName" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">Required field</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("COMPANYNAME") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Ownership :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOwnership" Width="380" MaxLength="50" runat="server" Text='<%# Bind("CompanyOwnership") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblOwnership" runat="server" Text='<%# Eval("CompanyOwnership") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Description :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCompanyDescription" Width="380" MaxLength="50" runat="server" Text='<%# Bind("CompanyDescription") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompanyDescription" runat="server" Text='<%# Eval("CompanyDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" Width="380" MaxLength="150" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAddress" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCity" Width="380" MaxLength="50" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtState" Width="380" MaxLength="50" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zip :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtZip" Width="380"  MaxLength="7" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblZip" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCountry" Width="380"  runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Same Billing Address? :">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlBillingAdrs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlBillingAdrs_SelectedIndexChanged" DataSourceID="BillingAddressDS" DataTextField="BillingDescription" DataValueField="BillingValue" SelectedValue='<%# Bind("BillingValue") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblBillingAdrs" runat="server" Text='<%# Eval("BillingDescription") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Billing Address :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBillingAddress" Width="380" MaxLength="150" runat="server" Text='<%# Bind("BillingAddress") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblBillingAddress" runat="server" Text='<%# Bind("BillingAddress") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billing City :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBillingCity" Width="380" MaxLength="50" runat="server" Text='<%# Bind("BillingCity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblBillingCity" runat="server" Text='<%# Bind("BillingCity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billing State :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBillingState" Width="380" MaxLength="50" runat="server" Text='<%# Bind("BillingState") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblBillingState" runat="server" Text='<%# Bind("BillingState") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billing Zip :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBillingZip" Width="380"  MaxLength="7" runat="server" Text='<%# Bind("BillingZip") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblBillingZip" runat="server" Text='<%# Bind("BillingZip") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billing Country :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtBillingCountry" Width="380"  runat="server" Text='<%# Bind("BillingCountry") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblBillingCountry" runat="server" Text='<%# Bind("BillingCountry") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="POC Last Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCLastName" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCLastName") %>'></asp:TextBox>
                                <label id="mandlbl2" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvLastNameTB" ControlToValidate="txtPOCLastName" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter POC Last Name to proceed.">Required field</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCLastName" runat="server" Text='<%# Bind("POCLastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC First Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCFirstName" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCFirstName") %>'></asp:TextBox>
                                <label id="mandlbl1" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="rfvFirstNameTB" ControlToValidate="txtPOCFirstName" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter POC First Name to proceed.">Required field</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCFirstName" runat="server" Text='<%# Bind("POCFirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC Phone :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCPhone" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCPhone") %>'></asp:TextBox>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCPhone" runat="server" Text='<%# Bind("POCPhone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
              
                        <asp:TemplateField HeaderText="POC Department :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCDepartment" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCDepartment") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCDepartment" runat="server" Text='<%# Bind("POCDepartment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="POC Email :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCEmail" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCEmail") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="regExpVal" runat="server" ControlToValidate="txtPOCEmail" ErrorMessage="Please Enter Valid Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCEmail" runat="server" Text='<%# Bind("POCEmail") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="POC Fax :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCFax" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCFax") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCFax" runat="server" Text='<%# Bind("POCFax") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Assistant's Last Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAssistantLastName" Width="380" MaxLength="50" runat="server" Text='<%# Bind("AssistantLastName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAssistantLastName" runat="server" Text='<%# Bind("AssistantLastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Assistant's First Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAssistantFirstName" Width="380" MaxLength="50" runat="server" Text='<%# Bind("AssistantFirstName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAssistantFirstName" runat="server" Text='<%# Bind("AssistantFirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Assistant's Phone :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAssistantPhone" Width="380" MaxLength="50" runat="server" Text='<%# Bind("AssistantPhone") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAssistantPhone" runat="server" Text='<%# Bind("AssistantPhone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:TemplateField HeaderText="New Company? :">
                            <ItemTemplate>
                                <asp:Label ID="lblNewCompany" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlNewItem" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description"
                                    DataValueField="Value" SelectedValue='<%# Bind("Value") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Company Website :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtWebsite" Width="380" MaxLength="50" runat="server" Text='<%# Bind("Website") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblWebsite" runat="server" Text='<%# Bind("Website") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Employee Quantity :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmpQuantity" Width="380" onkeypress="EnterOnlyNumeric()" runat="server" Text='<%# Bind("EmpQuantity") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEmpQuantity" runat="server" Text='<%# Bind("EmpQuantity") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Company Value Goal :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCOMPANYVALUEGOAL" Width="380" onkeypress="EnterOnlyNumeric()" MaxLength="50" runat="server" Text='<%# Bind("COMPANYVALUEGOAL") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCOMPANYVALUEGOAL" runat="server" Text='<%# Bind("COMPANYVALUEGOAL") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Industry :">
                            <ItemTemplate>
                                <asp:Label ID="lblIndustry" runat="server" Text='<%# Eval("Industry") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlIndustry" runat="server" DataSourceID="IndustryDS" DataTextField="IndustryTypeName"
                                    DataValueField="IndID" SelectedValue='<%# Bind("IndID") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sandler Rep Last Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRepLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("RepLastName") %>'></asp:TextBox>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRepLastName" runat="server" Text='<%# Bind("RepLastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sandler Rep First Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRepFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("RepFirstName") %>'></asp:TextBox>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRepFirstName" runat="server" Text='<%# Bind("RepFirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDiscussionTopic" MaxLength="50" Width="380" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDiscussionTopic" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Step :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtACTIONSTEP" MaxLength="50" Width="380" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblACTIONSTEP" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Contact Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="LastContactDate" Text='<%# Bind("LastContact_Date") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageLCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender runat="server" TargetControlID="LastContactDate" PopupButtonID="calanderImageLCD"
                                    CssClass="calendar">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastContactDate" runat="server" Text='<%# Bind("LastContact_Date","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Next Contact Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="NextContactDate" Text='<%# Bind("NextContact_Date") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageNCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender runat="server" TargetControlID="NextContactDate" PopupButtonID="calanderImageNCD"
                                    CssClass="calendar">
                                </asp:CalendarExtender>
                                Start Time:
                                <asp:TextBox ID="tpStartTime" Text='<%# Bind("StartTime","{0:t}") %>' MaxLength="30" Width="80" runat="server"></asp:TextBox>
                                e.g 9:00 AM or 3:30 PM
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNextContactDate" runat="server" Text='<%# Bind("NextContact_Date","{0:d}") %>'></asp:Label>&nbsp;
                                <asp:Label ID="lblStartTime" runat="server" Text='<%# Bind("StartTime","{0:t}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Creation Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="CreationDate" Text='<%# Bind("CreationDate") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageCRD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="CreationDate"
                                    PopupButtonID="calanderImageCRD" CssClass="calendar">
                                </asp:CalendarExtender>
                                
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCreationDate" runat="server" Text='<%# Bind("CreationDate","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Company Notes :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNotes" Width="380" TextMode="MultiLine" Rows="3" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
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
                                    Text="Edit"></asp:LinkButton>&nbsp;&nbsp;<a href="Index.aspx" style="font-weight:bold">Back To Companies</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:DetailsView>
            </td>
        </tr>        
        <tr>
            <td colspan="2">&nbsp;</td>
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
                <asp:HiddenField ID="hidCompanyID" runat="server" />
                <asp:HiddenField ID="hidIndName" runat="server" />
            </td>
        </tr>
        <%--Datasources--%>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="IndustryDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetAllIndustries"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="BillingAddressDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetBillingOptions"></asp:ObjectDataSource>
            </td>
        </tr>
    </table>

    </ContentTemplate> 
    </asp:UpdatePanel>
</asp:Content>
