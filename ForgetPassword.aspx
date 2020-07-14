<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
       
            
            <table>
                <tr>
                    <th>Username</th>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                       
                    </td>
                </tr>
                <tr>
                    <th>EmailID</th>
                    <td>
                        <asp:TextBox ID="txtEmailid" runat="server"></asp:TextBox>
                       
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

