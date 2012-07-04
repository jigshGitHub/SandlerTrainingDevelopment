<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMViewContact.aspx.cs" Inherits="CRMViewContact" %>
<%@Register TagPrefix="ew"  Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table>
<tr><th align="left" class="tdTC" colspan="2" style="width: 680px">View / Edit Contact :</th></tr>
<tr>
<td>
<asp:DetailsView AutoGenerateRows="False" DataKeyNames="Contact_ID"
       ID="ContactDW" runat="server" Width="675px" 
        onitemcommand="ContactDW_ItemCommand" 
        onmodechanging="ContactDW_ModeChanging" onitemupdating="ContactDW_ItemUpdating">
      <Fields>
        <asp:BoundField DataField="Contact_ID" visible="False"/>
                                       
          <asp:TemplateField HeaderText="Name :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtFullName"  MaxLength="50"  runat="server" Text='<%# Bind("Full_Name") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValNameTB"
                    ControlToValidate="txtFullName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblFullName" runat="server" Text='<%# Bind("Full_Name") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
                  
             
          <asp:TemplateField HeaderText="Phone :">
              <EditItemTemplate>
                  <ew:maskedtextbox id="txtPhone"  MaxLength="50" Text='<%# Eval("Phone") %>' runat="server" RequiredErrorText="*"  ErrorText="*"
							ErrorMessage="Please Enter Phone Number in 111-111-1111 format." 
							ValidationExpression="\d{3}\-\d{3}\-\d{4}" Validate="false" Mask="999-999-9999"></ew:maskedtextbox>
                            
              </EditItemTemplate>
             
              <ItemTemplate>
                  <asp:Label ID="lblPhone" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>   


          <asp:TemplateField HeaderText="E-mail :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtEmail"  MaxLength="50"   runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                  
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>


           <asp:TemplateField HeaderText="Company :" >
            <ItemTemplate>
              <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("Company_Name") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
              <asp:DropDownList DataSourceID="CompanyDS" DataTextField="Company_Name"  DataValueField="ID" ID="ddlCompany" runat="server" SelectedValue='<%# Bind("ID") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemStyle Wrap="False" />
          </asp:TemplateField>

             
          <asp:TemplateField HeaderText="Total Account Value :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtTotalActValue"  onkeypress="EnterOnlyNumeric()"   runat="server" Text='<%# Bind("Total_ACT_Value") %>'></asp:TextBox>
                  
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblTotalActValue" runat="server" Text='<%# Bind("Total_ACT_Value","{0:c}") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>



          <asp:TemplateField HeaderText="Discussion Topic :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtCOMMENT"    runat="server" Text='<%# Bind("COMMENT") %>'></asp:TextBox>
                  
              </EditItemTemplate>
              
              <ItemTemplate>
                  <asp:Label ID="lblCOMMENT" runat="server" Text='<%# Bind("COMMENT") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

         
         <asp:TemplateField HeaderText="Action Step :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtActStep"    runat="server" Text='<%# Bind("ACTION_STEP") %>'></asp:TextBox>
                  
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
        Text="Go Back to All Contacts" onclick="Cancel_Click" /></td></tr>
<tr><td colspan="2"><asp:Label  CssClass="resultLabel" ID="LblStatus"  ForeColor="Red" runat="server"></asp:Label></td></tr>
<tr><td colspan="2"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" /></td></tr>
<tr><td colspan="2"> <asp:ObjectDataSource ID="CompanyDS" Runat="server" TypeName="ContactsDAL" SelectMethod="GetAllCompanies"></asp:ObjectDataSource></td></tr>
<tr><td colspan="2"><asp:HiddenField ID="hidContactID" runat="server" /> </td></tr>     
    
</table> 
</asp:Content>

