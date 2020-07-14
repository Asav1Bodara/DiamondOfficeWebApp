using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class PurchaseInfo : System.Web.UI.Page
{
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["utype"].ToString() != "Admin" && Session["utype"].ToString() != "Purchase")
            {
                Response.Redirect("DashBoard.aspx");
            }
        }

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tblPurchaseInfo (SupplierID,ImportDate,PacketNumber) VALUES ('" + ddlSupplierCompany.SelectedValue + "','" + txtImpDate.Text + "','" + txtPacketNumber.Text + "')";

        }
        else
        {
            qry = "UPDATE tblPurchaseInfo SET SupplierID= '" + ddlSupplierCompany.SelectedValue + "', ImportDate='" + txtImpDate.Text + "', PacketNumber='" + txtPacketNumber.Text + "' WHERE PurchaseID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }
    protected void AllClear()
    {
        ddlSupplierCompany.SelectedIndex = 0;
        txtImpDate.Text = "";
        txtPacketNumber.Text = "";
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblPurchaseInfo WHERE PurchaseID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        qry = "SELECT PurchaseID AS [ID], CompanyName AS [Company Name], ImportDate AS [Import Date], PacketNumber AS [Packet Number] FROM viewPurchaseInfo";
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
        qry = "SELECT * FROM tblPurchaseInfo WHERE PurchaseID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            ddlSupplierCompany.SelectedValue = dr.GetValue(1).ToString();
            txtImpDate.Text = Convert.ToDateTime(dr.GetValue(2).ToString()).ToString("dd-MMM-yyyy");
            txtPacketNumber.Text= dr.GetValue(3).ToString();

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