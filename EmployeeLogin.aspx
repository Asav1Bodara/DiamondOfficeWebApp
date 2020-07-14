<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="EmployeeLogin.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center><h1 style="font-family:Georgia">Employee Login </h1>
        <br />
    <table>
        <tr>
            <th><strong>Username:</strong></th>
            <td><asp:TextBox ID="txtName" Placeholder="Enter User Name" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequireName must be required" ForeColor="Red" ControlToValidate="txtName">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th><strong>Password:</strong></th>
            <td><asp:TextBox ID="txtPwd" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPwd" ErrorMessage="Password must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td></td>
        <td colspan="2">
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />              
       </td>

    </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnforget" runat="server" Text="Forgot Password" OnClick="btnforget_Click" />              
</td>

        </tr>
        <tr>
            <td>

            </td>
            <td> <asp:Button ID="btnchange" runat="server" Text="Change Password" OnClick="btnchange_Click"  />              
        </tr>

    </table>
        <br/>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>
        </center>
</asp:Content>

