using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Supplier : System.Web.UI.Page
{
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {        
            if (!IsPostBack)
            {
                if (Session["utype"].ToString() != "Purchase" && Session["utype"].ToString() != "Admin")
                {
                    Response.Redirect("DashBoard.aspx");
                }
            }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tblSupplier (CompanyName,CompanyContact,CompanyAddress,CompanyCity,CompanyState,CompanyCountry) VALUES ('" + txtCompany.Text + "','" + txtPhoneNo.Text + "','" + txtAddress.Text + "','" + ddlCity.SelectedValue + "','" + ddlState.SelectedValue + "','" + txtCountry.Text + "')";

        }
        else
        {
            qry = "UPDATE tblSupplier SET CompanyName='" + txtCompany.Text + "', CompanyContact='" + txtPhoneNo.Text + "', CompanyAddress='" + txtAddress.Text + "', CompanyCity='" + ddlCity.SelectedValue + "', CompanyState='" + ddlState.SelectedValue + "', CompanyCountry='" + txtCountry.Text + "' WHERE SupplierID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }
    protected void AllClear()
    {
        txtCompany.Text = "";
        txtPhoneNo.Text = "";
        txtAddress.Text = "";
        ddlCity.SelectedIndex = 0;
        ddlState.SelectedIndex = 0;
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblSupplier WHERE SupplierID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        qry = "SELECT SupplierID AS [ID], CompanyName AS [Company Name], CompanyContact AS [Company Contact], CompanyAddress AS [Company Address], CityName AS [City Name], StateName As [State Name], CompanyCountry AS [Company Country] FROM viewSupplier";
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
        qry = "SELECT * FROM tblSupplier WHERE SupplierID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            txtCompany.Text = dr.GetValue(1).ToString();
            txtPhoneNo.Text = dr.GetValue(2).ToString();
            txtAddress.Text = dr.GetValue(3).ToString();
            ddlCity.SelectedValue = dr.GetValue(4).ToString();
            ddlState.SelectedValue = dr.GetValue(5).ToString();

            btnSubmit.Text = "Update";
            btnDelete.Visible = true;

            pnlView.Visible = false;
            pnlTable.Visible = true;
        }
        dr.Close();
    }

    
}