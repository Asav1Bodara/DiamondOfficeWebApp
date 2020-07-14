using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Demand : System.Web.UI.Page
{
    string query, query1;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRate_Click(object sender, EventArgs e)
    {
        query = "SELECT * FROM tblRatepc WHERE DiamondType='" + ddlType.SelectedValue + "'";
        SqlDataReader dr = classDiamond.getRecords(query);
        lblType.Text = ddlType.SelectedValue;
        if (dr.Read())
        {
            lblRate.Text = dr.GetValue(2).ToString();
        }
        if (ddlType.SelectedValue == "Pan" || ddlType.SelectedValue == "Marquees")
        {
            lblTemp.Text = "Pan Marquees";
            query1 = "SELECT * FROM tblBundle where BundleName= '" + lblTemp.Text + "'";
            SqlDataReader dr1 = classDiamond.getRecords(query1);
            lblpktMsg.Text = "Along with Pan you can buy Marquees it will make better pair";
            if (dr1.Read())
            {
                lblRateBundle.Text = dr1.GetValue(2).ToString();
            }
        }
            if (ddlType.SelectedValue == "Round" || ddlType.SelectedValue == "Oval")
            {
                lblTemp.Text = "Round Oval";

                query1 = "SELECT * FROM tblBundle where BundleName= '" + lblTemp.Text + "'";
                SqlDataReader dr2 = classDiamond.getRecords(query1);
                lblpktMsg.Text = "Along with Round you can buy Oval it will make better pair";
                if (dr2.Read())
                {
                    lblRateBundle.Text = dr2.GetValue(2).ToString();
                }
            }

           if(ddlType.SelectedValue == "Princess" || ddlType.SelectedValue == "Radiant")
            {
                lblTemp.Text = "Princess Radiant";
                query1 = "SELECT * FROM tblBundle where BundleName= '" + lblTemp.Text + "'";
                SqlDataReader dr3 = classDiamond.getRecords(query1);
                lblpktMsg.Text = "Along with Princess you can buy Radiant it will make better pair";
                if (dr3.Read())
                {
                    lblRateBundle.Text = dr3.GetValue(2).ToString();
                }
            }

            if (ddlType.SelectedValue == "Cushion" || ddlType.SelectedValue == "Pear")
            {
                lblTemp.Text = "Cushion Pear";
                query1 = "SELECT * FROM tblBundle where BundleName= '" + lblTemp.Text + "'";
                SqlDataReader dr4 = classDiamond.getRecords(query1);
                lblpktMsg.Text = "Along with Cushion you can buy Pear it will make better pair";
                if (dr4.Read())
                {
                    lblRateBundle.Text = dr4.GetValue(2).ToString();
                }
            }

            if (ddlType.SelectedValue == "Heart" || ddlType.SelectedValue == "Asshcher")
            {
                lblTemp.Text = "Heart Asshcher";
                query1 = "SELECT * FROM tblBundle where BundleName= '" + lblTemp.Text + "'";
                SqlDataReader dr5 = classDiamond.getRecords(query1);
                lblpktMsg.Text = "Along with Heart you can buy Asshcher it will make better pair";
                if (dr5.Read())
                {
                    lblRateBundle.Text = dr5.GetValue(2).ToString();
                }
            }

            if (ddlType.SelectedValue == "Rough" || ddlType.SelectedValue == "Mix")
            {
                lblTemp.Text = "Rough Mix";
                query1 = "SELECT * FROM tblBundle where BundleName= '" + lblTemp.Text + "'";
                SqlDataReader dr6 = classDiamond.getRecords(query1);
                lblpktMsg.Text = "Along with Rough you can buy Mix diamonds it will make better pair";
                if (dr6.Read())
                {
                    lblRateBundle.Text = dr6.GetValue(2).ToString();
                }
            }

            if (ddlType.SelectedValue == "Emerald" || ddlType.SelectedValue == "Rose")
            {
                lblTemp.Text = "Emerald Rose";
                query1 = "SELECT * FROM tblBundle where BundleName= '" + lblTemp.Text + "'";
                SqlDataReader dr6 = classDiamond.getRecords(query1);
                lblpktMsg.Text = "Along with Rose you can buy Emerald it will make better pair";
                if (dr6.Read())
                {
                    lblRateBundle.Text = dr6.GetValue(2).ToString();
                }
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