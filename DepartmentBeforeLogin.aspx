<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.master" AutoEventWireup="true" CodeFile="DepartmentBeforeLogin.aspx.cs" Inherits="DepartmentBeforeLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            background-color: gray;
        }
        .quot {
                color:black;
                font-style:italic;
        }
        h2 {
            style="font-family:Georgia"
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <hr />
        <h2>Importing</h2>        
        <p class="quot">*** Importing of Rough Diamonds Directly from Mines *** </p>
        <hr />
        <img src="images/Departments/import.png" width="600px" />
        <hr />
        <h2>Manufacturing</h2>
        <p class="quot">*** Manufacturing of Shaped and Fancy Diamonds from Rough Diamonds ***</p>
        <hr />
        <img src="images/Departments/dman.jpg" height="500px" width="600px"  />
        <hr />       
        <h2>Marketing</h2>
        <p class="quot">*** Great Marketing Team ***</p>
        <hr />
        <img src="images/Departments/marketing.jpg" width="600px" />
        <hr />
        <hr />        
        <h2>Purchasing</h2>
        <p class="quot">*** Impressive Purchasing Team ***</p><hr />
        <img src="images/Departments/purchase.jpg" width="600px"/>
        <hr />
        <h2>Selling</h2>
        <p class="quot">*** Selling of Diamods with perfect rate ***</p>
        <hr />
        <img src="images/Departments/selling.jpg" width="600px"/>
        <hr />               
        <h2>Exporting</h2>
        <p class="quot">*** Exporting of Diamonds in Different Countries ***</p>
        <hr />
        <img src="images/Departments/export.jpg" width="600px" />
        <hr />        
        <h2>Acounting</h2>
        <p class="quot">*** A Tansparent Financial System ***</p>
        <hr />
        <img src="images/Departments/acounting.jpg" width="600px"/>
        
    </center>
</asp:Content>

