<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerAfterLogin.master" AutoEventWireup="true" CodeFile="Demand.aspx.cs" Inherits="Demand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .labeldesign {
            font-size: 15px;
            color: black;
        }

        .headingdesign {
            font-size: 20px;
            color: black;
            font-family:Georgia, 'Times New Roman', Times, serif
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>   <h1>Raise your Demand</h1><br />
   <asp:Panel ID="pnlTable" runat="server">
    <table>
        <tr>
            <th>Select the Type of a Diamond:</th>
            <td>
                <asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSource1" DataTextField="DiamondType" DataValueField="DiamondType">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DiamondType] FROM [tblDiamondInfo]"></asp:SqlDataSource>
                <br />              
            </td>
        </tr>      
         <tr>
        <td colspan="2">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
    </table>
<asp:Button ID="btnRate" runat="server" Text="View Rate" OnClick="btnRate_Click"></asp:Button>          
   </asp:Panel>
       <asp:Panel ID="pnlView" Visible="false" runat="server">
            <asp:Button ID="btnBack" runat="server" Text="Back" CausesValidation="false" OnClick="btnBack_Click"/><br />
                    <h4>Please check your detail below:</h4>
                    <table>                       
                        <tr>
                            <th class="headingdesign"> 
                                Diamond Type:
                            </th>
                            <td>
                             <asp:Label class="labeldesign"  ID="lblType" runat="server" Text=""/>
                            </td>
                        </tr>
                        
                        <tr>
                            <th class="headingdesign">
                                Rate:
                            </th>
                            <td>
                                <asp:Label class="labeldesign" ID="lblRate" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                   </table>
            <h5 style="font-style:italic">If you are a prime customer than you will get additional discount on whole packet as company's convinience.<span style="color:red">*</span></h5>
        
           <h4 style="font-family:'Franklin Gothic Medium'"><u>There is a special offer for you if you choose from following packet:</u></h4> <br>
          <div style="border:dotted" >
           <table >
               <tr></tr>
               <tr>
                   <asp:Label style="font-family:'Times New Roman';font-size:20px;color:red" ID="lblpktMsg" runat="server" Text=""></asp:Label> <br />
               </tr>
               <tr>
                   <th class="headingdesign">
                       Bundle Type:
                   </th>
                   <td>
                       <asp:Label ID="lblTemp" class="labeldesign" runat="server" Text=""></asp:Label>
                   </td>
                   </tr>
                <tr>
                 <th class="headingdesign">
                     Rate for whole Bundle:
                 </th>
                    <td>
                    <asp:Label ID="lblRateBundle" class="labeldesign" runat="server" Text=""></asp:Label>
               </td>
               </tr>
                       
            </table>
               </div>
           <p>The rate shown here are per carat </p>
            </asp:Panel>  
   </center>
</asp:Content>

