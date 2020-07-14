using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class DiamondInfo : System.Web.UI.Page
{
    string qry;
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
            qry = "INSERT INTO tblDiamondInfo (PacketNumber,DiamondType,CertiTypeID,CertificateNumber,CertificationDate,DiamondStatus,MarketRate,LaborRate) VALUES ('" + txtPacketNumber.Text + "','" + txtDiamondType.Text + "','" + ddlCertification.SelectedValue + "','" + txtCertiNumber.Text +"','" + txtCertiDate.Text + "','" + txtStatus.Text + "','" + txtMarketRate.Text + "', '" + txtLaborRate.Text + "')";
        }
        else
        {
            qry = "UPDATE tblDiamondInfo SET PacketNumber='" + txtPacketNumber.Text + "', DiamondType='" + txtDiamondType.Text + "', CertiTypeID='" + ddlCertification.SelectedValue + "',CertificateNumber='" + txtCertiNumber.Text + "', CertificationDate='" + txtCertiDate.Text + "', DiamondStatus='" + txtStatus.Text + "', MarketRate='" + txtMarketRate.Text + "', LaborRate='" + txtLaborRate.Text + "' WHERE PacketID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        }
        int i = classDiamond.setRecords(qry);
        AllClear();
        lblMsg.Text = "Record submitted successfully.";
    }

    protected void AllClear()
    {
        txtPacketNumber.Text = "";
        ddlCertification.SelectedIndex = 0;
        txtCertiNumber.Text = "";
        txtCertiDate.Text = "";
        txtDiamondType.Text = "";
        txtMarketRate.Text = "";
        txtLaborRate.Text = "";
        txtStatus.Text = "";
        lblMsg.Text = "";
        btnSubmit.Text = "Submit";
        btnDelete.Visible = false;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        qry = "DELETE FROM tblDiamondInfo WHERE PacketID='" + GridView1.SelectedRow.Cells[1].Text + "'";
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
        qry = "SELECT PacketID AS [ID], PacketNumber AS [Packet Number], DiamondType AS [Diamond Type], CertiTypeName AS [CertiType Name], CertificateNumber AS [Certificate Number], CertificationDate AS [Certi Date], DiamondStatus AS [Diamond Status], MarketRate AS [Market Rate], LaborRate AS [Labor Rate] FROM viewDiamondInfo";
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
        qry = "SELECT * FROM tblDiamondInfo WHERE PacketID='" + GridView1.SelectedRow.Cells[1].Text + "'";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            txtPacketNumber.Text = dr.GetValue(1).ToString();
            txtDiamondType.Text = dr.GetValue(2).ToString();
            ddlCertification.SelectedValue = dr.GetValue(3).ToString();
            txtCertiNumber.Text = dr.GetValue(4).ToString();
            txtCertiDate.Text = Convert.ToDateTime(dr.GetValue(5).ToString()).ToString("dd-MMM-yyyy");
            txtStatus.Text = dr.GetValue(6).ToString();
            txtMarketRate.Text = dr.GetValue(7).ToString();
            txtLaborRate.Text = dr.GetValue(8).ToString();
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
            e.Row.Cells[6].Text = Convert.ToDateTime(e.Row.Cells[6].Text).ToString("dd-MMM-yyyy");
        }
    }
}