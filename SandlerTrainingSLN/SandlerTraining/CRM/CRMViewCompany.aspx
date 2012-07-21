<%@ Page Title="CRM - View/Edit Company" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="CRMViewCompany.aspx.cs" Inherits="UpdatedCRM_CRMViewCompany" %>
<%@Register TagPrefix="ew"  Namespace="eWorld.UI" Assembly="eWorld.UI, Version=1.9.0.0, Culture=neutral, PublicKeyToken=24d65337282035f2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table>
<tr><th align="left" class="tdTC" colspan="2" style="width: 680px">View / Edit Company :</th></tr>
<tr>
<td>
<asp:DetailsView AutoGenerateRows="False" DataKeyNames="COMPANIESID" ID="CompanyDW" runat="server" Width="675px" onitemcommand="CompanyDW_ItemCommand" 
        onmodechanging="CompanyDW_ModeChanging" onitemupdating="CompanyDW_ItemUpdating">
      <Fields>
        <asp:BoundField DataField="COMPANIESID" visible="False"/>
                                       
          <asp:TemplateField HeaderText="Company Name :" >
            <EditItemTemplate>
                  <asp:TextBox ID="txtCompName"  MaxLength="50"  runat="server" Text='<%# Bind("COMPANYNAME") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValCompNameTB"
                    ControlToValidate="txtCompName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Company Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("COMPANYNAME") %>'></asp:Label>
              </ItemTemplate>
            <ItemStyle Wrap="False" />
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Address :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtAddress"  MaxLength="150"  runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValAddressTB"
                    ControlToValidate="txtAddress"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Address to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblAddressName" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="City :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtCity"  MaxLength="50"  runat="server" Text='<%# Bind("City") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValCityTB"
                    ControlToValidate="txtCity"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter City to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblCity" runat="server" Text='<%# Bind("City") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="State :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtState"  MaxLength="50"  runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValStateTB"
                    ControlToValidate="txtState"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter State to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblState" runat="server" Text='<%# Bind("State") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
                            
          <asp:TemplateField HeaderText="Zip :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtZip"  onkeypress="EnterOnlyNumeric()" MaxLength="50"  runat="server" Text='<%# Bind("Zip") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValtxtZipTB"
                    ControlToValidate="txtZip"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Zip to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblZip" runat="server" Text='<%# Bind("Zip") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="POC Last Name :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtPOCLastName"  MaxLength="50"  runat="server" Text='<%# Bind("POCLastName") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValtxtPOCLastNameTB"
                    ControlToValidate="txtPOCLastName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter POC Last Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblPOCLastName" runat="server" Text='<%# Bind("POCLastName") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="POC First Name :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtPOCFirstName"  MaxLength="50"  runat="server" Text='<%# Bind("POCFirstName") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValtxtPOCFirstNameTB"
                    ControlToValidate="txtPOCFirstName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter POC First Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblPOCFirstName" runat="server" Text='<%# Bind("POCFirstName") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="POC Phone :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtPOCPhone"  MaxLength="50"  runat="server" Text='<%# Bind("POCPhone") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="reqFieldValtxtPOCPhoneTB"
                    ControlToValidate="txtPOCPhone"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter POC Phone to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblPOCPhone" runat="server" Text='<%# Bind("POCPhone") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="New Company? :" >
            <ItemTemplate>
              <asp:Label ID="lblNewCompany" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlNewItem" runat="server" DataSourceID="NewItemInfoDS" DataTextField="Description" DataValueField="Value" SelectedValue='<%# Bind("Value") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemStyle Wrap="False" />
          </asp:TemplateField>

           <asp:TemplateField HeaderText="Company Value Goal :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtCOMPANYVALUEGOAL"  onkeypress="EnterOnlyNumeric()" MaxLength="50"  runat="server" Text='<%# Bind("COMPANYVALUEGOAL") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvtxtCOMPANYVALUEGOALTB"
                    ControlToValidate="txtCOMPANYVALUEGOAL"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Company Value Goal to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblCOMPANYVALUEGOAL" runat="server" Text='<%# Bind("COMPANYVALUEGOAL") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>


           <asp:TemplateField HeaderText="Product :" >
            <ItemTemplate>
              <asp:Label ID="lblProduct" runat="server" Text='<%# Eval("Product") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlProduct" runat="server" DataSourceID="ProductDS" DataTextField="ProductTypeName" DataValueField="ID" SelectedValue='<%# Bind("ID") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemStyle Wrap="False" />
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Industry :" >
            <ItemTemplate>
              <asp:Label ID="lblIndustry" runat="server" Text='<%# Eval("Industry") %>'></asp:Label>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:DropDownList ID="ddlIndustry" runat="server" DataSourceID="IndustryDS" DataTextField="IndustryTypeName"  DataValueField="IndID" SelectedValue='<%# Bind("IndID") %>'></asp:DropDownList>
            </EditItemTemplate>
            <ItemStyle Wrap="False" />
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Rep Last Name :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtRepLastName"  MaxLength="50"  runat="server" Text='<%# Bind("RepLastName") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvRepLastNMTB"
                    ControlToValidate="txtRepLastName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Rep Last Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblRepLastName" runat="server" Text='<%# Bind("RepLastName") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>


          <asp:TemplateField HeaderText="Rep First Name :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtRepFirstName"  MaxLength="50"  runat="server" Text='<%# Bind("RepFirstName") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvRepFirstNMTB"
                    ControlToValidate="txtRepFirstName"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Rep First Name to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblRepFirstName" runat="server" Text='<%# Bind("RepFirstName") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>


          <asp:TemplateField HeaderText="Discussion Topic :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtDiscussionTopic"  MaxLength="50"  runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvDiscTopicTB"
                    ControlToValidate="txtDiscussionTopic"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Discussion Topic to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblDiscussionTopic" runat="server" Text='<%# Bind("DiscussionTopic") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Action Step :">
              <EditItemTemplate>
                  <asp:TextBox ID="txtACTIONSTEP"  MaxLength="50"  runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:TextBox>
                  <asp:RequiredFieldValidator id="rfvACTIONSTEPTB"
                    ControlToValidate="txtACTIONSTEP"
                    Display="Static"
                    InitialValue="" runat="server" ErrorMessage="Please Enter Action Step to proceed.">
                    *
                  </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblACTIONSTEP" runat="server" Text='<%# Bind("ACTIONSTEP") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>


          <asp:TemplateField HeaderText="Last Contact Date :">
              
              <EditItemTemplate>
                    <ew:CalendarPopup ID="LastContactDate" Nullable="True" 

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("LastContact_Date") %>' runat="server" 

