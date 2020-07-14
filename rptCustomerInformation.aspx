<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="rptCustomerInformation.aspx.cs" Inherits="rptCustomerInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center> 
    Search by Company Name: <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click"></asp:Button>
    <h2>Customer Information</h2>
<asp:GridView ID="GridView1" runat="server"></asp:GridView>
    <br />
    <asp:Button ID="btnExport" runat="server" Text="Export as Excel" OnClick="btnExport_Click"></asp:Button>
</center>
</asp:Content>

