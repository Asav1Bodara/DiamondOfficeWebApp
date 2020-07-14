using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Bundling : System.Web.UI.Page
{
    string qry;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tblBundle(BundleName,BundlePrice) VALUES ('" + txtBundleName.Text + "','" + txtRate.Text + "')";
        }
        else
        {
            qry = "UPDATE tblBundle SET BundleName='" + txtBundleName.Text + "',BundlePrice='" + txtRate.Text + "' WHERE BundleID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }

    protected void AllClear()
    {
        txtRate.Text = "";
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblBundle WHERE BundleID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        qry = "SELECT * FROM tblBundle";
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
        Response.Redirect("DashBoard.aspx");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        AllClear();
        pnlView.Visible = false;
        pnlTable.Visible = true;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        qry = "SELECT * FROM tblBundle WHERE BundleID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            txtBundleName.Text = dr.GetValue(1).ToString();
            txtRate.Text = dr.GetValue(2).ToString();
            btnSubmit.Text = "Update";
            btnDelete.Visible = true;
            pnlView.Visible = false;
            pnlTable.Visible = true;
        }
        dr.Close();
    }
}