AllowArbitraryText="False" CellPadding="2px" CellSpacing="0px" Culture="English (United States)" 

JavascriptOnChangeFunction="" LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="../Images/calendar.gif" ControlDisplay="TextBoxImage">
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
                  <asp:Label ID="lblLastContactDate" runat="server" Text='<%# Bind("LastContact_Date","{0:d}") %>' ></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
          
          <asp:TemplateField HeaderText="Next Contact Date :">
              
              <EditItemTemplate>
                    <ew:CalendarPopup ID="NextContactDate" Nullable="True"  

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("NextContact_Date") %>' runat="server" 

AllowArbitraryText="False" CellPadding="2px" CellSpacing="0px" Culture="English (United States)" 

JavascriptOnChangeFunction="" LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="../Images/calendar.gif" ControlDisplay="TextBoxImage">
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
                    <asp:RequiredFieldValidator 

id="NextContactDateRFV"
            ControlToValidate="NextContactDate" runat="server" ErrorMessage="Please Enter Next Contact Date to proceed." >
            *
        </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblNextContactDate" runat="server" Text='<%# Bind("NextContact_Date","{0:d}") %>' ></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>

          <asp:TemplateField HeaderText="Creation Date :">
              
              <EditItemTemplate>
                    <ew:CalendarPopup ID="CreationDate" Nullable="True"  

DisplayPrevNextYearSelection="True" SelectedDate='<%# Bind("CreationDate") %>' runat="server" 

AllowArbitraryText="False" CellPadding="2px" CellSpacing="0px" Culture="English (United States)" 

JavascriptOnChangeFunction="" LowerBoundDate="" ShowClearDate="True" UpperBoundDate="12/31/9999 23:59:59" ImageUrl="../Images/calendar.gif" ControlDisplay="TextBoxImage">
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
                    <asp:RequiredFieldValidator id="CreationDateRFV"
            ControlToValidate="CreationDate" runat="server" ErrorMessage="Please Enter Creation Date to proceed." >
            *
        </asp:RequiredFieldValidator>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="lblCreationDate" runat="server" Text='<%# Bind("CreationDate","{0:d}") %>' ></asp:Label>
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
        Text="Go Back to All Compnaies" onclick="Cancel_Click" /></td></tr>
<tr><td colspan="2"><asp:Label  CssClass="resultLabel" ID="LblStatus"  ForeColor="Red" runat="server"></asp:Label></td></tr>
<tr><td colspan="2"><asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" /></td></tr>
<tr><td colspan="2"><asp:HiddenField ID="hidCompanyID" runat="server" /> </td></tr>     
<%--Datasources--%>
<tr><td colspan="2"><asp:ObjectDataSource ID="ProductDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetAllProducts"></asp:ObjectDataSource></td></tr>     
<tr><td colspan="2"><asp:ObjectDataSource ID="IndustryDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetAllIndustries"></asp:ObjectDataSource></td></tr>     
<tr><td colspan="2"><asp:ObjectDataSource ID="NewItemInfoDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository" SelectMethod="GetNewItemOptions"></asp:ObjectDataSource></td></tr>     
</table>
</asp:Content>

