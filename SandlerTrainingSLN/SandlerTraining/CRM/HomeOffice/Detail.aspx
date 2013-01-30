<%@ Page Title="View/Edit Franchisee" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="CRM_HomeOffice_Detail" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    
    <asp:UpdatePanel ID="updPnl" runat="server">
        <ContentTemplate>
    
    <table width="100%">
        <tr>
            <th style="float: left">
                <asp:Label ID="lblModuleActionHeading" runat="server"></asp:Label>
            </th>
        </tr>
        <tr>
            <td>
            <asp:FormView DataKeyNames="ID" ID="FranchiseeFW" runat="server" OnItemUpdating="FranchiseeFW_ItemUpdating"
            OnItemCommand="FranchiseeFW_ItemCommand" OnModeChanging="FranchiseeFW_ModeChanging" OnItemCreated="FranchiseeFW_ItemCreated"
            OnDataBound="FranchiseeFW_DataBound">
                    
                    <EditItemTemplate>
                        <table width="100%">
                             <tr>
                                 <td>
                                     <table id="tblFranchiseeInfoET">
                                         <tr>
                                            <td colspan="2" style="font-size:large"><b>Franchisee Information:</b></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Franchisee Name:<td><%# Eval("Name")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>LastName:</td>
                                            <td>
                                                <asp:TextBox ID="LastNameTB" MaxLength="50"  Width="150" Text='<%# Bind("LastName") %>' runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="reqFieldValLastNameTB" ControlToValidate="LastNameTB" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter LastName to proceed.">*</asp:RequiredFieldValidator>
                                            </td>

                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>FirstName:</td>
                                            <td>
                                                <asp:TextBox ID="FirstNameTB" MaxLength="50" Width="150" Text='<%# Bind("FirstName") %>' runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvFirstNameTB" ControlToValidate="FirstNameTB" Display="Static" InitialValue="" runat="server" ErrorMessage="Please Enter FirstName to proceed.">*</asp:RequiredFieldValidator>
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
                                            <td>Part of a Master Franchisee?:</td>
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
                                                    <asp:CalendarExtender runat="server" TargetControlID="InitialContractDate" PopupButtonID="calanderImageICD" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                           <td>Renewal Date:</td>
                                           <td>
                                                    <asp:TextBox ID="RenewalDate" Text='<%# Bind("RenewalDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageRND" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender runat="server" TargetControlID="RenewalDate" PopupButtonID="calanderImageRND" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                           <td>Contract Form Date:</td>
                                           <td>
                                                    <asp:TextBox ID="ContractFormDate" Text='<%# Bind("ContractFormDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageCFD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender runat="server" TargetControlID="ContractFormDate" PopupButtonID="calanderImageCFD" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Are Contractors Permitted?:</td>
                                             <td>
                                                 <asp:DropDownList ID="ddlContrPerm" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("IsContractorPermittedValue") %>'></asp:DropDownList>
                                              </td>
                                         </tr>

                                     </table>
                                 </td>
                                 <td>&nbsp;&nbsp;</td>
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
                                                    <asp:CalendarExtender runat="server" TargetControlID="DHSAwardDate" PopupButtonID="calanderImageDAD" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Initial Training Date:</td>
                                                <td>
                                                    <asp:TextBox ID="IntTrngDate" Text='<%# Bind("InitialTrngDate") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageITD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender runat="server" TargetControlID="IntTrngDate" PopupButtonID="calanderImageITD" CssClass="calendar"></asp:CalendarExtender>
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
                                                <td>Work Email:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkEmail" MaxLength="80" Width="150" runat="server" Text='<%# Bind("WorkEmail") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work Address:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkAddress" MaxLength="200" Width="250" runat="server" Text='<%# Bind("WorkAddress") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Work City:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkCity" MaxLength="50" Width="150" runat="server" Text='<%# Bind("WorkCity") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work State:</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlWorkState" runat="server" DataSourceID="StateInfoDS" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("WorkStateValue") %>'></asp:DropDownList>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Work Zip:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkZip" MaxLength="50" Width="150" runat="server" Text='<%# Bind("WorkZip") %>'></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work Country:</td>
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
                                                    <asp:CalendarExtender runat="server" TargetControlID="BirthDay" PopupButtonID="calanderImageBTD" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Anniversary:</td>
                                                <td>
                                                    <asp:TextBox ID="Anniversary" Text='<%# Bind("Anniversary") %>' runat="server" />&nbsp;<asp:Image ID="calanderImageAVS" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender runat="server" TargetControlID="Anniversary" PopupButtonID="calanderImageAVS" CssClass="calendar"></asp:CalendarExtender>
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
                             </tr>
                             
                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                 <td colspan="2">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>&nbsp;&nbsp;
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                 </td>
                             </tr>
                         </table>
                         
                     </EditItemTemplate>
                                         
                    <ItemTemplate>
                        <table width="100%">
                             <tr>
                                 <td>
                                     <table id="tblFranchiseeInfoIT">
                                         <tr>
                                            <td colspan="2" style="font-size:large"><b>Franchisee Information:</b></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Franchisee Name:<td><%# Eval("Name")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>LastName:<td><%# Eval("LastName")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>FirstName:</td><td><%# Eval("FirstName")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Title:</td><td><%# Eval("Title")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Sandler Role:</td><td><%# Eval("SandlerRole")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Part of a Master Franchisee?:</td><td><%# Eval("IsMasterFranchiseeExists")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Master Franchisee:</td><td><%# Eval("MasterFrName")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Can Print Locally?:</td><td><%# Eval("IsCanPrintLocally")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Buy From Customer:</td><td><%# Eval("IsBuyFromCustomer")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Fixed Price Purchase:</td><td><%# Eval("IsFixedPricePurchase")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Cost Plus Amount:</td><td><%# Eval("CostPlusAmount")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Behind in Territory Development?:</td><td><%# Eval("IsBehindInTerDev")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Select Behind Amount:</td><td><%# Eval("BehindAmount")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Coach:</td><td><%# Eval("CoachName")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Region:</td><td><%# Eval("RegionName")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Office Phone:</td><td><%# Eval("OfficePhone")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Mobile Phone:</td><td><%# Eval("MobilePhone")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Fax:</td><td><%# Eval("Fax")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Award Level:</td><td><%# Eval("AwardLevel")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Purchase Level:</td><td><%# Eval("PurchaseLevel")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Certified Level:</td><td><%# Eval("CertifiedLevel")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Primary Business:</td><td><%# Eval("PrimaryBusiness")%></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Initial Contract Date:</td>
                                            <td>
                                                <asp:Label ID="lblInitialContractDate" runat="server" Text='<%# Bind("InitialContractDate") %>'></asp:Label>
                                            </td>
                                            
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Renewal Date:</td>
                                            <td>
                                                <asp:Label ID="lblRenewalDate" runat="server" Text='<%# Bind("RenewalDate") %>'></asp:Label>
                                            </td>
                                            
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Contract Form Date:</td>
                                            <td>
                                                <asp:Label ID="lblContractFormDate" runat="server" Text='<%# Bind("ContractFormDate") %>'></asp:Label>
                                            </td>
                                         </tr>
                                         
                                     </table>
                                 </td>
                                 <td>&nbsp;&nbsp;</td>
                                 <td>
                                     <table id="tblPersonalInfoIT">
                                             <tr>
                                                <td colspan="2" style="font-size:large"><b>Personal Information:</b></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>KOL Member:</td><td><%# Eval("IsKOLMember")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Advisory Board:</td><td><%# Eval("IsAdvBoard")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Marketing Committee:</td><td><%# Eval("IsMktgCommittee")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Using Sandler CRM?:</td><td><%# Eval("IsUsingSandlerCRM")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>DHS Award Winner:</td><td><%# Eval("IsDHSAwardWinner")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>DHS Award Date:</td>
                                                <td>
                                                    <asp:Label ID="lblDHSAwardDate" runat="server" Text='<%# Bind("DHSAwardDate") %>'></asp:Label>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Initial Training Date:</td>
                                                <td>
                                                <asp:Label ID="lblInitialTrngDate" runat="server" Text='<%# Bind("InitialTrngDate") %>'></asp:Label>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Is Sandler Mail Required?:</td><td><%# Eval("IsSandlerMailRequired")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Required to Submit Financials?:</td><td><%# Eval("IsReqToSubmitFinancial")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Rep agreement for Global Account?:</td><td><%# Eval("IsRepAgreement")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Work Email:</td><td><%# Eval("WorkEmail")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work Address:</td><td><%# Eval("WorkAddress")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Work City:</td><td><%# Eval("WorkCity")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work State:</td><td><%# Eval("WorkState")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Work Zip:</td><td><%# Eval("WorkZip")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work Country:</td><td><%# Eval("WorkCountry")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Spouse's Name:</td><td><%# Eval("SpouseName")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Birthday:</td>
                                                <td>
                                                <asp:Label ID="lblBirthday" runat="server" Text='<%# Bind("Birthday") %>'></asp:Label>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Anniversary:</td>
                                                <td>
                                                <asp:Label ID="lblAnniversary" runat="server" Text='<%# Bind("Anniversary") %>'></asp:Label>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Years with Company:</td><td><%# Eval("YearsWithCompany")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home Phone:</td><td><%# Eval("HomePhone")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Alternamte Email:</td><td><%# Eval("AlternateEmail")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Same Home Address?:</td><td><%# Eval("IsSameHomeAddress")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home Address:</td><td><%# Eval("HomeAddress")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home City:</td><td><%# Eval("HomeCity")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home State:</td><td><%# Eval("HomeState")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home Zip:</td><td><%# Eval("HomeZip")%></td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home Country:</td><td><%# Eval("HomeCountry")%></td>
                                             </tr>
                                      </table>
                                 </td>
                             </tr>
                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                 <td colspan="2">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>&nbsp;&nbsp;<a href="Index.aspx" style="font-weight:bold">Back To Franchisees</a>
                                 </td>
                             </tr>
                         </table>
                   </ItemTemplate>
            </asp:FormView>



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
                <asp:HiddenField ID="hidFranchiseeID" runat="server" />
                <asp:HiddenField ID="hidWorkStateName" runat="server" />
                <asp:HiddenField ID="hidHomeStateName" runat="server" />
                <asp:HiddenField ID="hidWorkCountryName" runat="server" />
                <asp:HiddenField ID="hidHomeCountryName" runat="server" />
                <asp:HiddenField ID="hidSandlerRoleName" runat="server" />
                <asp:HiddenField ID="hidCostPlusAmtName" runat="server" />
                <asp:HiddenField ID="hidBehindAmtName" runat="server" />
                <asp:HiddenField ID="hidAwardLevelName" runat="server" />
                <asp:HiddenField ID="hidPurchaseLevelName" runat="server" />
                <asp:HiddenField ID="hidCertifiedLevelName" runat="server" />
                <asp:HiddenField ID="hidPrimaryBusinessName" runat="server" />
                <asp:HiddenField ID="hidMasterFranchiseeName" runat="server" />
                                
            </td>
        </tr>
        <tr>
            <td colspan="2">
                
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
                
            </td>
        </tr>
    </table>

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>

