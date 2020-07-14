using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
public partial class ForgetPassword : System.Web.UI.Page
{
    String qry;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        qry = "SELECT EmpPassword FROM tblEmployee WHERE EmpUserName='" + txtUsername.Text + "' AND EmpEmail='" + txtEmailid.Text + "' ";
        SqlDataReader dr = classDiamond.getRecords(qry);
        if (dr.Read())
        {
            String pwd = dr.GetValue(0).ToString();
            string text = "Hello!! Infinities welcomes you to the world of the dimaond. As our servers said you have forgotton your login password to our login in diamond office web application, This mail contains your password information and do not share this with any one! Regards, Diamond Office Web Application, The infinities!!";
            NetworkCredential loginInfo = new NetworkCredential("diamondinfinities@gmail.com", "helloinfinity");
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("originalgmail@gmail.com");
            msg.To.Add(new MailAddress(txtEmailid.Text));   //the email id where you need to send email.
            msg.Subject = "Your password recovery to Diamond Office Web App login";
            msg.Body = text +" Your password is " + pwd;
            msg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = loginInfo;
            client.Send(msg);
            //for sending email ends here

            lblmsg.Text = "Password has been sent to your Email ID";

            //lblmsg.Text = pwd;
        }
        else
        {
            dr.Close();
            lblmsg.Text = "User not found";
        }
    }
}