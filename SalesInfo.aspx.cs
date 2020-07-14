using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class SalesInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["utype"].ToString() != "Sales" && Session["utype"].ToString() != "Admin" )
            {
                Response.Redirect("DashBoard.aspx");
            }
        }
    }

    string qry;
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tblSalesInfo (CustomerID,SellingDate,PacketNumber) VALUES ('" + ddlCustomer.SelectedValue + "','" + txtSellingDate.Text + "','" + ddlPacketNo.SelectedValue + "')";
        }
        else
        {
            qry = "UPDATE tblSalesInfo SET CustomerID='" + ddlCustomer.SelectedValue + "', SellingDate='" + txtSellingDate.Text + "', PacketNumber='" + ddlPacketNo.SelectedValue + "' WHERE SalesID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }
    protected void AllClear()
    {
        ddlCustomer.SelectedIndex = 0;
        txtSellingDate.Text = "";
        ddlPacketNo.SelectedIndex = 0;
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblSalesInfo WHERE SalesID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        qry = "SELECT SalesID AS [ID], CustomerCompany AS [Company Name], SellingDate AS [Selling Date], PacketNumber AS [Packet Number] FROM viewSalesInfo";
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
        qry = "SELECT * FROM tblSalesInfo WHERE SalesID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            ddlCustomer.SelectedValue = dr.GetValue(1).ToString();
            txtSellingDate.Text = Convert.ToDateTime(dr.GetValue(2).ToString()).ToString("dd-MMM-yyyy");
            ddlPacketNo.SelectedValue = dr.GetValue(3).ToString();
            btnSubmit.Text = "Update";
            btnDelete.Visible = true;

            pnlView.Visible = false;
            pnlTable.Visible = true;
        }
        dr.Close();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[3].Text = Convert.ToDateTime(e.Row.Cells[3].Text).ToString("dd-MMM-yyyy");
        }
    }
}