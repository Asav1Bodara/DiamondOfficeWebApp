using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Employee : System.Web.UI.Page
{
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
        {
            if (Session["utype"].ToString() != "Admin")
            {
                Response.Redirect("DashBoard.aspx");
            }
        }
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tblEmployee (EmpName,EmpPhone,EmpUserName,EmpPassword,EmpAddress,CityID,DepartmentID,EmpEmail,Gender,EmpDOB,EmpDOJ) VALUES ('" + txtName.Text + "','" + txtPhone.Text + "','" + txtUserName.Text + "','" + txtPassword.Text + "','" + txtAddress.Text + "','" + ddlCity.SelectedValue + "','" + ddlDept.SelectedValue + "','" + txtEmail.Text + "','" + ddlGender.SelectedValue + "','" + txtDob.Text + "','" + txtDoj.Text + "')";
        }
        else
        {
            qry = "UPDATE tblEmployee SET EmpName='" + txtName.Text + "', EmpPhone='" + txtPhone.Text + "', EmpUserName='" + txtUserName.Text + "', EmpPassword='" + txtPassword.Text + "', EmpAddress='" + txtAddress.Text + "', CityID='" + ddlCity.SelectedValue + "', DepartmentID='" + ddlDept.SelectedValue + "', EmpEmail='" + txtEmail.Text + "', Gender='" + ddlGender.SelectedValue + "', EmpDOB='" + txtDob.Text + "', EmpDOJ='" + txtDoj.Text + "' WHERE EmpID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }

    protected void AllClear()
    {
        txtName.Text = "";
        txtPhone.Text = "";
        txtUserName.Text = "";
        txtPassword.Text = "";
        txtAddress.Text = "";
        txtDob.Text = "";
        txtDoj.Text = "";
        ddlCity.SelectedIndex = 0;
        ddlDept.SelectedIndex = 0;
        ddlGender.SelectedIndex = 0;
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblEmployee WHERE EmpID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        qry = "SELECT EmpID AS [ID], EmpName AS [Emp Name], EmpPhone AS [Emp Phone], EmpUserName AS [Emp UserName], EmpPassword AS [Emp Password], EmpAddress AS [Emp Address], CityName AS [City Name], DepartmentName AS [Department Name], EmpEmail AS [Emp Email], Gender AS [Gen], EmpDoB AS [Emp DOB], EmpDOJ AS [Emp DOJ] FROM viewEmployee";
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
        qry = "SELECT * FROM tblEmployee WHERE EmpID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            txtName.Text = dr.GetValue(1).ToString();
            txtPhone.Text = dr.GetValue(2).ToString();
            txtUserName.Text = dr.GetValue(3).ToString();
            txtPassword.Text = dr.GetValue(4).ToString();
            txtAddress.Text = dr.GetValue(5).ToString();
            ddlCity.SelectedValue = dr.GetValue(6).ToString();
            ddlDept.SelectedValue = dr.GetValue(7).ToString();
            txtEmail.Text = dr.GetValue(8).ToString();
            ddlGender.SelectedValue = dr.GetValue(9).ToString();
            txtDob.Text = Convert.ToDateTime(dr.GetValue(10).ToString()).ToString("dd-MMM-yyyy");
            txtDoj.Text = Convert.ToDateTime(dr.GetValue(11).ToString()).ToString("dd-MMM-yyyy");

            btnSubmit.Text = "Update";
            btnDelete.Visible = true;

            pnlView.Visible = false;
            pnlTable.Visible = true;
        }
        dr.Close();
    }


    protected void GridView1_DataBound(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[11].Text = Convert.ToDateTime(e.Row.Cells[11].Text).ToString("dd-MMM-yyyy");
            e.Row.Cells[12].Text = Convert.ToDateTime(e.Row.Cells[12].Text).ToString("dd-MMM-yyyy");
        }
    }
}