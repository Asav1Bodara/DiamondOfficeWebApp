using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class CustomerDashboard : System.Web.UI.Page
{
    string query,query1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            query = "SELECT * FROM tblInvoice WHERE CustomerID='" + Session["uid"].ToString() + "'";
            SqlDataReader dr = classDiamond.getRecords(query);
            ddlPacketNo.DataTextField = "PacketNumber";
            ddlPacketNo.DataValueField = "PacketNumber";
            ddlPacketNo.DataSource = dr;
            ddlPacketNo.DataBind();
        }
    }

    protected void btnInvoice_Click(object sender, EventArgs e)
    {
        query = "SELECT * FROM viewDiamond WHERE PacketNumber='" + ddlPacketNo.SelectedValue + "'";
        SqlDataReader dr = classDiamond.getRecords(query);
        if (dr.Read())
        {
            lblInvoiceNo.Text = dr.GetValue(0).ToString();
            lblDate.Text = dr.GetValue(1).ToString();
            lblPacketNumber.Text = dr.GetValue(3).ToString();
            lblCompany.Text = dr.GetValue(11).ToString();
            double rt = Convert.ToDouble(dr.GetValue(9).ToString()) + Convert.ToDouble(dr.GetValue(10).ToString());
            lblRate.Text = rt.ToString();

        }

        pnlView.Visible = true;
        pnlTable.Visible = false;
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        AllClear();
        pnlView.Visible = false;
        pnlTable.Visible = true;
    }

    protected void AllClear()
    {        
        lblMsg.Text = "";
    }

}