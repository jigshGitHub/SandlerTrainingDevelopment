<%@ Page Title="Add Franchisee" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="CRM_HomeOffice_Add" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    
    <asp:UpdatePanel ID="updPnl" runat="server">
        <ContentTemplate>

        <table width="100%">
        <tr>
            <th class="tdTC" style="width: 280px" align="left">
                Add Franchisee :
            </th>
        </tr>
            <tr>
                <td>
                   <asp:FormView DataKeyNames="ID" ID="FranchiseeFW" runat="server" CellPadding="3" BorderStyle="None" OnItemInserted="FranchiseeFW_ItemInserted" OnModeChanging="FranchiseeFW_ModeChanging"
                    BorderWidth="1px" BackColor="White" BorderColor="#999999" GridLines="Vertical" DataSourceID="FranchiseeDataSource"
                   DefaultMode="Insert" OnDataBound="FranchiseeFW_DataBound" width="100%">
                    <InsertItemTemplate>
                                    
                        <table width="100%">
                             <tr>
                                 <td style="width:5%"></td>
                                 <td>
                                     <table id="tblFranchiseeInfoET">
                                         <tr>
                                            <td colspan="2" style="font-size:large"><b>Franchisee Information:</b></td>
                                         </tr>
                                        
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Last Name:</td>
                                            <td>
                                                <asp:TextBox ID="LastNameTB" MaxLength="50"  Width="150" Text='<%# Bind("LastName") %>' runat="server"></asp:TextBox>
                                                <label id="mandlbl" style="color:Red" runat="server">*</label>
                                                <asp:RequiredFieldValidator ID="reqFieldValLastNameTB" ControlToValidate="LastNameTB" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Last Name to proceed.">Required field</asp:RequiredFieldValidator>
                                            </td>

                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>First Name:</td>
                                            <td>
                                                <asp:TextBox ID="FirstNameTB" MaxLength="50" Width="150" Text='<%# Bind("FirstName") %>' runat="server"></asp:TextBox>
                                                <label id="LmandLbl2" style="color:Red" runat="server">*</label>
                                                <asp:RequiredFieldValidator ID="rfvFirstNameTB" ControlToValidate="FirstNameTB" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter First Name to proceed.">Required field</asp:RequiredFieldValidator>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Title:</td>
                                            <td><asp:TextBox ID="TitleTB" MaxLength="50" Width="150" Text='<%# Bind("Title") %>' runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Sandler Role:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlSandlerRole" runat="server" DataSourceID="SandlerRoleInfoDS" DataTextField="SandlerRoleText" DataValueField="SandlerRoleId" SelectedValue='<%# Bind("SandlerRoleValue") %>'></asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Part of a Master Franchise?:</td>
                                             <td>
                                                 <asp:DropDownList ID="ddlPartOfMF" runat="server" DataSourceID="YesNoOptionsInfoDS" 
                                                 DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsMasterFranchiseeExistsValue") %>'></asp:DropDownList>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Master Franchisee:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlMasterFranchisee" runat="server" DataSourceID="MasterFranchiseeInfoDS" DataTextField="MasterFranchiseeName" DataValueField="MasterFranchiseeId" SelectedValue='<%# Bind("MasterFranchiseeId") %>'></asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Can Print Locally?:</td>
                                             <td>
                                                 <asp:DropDownList ID="ddlCanPrintLocally" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsCanPrintLocallyValue") %>'></asp:DropDownList>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Buy from Customer:</td>
                                             <td>
                                                 <asp:DropDownList ID="ddlBuyFromCustomer" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsBuyFromCustomerValue") %>'></asp:DropDownList>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Fixed Price Purchase:</td>
                                             <td>
                                                 <asp:DropDownList ID="ddlFixedPricePurchase" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsFixedPricePurchaseValue") %>'></asp:DropDownList>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Cost Plus Amount:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlCostPlusAmt" runat="server" DataSourceID="CostPlusAmountInfoDS" DataTextField="CostPlusAmountText" DataValueField="CostPlusAmountId" SelectedValue='<%# Bind("CostPlusAmountValue") %>'></asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Behind in Territory Development:</td>
                                             <td>
                                                 <asp:DropDownList ID="ddlBehindTerDev" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsBehindInTerDevValue") %>'></asp:DropDownList>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Select Behind Amount:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlBehindAmt" runat="server" DataSourceID="BehindAmountInfoDS" DataTextField="BehindAmountText" DataValueField="BehindAmountId" SelectedValue='<%# Bind("BehindAmountValue") %>'></asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Coach-Region:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlCoach" runat="server" DataSourceID="CoachOptionsInfoDS" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("CoachId") %>'></asp:DropDownList>
                                                <label id="mandLbl3" style="color:Red" runat="server">*</label>
                                                <asp:RequiredFieldValidator ID="rfvCoach" ControlToValidate="ddlCoach"  InitialValue="0" Display="Static" runat="server" ErrorMessage="Please Select Coach to proceed.">Required field</asp:RequiredFieldValidator>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color:  #DCDCDC; white-space: nowrap;">
                                            <td>Territory:</td>
                                            <td><asp:TextBox ID="txtTerritory" MaxLength="120" Width="150" Text='<%# Bind("Territory") %>' runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Business Focus Area:</td>
                                            <td><asp:TextBox ID="txtBusinessFocusArea" MaxLength="50" Width="150" Text='<%# Bind("BusinessFocusArea") %>' runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color:  #DCDCDC; white-space: nowrap;">
                                            <td>Closest Metro Area:</td>
                                            <td><asp:TextBox ID="txtClosestMetro" MaxLength="50" Width="150" Text='<%# Bind("ClosestMetroArea") %>' runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Franchise Name:</td>
                                            <td>
                                                <asp:TextBox ID="FranchiseeNameTB" MaxLength="250"  Width="250" Text='<%# Bind("Name") %>' runat="server"></asp:TextBox>
                                                <label id="mandLbl4" style="color:Red" runat="server">*</label>
                                                <asp:RequiredFieldValidator ID="rfvFranchiseeName" ControlToValidate="FranchiseeNameTB" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter Franchisee Name to proceed.">Required field</asp:RequiredFieldValidator>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Office Phone:</td>
                                            <td><asp:TextBox ID="txtOfficePhone" MaxLength="50" Width="150" Text='<%# Bind("OfficePhone") %>' runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Mobile Phone:</td>
                                            <td><asp:TextBox ID="txtMobilePhone" MaxLength="50" Width="150" Text='<%# Bind("MobilePhone") %>' runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Fax:</td>
                                            <td><asp:TextBox ID="txtFax" MaxLength="50" Width="150" Text='<%# Bind("Fax") %>' runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Award Level:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlAwardLevel" runat="server" DataSourceID="AwardLevelInfoDS" DataTextField="AwardLevelText" DataValueField="AwardLevelId" SelectedValue='<%# Bind("AwardLevelValue") %>'></asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Purchase Level:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlPurchaseLevel" runat="server" DataSourceID="PurchaseLevelInfoDS" DataTextField="PurchaseLevelText" DataValueField="PurchaseLevelId" SelectedValue='<%# Bind("PurchaseLevelValue") %>'></asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Certified Level:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlCertifiedLevel" runat="server" DataSourceID="CertifiedLevelInfoDS" DataTextField="CertifiedLevelText" DataValueField="CertifiedLevelId" SelectedValue='<%# Bind("CertifiedLevelValue") %>'></asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Primary Business:</td>
                                            <td>
                                                <asp:DropDownList ID="ddlPrimaryBusiness" runat="server" DataSourceID="PrimaryBusinessInfoDS" DataTextField="PrimaryBusinessText" DataValueField="PrimaryBusinessId" SelectedValue='<%# Bind("PrimaryBusinessValue") %>'></asp:DropDownList>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                           <td>Initial Contract Date:</td>
                                           <td>
                                                    <asp:TextBox ID="InitialContractDate" Text='<%# Bind("InitialContractDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageICD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="InitialContractDate" PopupButtonID="calanderImageICD" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                           <td>Renewal Date:</td>
                                           <td>
                                                    <asp:TextBox ID="RenewalDate" Text='<%# Bind("RenewalDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageRND" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="RenewalDate" PopupButtonID="calanderImageRND" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                           <td>Contract Form Date:</td>
                                           <td>
                                                    <asp:TextBox ID="ContractFormDate" Text='<%# Bind("ContractFormDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageCFD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="ContractFormDate" PopupButtonID="calanderImageCFD" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Are Contractors Permitted?:</td>
                                             <td>
                                                 <asp:DropDownList ID="ddlContrPerm" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsContractorPermittedValue") %>'></asp:DropDownList>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                             <td colspan="2">
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Add" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"    Text="Back To Franchisees" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
                                             </td>
                                         </tr>
                                     </table>
                                 </td>
                                 <td style="width:20%"></td>
                                 <td>
                                     <table id="tblPersonalInfoET">
                                             <tr>
                                                <td colspan="2" style="font-size:large"><b>Personal Information:</b></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>KOL Member:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlKOLMember" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsKOLMemberValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Advisory Borad:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlAdvBoard" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsAdvBoardValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Marketing Committee:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlMktgComt" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsMktgCommitteeValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Using Sandler CRM?:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSandlerCRM" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsUsingSandlerCRMValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>DHS Award Winner:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlDHSAward" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsDHSAwardWinnerValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>DHS Award Date:</td>
                                                <td>
                                                    <asp:TextBox ID="DHSAwardDate" Text='<%# Bind("DHSAwardDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageDAD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="DHSAwardDate" PopupButtonID="calanderImageDAD" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Initial Training Date:</td>
                                                <td>
                                                    <asp:TextBox ID="IntTrngDate" Text='<%# Bind("InitialTrngDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageITD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="IntTrngDate" PopupButtonID="calanderImageITD" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Is Sandler Mail Required?:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSandlerMail" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsSandlerMailRequiredValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Required to submit Financials?:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlReqFinancials" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsReqToSubmitFinancialValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Rep Agreement for Global Account?:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlRepAgreement" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsRepAgreementValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Primary Office Email:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkEmail" MaxLength="80" Width="150" runat="server" Text='<%# Bind("WorkEmail") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Primary Office Address:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkAddress" MaxLength="200" Width="250" runat="server" Text='<%# Bind("WorkAddress") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Primary Office City:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkCity" MaxLength="50" Width="150" runat="server" Text='<%# Bind("WorkCity") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Primary Office State:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlWorkState" runat="server" DataSourceID="StateInfoDS" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("WorkStateValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Primary Office Zip:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkZip" MaxLength="50" Width="150" runat="server" Text='<%# Bind("WorkZip") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Primary Office Country:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlWorkCountry" runat="server" DataSourceID="CountryInfoDS" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("WorkCountryValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Spouse's Name:</td>
                                                <td>
                                                    <asp:TextBox ID="txtSpouseName" MaxLength="50" Width="150" runat="server" Text='<%# Bind("SpouseName") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Birthday:</td>
                                                <td>
                                                    <asp:TextBox ID="BirthDay" Text='<%# Bind("BirthDay") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageBTD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="BirthDay" PopupButtonID="calanderImageBTD" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Anniversary:</td>
                                                <td>
                                                    <asp:TextBox ID="Anniversary" Text='<%# Bind("Anniversary") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageAVS" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="Anniversary" PopupButtonID="calanderImageAVS" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Years with Company:</td>
                                                <td>
                                                    <asp:TextBox ID="txtYrsCompany" MaxLength="50" Width="150" runat="server" Text='<%# Bind("YearswithCompany") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home Phone:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHomePhone" MaxLength="50" Width="150" runat="server" Text='<%# Bind("HomePhone") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Alternate Email:</td>
                                                <td>
                                                    <asp:TextBox ID="txtAlternateEmail" MaxLength="50" Width="150" runat="server" Text='<%# Bind("AlternateEmail") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Same Home Address?:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlSameHomeAdrs" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsSameHomeAddressValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home Address:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHomeAddress" MaxLength="200" Width="250" runat="server" Text='<%# Bind("HomeAddress") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home City:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHomeCity" MaxLength="50" Width="150" runat="server" Text='<%# Bind("HomeCity") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home State:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlHomeState" runat="server" DataSourceID="StateInfoDS" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("HomeStateValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home Zip:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHomeZip" MaxLength="50" Width="150" runat="server" Text='<%# Bind("HomeZip") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home Country:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlHomeCountry" runat="server" DataSourceID="CountryInfoDS" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("HomeCountryValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                      </table>
                                 </td>
                                 <td style="width:5%"></td>
                             </tr>
                             
                             
                         </table>
                         
                     </InsertItemTemplate>
                                         
                   
            </asp:FormView>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server"  ForeColor="Red" ShowMessageBox="True" />
                </td>
            </tr>

            <tr>
            <td colspan="2">
                <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
                <asp:ObjectDataSource ID="YesNoOptionsInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetNewItemOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="StateInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetStateOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CountryInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetCountryOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="SandlerRoleInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetSandlerRoleOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="MasterFranchiseeInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetMasterFranchiseehOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CostPlusAmountInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetCostPlusAmountOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="BehindAmountInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetBehindAmountOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CoachOptionsInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetCoachOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="AwardLevelInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetAwardLevelOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="PurchaseLevelInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetPurchaseLevelOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="CertifiedLevelInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetCertifiedLevelOptions"></asp:ObjectDataSource>
                <asp:ObjectDataSource ID="PrimaryBusinessInfoDS" runat="server" TypeName="SandlerRepositories.FranchiseesRepository" SelectMethod="GetPrimaryBusinessOptions"></asp:ObjectDataSource>
                
                 <asp:ObjectDataSource ID="FranchiseeDataSource" runat="server" InsertMethod="InsertFranchisee" TypeName="SandlerRepositories.FranchiseesRepository" OnInserting="InsertOperation_Selecting">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="Name" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="LastName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="FirstName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="Title" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="SandlerRoleValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsMasterFranchiseeExistsValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="MasterFranchiseeId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsCanPrintLocallyValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsBuyFromCustomerValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsFixedPricePurchaseValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="CostPlusAmountValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsBehindInTerDevValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="BehindAmountValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="CoachId" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="OfficePhone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="Fax" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="AwardLevelValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="PurchaseLevelValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="CertifiedLevelValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="PrimaryBusinessValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="InitialContractDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="RenewalDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="ContractFormDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsContractorPermittedValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsKOLMemberValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsAdvBoardValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsMktgCommitteeValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsUsingSandlerCRMValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsDHSAwardWinnerValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="DHSAwardDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="InitialTrngDate" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsSandlerMailRequiredValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsReqToSubmitFinancialValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsRepAgreementValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="WorkEmail" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="WorkAddress" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="WorkCity" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="WorkStateValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="WorkZip" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="WorkCountryValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="SpouseName" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="BirthDay" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="Anniversary" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="YearswithCompany" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="HomePhone" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="AlternateEmail" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="IsSameHomeAddressValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="HomeAddress" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="HomeCity" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="HomeStateValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="HomeZip" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="HomeCountryValue" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="Territory" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="BusinessFocusArea" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="FranchiseeFW" Name="ClosestMetroArea" PropertyName="SelectedValue" />
                        <asp:Parameter Name="_user"  />
                    </InsertParameters>
                </asp:ObjectDataSource>


            </td>
        </tr>


        </table>


        </ContentTemplate>

    </asp:UpdatePanel>


</asp:Content>

