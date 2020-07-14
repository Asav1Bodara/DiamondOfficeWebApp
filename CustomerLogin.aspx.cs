using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class CustomerLogin : System.Web.UI.Page
{
    string query;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        query = "SELECT * FROM tblCustomerInfo WHERE CustomerUName='" + txtName.Text + "' AND CustomerPwd='" + txtPwd.Text + "'";
        SqlDataReader dr = classDiamond.getRecords(query);
        if (dr.Read())
        {
            Session["uname"] = txtName.Text;
            Session["utype"] = "Customer";
            Session["uid"] = dr.GetValue(0).ToString();
            Response.Redirect("CustomerDashboard.aspx");
        }
        else
        {
            lblMsg.Text = "Invalid UserName or Password";
        }
        dr.Close();
    }
}
