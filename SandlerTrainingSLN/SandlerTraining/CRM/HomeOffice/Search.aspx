<%@ Page Title="Search - Franchisee" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="CRM_HomeOffice_Search" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
<asp:UpdatePanel ID="updPnl" runat="server">
    <ContentTemplate>
   <table id="tblSearchCriteria" width="100%">
    <tr>
       <th class="tdTC" align="left">
                Search Franchisee : Please enter/select at least one criteria to search.
       </th>
     </tr>
     <tr><td><asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label></td></tr>
     <tr>
            <td>

              <asp:FormView ID="FranchiseeFW" runat="server" CellPadding="3" BorderStyle="None" DefaultMode="Insert" width="100%"
                    BorderWidth="1px" BackColor="White" BorderColor="#999999" GridLines="Vertical"
                     OnModeChanging="FranchiseeFW_ModeChanging" OnItemInserting="FranchiseeFW_ItemInserting">
                    <InsertItemTemplate>
                                    
                        <table width="100%">
                             <tr>
                                 <td style="width:5%"></td>
                                 <td>
                                     <table id="tblFranchiseeInfoET">
                                         <tr>
                                            <td colspan="2" style="font-size:large"><b>Franchisee Information:</b></td>
                                         </tr>
                                            
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Franchisee Name:</td>
                                            <td>
                                                <asp:TextBox ID="FranchiseeNameTB" MaxLength="250"  Width="250"  runat="server"></asp:TextBox>
                                                
                                            </td>

                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Last Name:</td>
                                            <td>
                                                <asp:TextBox ID="LastNameTB" MaxLength="50"  Width="150" runat="server"></asp:TextBox>
                                                
                                            </td>

                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Firs tName:</td>
                                            <td>
                                                <asp:TextBox ID="FirstNameTB" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Title:</td>
                                            <td><asp:TextBox ID="TitleTB" MaxLength="50" Width="150" runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Sandler Role:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstSandlerRole" runat="server" DataSourceID="SandlerRoleInfoDS" DataTextField="SandlerRoleText" DataValueField="SandlerRoleId"></asp:ListBox>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Part of a Master Franchise?:</td>
                                             <td>
                                                 <asp:ListBox SelectionMode="Multiple" ID="lstPartOfMF" runat="server" DataSourceID="YesNoOptionsInfoDS" Width="240" Height="40"
                                                 DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Master Franchisee:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstMasterFranchisee" runat="server" DataSourceID="MasterFranchiseeInfoDS" DataTextField="MasterFranchiseeName" DataValueField="MasterFranchiseeId"></asp:ListBox>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Can Print Locally?:</td>
                                             <td>
                                                 <asp:ListBox SelectionMode="Multiple" ID="lstCanPrintLocally" Width="240" Height="40" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Buy from Customer:</td>
                                             <td>
                                                 <asp:ListBox SelectionMode="Multiple" ID="lstBuyFromCustomer" Width="240" Height="40" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Fixed Price Purchase:</td>
                                             <td>
                                                 <asp:ListBox SelectionMode="Multiple" ID="lstFixedPricePurchase" Width="240" Height="40" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Cost Plus Amount:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstCostPlusAmt" runat="server" DataSourceID="CostPlusAmountInfoDS" DataTextField="CostPlusAmountText" DataValueField="CostPlusAmountId"></asp:ListBox>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Behind in Territory Development:</td>
                                             <td>
                                                 <asp:ListBox SelectionMode="Multiple" ID="lstBehindTerDev" Width="240" Height="40" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                              </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Select Behind Amount:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstBehindAmt" runat="server" DataSourceID="BehindAmountInfoDS" DataTextField="BehindAmountText" DataValueField="BehindAmountId"></asp:ListBox>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Coach-Region:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstCoach" runat="server" DataSourceID="CoachOptionsInfoDS" DataTextField="Name" DataValueField="Id"></asp:ListBox>
                                                
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Office Phone:</td>
                                            <td><asp:TextBox ID="txtOfficePhone" MaxLength="50" Width="150" runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Mobile Phone:</td>
                                            <td><asp:TextBox ID="txtMobilePhone" MaxLength="50" Width="150" runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Fax:</td>
                                            <td><asp:TextBox ID="txtFax" MaxLength="50" Width="150" runat="server"></asp:TextBox></td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Award Level:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstAwardLevel" runat="server" DataSourceID="AwardLevelInfoDS" DataTextField="AwardLevelText" DataValueField="AwardLevelId" ></asp:ListBox>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Purchase Level:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstPurchaseLevel" runat="server" DataSourceID="PurchaseLevelInfoDS" DataTextField="PurchaseLevelText" DataValueField="PurchaseLevelId" ></asp:ListBox>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                            <td>Certified Level:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstCertifiedLevel" runat="server" DataSourceID="CertifiedLevelInfoDS" DataTextField="CertifiedLevelText" DataValueField="CertifiedLevelId"></asp:ListBox>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Primary Business:</td>
                                            <td>
                                                <asp:ListBox SelectionMode="Multiple" ID="lstPrimaryBusiness" runat="server" DataSourceID="PrimaryBusinessInfoDS" DataTextField="PrimaryBusinessText" DataValueField="PrimaryBusinessId"></asp:ListBox>
                                            </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                           <td>Initial Contract Date:</td>
                                           <td>
                                                    <asp:TextBox ID="InitialContractDate" runat="server" />&nbsp;<asp:Image ID="calanderImageICD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="InitialContractDate" PopupButtonID="calanderImageICD" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                           <td>Renewal Date:</td>
                                           <td>
                                                    <asp:TextBox ID="RenewalDate"  runat="server" />&nbsp;<asp:Image ID="calanderImageRND" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="RenewalDate" PopupButtonID="calanderImageRND" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                           <td>Contract Form Date:</td>
                                           <td>
                                                    <asp:TextBox ID="ContractFormDate"  runat="server" />&nbsp;<asp:Image ID="calanderImageCFD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="ContractFormDate" PopupButtonID="calanderImageCFD" CssClass="calendar"></asp:CalendarExtender>
                                           </td>
                                         </tr>
                                         <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                            <td>Are Contractors Permitted?:</td>
                                             <td>
                                                 <asp:ListBox  SelectionMode="Multiple" ID="lstContrPerm" runat="server" Width="240" Height="40" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
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
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                 <td colspan="2" align="right" >
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Search" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Clear" ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
                                                 </td>
                                             </tr>  
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>KOL Member:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstKOLMember" runat="server" Width="240" Height="60" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Advisory Borad:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstAdvBoard" runat="server" Width="240" Height="60" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Marketing Committee:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstMktgComt" runat="server" Width="240" Height="60" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Using Sandler CRM?:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstSandlerCRM" runat="server" Width="240" Height="60" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>DHS Award Winner:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstDHSAward" runat="server" Width="240" Height="40" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>DHS Award Date:</td>
                                                <td>
                                                    <asp:TextBox ID="DHSAwardDate" runat="server" />&nbsp;<asp:Image ID="calanderImageDAD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="DHSAwardDate" PopupButtonID="calanderImageDAD" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Initial Training Date:</td>
                                                <td>
                                                    <asp:TextBox ID="IntTrngDate" runat="server" />&nbsp;<asp:Image ID="calanderImageITD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="IntTrngDate" PopupButtonID="calanderImageITD" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Is Sandler Mail Required?:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstSandlerMail" runat="server" Width="240" Height="40" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Required to submit Financials?:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstReqFinancials" runat="server" Width="240" Height="40" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Rep Agreement for Global Account?:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstRepAgreement" runat="server" Width="240" Height="40" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Work Email:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkEmail" MaxLength="80" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work Address:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkAddress" MaxLength="200" Width="250" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Work City:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkCity" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work State:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstWorkState" runat="server" DataSourceID="StateInfoDS" DataTextField="Name" DataValueField="Id"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Work Zip:</td>
                                                <td>
                                                    <asp:TextBox ID="txtWorkZip" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Work Country:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstWorkCountry" runat="server" DataSourceID="CountryInfoDS" DataTextField="Name" DataValueField="Id"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Spouse's Name:</td>
                                                <td>
                                                    <asp:TextBox ID="txtSpouseName" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Birthday:</td>
                                                <td>
                                                    <asp:TextBox ID="BirthDay" runat="server" />&nbsp;<asp:Image ID="calanderImageBTD" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender6" runat="server" TargetControlID="BirthDay" PopupButtonID="calanderImageBTD" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Anniversary:</td>
                                                <td>
                                                    <asp:TextBox ID="Anniversary" runat="server" />&nbsp;<asp:Image ID="calanderImageAVS" runat="server" ImageUrl="~/images/calendar.gif" ImageAlign="Middle" />
                                                    <asp:CalendarExtender ID="CalendarExtender7" runat="server" TargetControlID="Anniversary" PopupButtonID="calanderImageAVS" CssClass="calendar"></asp:CalendarExtender>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Years with Company:</td>
                                                <td>
                                                    <asp:TextBox ID="txtYrsCompany" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home Phone:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHomePhone" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Alternate Email:</td>
                                                <td>
                                                    <asp:TextBox ID="txtAlternateEmail" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                            <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Same Home Address?:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstSameHomeAdrs" Width="240" Height="40" runat="server" DataSourceID="YesNoOptionsInfoDS" DataTextField="Description" DataValueField="Value"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home Address:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHomeAddress" MaxLength="200" Width="250" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home City:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHomeCity" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home State:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstHomeState" runat="server" DataSourceID="StateInfoDS" DataTextField="Name" DataValueField="Id"></asp:ListBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #EEEEEE; white-space: nowrap;">
                                                <td>Home Zip:</td>
                                                <td>
                                                    <asp:TextBox ID="txtHomeZip" MaxLength="50" Width="150" runat="server"></asp:TextBox>
                                                </td>
                                             </tr>
                                             <tr style="color: Black; background-color: #DCDCDC; white-space: nowrap;">
                                                <td>Home Country:</td>
                                                <td>
                                                    <asp:ListBox SelectionMode="Multiple" ID="lstHomeCountry" runat="server" DataSourceID="CountryInfoDS" DataTextField="Name" DataValueField="Id"></asp:ListBox>
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
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label><br />
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

