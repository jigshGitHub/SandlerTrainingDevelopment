<%@ Page Title="CRM" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMAddContact.aspx.cs" Inherits="CRMAddContact" %>
<%@Register TagPrefix="ew"  Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<table>
<tr><th class="tdTC" style="width: 280px" align="left">Add Contact :</th></tr>
<tr><td style="width: 280px">
    <asp:DetailsView ID="dvContact" runat="server" Height="50px" Width="300px" 
        AutoGenerateRows="False" DataSourceID="ContactDataSource" DefaultMode="Insert" 
        CellPadding="3" BorderStyle="None" BorderWidth="1px" BackColor="White" 
        BorderColor="#999999" GridLines="Vertical" 
        oniteminserted="dvContact_ItemInserted" onmodechanging="dvContact_ModeChanging">
        <Fields>
            <asp:TemplateField HeaderText="Select Company:">
                <InsertItemTemplate>
                    <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="CompanyDS"  DataTextField="Company_Name"  DataValueField="ID" SelectedValue='<%# Bind("ID") %>'></asp:DropDownList>
                </InsertItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Name :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtFullName"  MaxLength="50" Width="380" runat="server" Text='<%# Bind("Full_Name") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValNameTB"
                    ControlToValidate="txtFullName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </InsertItemTemplate>
              
          </asp:TemplateField>
                                
          <asp:TemplateField HeaderText="E-mail :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtEmail"  MaxLength="50"   Width="380"  runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                  
               </InsertItemTemplate>
          </asp:TemplateField>
          

          <asp:TemplateField HeaderText="Phone :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtPhone" onkeypress="EnterOnlyNumeric()"  MaxLength="50"   Width="380"  runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
              </InsertItemTemplate>
            
          </asp:TemplateField>  


          <asp:TemplateField HeaderText="Total Account Value :">
              <InsertItemTemplate>
                  <asp:TextBox ID="txtTotalActValue" onkeypress="EnterOnlyNumeric()"  Width="380"  runat="server" Text='<%# Bind("Total_ACT_Value") %>'></asp:TextBox>
                  
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
              </InsertItemTemplate>
              
          </asp:TemplateField>
          
          

          <asp:TemplateField HeaderText="Next Contact Date :">
              
              <InsertItemTemplate>
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
              </InsertItemTemplate>
              
          </asp:TemplateField>

            
            <asp:TemplateField ShowHeader="False">
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Add" Font-Bold="true" ForeColor="Blue"></asp:LinkButton>&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Back To Contacts" Font-Bold="true" ForeColor="Blue"></asp:LinkButton>
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
    <asp:ObjectDataSource ID="ContactDataSource" runat="server" InsertMethod="InsertContact" TypeName="ContactsDAL">
        <InsertParameters>
            <asp:ControlParameter ControlID="dvContact" Name="ID" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvContact" Name="Full_Name" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvContact" Name="Email" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvContact" Name="Phone" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvContact" Name="Total_ACT_Value" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvContact" Name="Comment" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvContact" Name="ACTION_STEP" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvContact" Name="Last_Contact_Date" PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="dvContact" Name="Next_Contact_Date" PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:ObjectDataSource>
    </td></tr>
    </table>
    

</asp:Content>

