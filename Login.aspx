<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h1 style="font-family:Georgia">Select Your Login Option</h1>
        <br />
    <asp:Button ID="Button" runat="server" Text="CustomerLogin" OnClick="Button_Click" />
    <br />  <br /><br />
    <asp:Button ID="Button3" runat="server" Text="Employee Login" OnClick="Button3_Click" />
</center>
</asp:Content>

