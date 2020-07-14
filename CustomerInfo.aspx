<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="CustomerInfo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1 style="font-family:Georgia">Customer Information</h1><br />
        <asp:Panel ID="pnlTable" runat="server">
<table>
    <tr>
        <th>
            <strong>Customer Name:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtName" MaxLength="20" Placeholder="Enter Customer Name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name required" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            <strong>User Name:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtUser" MaxLength="20" Placeholder="Enter User Name" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="Alphabets only" ValidationExpression="[a-zA-Z ]+$">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <th>
            <strong>Password:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtPassword" MaxLength="32" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
            <ajaxToolkit:PasswordStrength ID="txtPassword_PasswordStrength" runat="server" TargetControlID="txtPassword" />
        </td>
    </tr>
    <tr>
        <th>
            <strong>Retype Password:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtRetype" MaxLength="32" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtRetype" ErrorMessage="Password mismatch">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <th>
            <strong>Company Name:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtCompanyName" MaxLength="20" runat="server"></asp:TextBox>   
        </td>
    </tr>
    <tr>
        <th>
            <strong>Phone Number:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtPhone" MaxLength="10" Placeholder="Enter Phone Number" runat="server"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtPhone" ErrorMessage="Invalid Phone" MaximumValue="9999999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
        </td>
    </tr>
         <tr>
        <th>
            <strong>Email Id:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtEmail" MaxLength="40" Placeholder="Enter E-Mail ID" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnDelete" Visible="false" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click" />
            <ajaxToolkit:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure?" TargetControlID="btnDelete" />
            <asp:Button ID="btnView" runat="server" Text="View" CausesValidation="false" OnClick="btnView_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
            <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" OnClick="btnClose_Click" />
        </td>
    </tr>
</table>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
     </asp:Panel>
        <asp:Panel ID="pnlView" Visible="false" runat="server">
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click"/><br />
                <asp:GridView class="gridview" ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            </asp:Panel>
    </center>
</asp:Content>

