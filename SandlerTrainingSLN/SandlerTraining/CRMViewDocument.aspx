<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true"
    CodeFile="CRMViewDocument.aspx.cs" Inherits="CRMViewDocument" %>

<%@ Register TagPrefix="ew" Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table>
        <tr>
            <th align="left" class="tdTC" colspan="2" style="width: 680px">
                View / Edit Document :
            </th>
        </tr>
        <tr>
            <td>
                <asp:DetailsView AutoGenerateRows="False" DataKeyNames="Doc_ID" ID="DocumentDW" runat="server"
                    Width="675px" OnItemCommand="DocumentDW_ItemCommand" OnModeChanging="DocumentDW_ModeChanging"
                    OnItemUpdating="DocumentDW_ItemUpdating">
                    <Fields>
                        <asp:BoundField DataField="Doc_ID" Visible="False" />
                        <asp:TemplateField HeaderText="Company :">
                            <ItemTemplate>
                                <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("Company_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Opp Name :">
                            <ItemTemplate>
                                <asp:Label ID="lblOppName" runat="server" Text='<%# Eval("Opp_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Document Status :">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDocStatus" runat="server" Text='<%# Bind("Document_Status") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDocStatusTB" ControlToValidate="txtDocStatus"
                                    Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Document Status to proceed.">
                    *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCOMMENT" runat="server" Text='<%# Bind("Document_Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Modified Date :">
                            <EditItemTemplate>
                                <ew:CalendarPopup ID="LastModifyDate" Nullable="True" DisplayPrevNextYearSelection="True"
                                    SelectedDate='<%# Bind("Last_Modify_Date") %>' runat="server" AllowArbitraryText="False"
                                    CellPadding="2px" CellSpacing="0px" Culture="English (United States)" JavascriptOnChangeFunction=""
                                    LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="Images/calendar.gif"
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
                                <asp:RequiredFieldValidator ID="LastContactDateRFV" ControlToValidate="LastModifyDate"
                                    runat="server" ErrorMessage="Please Enter Last Modify Date to proceed.">
            *
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblLastContactDate" runat="server" Text='<%# Bind("Last_Modify_Date","{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Attached Document:">
                            <EditItemTemplate>
                                <asp:FileUpload ID="UpLoad" Width="275px" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:HyperLink ID="ModuleLink" runat="server" ForeColor="Blue" Target="_blank" NavigateUrl='<%# Eval("Doc_Name", "Documents\\{0}") %>'
                                    Text='<%# Eval("Doc_Name") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update"></asp:LinkButton>&nbsp;&nbsp;
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ControlStyle ForeColor="Red" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    Text="Edit"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Fields>
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
                <asp:Button ID="Cancel" CssClass="menuButton" runat="server" Text="Go Back to Documents"
                    OnClick="Cancel_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label CssClass="resultLabel" ID="LblStatus" ForeColor="Red" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HiddenField ID="hidDocumentID" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
