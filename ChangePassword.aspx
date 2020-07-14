<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
            <table>
                <tr>
                    <th>Username</th>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Username" ControlToValidate="txtUsername">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td>
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Password" ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th>New Password</th>
                    <td>
                        <asp:TextBox ID="txtNewpass" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter New Password" ControlToValidate="txtNewpass">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th>Re-enter Password</th>
                    <td>
                        <asp:TextBox ID="txtRePass" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Re-enter Password" ControlToValidate="txtRePass">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewpass" ControlToValidate="txtRePass" ErrorMessage="Please Enter the right password">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" OnCommand="btnSubmit_Click" OnDataBinding="btnSubmit_Click" OnLoad="Page_Load" /></td>
                </tr>
            </table>
            <br/>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        </center>
</asp:Content>

