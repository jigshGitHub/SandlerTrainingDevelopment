<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMAddOpportunity.aspx.cs" Inherits="CRMAddOpportunity" %>
<%@Register TagPrefix="ew"  Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<table>
<tr><th class="tdTC" style="width: 280px" align="left">Add Opportunity :</th></tr>
<tr><td style="width: 280px">
    <asp:DetailsView ID="dvOpportunity" runat="server" Height="50px" Width="300px" 
        AutoGenerateRows="False" DataSourceID="OpportunityDataSource" DefaultMode="Insert" 
        CellPadding="3" BorderStyle="None" BorderWidth="1px" BackColor="White" 
        BorderColor="#999999" GridLines="Vertical" 
        oniteminserted="dvOpportunity_ItemInserted" onmodechanging="dvOpportunity_ModeChanging">
      <Fields>
        
                                       
           <asp:TemplateField HeaderText="Company :" >
            
            <InsertItemTemplate>
              <asp:DropDownList DataSourceID="CompanyDS" DataTextField="Company_Name"  DataValueField="ID" ID="ddlCompany" runat="server" SelectedValue='<%# Bind("ID") %>'></asp:DropDownList>
            </InsertItemTemplate>
            <ItemStyle Wrap="False" />
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Acct ID :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtAcctID" onkeypress="EnterOnlyNumeric()"  runat="server" Text='<%# Bind("Acct_ID") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvAcctIDTB"
                    ControlToValidate="txtAcctID"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Acct ID to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
             
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Oppty Name :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtOppName"  MaxLength="50" runat="server"  Width="380" Text='<%# Bind("Opp_Name") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rFVOppNameTB"
                    ControlToValidate="txtOppName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Oppty Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
             
          </asp:TemplateField>
                            
          <asp:TemplateField HeaderText="Sales Rep :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtSalesRep"  MaxLength="50"   runat="server"  Width="380" Text='<%# Bind("Sales_Rep") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValSRTB"
                    ControlToValidate="txtSalesRep"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Sales Rep to proceed.">
                    *
                  </asp:RequiredFieldValidator>
               </InsertItemTemplate>
             
          </asp:TemplateField>
                    
          <asp:TemplateField HeaderText="Sales Rep Phone :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtSalesRepPhone" onkeypress="EnterOnlyNumeric()" MaxLength="50"   Width="380"  runat="server" Text='<%# Bind("Rep_Phone") %>'></asp:TextBox>           
              </InsertItemTemplate>
             
          </asp:TemplateField>   


           <asp:TemplateField HeaderText="Company Contact :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtCompContact"  MaxLength="50"   runat="server"   Width="380" Text='<%# Bind("Comp_Contact") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvCompContactTB"
                    ControlToValidate="txtCompContact"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Company Contact to proceed.">
                    *
                  </asp:RequiredFieldValidator>
               </InsertItemTemplate>
               
          </asp:TemplateField>


          <asp:TemplateField HeaderText="Company Phone :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtCompPhone" onkeypress="EnterOnlyNumeric()" MaxLength="50"   Width="380"  runat="server" Text='<%# Bind("Comp_Phone") %>'></asp:TextBox>
                            
              </InsertItemTemplate>
             
          </asp:TemplateField> 


           <asp:TemplateField HeaderText="Comp E-mail :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtEmail"  MaxLength="50"   runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
              </InsertItemTemplate>
            
          </asp:TemplateField>

             
          <asp:TemplateField HeaderText="Acct Opp Status :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtActOppStatus"  MaxLength="50"  Width="380"   runat="server" Text='<%# Bind("Acct_Opp_Status") %>'></asp:TextBox>
                  
               </InsertItemTemplate>
              
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Total Account Value :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtTotalActValue" onkeypress="EnterOnlyNumeric()"   runat="server" Text='<%# Bind("Total_Value") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValTAVTB"
                    ControlToValidate="txtTotalActValue"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Total Account Value to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
              
             
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Weighted Value :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtWeightedValue" onkeypress="EnterOnlyNumeric()"    runat="server" Text='<%# Bind("Weighted_Value") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvWeightedValueTB"
                    ControlToValidate="txtWeightedValue"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Weighted Value to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
              
          </asp:TemplateField>
                          
             
           <asp:TemplateField HeaderText="Win Probability % :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtWinProbabilityValue" onkeypress="EnterOnlyNumeric()"  MaxLength="3" runat="server" Text='<%# Bind("Win_Probability") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValWinTB"
                    ControlToValidate="txtWinProbabilityValue"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Win Probability % to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
           
          </asp:TemplateField>   
          
          <asp:TemplateField HeaderText="Close Date :">
              
              <InsertItemTemplate>
                    <ew:CalendarPopup ID="CloseDate" Nullable="True"  

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("Close_Date") %>' runat="server" 

AllowArbitraryText="False" CellPadding="2px" CellSpacing="0px" Culture="English (United States)" 

JavascriptOnChangeFunction="" LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="../images/calendar.gif" ControlDisplay="TextBoxImage">
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
              </InsertItemTemplate>
             
          </asp:TemplateField>                

            
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Add"  ForeColor="Blue" Font-Bold="true"></asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Back To Salespipeline"  ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
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
    </td></tr>
    <tr><td style="width: 280px">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
    </td></tr>
    <tr><td style="width: 280px">
    <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label><br />
    <asp:ObjectDataSource ID="CompanyDS" Runat="server" TypeName="ContactsDAL" SelectMethod="GetAllCompanies"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OpportunityDataSource" runat="server" InsertMethod="InsertOpportunity" TypeName="OpportunityDAL">
        <InsertParameters>
            <asp:ControlParameter ControlID="dvOpportunity" Name="ID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Acct_ID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Opp_Name" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Sales_Rep" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Rep_Phone" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Comp_Contact" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Comp_Phone" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Email" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Acct_Opp_Status" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Total_Value" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Weighted_Value" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Win_Probability" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvOpportunity" Name="Close_Date" PropertyName="SelectedValue" />

            


            
        </InsertParameters>
    </asp:ObjectDataSource>
    </td></tr>
    </table>
    


</asp:Content>

