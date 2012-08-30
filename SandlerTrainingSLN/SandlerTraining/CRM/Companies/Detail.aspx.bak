<%@ Page Title="CRM - View/Edit Company" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="CompanyDETAIL" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table>
        <tr>
            <th style="float: left">
                <asp:Label ID="lblModuleActionHeading" runat="server"></asp:Label>
            </th>
        </tr>
        <tr>
            <td>
                <asp:DetailsView AutoGenerateRows="False" DataKeyNames="COMPANIESID" ID="CompanyDW"
                    runat="server" Width="675px" OnItemCommand="CompanyDW_ItemCommand" OnModeChanging="CompanyDW_ModeChanging"
                    OnItemUpdating="CompanyDW_ItemUpdating" OnItemCreated="CompanyDW_ItemCreated"
                    OnDataBound="CompanyDW_DataBound">
                    <Fields>
                        <asp:BoundField DataField="COMPANIESID" Visible="False" />
                        <asp:TemplateField HeaderText="Company Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCompName" Width="380" MaxLength="50" runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValCompNameTB" ControlToValidate="txtCompName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("COMPANYNAME") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Wrap="False" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtAddress" Width="380" MaxLength="150" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValAddressTB" ControlToValidate="txtAddress"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Address to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblAddressName" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCity" Width="380" MaxLength="50" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValCityTB" ControlToValidate="txtCity" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter City to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtState" Width="380" MaxLength="50" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValStateTB" ControlToValidate="txtState"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter State to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zip :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtZip" Width="380"  MaxLength="6"
                                    runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValtxtZipTB" ControlToValidate="txtZip" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Zip to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblZip" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC Last Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCLastName" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCLastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValtxtPOCLastNameTB" ControlToValidate="txtPOCLastName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter POC Last Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCLastName" runat="server" Text='<%# Bind("POCLastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC First Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCFirstName" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCFirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValtxtPOCFirstNameTB" ControlToValidate="txtPOCFirstName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter POC First Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCFirstName" runat="server" Text='<%# Bind("POCFirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC Phone :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPOCPhone" Width="380" MaxLength="50" runat="server" Text='<%# Bind("POCPhone") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValtxtPOCPhoneTB" ControlToValidate="txtPOCPhone"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter POC Phone to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblPOCPhone" runat="server" Text='<%# Bind("POCPhone") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="Company Value Goal :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCOMPANYVALUEGOAL" Width="380" onkeypress="EnterOnlyNumeric()"
                                    MaxLength="50" runat="server" Text='<%# Bind("COMPANYVALUEGOAL") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtxtCOMPANYVALUEGOALTB" ControlToValidate="txtCOMPANYVALUEGOAL"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Company Value Goal to proceed.">
                    *
                                </asp:RequiredFieldValidator>
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
                        <asp:TemplateField HeaderText="Rep Last Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRepLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("RepLastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvRepLastNMTB" ControlToValidate="txtRepLastName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Rep Last Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRepLastName" runat="server" Text='<%# Bind("RepLastName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rep First Name :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtRepFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("RepFirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvRepFirstNMTB" ControlToValidate="txtRepFirstName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Rep First Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblRepFirstName" runat="server" Text='<%# Bind("RepFirstName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDiscussionTopic" MaxLength="50" Width="380" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDiscTopicTB" ControlToValidate="txtDiscussionTopic"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Discussion Topic to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblDiscussionTopic" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Step :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtACTIONSTEP" MaxLength="50" Width="380" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvACTIONSTEPTB" ControlToValidate="txtACTIONSTEP"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Action Step to proceed.">
                    *
                                </asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="NextContactDateRFV" ControlToValidate="NextContactDate"
                                    runat="server" ErrorMessage="Please Enter Next Contact Date to proceed.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblNextContactDate" runat="server" Text='<%# Bind("NextContact_Date","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Creation Date :">
                            <EditItemTemplate>
                                <asp:TextBox ID="CreationDate" Text='<%# Bind("CreationDate") %>' runat="server" />&nbsp;<asp:Image
                                    ID="calanderImageCRD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="CreationDate"
                                    PopupButtonID="calanderImageCRD" CssClass="calendar">
                                </asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="CreationDateRFV" ControlToValidate="CreationDate"
                                    runat="server" ErrorMessage="Please Enter Creation Date to proceed.">*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCreationDate" runat="server" Text='<%# Bind("CreationDate","{0:d}") %>'></asp:Label>
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
            <td colspan="2">
                &nbsp;
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
                <asp:HiddenField ID="hidCompanyID" runat="server" />
            </td>
        </tr>
        <%--Datasources--%>
        <%--<tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="ProductDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetAllProducts"></asp:ObjectDataSource>
            </td>
        </tr>--%>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="IndustryDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetAllIndustries"></asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
