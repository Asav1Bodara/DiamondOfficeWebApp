using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
public partial class Payment : System.Web.UI.Page
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
            qry = "INSERT INTO tblPayment (PurchasedPacket,PayDate,SupplierID,PayAmount,PayMode,BankName,TransactionID) VALUES ('" + ddlPurchaseID.SelectedValue + "','" + txtPayDate.Text + "','" + ddlSupplier.SelectedValue + "','" + txtAmount.Text + "','" + ddlMode.SelectedValue + "','" + txtBankName.Text + "','" + txtTransaction.Text + "')";

        }
        else
        {
            qry = "UPDATE tblPayment SET PurchasedPacket='" + ddlPurchaseID.SelectedValue + "', PayDate='" + txtPayDate.Text + "', SupplierID='" + ddlSupplier.SelectedValue + "', PayAmount='" + txtAmount.Text + "', PayMode='" + ddlMode.SelectedValue + "', BankName='" + txtBankName.Text + "', TransactionID='" + txtTransaction.Text + "' WHERE PayID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }
    protected void AllClear()
    {
        //ddlPurchaseID.SelectedIndex = 0;
        txtPayDate.Text = "";
        //ddlSupplier.SelectedIndex = 0;
        txtAmount.Text = "";
        ddlMode.SelectedIndex = 0;
        txtBankName.Text = "";
        txtTransaction.Text = "";

        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblPayment WHERE PayID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record DELETED successfully.";
    }

    protected void FillGrid()
    {
        qry = "SELECT PayID AS [ID], PurchasedPacket AS [Purchased Packet], PayDate AS [Payment Date],CompanyName AS [Company Name], PayAmount AS [Payment Amount], PayMode AS [Payment Mode], BankName AS [Bank Name], TransactionID AS [Transaction ID]  FROM viewPayment";
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
        qry = "SELECT * FROM tblPayment WHERE PayID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            ddlPurchaseID.SelectedValue = dr.GetValue(1).ToString();
            txtPayDate.Text = Convert.ToDateTime(dr.GetValue(2).ToString()).ToString("dd-MMM-yyyy");
            ddlSupplier.SelectedValue = dr.GetValue(3).ToString();
            txtAmount.Text = dr.GetValue(4).ToString();
            ddlMode.SelectedValue = dr.GetValue(5).ToString();
            txtBankName.Text = dr.GetValue(6).ToString();
            txtTransaction.Text = dr.GetValue(7).ToString();
            btnSubmit.Text = "Update";
            btnDelete.Visible = true;
            pnlView.Visible = false;
            pnlTable.Visible = true;
        }
        dr.Close();
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        FillGrid();
        pnlView.Visible = true;
        pnlTable.Visible = false;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[3].Text = Convert.ToDateTime(e.Row.Cells[3].Text).ToString("dd-MMM-yyyy");
        }
    }
}