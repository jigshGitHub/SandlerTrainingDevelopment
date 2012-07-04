<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMAddAccount.aspx.cs" Inherits="CRMAddAccount" %>
<%@Register TagPrefix="ew"  Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table>
<tr><th class="tdTC" style="width: 280px" align="left">Add Account :</th></tr>
<tr><td style="width: 280px">
    <asp:DetailsView ID="dvAccount" runat="server" Height="50px" Width="300px" 
        AutoGenerateRows="False" DataSourceID="AccountDataSource" DefaultMode="Insert" 
        CellPadding="3" BorderStyle="None" BorderWidth="1px" BackColor="White" 
        BorderColor="#999999" GridLines="Vertical" 
        oniteminserted="dvAccount_ItemInserted" onmodechanging="dvAccount_ModeChanging">
        <Fields>
                       
           <asp:TemplateField HeaderText="Company Name :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtCompName"  MaxLength="50" Width="380" runat="server" Text='<%# Bind("Company_Name") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValCompNameTB"
                    ControlToValidate="txtCompName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
          </asp:TemplateField>


          <asp:TemplateField HeaderText="Account Name :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtActName"  MaxLength="50" Width="380" runat="server" Text='<%# Bind("Account_Name") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValActNameTB"
                    ControlToValidate="txtActName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Account Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
             
          </asp:TemplateField>
                                
          <asp:TemplateField HeaderText="Product :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtProduct"  MaxLength="50"   Width="380"  runat="server" Text='<%# Bind("Product") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValProdTB"
                    ControlToValidate="txtProduct"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Prodcut to proceed.">
                    *
                  </asp:RequiredFieldValidator>
               </InsertItemTemplate>
          </asp:TemplateField>
          

          <asp:TemplateField HeaderText="Sales Rep :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtSalesRep"  MaxLength="50"   Width="380"  runat="server" Text='<%# Bind("Sales_Rep") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValSalesRepTB"
                    ControlToValidate="txtSalesRep"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Sales Rep to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
            
          </asp:TemplateField>  


          <asp:TemplateField HeaderText="Total Account Value :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtActValue" onkeypress="EnterOnlyNumeric()"  Width="380"  runat="server" Text='<%# Bind("Account_Value") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValActValueTB"
                    ControlToValidate="txtActValue"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Account Value to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
                          
          </asp:TemplateField>

          
          <asp:TemplateField HeaderText="Discussion Topic :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtCOMMENT"   Width="380"  runat="server" Text='<%# Bind("COMMENT") %>'></asp:TextBox>
                  
              </InsertItemTemplate>
                          
          </asp:TemplateField>

         
         <asp:TemplateField HeaderText="Action Step :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtActStep"   Width="380"  runat="server" Text='<%# Bind("ACTION_STEP") %>'></asp:TextBox>
                  
              </InsertItemTemplate>
                        
          </asp:TemplateField>


          <asp:TemplateField HeaderText="Last Contact Date :">
              
              <InsertItemTemplate>
                    <ew:CalendarPopup ID="LastContactDate" Nullable="True" 

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("Last_Contact_Date") %>' runat="server" 

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
                    </ew:CalendarPopup><asp:RequiredFieldValidator 

id="LastContactDateRFV"
            ControlToValidate="LastContactDate" runat="server" ErrorMessage="Please Enter Last Contact Date to proceed." >
            *
        </asp:RequiredFieldValidator>
              </InsertItemTemplate>
              
          </asp:TemplateField>
          
          

          <asp:TemplateField HeaderText="Next Contact Date :">
              
              <InsertItemTemplate>
                    <ew:CalendarPopup ID="NextContactDate" Nullable="True" 

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("Next_Contact_Date") %>' runat="server" 

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
                        Text="Back To Accounts"  ForeColor="Blue" Font-Bold="true"></asp:LinkButton>
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
    <asp:ObjectDataSource ID="AccountDataSource" runat="server" InsertMethod="InsertAccount" TypeName="AccountsDAL">
        <InsertParameters>
            <asp:ControlParameter ControlID="dvAccount" Name="Company_Name" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvAccount" Name="Account_Name" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvAccount" Name="Sales_Rep" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvAccount" Name="Account_Value" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvAccount" Name="Comment" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvAccount" Name="ACTION_STEP" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvAccount" Name="Last_Contact_Date" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvAccount" Name="Next_Contact_Date" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvAccount" Name="Product" PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:ObjectDataSource>
    </td></tr>
    </table>

</asp:Content>

