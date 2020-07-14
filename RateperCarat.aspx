<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="RateperCarat.aspx.cs" Inherits="RateperCarat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<center><h1 style="font-family:Georgia">Diamond rate per carat</h1><br />
        <asp:Panel ID="pnlTable" runat="server">
<table>
    <tr>
        <th>
            <strong>Enter Diamond Packet Bundle:</strong>
        </th>
        <td> 
            <asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSource1" DataTextField="DiamondType" DataValueField="DiamondType"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DiamondType] FROM [viewDiamondInfo]"></asp:SqlDataSource>
        </td>    
    </tr>
    <tr>
        <th><strong>Rate of per carat</strong></th>
        <td><asp:TextBox ID="txtRate" MaxLength="30" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtRate" ErrorMessage="Enter Rate of Diamond per carat" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>    <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnDelete" Visible="false" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click"/>
            <asp:Button ID="btnView" runat="server" Text="View" CausesValidation="false" OnClick="btnView_Click"/>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click"/>
            <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" OnClick="btnClose_Click"/>
        </td>
    </tr>
</table>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>
        </asp:Panel>
        <asp:Panel ID="pnlView" Visible="false" runat="server">
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click"/><br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            </asp:Panel>
    </center>
</asp:Content>

