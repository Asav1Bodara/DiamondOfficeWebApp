using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class rptLaborInformation : System.Web.UI.Page
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
            qry = "SELECT [LaborTypeName] FROM [tblLaborType]";
            SqlDataReader dr = classDiamond.getRecords(qry);
            ddltype.DataSource = dr;
            ddltype.DataBind();
            ddltype.Items.Insert(0, "-- select --");

        }

    }


    protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[6].Text = Convert.ToDateTime(e.Row.Cells[6].Text).ToString("dd-MMM-yyyy");
            e.Row.Cells[7].Text = Convert.ToDateTime(e.Row.Cells[7].Text).ToString("dd-MMM-yyyy");
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (ddltype.SelectedIndex == 0)
        {
            qry = "SELECT LaborName AS [Labor Name], LaborPhone AS [Labor Phone], LaborAddress AS [Labor Address], CityName AS [City Name], LaborType AS [Labor Type], Gender AS [Gen], LaborDOB AS [Labor DOB], LaborDOJ AS [Labor DOJ] FROM viewLabor WHERE LaborName LIKE '" + txtName.Text + "%'";
        }
        else
        {
            qry = "SELECT LaborName AS [Labor Name], LaborPhone AS [Labor Phone], LaborAddress AS [Labor Address], CityName AS [City Name], LaborType AS [Labor Type], Gender AS [Gen], LaborDOB AS [Labor DOB], LaborDOJ AS [Labor DOJ] FROM viewLabor WHERE LaborName LIKE '" + txtName.Text + "%' AND LaborType = '" + ddltype.SelectedValue +"'";
        }
        SqlDataReader dr = classDiamond.getRecords(qry);
        GridView1.DataSource = dr;
        GridView1.DataBind();
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        // Clear all content output from the buffer stream
        Response.ClearContent();
        // Specify the default file name using "content-disposition" RESPONSE header
        Response.AppendHeader("content-disposition", "attachment; filename=LaborInformation.xls");
        // Set excel as the HTTP MIME type
        Response.ContentType = "application/excel";
        // Create an instance of stringWriter for writing information to a string
        System.IO.StringWriter stringWriter = new System.IO.StringWriter();
        // Create an instance of HtmlTextWriter class for writing markup 
        // characters and text to an ASP.NET server control output stream
        HtmlTextWriter htw = new HtmlTextWriter(stringWriter);

        // Set white color as the background color for gridview header row
        GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");

        // Set background color of each cell of GridView1 header row
        foreach (TableCell tableCell in GridView1.HeaderRow.Cells)
        {
            tableCell.Style["background-color"] = "#A55129";
        }

        // Set background color of each cell of each data row of GridView1
        foreach (GridViewRow gridViewRow in GridView1.Rows)
        {
            gridViewRow.BackColor = System.Drawing.Color.White;
            foreach (TableCell gridViewRowTableCell in gridViewRow.Cells)
            {
                gridViewRowTableCell.Style["background-color"] = "#FFF7E7";
            }
        }
        GridView1.RenderControl(htw);
        Response.Write(stringWriter.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
}