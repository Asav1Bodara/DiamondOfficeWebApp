<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center><h1 style="font-family:Georgia">Payment</h1>
    <br />
         <asp:Panel ID="pnlTable" runat="server">
    <table>
        <tr>
            <th>
                <strong>Purchased Diamond :</strong>
            </th>
            <td>
            <asp:DropDownList ID="ddlPurchaseID" runat="server" DataSourceID="SqlDataSource1" DataTextField="PacketNumber" DataValueField="PacketNumber"></asp:DropDownList>    
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PacketNumber] FROM [tblPurchaseInfo]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Payment Date:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtPayDate" Placeholder="Enter Payment Date" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtPayDate_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtPayDate" />
              </td>
        </tr>
        <tr>
            <th>
                <strong>Supplier:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlSupplier" runat="server" DataSourceID="SqlDataSource2" DataTextField="CompanyName" DataValueField="SupplierID"></asp:DropDownList>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SupplierID], [CompanyName] FROM [tblSupplier]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <th>
                <strong>Payment Amount:</strong>
            </th>
            <td> 
                <asp:TextBox ID="txtAmount" MaxLength="10" Placeholder="Enter Payment Amount" runat="server"></asp:TextBox>
              <!--  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAmount" ErrorMessage="Enter Amount Paid" ForeColor="Red">*</asp:RequiredFieldValidator>
            --></td>
        </tr>
        <tr>
            <th>
                <strong>Payment Mode:</strong>
            </th>
            <td>
   <asp:DropDownList ID="ddlMode" runat="server">
                    <asp:ListItem>Cash</asp:ListItem>
                    <asp:ListItem>Cheque</asp:ListItem>
                    <asp:ListItem>Debit Card</asp:ListItem>
                    <asp:ListItem>Credit Card</asp:ListItem>
                    <asp:ListItem>Net-Banking</asp:ListItem>
                </asp:DropDownList>            </td>
        </tr>
        <tr>
            <th>
                <strong>Bank Name:</strong>
            </th>
            <td>
               <asp:TextBox ID="txtBankName" MaxLength="30" runat="server"></asp:TextBox>
               </td>
        </tr>
        <tr>
            <th>
                <strong>Transaction ID:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtTransaction" MaxLength="30" Placeholder="Enter Transaction ID" runat="server"></asp:TextBox>
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
                <asp:Button ID="btnDelete" Visible="false" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                <ajaxToolkit:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure?" TargetControlID="btnDelete" />
                <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" />
            </td>
        </tr>
    </table>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"></asp:ValidationSummary>
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

