<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="CertiType.aspx.cs" Inherits="CertiType" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1 style="font-family:Georgia">Certificare Type</h1><br />
        <asp:Panel ID="pnlTable" runat="server">
<table>
    <tr>
       <th><strong>Certificate Type:</strong></th>
        <td>
            <asp:TextBox ID="txtCertiType" MaxLength="40" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCertiType" ErrorMessage="Type must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnDelete" Visible="false" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click"/>
            <ajaxToolkit:ConfirmButtonExtender ID="btnDelete_ConfirmButtonExtender" runat="server" ConfirmText="Are you sure?" TargetControlID="btnDelete" />
            <asp:Button ID="btnView" runat="server" Text="View" CausesValidation="false" OnClick="btnView_Click"/>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click"/>
            <asp:Button ID="btnClose" runat="server" Text="Close" CausesValidation="false" OnClick="btnClose_Click"/>
        </td>
    </tr>
</table>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />

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

