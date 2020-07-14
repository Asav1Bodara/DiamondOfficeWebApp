using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["uname"] = "";
            Session["utype"] = "";
        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("EmployeeLogin.aspx");
    }

    protected void Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerLogin.aspx");
    }

   
}