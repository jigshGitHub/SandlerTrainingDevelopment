<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMViewAccount.aspx.cs" Inherits="CRMViewAccount" %>
<%@Register TagPrefix="ew"  Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table>
<tr><th align="left" class="tdTC" colspan="2" style="width: 680px">View / Edit Account :</th></tr>
<tr>
<td>
<asp:DetailsView AutoGenerateRows="False" DataKeyNames="ID" ID="AccountDW" runat="server" Width="675px" 
        onitemcommand="AccountDW_ItemCommand" 
        onmodechanging="AccountDW_ModeChanging" onitemupdating="AccountDW_ItemUpdating">
      <Fields>
        <asp:BoundField DataField="ID" visible="False"/>
                                       
          <asp:TemplateField HeaderText="Company :" >
            <EditItemTemplate>
                  <asp:TextBox ID="txtComName"  MaxLength="50"  runat="server" Text='<%# Bind("Company_Name") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValCompNameTB"
                    ControlToValidate="txtComName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
            
            <ItemTemplate>
              <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("Company_Name") %>'></asp:Label>
            </ItemTemplate>
            <ItemStyle Wrap="False" />
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Account Name :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtAccountName"  MaxLength="50"  runat="server" Text='<%# Bind("Account_Name") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValNameTB"
                    ControlToValidate="txtAccountName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Account Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblActName" runat="server" Text='<%# Bind("Account_Name") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
                  
          <asp:TemplateField HeaderText="Product :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtProduct"  MaxLength="50"     runat="server" Text='<%# Bind("Product") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValProdTB"
                    ControlToValidate="txtProduct"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Product to proceed.">
                    *
                  </asp:RequiredFieldValidator>
               </EditItemTemplate>
               <ItemTemplate>
                  <asp:Label ID="lblProduct" runat="server" Text='<%# Bind("Product") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

           
           <asp:TemplateField HeaderText="Sales Rep :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtSalesRep"  MaxLength="50"     runat="server" Text='<%# Bind("Sales_Rep") %>'></asp:TextBox>
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
                    
             
          <asp:TemplateField HeaderText="Total Account Value :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtTotalActValue" onkeypress="EnterOnlyNumeric()"    runat="server" Text='<%# Bind("Account_Value") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValTAVTB"
                    ControlToValidate="txtTotalActValue"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Account Value to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblTotalActValue" runat="server" Text='<%# Bind("Account_Value","{0:c}") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Discussion Topic :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtCOMMENT"     runat="server" Text='<%# Bind("COMMENT") %>'></asp:TextBox>
                  
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblCOMMENT" runat="server" Text='<%# Bind("COMMENT") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

         
         <asp:TemplateField HeaderText="Action Step :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtActStep"     runat="server" Text='<%# Bind("ACTION_STEP") %>'></asp:TextBox>
                  
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblActStep" runat="server" Text='<%# Bind("ACTION_STEP") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>



          <asp:TemplateField HeaderText="Last Contact Date :">
              
              <EditItemTemplate>
                    <ew:CalendarPopup ID="LastContactDate" Nullable="True" 

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("Last_Contact_Date") %>' runat="server" 

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
                    </ew:CalendarPopup><asp:RequiredFieldValidator 

id="LastContactDateRFV"
            ControlToValidate="LastContactDate" runat="server" ErrorMessage="Please Enter Last Contact Date to proceed." >
            *
        </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblLastContactDate" runat="server" Text='<%# Bind("Last_Contact_Date","{0:d}") %>' ></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          
          

          <asp:TemplateField HeaderText="Next Contact Date :">
              
              <EditItemTemplate>
                    <ew:CalendarPopup ID="NextContactDate" Nullable="True"  

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("Next_Contact_Date") %>' runat="server" 

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
                  <asp:Label ID="lblNextContactDate" runat="server" Text='<%# Bind("Next_Contact_Date","{0:d}") %>' ></asp:Label>
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
        Text="Go Back to All Accounts" onclick="Cancel_Click" /></td></tr>
<tr><td colspan="2"><asp:Label  CssClass="resultLabel" ID="LblStatus"  ForeColor="Red" runat="server"></asp:Label></td></tr>
<tr><td colspan="2"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" /></td></tr>
<tr><td colspan="2"><asp:HiddenField ID="hidAccountID" runat="server" /> </td></tr>     
    
</table>
</asp:Content>

