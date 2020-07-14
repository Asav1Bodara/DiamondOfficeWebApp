<%@ Page Title="" Language="C#" MasterPageFile="~/AfterLogin.master" AutoEventWireup="true" CodeFile="DiamondInfo.aspx.cs" Inherits="DiamondInfo" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1 style="font-family:Georgia">Diamond Information</h1><br />
        <asp:Panel ID="pnlTable" runat="server">
<table>
    <tr>
        <th>
            <strong>Packet Number:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtPacketNumber" MaxLength="20" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPacketNumber" ErrorMessage="Please scan the barcode" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            <strong>Diamond Type:</strong>
        </th>
        <td>          
            <asp:TextBox ID="txtDiamondType" MaxLength="20" Placeholder="Enter Diamond Type" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDiamondType" ErrorMessage="Type must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
    </tr>
    <tr>
        <th>
            <strong>Select Certification:</strong>
        </th>
        <td> 
            <asp:DropDownList ID="ddlCertification" runat="server" DataSourceID="SqlDataSource1" DataTextField="CertiTypeName" DataValueField="CertiTypeID"></asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CertiTypeName], [CertiTypeID] FROM [tblCertiType]"></asp:SqlDataSource>
        </td>    
    </tr>
    <tr>
        <th><strong>Certificate Number</strong></th>
        <td><asp:TextBox ID="txtCertiNumber" MaxLength="30" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtCertiNumber" ErrorMessage="Enter Certificate Number" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
     <tr>
        <th><strong>Certified Date:</strong></th>
        <td><asp:TextBox ID="txtCertiDate" Placeholder="Enter Certified Date"  runat="server"></asp:TextBox>
            <ajaxToolkit:CalendarExtender ID="txtCertiDate_CalendarExtender" runat="server" Format="dd-MMM-yyyy" TargetControlID="txtCertiDate" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCertiDate" ErrorMessage="Date must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            <strong>Diamond Status:</strong>
        </th>
        <td>
           <asp:TextBox MaxLength="20" ID="txtStatus" runat="server"></asp:TextBox>  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStatus" ErrorMessage="Enter Diamond Status" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <th>
            <strong>Market Rate:</strong>
        </th>
        <td>
            <asp:TextBox ID="txtMarketRate" MaxLength="10" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMarketRate" ErrorMessage="Rate must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
        </td>
    </tr>   
     <tr>
            <th>
                <strong>Labor Rate:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtLaborRate" MaxLength="10" Placeholder="Enter Labor Rate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLaborRate" ErrorMessage="Labor Rate Required" ForeColor="Red">*</asp:RequiredFieldValidator>
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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>
        </asp:Panel>
        <asp:Panel ID="pnlView" Visible="false" runat="server">
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click"/><br />
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
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

