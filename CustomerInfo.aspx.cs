using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class CustomerInfo : System.Web.UI.Page
{
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["utype"].ToString() == "Manufacture")
            {
                Response.Redirect("DashBoard.aspx");
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tblCustomerInfo (CustomerName,CustomerUName,CustomerPwd,CustomerCompany,CustomerContact,CustomerEmail) VALUES ('" + txtName.Text + "','" + txtUser.Text + "','" + txtPassword.Text + "','" + txtCompanyName.Text + "','" + txtPhone.Text + "','" + txtEmail.Text + "')";
        }
        else
        {
            qry = "UPDATE tblCustomerInfo SET CustomerName='" + txtName.Text + "', CustomerUName='" + txtUser.Text + "', CustomerPwd='" + txtPassword.Text +"', CustomerCompany='" + txtCompanyName.Text + "', CustomerContact='" + txtPhone.Text + "', CustomerEmail='" + txtEmail.Text + "'   WHERE CustomerID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }
    protected void AllClear()
    {
        txtName.Text = "";
        txtUser.Text = "";
        txtPassword.Text = "";
        txtCompanyName.Text = "";
        txtPhone.Text = "";
        txtEmail.Text = "";
      
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblCustomerInfo WHERE CustomerID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record DELETED successfully.";
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlView.Visible = true;
        pnlTable.Visible = false;
    }

    protected void FillGrid()
    {
        qry = "SELECT * FROM tblCustomerInfo";
        SqlDataReader dr = classDiamond.getRecords(qry);
        GridView1.DataSource = dr;
        GridView1.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        AllClear();
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        AllClear();
        pnlView.Visible = false;
        pnlTable.Visible = true;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        qry = "SELECT * FROM tblCustomerInfo WHERE CustomerID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            txtName.Text = dr.GetValue(1).ToString();
            txtUser.Text = dr.GetValue(2).ToString();
            txtPassword.Text = dr.GetValue(3).ToString();
            txtCompanyName.Text = dr.GetValue(4).ToString();
            txtPhone.Text = dr.GetValue(5).ToString();
            txtEmail.Text = dr.GetValue(6).ToString(); ;

            

            btnSubmit.Text = "Update";
            btnDelete.Visible = true;

            pnlView.Visible = false;
            pnlTable.Visible = true;
        }
        dr.Close();
    }
}