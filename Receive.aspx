<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Receive.aspx.cs" Inherits="Receive" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <center> <h1 style="font-family:Georgia">Received Payment Information</h1><br />
     <asp:Panel ID="pnlTable" runat="server">
    <table>
        <tr>
            <th>
                <strong>Packet Number:</strong>
            </th>
            <td>
               <asp:DropDownList ID="ddlPacketNumber" runat="server" DataSourceID="SqlDataSource2" DataTextField="PacketNumber" DataValueField="PacketNumber"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PacketNumber] FROM [tblDiamondInfo]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Selling Date:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtSellingDate" Placeholder="Enter Selling Date" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtSellingDate_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtSellingDate" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSellingDate" ErrorMessage="Selling Date Must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Customer(Company):</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlCompany" runat="server" DataSourceID="SqlDataSource1" DataTextField="CustomerCompany" DataValueField="CustomerID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerID], [CustomerCompany] FROM [tblCustomerInfo]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Received Amount:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtAmount" MaxLength="10" Placeholder="Enter Receiving Amount" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAmount" ErrorMessage="Enter Received Amount " ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Receiving Mode:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlMode" runat="server">
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>Cheque</asp:ListItem>
                    <asp:ListItem>Debit Card</asp:ListItem>
                    <asp:ListItem>Credit Card</asp:ListItem>
                    <asp:ListItem>Net-Banking</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Bank Name:</strong>
            </th>
            <td>
               <asp:TextBox ID="txtBankName" MaxLength="30" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <th>
                <strong>Transaction ID:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtTransactionID" MaxLength="30" Placeholder="Enter Transaction ID" runat="server"></asp:TextBox>
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
                <asp:Button ID="btnView" runat="server" Text="View" CausesValidation="false" OnClick="btnView_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" OnClick="btnClose_Click" />
            </td>
        </tr>
    </table>
       <br />
       <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>
       </asp:Panel>
        <asp:Panel ID="pnlView" Visible="false" runat="server">
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click"/><br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
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

