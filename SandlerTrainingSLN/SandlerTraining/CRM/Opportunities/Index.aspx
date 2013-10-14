<%@ Page Title="CRM - View Opportunities" Language="C#" MasterPageFile="~/CRM.master"
    AutoEventWireup="true" EnableEventValidation="false" CodeFile="Index.aspx.cs"
    Inherits="OpportunityIndex" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<%@ Register Src="../EntityMenu.ascx" TagName="EntityMenu" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <table id="tblMain" style="width: 100%">
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100%" align="right">
                            <uc1:EntityMenu ID="opportunityMenu" runat="server" EnableViewState="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Select Company Name:
                            <asp:DropDownList DataSourceID="CompanyDS" DataTextField="CompanyName" DataValueField="CompaniesID"
                                ID="ddlCompany" runat="server" AutoPostBack="True" OnDataBound="ddlCreateDefaultSelection"
                                OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="CompanyDS" runat="server" TypeName="SandlerRepositories.CompaniesRepository"
                                SelectMethod="GetCompaniesForDDL" OnSelecting="CompanyDS_Selecting">
                                <SelectParameters>
                                    <asp:Parameter Name="_user" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:ImageButton ImageUrl="~/images/excel.jpg" runat="server" ToolTip="Export To Excel"
                                ID="btnExportExcel" OnClick="btnExportExcel_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="updPnl" runat="server">
                    <ContentTemplate>
                        <asp:GridView Width="100%" ID="gvOpportunities" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="ID" AllowSorting="true" OnDataBound="gvOpportunities_DataBound"
                            OnRowDataBound="gvOpportunities_RowDataBound" ShowFooter="true" OnSorting="gvOpportunities_Sorting"
                            AutoGenerateEditButton="true" OnRowEditing="gvOpportunities_Editing" OnRowCancelingEdit="gvOpportunities_CancelEditing"
                            OnRowUpdating="gvOpportunities_RowUpdating">
                            <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="ID" Visible="False" />
                                <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                    HeaderStyle-ForeColor="Blue" DataField="OPPORTUNITYID" HeaderText="ID" SortExpression="OPPORTUNITYID"
                                    ReadOnly="true" />
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' /></ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtName" Width="100%" runat="server" Text='<%#Eval("Name") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                    HeaderStyle-ForeColor="Blue" DataField="CompanyName" HeaderText="Company" SortExpression="CompanyName"
                                    ReadOnly="true" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                    HeaderText="Value" HeaderStyle-ForeColor="Blue" SortExpression="Value">
                                    <ItemTemplate>
                                        <asp:Label ID="lblValue" runat="server" Text='<%#Eval("Value","{0:c}") %>' /></ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtValue" runat="server" Text='<%#Eval("Value") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                    HeaderText="Close Date" HeaderStyle-ForeColor="Blue" SortExpression="CloseDate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCloseDt" runat="server" Text='<%#Eval("CloseDate","{0:d}") %>' /></ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCloseDt" runat="server" Text='<%#Eval("CloseDate","{0:d}") %>' />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                    HeaderText="Sales Rep" HeaderStyle-ForeColor="Blue" SortExpression="SalesRep">
                                    <ItemTemplate>
                                        <asp:Label ID="lblSalesRep" runat="server" Text='<%#Eval("SalesRep") %>' /></ItemTemplate>
                                    <EditItemTemplate>
                                        First Name:<asp:TextBox ID="txtSalesFN" Text='<%#Eval("SalesRepFN") %>' runat="server" /><br />
                                        Last Name:<asp:TextBox ID="txtSalesLN" Text='<%#Eval("SalesRepLN") %>' runat="server" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                    HeaderText="Status" HeaderStyle-ForeColor="Blue" SortExpression="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status") %>' /></ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlProductStatus" SelectedValue='<%#Eval("StatusID") %>' runat="server"
                                            DataSourceID="OpportunityStatusDS" DataTextField="Name" DataValueField="ID">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="OpportunityStatusDS" runat="server" SelectMethod="GetAll"
                                            TypeName="SandlerRepositories.OpprtunityStatusRepository"></asp:ObjectDataSource>
                                        <br />
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 100%">
                                                    <strong>Notes:</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Text='<%#Eval("Notes") %>'></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <a href="Detail.aspx?id=<%#Eval("Id")%>">View Detail...</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False" HeaderText="Archive">
                                    <ItemTemplate>
                                        <a href="ProcessArchive.aspx?mode=false&id=<%#Eval("Id")%>" onclick="return confirm ('Are you sure you want to archive this Pipeline record?');">
                                            Archive...</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="Pager">
                <uc1:Pager ID="pager" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ForeColor="Red" ID="LblStatus" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlExport" runat="server" Visible="false">
                    <asp:GridView Width="100%" ID="gvExport" runat="server" AutoGenerateColumns="false">
                        <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="OPPORTUNITYID" HeaderText="Opportunity ID" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="NAME" HeaderText="Name" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="CompanyName" HeaderText="Company" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="Franchisee" HeaderText="Franchisee" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="Region" HeaderText="Region" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="WEIGHTEDVALUE" HeaderText="Weighted Value"
                                DataFormatString="{0:C}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="VALUE" HeaderText="Value" DataFormatString="{0:C}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="CloseDate" HeaderText="Close Date" DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="CreationDate" HeaderText="Creation Date"
                                DataFormatString="{0:d}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="SalesRep" HeaderText="Sales Rep" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="Status" HeaderText="Status" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="PrimaryContact" HeaderText="PrimaryContact" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="SecondaryContact1" HeaderText="SecondaryContact1" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="SecondaryContact2" HeaderText="SecondaryContact2" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="Product" HeaderText="Product" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="ProductCost" HeaderText="ProductCost"
                                DataFormatString="{0:C}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="OppType" HeaderText="TypeOfOpportunity" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="WhyLost" HeaderText="WhyLost?" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="Description" HeaderText="Description" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="Notes" HeaderText="Notes" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="ActualValue" HeaderText="ActualValue"
                                DataFormatString="{0:C}" />
                            <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                HeaderStyle-ForeColor="Blue" DataField="Source" HeaderText="Source" />
                        </Columns>
                        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                    </asp:GridView>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <div id="divProgress" style="width: 150px; text-align: center; vertical-align: middle;
        position: absolute; bottom: 50%; left: 45%; visibility: hidden; color: blue;
        background-color: lightblue;">
        <asp:Image ID="ajaxLoadNotificationImage" runat="server" ImageUrl="~/images/indicator_medium.gif" />Please
        wait...
    </div>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);


        function BeginRequestHandler(sender, args) {
            var elem = args.get_postBackElement();
            ShowHideProgress('visible');
        }
        function EndRequestHandler(sender, args) {
            ShowHideProgress('hidden');
        }
        function ShowHideProgress(visibility) {
            var divProgress = $get('divProgress');
            divProgress.style.visibility = visibility;
        }
    </script>
</asp:Content>
