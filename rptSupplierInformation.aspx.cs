using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class rptSupplierInformation : System.Web.UI.Page
{
    string qry;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["utype"].ToString() != "Sales" && Session["utype"].ToString() != "Admin")
            {
                Response.Redirect("DashBoard.aspx");
            }
        }
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        // Clear all content output from the buffer stream
        Response.ClearContent();
        // Specify the default file name using "content-disposition" RESPONSE header
        Response.AppendHeader("content-disposition", "attachment; filename=CustomerInformation.xls");
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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtName.Text == "")
        {
            qry = "SELECT CompanyName AS [Company Name], CompanyContact AS [Company Contact], CompanyAddress AS [Company Address], CityName AS [City Name], StateName As [State Name], CompanyCountry AS [Company Country] FROM viewSupplier WHERE CompanyName LIKE '" + txtName.Text + "%'";
        }
        else
        {
            qry = "SELECT CompanyName AS [Company Name], CompanyContact AS [Company Contact], CompanyAddress AS [Company Address], CityName AS [City Name], StateName As [State Name], CompanyCountry AS [Company Country] FROM viewSupplier WHERE CompanyName LIKE '" + txtName.Text + "'";
        }
        SqlDataReader dr = classDiamond.getRecords(qry);
        GridView1.DataSource = dr;
        GridView1.DataBind();
    }
}