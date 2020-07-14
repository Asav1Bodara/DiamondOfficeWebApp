<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="rptPaymentInformation.aspx.cs" Inherits="rptPaymentInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        Packet Number:<asp:TextBox ID="txtPacketNumber" runat="server"></asp:TextBox>
        Select Mode : <asp:DropDownList ID="ddlmode" runat="server" DataTextField="PayMode" DataValueField="PayMode"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PayMode] FROM [tblPayment]"></asp:SqlDataSource>
        <asp:Button ID="btnSearch" runat="server" Text="Search Filter" OnClick="btnSearch_Click" ></asp:Button>
        <h2>Payment Information</h2>
        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
          <br />
      <asp:Button ID="btnExportExcel" runat="server" Text="Export as Excel" OnClick="btnExportExcel_Click"></asp:Button>
    </center>
</asp:Content>

