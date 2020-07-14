<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="rptPurchaseInformation.aspx.cs" Inherits="rptPurchaseInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        Search by PacketNumber:<asp:TextBox ID="txtPacketNumber" runat="server"></asp:TextBox>
        Search by Company:<asp:DropDownList ID="ddlCompany" runat="server" DataTextField="CompanyName" DataValueField="CompanyName"></asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click"></asp:Button>
        <h2>Purchase Information</h2>
        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
        <br />
        <asp:Button ID="btnExport" runat="server" Text="Export as Excel" OnClick="btnExport_Click"></asp:Button>
        </center>
</asp:Content>

