using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    String query;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["uname"] = "";
            Session["utype"] = "";
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        query = "SELECT * FROM viewEmployee WHERE EmpUserName='" + txtName.Text + "' AND EmpPassword='" + txtPwd.Text + "'";
        SqlDataReader dr = classDiamond.getRecords(query);
        if (dr.Read())
        {
            Session["uname"] = txtName.Text;
            Session["utype"] = dr.GetValue(13).ToString();
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            lblMsg.Text = "Invalid UserName or Password";
        }
        dr.Close();
    }


    protected void btnforget_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgetPassword.aspx");
    }

    protected void btnchange_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx");
    }
}