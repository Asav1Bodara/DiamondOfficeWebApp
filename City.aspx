<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="City.aspx.cs" Inherits="City" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1 style="font-family:Georgia">City</h1> <br />
        <asp:Panel ID="pnlTable" runat="server">
     
<table>
    <tr>
        <th><strong>City:</strong></th>
        <td>
            <asp:TextBox ID="txtCity" MaxLength="30" Placeholder="Enter City" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCity" ErrorMessage="City must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>State:</th>
        <td>
            <asp:DropDownList ID="ddlState" runat="server" DataSourceID="SqlDataSource1" DataTextField="StateName" DataValueField="StateID">
                <asp:ListItem>Select State</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StateID], [StateName] FROM [tblState]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnDelete" Visible="false" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click"/>
            <ajaxToolkit:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure?" TargetControlID="btnDelete" />
            <asp:Button ID="btnView" runat="server" Text="View" CausesValidation="false" OnClick="btnView_Click"/>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click"/>
            <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" OnClick="btnClose_Click"/>
        </td> 
    </tr>
</table>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>
        </asp:Panel>
        <asp:Panel ID="pnlView" Visible="false" runat="server">
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click"/><br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </asp:Panel>
    </center>
</asp:Content>

