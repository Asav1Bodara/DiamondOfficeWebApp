<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="rptDiamondInformation.aspx.cs" Inherits="rptDiamondInformation" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center> 
    <h2>Diamond Informtion</h2>  
    Packet No.: <asp:TextBox ID="txtPacketNo" MaxLength="20" runat="server"></asp:TextBox>
    Diamond Type: <asp:DropDownList ID="ddlDiamondType" runat="server" DataTextField="DiamondType" DataValueField="DiamondType"></asp:DropDownList>
    <ajaxToolkit:ListSearchExtender ID="ddlDiamondType_ListSearchExtender" runat="server" TargetControlID="ddlDiamondType">
    </ajaxToolkit:ListSearchExtender>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT( [DiamondType]) FROM [tblDiamondInfo]"></asp:SqlDataSource>
    <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click" /><br />
    <asp:GridView style="align-content:center;" ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" BorderColor="#FF6699" CellPadding="1" CellSpacing="2" Font-Bold="True" Font-Size="Medium">
    </asp:GridView>
      <br />
      <asp:Button ID="btnExportExcel" runat="server" Text="Export as Excel" OnClick="btnExportExcel_Click"></asp:Button>
</center>
</asp:Content>

