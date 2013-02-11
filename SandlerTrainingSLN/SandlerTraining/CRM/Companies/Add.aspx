<%@ Page Title="CRM - Add Company" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="AddCompany" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:UpdatePanel id="updPnlCompany" runat="server">
    <ContentTemplate>
    
    

    <table>
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                Add Company :
            </th>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:DetailsView ID="dvCompany" runat="server" Height="50px" Width="300px" AutoGenerateRows="False"
                    DataSourceID="CompanyDataSource" DefaultMode="Insert" CellPadding="3" BorderStyle="None"
                    BorderWidth="1px" BackColor="White" BorderColor="#999999" GridLines="Vertical"
                    OnItemInserted="dvCompany_ItemInserted" OnModeChanging="dvCompany_ModeChanging"
                    OnDataBound="dvCompany_DataBound" onitemcreated="dvCompany_ItemCreated">
                    <Fields>
                        <asp:TemplateField HeaderText="Company Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCompName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:TextBox>
                                <label id="mandlbl" style="color:Red" runat="server">*</label>
                                <asp:RequiredFieldValidator ID="reqFieldValCompNameTB" ControlToValidate="txtCompName" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">Required field</asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ownership :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtOwnership" MaxLength="50" Width="380" runat="server" Text='<%# Bind("CompanyOwnership") %>'></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Description :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCompanyDescription" MaxLength="50" Width="380" runat="server" Text='<%# Bind("CompanyDescription") %>'></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <%--Address details--%>
                        <asp:TemplateField HeaderText="Address :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtAddress" MaxLength="150" Width="380" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCity" MaxLength="50" Width="380" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtState" MaxLength="50" Width="380" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zip :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtZip"  MaxLength="7"  Width="380" runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCountry" MaxLength="50" Width="380" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Same Billing Address?:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlBillingAdrs" AutoPostBack="true" OnSelectedIndexChanged="ddlBillingAdrs_SelectedIndexChanged" runat="server" DataSourceID="BillingAddressDS" DataTextField="BillingDescription" DataValueField="BillingValue" SelectedValue='<%# Bind("BillingValue") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <%-- Billing Address details--%>
                        <asp:TemplateField HeaderText="Billing Address :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtBillingAddress" MaxLength="150" Width="380" runat="server" Text='<%# Bind("BillingAddress") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billing City :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtBillingCity" MaxLength="50" Width="380" runat="server" Text='<%# Bind("BillingCity") %>'></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billing State :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtBillingState" MaxLength="50" Width="380" runat="server" Text='<%# Bind("BillingState") %>'></asp:TextBox>
                             </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billing Zip :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtBillingZip"  MaxLength="7"  Width="380" runat="server" Text='<%# Bind("BillingZip") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Billing Country :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtBillingCountry" MaxLength="50" Width="380" runat="server" Text='<%# Bind("BillingCountry") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="POC Last Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("POCLastName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC First Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("POCFirstName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCPhone" MaxLength="50" Width="380" runat="server" Text='<%# Bind("POCPhone") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="POC Department :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCDepartment" MaxLength="50" Width="380" runat="server" Text='<%# Bind("POCDepartment") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="POC Email :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCEmail" MaxLength="50" Width="380" runat="server" Text='<%# Bind("POCEmail") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="regExpVal" runat="server" ControlToValidate="txtPOCEmail" ErrorMessage="Please Enter Valid Email address." ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC Fax :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCFax" MaxLength="50" Width="380" runat="server" Text='<%# Bind("POCFax") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Assistant's Last Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtAssistantLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("AssistantLastName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assistant's First Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtAssistantFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("AssistantFirstName") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Assistant's Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtAssistantPhone" MaxLength="50" Width="380" runat="server" Text='<%# Bind("AssistantPhone") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                                               
                        <asp:TemplateField HeaderText="New Company?:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description"
                                    DataValueField="Value" SelectedValue='<%# Bind("Value") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Company Website :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtWebsite" MaxLength="50" Width="380" runat="server" Text='<%# Bind("Website") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Employee Quantity :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtEmpQuantity" onkeypress="EnterOnlyNumeric()" Width="380" runat="server" Text='<%# Bind("EmpQuantity") %>'></asp:TextBox>
                            </InsertItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Company Value Goal :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtComValueGoal" onkeypress="EnterOnlyNumeric()" Width="380" runat="server"
                                    Text='<%# Bind("COMPANYVALUEGOAL") %>'></asp:TextBox>
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Industry:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlIndustry" runat="server" DataSourceID="IndustryDS" DataTextField="IndustryTypeName"
                                    DataValueField="IndID" SelectedValue='<%# Bind("IndID") %>'>
                                </asp:DropDownList>
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sandler Rep Last Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtRepLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("RepLastName") %>'></asp:TextBox>
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sandler Rep First Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtRepFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("RepFirstName") %>'></asp:TextBox>
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDisTopic" Width="380" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Step :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtActStep" Width="380" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Contact Date :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="LastContactDate" Text='<%# Bind("LastContact_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageLCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender  runat="server" TargetControlID="LastContactDate" PopupButtonID="calanderImageLCD" CssClass="calendar"></asp:CalendarExtender>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Next Contact Date :">
                            <InsertItemTemplate>
                                
                                <asp:TextBox ID="NextContactDate" Text='<%# Bind("NextContact_Date") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageNCD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender  runat="server" TargetControlID="NextContactDate" PopupButtonID="calanderImageNCD" CssClass="calendar"></asp:CalendarExtender>
                                                                
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Creation Date :">
                            <InsertItemTemplate>
                                
                                <asp:TextBox ID="CreationDate" Text='<%# Bind("CreationDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageCRD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                <asp:CalendarExtender  runat="server" TargetControlID="CreationDate" PopupButtonID="calanderImageCRD" CssClass="calendar"></asp:CalendarExtender>
                                                                
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Company Notes :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtNotes"  TextMode="MultiLine" Rows="3" Width="380" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                                
                            </InsertItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField ShowHeader="False">
                            <InsertItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Add" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Back To Companies" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
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
            <td style="width: 280px">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ForeColor="Red" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                <asp:ObjectDataSource ID="ProductDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetAllProducts"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="IndustryDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetAllIndustries"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>

                <asp:ObjectDataSource ID="BillingAddressDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetBillingOptions"></asp:ObjectDataSource>

                <asp:ObjectDataSource ID="CompanyDataSource" runat="server" InsertMethod="InsertCompany"
                    TypeName="SandlerRepositories.CompaniesRepository">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="dvCompany" Name="COMPANYNAME" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="CompanyOwnership" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="CompanyDescription" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Address" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="City" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="State" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Zip" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Country" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="BillingValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="BillingAddress" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="BillingCity" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="BillingState" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="BillingZip" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="BillingCountry" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCLastName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCFirstName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCPhone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCDepartment" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCEmail" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCFax" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="AssistantLastName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="AssistantFirstName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="AssistantPhone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Value" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Website" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="EmpQuantity" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="COMPANYVALUEGOAL" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="IndID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="RepLastName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="RepFirstName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="DiscussionTopic" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="ACTIONSTEP" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="LastContact_Date" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="NextContact_Date" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="CreationDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Notes" PropertyName="SelectedValue" />

                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>


    </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
