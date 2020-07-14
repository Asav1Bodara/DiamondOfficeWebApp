<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="rptEmployeeInfo.aspx.cs" Inherits="rptEmployeeInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center> 
     Search by Name:<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
     Search by Department:<asp:DropDownList ID="ddlDepartment" runat="server" DataTextField="DepartmentName" DataValueField="DepartmentName"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DepartmentName] FROM [tblDepartment]"></asp:SqlDataSource>
        <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click"></asp:Button>
    <h2>Employee Information</h2>
<asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
<br />
<asp:Button ID="btnExport" runat="server" Text="Export as Excel" OnClick="btnExport_Click"></asp:Button>
</center>
</asp:Content>

