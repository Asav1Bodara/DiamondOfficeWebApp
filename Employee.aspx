﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="Employee" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center><h1 style="font-family:Georgia">Employee</h1>
    <br />
        <asp:Panel ID="pnlTable" runat="server">
    <table>
        <tr>
            <th>
                <strong>Employee Name:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtName" MaxLength="20" Placeholder="Enter Employee Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Employee name must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Phone Number:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtPhone" MaxLength="10" Placeholder="Enter Phone Number" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Invalid phone number" ForeColor="Red" MaximumValue="9999999999" MinimumValue="0" Type="Double">*</asp:RangeValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone number must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>User Name:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtUserName" MaxLength="20" Placeholder="Enter User Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserName" ErrorMessage="User name must be requireed" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Password:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtPassword" MaxLength="32" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
                <ajaxToolkit:PasswordStrength ID="txtPassword_PasswordStrength" runat="server" TargetControlID="txtPassword" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Re-Type Password:</strong>
            </th>
            <td>
                <asp:TextBox ID="TextRePassword" MaxLength="32" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="TextRePassword" ErrorMessage="Password must be match" ForeColor="Red">*</asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextRePassword" ErrorMessage="Re type password required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Address:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtAddress" MaxLength="200" TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
                </tr>
        <tr>
            <th>
                <strong>City:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlCity" runat="server" DataSourceID="SqlDataSource1" DataTextField="CityName" DataValueField="CityID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CityID], [CityName] FROM [tblCity]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <th>
                <strong>State:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlState" runat="server" DataSourceID="SqlDataSource2" DataTextField="StateName" DataValueField="StateID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [StateID], [StateName] FROM [tblState]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Country:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlCountry" runat="server">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <th>
                <strong>Department:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlDept" runat="server" DataSourceID="SqlDataSource3" DataTextField="DepartmentName" DataValueField="DepartmentID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DepartmentID], [DepartmentName] FROM [tblDepartment]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <th>
                <strong>E-Mail Address:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtEmail" MaxLength="40" Placeholder="Enter E-Mail Address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail" ErrorMessage="Enter E-Mail ID" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="invalid E-Mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Gender:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server">
                    <asp:ListItem>Select Gender</asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                    <asp:ListItem>Transgender</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <th>
                <strong>Date of Birth:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtDob" Placeholder="Enter Date of Birth" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtDob_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtDob" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtDob" ErrorMessage="DOB Required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Date of Joining:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtDoj" Placeholder="Enter Date of Joining" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtDoj_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtDoj" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtDoj" ErrorMessage="DOJ Required" ForeColor="Red">*</asp:RequiredFieldValidator>
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
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List"></asp:ValidationSummary>
        </asp:Panel>
        <asp:Panel ID="pnlView" Visible="false" runat="server">
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click"/><br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="Black" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            </asp:Panel>
        </center>
</asp:Content>

