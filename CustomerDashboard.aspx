<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerAfterLogin.master" AutoEventWireup="true" CodeFile="CustomerDashboard.aspx.cs" Inherits="CustomerDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <center> <h1>Welcome Customer</h1> 
       <br />
   <asp:Panel ID="pnlTable" runat="server">
    <table>
        <tr>
            <th>Select the Packet Number:</th>
            <td>
                <asp:DropDownList ID="ddlPacketNo" runat="server">
                </asp:DropDownList>
                <br />              
            </td>
        </tr>      
         <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    </table>
<asp:Button ID="btnInvoice" runat="server" Text="View Invoice" OnClick="btnInvoice_Click"></asp:Button>          
   </asp:Panel>
       <asp:Panel ID="pnlView" Visible="false" runat="server">
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click"/><br />
                    <h4>Please check your detail below:</h4>
                    <table>
                       
                        <tr>
                            <th>
                                Invoice Number:
                            </th>
                            <td>
                                <asp:Label ID="lblInvoiceNo" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <th>
                                Invoice Date:
                            </th>
                            <td>
                                <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>                        
                        <tr>
                            <th>
                                Packet Number:
                            </th>
                            <td>
                                <asp:Label ID="lblPacketNumber" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                       <tr>
                            <th>
                                Company Name:
                            </th>
                            <td>
                                <asp:Label ID="lblCompany" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                Rate:
                            </th>
                            <td>
                                <asp:Label ID="lblRate" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>

                    </table>
            </asp:Panel>  
   </center>     
</asp:Content>

