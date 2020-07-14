using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class ChangePassword : System.Web.UI.Page
{
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        qry = "SELECT * FROM tblEmployee WHERE EmpUserName='" + txtUsername.Text + "' AND EmpPassword='" + txtPassword.Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            dr.Close();
            qry = "UPDATE tblEmployee SET EmpPassword='"+ txtRePass.Text +"' WHERE EmpUserName = '"+ txtUsername.Text +"'";
            int i = classDiamond.setRecords(qry);
            lblmsg.Text = "User found";

        }
        else
        {
            dr.Close();
            lblmsg.Text = "User not found";
        }
    }
}