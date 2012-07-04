<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMViewOpportunity.aspx.cs" Inherits="CRMViewOpportunity" %>
<%@Register TagPrefix="ew"  Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<table>
<tr><th align="left" class="tdTC" colspan="2" style="width: 680px">View / Edit Opportunity :</th></tr>
<tr>
<td>
<asp:DetailsView AutoGenerateRows="False" DataKeyNames="Opp_ID" ID="OpportunityDW" runat="server" Width="675px" 
        onitemcommand="OpportunityDW_ItemCommand" 
        onmodechanging="OpportunityDW_ModeChanging" onitemupdating="OpportunityDW_ItemUpdating">
      <Fields>
        <asp:BoundField DataField="Opp_ID" visible="False"/>
                                       
           <asp:TemplateField HeaderText="Company :" >
            <ItemTemplate>
              <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("Company_Name") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
              <asp:DropDownList DataSourceID="CompanyDS" DataTextField="Company_Name"  DataValueField="ID" ID="ddlCompany" runat="server" SelectedValue='<%# Bind("ID") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemStyle Wrap="False" />
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Acct ID :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtAcctID" onkeypress="EnterOnlyNumeric()"  runat="server" Text='<%# Bind("Acct_ID") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvAcctIDTB"
                    ControlToValidate="txtAcctID"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Acct ID to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblAcctID" runat="server" Text='<%# Bind("Acct_ID") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Oppty Name :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtOppName"  MaxLength="50" runat="server" Text='<%# Bind("Opp_Name") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rFVOppNameTB"
                    ControlToValidate="txtOppName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Oppty Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblOppName" runat="server" Text='<%# Bind("Opp_Name") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
                            
          <asp:TemplateField HeaderText="Sales Rep :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtSalesRep"  MaxLength="50"   runat="server" Text='<%# Bind("Sales_Rep") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValSRTB"
                    ControlToValidate="txtSalesRep"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Sales Rep to proceed.">
                    *
                  </asp:RequiredFieldValidator>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="lblSalesRep" runat="server" Text='<%# Bind("Sales_Rep") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
                    
          <asp:TemplateField HeaderText="Sales Rep Phone :">
              <EditItemTemplate>
                  <ew:maskedtextbox id="txtSalesRepPhone"  MaxLength="50" Text='<%# Eval("Rep_Phone") %>' runat="server" RequiredErrorText="*"  ErrorText="*"
							ErrorMessage="Please Enter Phone Number in 111-111-1111 format." 
							ValidationExpression="\d{3}\-\d{3}\-\d{4}" Validate="false" Mask="999-999-9999"></ew:maskedtextbox>
                            
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblSalesRepPhone" runat="server" Text='<%# Bind("Rep_Phone") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>   


           <asp:TemplateField HeaderText="Company Contact :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtCompContact"  MaxLength="50"   runat="server" Text='<%# Bind("Comp_Contact") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvCompContactTB"
                    ControlToValidate="txtCompContact"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Company Contact to proceed.">
                    *
                  </asp:RequiredFieldValidator>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="lblCompContact" runat="server" Text='<%# Bind("Comp_Contact") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>


          <asp:TemplateField HeaderText="Company Phone :">
              <EditItemTemplate>
                  <ew:maskedtextbox id="txtCompPhone"  MaxLength="50" Text='<%# Eval("Comp_Phone") %>' runat="server" RequiredErrorText="*"  ErrorText="*"
							ErrorMessage="Please Enter Phone Number in 111-111-1111 format." 
							ValidationExpression="\d{3}\-\d{3}\-\d{4}" Validate="false" Mask="999-999-9999"></ew:maskedtextbox>
                            
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblCompPhone" runat="server" Text='<%# Bind("Comp_Phone") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField> 


           <asp:TemplateField HeaderText="Comp E-mail :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtEmail"  MaxLength="50"   runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

             
          <asp:TemplateField HeaderText="Acct Opp Status :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtActOppStatus"  MaxLength="50"    runat="server" Text='<%# Bind("Acct_Opp_Status") %>'></asp:TextBox>
                  
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="lblActOppStatus" runat="server" Text='<%# Bind("Acct_Opp_Status") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Total Account Value :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtTotalActValue" onkeypress="EnterOnlyNumeric()"   runat="server" Text='<%# Bind("Total_Value") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValTAVTB"
                    ControlToValidate="txtTotalActValue"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Total Account Value to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblActValue" runat="server" Text='<%# Bind("Total_Value","{0:c}") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Weighted Value :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtWeightedValue" onkeypress="EnterOnlyNumeric()"    runat="server" Text='<%# Bind("Weighted_Value") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvWeightedValueTB"
                    ControlToValidate="txtWeightedValue"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Weighted Value to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblWeightedValue" runat="server" Text='<%# Bind("Weighted_Value","{0:c}") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
                          
             
           <asp:TemplateField HeaderText="Win Probability % :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtWinProbabilityValue" onkeypress="EnterOnlyNumeric()"  MaxLength="3" runat="server" Text='<%# Bind("Win_Probability") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValWinTB"
                    ControlToValidate="txtWinProbabilityValue"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Win Probability % to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblWinProbValue" runat="server" Text='<%# Bind("Win_Probability") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>   
          
          <asp:TemplateField HeaderText="Close Date :">
              
              <EditItemTemplate>
                    <ew:CalendarPopup ID="CloseDate" Nullable="True"  

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("Close_Date") %>' runat="server" 

