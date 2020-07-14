<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="rptLaborInformation.aspx.cs" Inherits="rptLaborInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        Search by Name:<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        Search by Labor Type:<asp:DropDownList ID="ddltype" runat="server" DataTextField="LaborTypeName" DataValueField="LaborTypeName"></asp:DropDownList>
        <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click"></asp:Button>
        <h2>Labor Information</h2>
<asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound1"></asp:GridView>
    <br />
        <asp:Button ID="btnExport" runat="server" Text="Export as Excel" OnClick="btnExport_Click"></asp:Button>
    </center>
</asp:Content>

