<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="rptSalesInformation.aspx.cs" Inherits="rptSalesInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        Search by Packet Number:<asp:TextBox ID="txtPacketNumber" runat="server"></asp:TextBox>
        Search by Company:<asp:DropDownList ID="ddlCompany" runat="server" DataTextField="CustomerCompany" DataValueField="CustomerCompany"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CustomerCompany] FROM [tblCustomerInfo]"></asp:SqlDataSource>
        <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click"></asp:Button>
        <h2>
            Sales Information
        </h2>
        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
        <br />
        <asp:Button ID="btnExport" runat="server" Text="Export as Excel" OnClick="btnExport_Click"></asp:Button>
    </center>
</asp:Content>

