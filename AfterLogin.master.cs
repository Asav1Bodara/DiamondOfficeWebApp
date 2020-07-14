using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AfterLogin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if(Session["uname"].ToString() == "")
            {
               Response.Redirect("Login.aspx");
            }
            else
            {
                lblWelcome.Text = "Welcome " + Session["uname"].ToString() + " | " + Session["utype"].ToString() + " Department ";
            }
        }
    }
}
