using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Labor : System.Web.UI.Page
{
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["utype"].ToString() != "Admin" && Session["utype"].ToString() != "Manufacture")
            {
                Response.Redirect("DashBoard.aspx");
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tblLabor (LaborName,LaborPhone,LaborAddress,CityID,LaborType,Gender,LaborDOB,LaborDOJ) VALUES ('" + txtLName.Text + "','" + txtPhoneNo.Text + "','" + txtAddress.Text + "','" + ddlCity.SelectedValue + "','" + ddlLaborType.SelectedValue + "','" + ddlGender.SelectedValue + "','" + txtDOB.Text + "','" + txtDOJ.Text + "')";
        }
        else
        {
            qry = "UPDATE tblLabor SET LaborName='" + txtLName.Text + "', LaborPhone='" + txtPhoneNo.Text + "', LaborAddress='" + txtAddress.Text + "', CityID='" + ddlCity.SelectedValue + "', LaborType'" + ddlLaborType.SelectedValue + "',Gender='" + ddlGender.SelectedValue + "', LaborDOB='" + txtDOB.Text + "', LaborDOJ='" + txtDOJ.Text + "' WHERE LaborID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }

    protected void AllClear()
    {
        txtLName.Text = "";
        txtPhoneNo.Text = "";
        txtAddress.Text = "";
        txtDOB.Text = "";
        txtDOJ.Text = "";
        ddlLaborType.SelectedIndex = 0;
        ddlCity.SelectedIndex = 0;
        ddlGender.SelectedIndex = 0;
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
   

    protected void btnView_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlView.Visible = true;
        pnlTable.Visible = false;
    }

    protected void FillGrid()
    {
        qry = "SELECT LaborID AS [ID], LaborName AS [Labor Name], LaborPhone AS [Labor Phone], LaborAddress AS [Labor Address], CityName AS [City Name], LaborType AS [labor Type], Gender AS [Gen], LaborDOB AS [Labor DOB], LaborDOJ AS [Labor DOJ] FROM viewLabor";
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
        qry = "SELECT * FROM tblLabor WHERE LaborID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            txtLName.Text = dr.GetValue(1).ToString();
            txtPhoneNo.Text = dr.GetValue(2).ToString();
            txtAddress.Text = dr.GetValue(3).ToString();
            ddlCity.SelectedValue = dr.GetValue(4).ToString();
            ddlLaborType.SelectedValue = dr.GetValue(5).ToString();
            ddlGender.SelectedValue = dr.GetValue(6).ToString();
            txtDOB.Text = Convert.ToDateTime(dr.GetValue(7).ToString()).ToString("dd-MMM-yyyy");
            txtDOJ.Text = Convert.ToDateTime(dr.GetValue(8).ToString()).ToString("dd-MMM-yyyy");

            btnSubmit.Text = "Update";
            btnDelete.Visible = true;

            pnlView.Visible = false;
            pnlTable.Visible = true;
        }
        dr.Close();
    }

    protected void btnDelete_Click1(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblLabor WHERE LaborID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record DELETED successfully.";
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[8].Text = Convert.ToDateTime(e.Row.Cells[8].Text).ToString("dd-MMM-yyyy");
            e.Row.Cells[9].Text = Convert.ToDateTime(e.Row.Cells[9].Text).ToString("dd-MMM-yyyy");
        }
    }
}
