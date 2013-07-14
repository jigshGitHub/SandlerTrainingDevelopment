<%@ Page Title="" Language="C#" MasterPageFile="~/CRM.master" AutoEventWireup="true" CodeFile="ProcessArchieve.aspx.cs" Inherits="ProcessArchieve" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Import Namespace="SandlerRepositories" %>
<%@ Register Src="../Pager.ascx" TagName="Pager" TagPrefix="uc1" %>
<%@ Register Src="../EntityMenu.ascx" TagName="EntityMenu" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <table id="tblMain" style="width: 100%">
        <tr>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100%" align="right">
                            <uc1:EntityMenu ID="opportunityMenu" runat="server" EnableViewState="true" />
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
                <asp:GridView Width="100%" ID="gvOpportunities" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ID" AllowSorting="true" OnDataBound="gvOpportunities_DataBound"
                    OnSorting="gvOpportunities_Sorting"
                    EnableViewState="false">
                    <PagerStyle BackColor="#999999" ForeColor="Blue" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="ID" Visible="False" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="OPPORTUNITYID"
                            HeaderText="ID" SortExpression="OPPORTUNITYID" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="NAME"
                            HeaderText="Name" SortExpression="NAME" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CompanyName"
                            HeaderText="Company" SortExpression="CompanyName" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="WEIGHTEDVALUE"
                            HeaderText="Weighted Value" SortExpression="WEIGHTEDVALUE" DataFormatString="{0:C}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="VALUE"
                            HeaderText="Value" SortExpression="VALUE" DataFormatString="{0:C}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="CloseDate"
                            HeaderText="Close Date" SortExpression="CloseDate" DataFormatString="{0:d}" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="SalesRep"
                            HeaderText="Sales Rep" SortExpression="SalesRep" />
                        <asp:BoundField ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" HeaderStyle-ForeColor="Blue" DataField="Status"
                            HeaderText="Status" SortExpression="Status" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <a href="ProcessArchieve.aspx?mode=true&id=<%#Eval("Id")%>">UnArchieve...</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                </asp:GridView>
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
    </table>
</asp:Content>

