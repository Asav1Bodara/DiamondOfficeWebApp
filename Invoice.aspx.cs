using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Invoice : System.Web.UI.Page
{
    
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["utype"].ToString() != "Admin" && Session["utype"].ToString() != "Account")
            {
                Response.Redirect("DashBoard.aspx");
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            qry = "INSERT INTO tblInvoice (InvoiceDate,PacketNumber,CustomerID) VALUES ('" + txtInvoice.Text + "','" + ddlPacketNumber.SelectedValue + "','" + ddlCustomerCompany.SelectedValue + "')";
        }
        else
        {
            qry = "UPDATE tblInvoice SET InvoiceDate='" + txtInvoice.Text + "', PacketNumber='" + ddlPacketNumber.SelectedValue + "', CustoerID='" + ddlCustomerCompany.SelectedValue + "' WHERE InvoiceID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }
    protected void AllClear()
    {
        txtInvoice.Text = "";
        ddlPacketNumber.SelectedIndex = 0;
        ddlCustomerCompany.SelectedIndex = 0;
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblInvoice WHERE InvoiceID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        qry = "SELECT InvoiceID AS [ID], InvoiceDate AS [Invoice Date], PacketNumber AS [Packet No], CustomerCompany AS [Customer] FROM viewInvoice";
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
        qry = "SELECT * FROM tblInvoice WHERE InvoiceID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            txtInvoice.Text = Convert.ToDateTime(dr.GetValue(1).ToString()).ToString("dd-MMM-yyyy");
            ddlPacketNumber.SelectedValue = dr.GetValue(2).ToString();
            ddlCustomerCompany.SelectedValue = dr.GetValue(3).ToString();
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
            e.Row.Cells[2].Text = Convert.ToDateTime(e.Row.Cells[2].Text).ToString("dd-MMM-yyyy");
        }
    }
}