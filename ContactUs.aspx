<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center><h1 style="font-family:Georgia">Contact Us</h1><br />
    <table>
       <tr>
            <th>
                <strong>Name:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtName" Placeholder="Full Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" ErrorMessage="Name must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Company Name:</strong>
            </th>
             <td>
            <asp:DropDownList ID="ddlCompanyName" runat="server">
                <asp:ListItem>Select Company</asp:ListItem>                
            </asp:DropDownList></td>
        </tr>
        <tr>
            <th>
                <strong>Contact No:</strong>
            </th>
            <td>
                <asp:TextBox ID="txtContact" Placeholder="Contact Number" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtContact" ErrorMessage="Contact must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtContact" ErrorMessage="Invalid Conatct" ForeColor="Red">*</asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Select Country:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlCountry" runat="server">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <th><strong>E-Mail:</strong></th>
            <td>
                <asp:TextBox ID="txtEmail" Placeholder="E-Mail Address" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email must be required" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <th>
                <strong>Inquiry For:</strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlInquiry" runat="server">
                    <asp:ListItem>GIA</asp:ListItem>
                    <asp:ListItem>Non-Certified Diamond</asp:ListItem>
                    <asp:ListItem>General</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <th>
                <strong>Message:</strong>
            </th>
            <td>
                <textarea id="txtMessage" Placeholder="Message" cols="20" rows="3"></textarea>
            </td>
        </tr>       
        <tr>
            <td>

            </td>
            <td>
                <asp:Button ID="btn" runat="server" Text="Submit" />
            </td>
        </tr>
   </table>      
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"></asp:ValidationSummary>
        </center>
</asp:Content>

