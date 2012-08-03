<%@ Page Title="CRM - Add Company" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="AddCompany" %>

<%@ Register TagPrefix="ew" Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<%@ Import Namespace="SandlerRepositories" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
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
                    OnDataBound="dvCompany_DataBound">
                    <Fields>
                        <asp:TemplateField HeaderText="Company Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCompName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValCompNameTB" ControlToValidate="txtCompName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Address :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtAddress" MaxLength="150" Width="380" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValAddressTB" ControlToValidate="txtAddress"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Address to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtCity" MaxLength="50" Width="380" runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValtxtCityTB" ControlToValidate="txtCity"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter City to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtState" MaxLength="50" Width="380" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValtxtStateTB" ControlToValidate="txtState"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter State to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zip :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtZip" onkeypress="EnterOnlyNumeric()" Width="380" runat="server"
                                    Text='<%# Bind("Zip") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValtxtZipTB" ControlToValidate="txtZip" Display="Static"
                                    InitialValue="" runat="server" ErrorMessage="Please Enter Zip to proceed.">
                        *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC Last Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("POCLastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValPOCLastNameTB" ControlToValidate="txtPOCLastName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter POC Last Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC First Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("POCFirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValPOCFirstNameTB" ControlToValidate="txtPOCFirstName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter POC First Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="POC Phone :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtPOCPhone" onkeypress="EnterOnlyNumeric()" MaxLength="50" Width="380"
                                    runat="server" Text='<%# Bind("POCPhone") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValPOCPhoneTB" ControlToValidate="txtPOCPhone"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter POC Phone to proceed.">
                        *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="New Company?:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlAccount" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description"
                                    DataValueField="Value" SelectedValue='<%# Bind("Value") %>'>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Value Goal :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtComValueGoal" onkeypress="EnterOnlyNumeric()" Width="380" runat="server"
                                    Text='<%# Bind("COMPANYVALUEGOAL") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValActValueTB" ControlToValidate="txtComValueGoal"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Company Value Goal to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Product:">
                   <InsertItemTemplate>
                        <asp:DropDownList ID="ddlProduct" runat="server" DataSourceID="ProductDS" DataTextField="ProductTypeName" DataValueField="ID" SelectedValue='<%# Bind("ID") %>'></asp:DropDownList>
                        <asp:RequiredFieldValidator id="productRFV"
                            ControlToValidate="ddlProduct"
                            Display="Static"
                            InitialValue="0" runat="server" ErrorMessage="Please Select Product to proceed." >
                            *
                        </asp:RequiredFieldValidator>
                   </InsertItemTemplate>
          </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Industry:">
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlIndustry" runat="server" DataSourceID="IndustryDS" DataTextField="IndustryTypeName"
                                    DataValueField="IndID" SelectedValue='<%# Bind("IndID") %>'>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="industryRFV" ControlToValidate="ddlIndustry" Display="Static"
                                    InitialValue="0" runat="server" ErrorMessage="Please Select Industry to proceed.">
                            *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sandler Rep Last Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtRepLastName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("RepLastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValRepLastNameTB" ControlToValidate="txtRepLastName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Rep Last Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sandler Rep First Name :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtRepFirstName" MaxLength="50" Width="380" runat="server" Text='<%# Bind("RepFirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValRepFirstNameTB" ControlToValidate="txtRepFirstName"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Rep First Name to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Discussion Topic :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtDisTopic" Width="380" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValDiscTopicTB" ControlToValidate="txtDisTopic"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Discussion Topic to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Action Step :">
                            <InsertItemTemplate>
                                <asp:TextBox ID="txtActStep" Width="380" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFieldValActStepTB" ControlToValidate="txtActStep"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Action Step to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Contact Date :">
                            <InsertItemTemplate>
                                <ew:CalendarPopup ID="LastContactDate" Nullable="True" DisplayPrevNextYearSelection="True"
                                    SelectedDate='<%# Bind("LastContact_Date") %>' runat="server" AllowArbitraryText="False"
                                    CellPadding="2px" CellSpacing="0px" Culture="English (United States)" JavascriptOnChangeFunction=""
                                    LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="~/images/calendar.gif"
                                    ControlDisplay="TextBoxImage">
                                    <TodayDayStyle BackColor="LightGoldenrodYellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <WeekendStyle BackColor="LightGray" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <OffMonthStyle BackColor="AntiqueWhite" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Gray" />
                                    <WeekdayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <SelectedDateStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <MonthHeaderStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <HolidayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <GoToTodayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <ClearDateStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                </ew:CalendarPopup>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Next Contact Date :">
                            <InsertItemTemplate>
                                <ew:CalendarPopup ID="NextContactDate" Nullable="True" DisplayPrevNextYearSelection="True"
                                    SelectedDate='<%# Bind("NextContact_Date") %>' runat="server" AllowArbitraryText="False"
                                    CellPadding="2px" CellSpacing="0px" Culture="English (United States)" JavascriptOnChangeFunction=""
                                    LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="~/images/calendar.gif"
                                    ControlDisplay="TextBoxImage">
                                    <TodayDayStyle BackColor="LightGoldenrodYellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <WeekendStyle BackColor="LightGray" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <OffMonthStyle BackColor="AntiqueWhite" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Gray" />
                                    <WeekdayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <SelectedDateStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <MonthHeaderStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <HolidayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <GoToTodayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <ClearDateStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                </ew:CalendarPopup>
                                <asp:RequiredFieldValidator ID="NextContactDateRFV" ControlToValidate="NextContactDate"
                                    runat="server" ErrorMessage="Please Enter Next Contact Date to proceed.">
            *
                                </asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Creation Date :">
                            <InsertItemTemplate>
                                <ew:CalendarPopup ID="CreationDate" Nullable="True" DisplayPrevNextYearSelection="True"
                                    SelectedDate='<%# Bind("CreationDate") %>' runat="server" AllowArbitraryText="False"
                                    CellPadding="2px" CellSpacing="0px" Culture="English (United States)" JavascriptOnChangeFunction=""
                                    LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="~/images/calendar.gif"
                                    ControlDisplay="TextBoxImage">
                                    <TodayDayStyle BackColor="LightGoldenrodYellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <WeekendStyle BackColor="LightGray" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <OffMonthStyle BackColor="AntiqueWhite" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Gray" />
                                    <WeekdayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <SelectedDateStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <MonthHeaderStyle BackColor="Yellow" Font-Names="Verdana,Helvetica,Tahoma,Arial"
                                        Font-Size="XX-Small" ForeColor="Black" />
                                    <HolidayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <GoToTodayStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <DayHeaderStyle BackColor="Orange" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                    <ClearDateStyle BackColor="White" Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                                        ForeColor="Black" />
                                </ew:CalendarPopup>
                                <asp:RequiredFieldValidator ID="AcctCreationDateRFV" ControlToValidate="CreationDate"
                                    runat="server" ErrorMessage="Please Enter Creation Date to proceed.">
            *
                                </asp:RequiredFieldValidator>
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
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td style="width: 280px">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                <asp:ObjectDataSource ID="ProductDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetAllProducts"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="IndustryDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetAllIndustries"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                    SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CompanyDataSource" runat="server" InsertMethod="Insert"
                    TypeName="SandlerRepositories.CompaniesRepository">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="dvCompany" Name="COMPANYNAME" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Address" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="City" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="State" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Zip" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCLastName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCFirstName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="POCPhone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="Value" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="COMPANYVALUEGOAL" PropertyName="SelectedValue" />
                        <%--<asp:ControlParameter ControlID="dvCompany" Name="ID" PropertyName="SelectedValue" />--%>
                        <asp:ControlParameter ControlID="dvCompany" Name="IndID" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="RepLastName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="RepFirstName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="DiscussionTopic" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="ACTIONSTEP" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="LastContact_Date" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="NextContact_Date" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dvCompany" Name="CreationDate" PropertyName="SelectedValue" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