AllowArbitraryText="False" CellPadding="2px" CellSpacing="0px" Culture="English (United States)" 

JavascriptOnChangeFunction="" LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="Images/calendar.gif" ControlDisplay="TextBoxImage">
                        <TodayDayStyle BackColor="LightGoldenrodYellow" 

Font-Names="Verdana,Helvetica,Tahoma,Arial"
                            Font-Size="XX-Small" ForeColor="Black" />
                        <WeekendStyle BackColor="LightGray" 

Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                            ForeColor="Black" />
                        <OffMonthStyle BackColor="AntiqueWhite" 

Font-Names="Verdana,Helvetica,Tahoma,Arial"
                            Font-Size="XX-Small" ForeColor="Gray" />
                        <WeekdayStyle BackColor="White" 

Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                            ForeColor="Black" />
                        <SelectedDateStyle BackColor="Yellow" 

Font-Names="Verdana,Helvetica,Tahoma,Arial"
                            Font-Size="XX-Small" ForeColor="Black" />
                        <MonthHeaderStyle BackColor="Yellow" 

Font-Names="Verdana,Helvetica,Tahoma,Arial"
                            Font-Size="XX-Small" ForeColor="Black" />
                        <HolidayStyle BackColor="White" 

Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                            ForeColor="Black" />
                        <GoToTodayStyle BackColor="White" 

Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                            ForeColor="Black" />
                        <DayHeaderStyle BackColor="Orange" 

Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                            ForeColor="Black" />
                        <ClearDateStyle BackColor="White" 

Font-Names="Verdana,Helvetica,Tahoma,Arial" Font-Size="XX-Small"
                            ForeColor="Black" />
                    </ew:CalendarPopup>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblCloseDate" runat="server" Text='<%# Bind("Close_Date","{0:d}") %>' ></asp:Label>
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
    </td></tr>
    <tr><td style="height:70"><br /></td></tr>
<tr><td colspan="2"><asp:Button ID="Cancel" CssClass="menuButton" runat="server" 
        Text="Go Back to Opportunities" onclick="Cancel_Click" /></td></tr>
<tr><td colspan="2"><asp:Label  CssClass="resultLabel" ID="LblStatus"  ForeColor="Red" runat="server"></asp:Label></td></tr>
<tr><td colspan="2"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" /></td></tr>
<tr><td colspan="2"><asp:HiddenField ID="hidOpprtunityID" runat="server" /> </td></tr>   
<tr><td colspan="2"> <asp:ObjectDataSource ID="CompanyDS" Runat="server" TypeName="ContactsDAL" SelectMethod="GetAllCompanies"></asp:ObjectDataSource></td></tr>  
</table>
</asp:Content>

