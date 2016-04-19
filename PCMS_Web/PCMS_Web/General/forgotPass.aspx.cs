using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.General
{
    public partial class forgotPass : System.Web.UI.Page
    {
        string fullName = "", userName = "", userType = "", password = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "refresh", "window.setTimeout('window.location.reload(true);',120000);", true);
            }
        }

        protected void changePassword_btn_Click(object sender, EventArgs e)
        {
            string passQuery = "select * from user_registeration where email ='" + userEmail_txt.Value + "'";
            string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = passQuery;
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            //for insert remove data reader and replace cmd.executenonquery()
            if (dr.Read())
            {
                if (dr.HasRows)
                {
                    password = dr["password"].ToString();
                    userType = dr["user_type"].ToString();
                    fullName = dr["full_name"].ToString();
                    try
                    {
                        // Gmail Address from where you send the mail
                        var fromAddress = "dairysolutionlahore.inquiry@gmail.com";
                        // any address where the email will be sending
                        var toAddress = "khalidmansoor92@gmail.com";
                        //Password of your gmail address
                        const string fromPassword = "dairysolution123";
                        // Passing the values and make a email formate to display
                        string subject = "Password Confirmation";

                        string body = "From: " + "Pyschiatrist Clinic Management System" + "\n";
                        body += "Subject: " + "Password Retrieval" + "\n\n";
                        body += "Dear " + fullName + ",\n\nYour password is :" + password + "\nPlease visit http://www.psychcure.com/login.aspx to go to your login page.\n\nBest Regards,\nTech Agentx\nhttp://www.techagentx.com";

                        // smtp settings
                        var smtp = new System.Net.Mail.SmtpClient();
                        {
                            smtp.Host = "smtp.gmail.com";
                            smtp.Port = 587;
                            smtp.EnableSsl = true;
                            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                            smtp.Timeout = 20000;
                        }
                        // Passing values to smtp object
                        smtp.Send(fromAddress, toAddress, subject, body);
                        errorMsg_alert.Visible = false;
                        successMsg_alert.InnerText = "An email has been sent to your email address. Please check your inbox.";
                        successMsg_alert.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        errorMsg_alert.InnerText = ex.Message;
                        errorMsg_alert.Visible = true;
                    }
                }
                else
                {
                    errorMsg_alert.InnerText = "Wrong email entered!";
                    errorMsg_alert.Visible = true;
                }
            }
            else
            {
                errorMsg_alert.InnerText = "Wrong email entered!";
                errorMsg_alert.Visible = true;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyFun1", "setTimeout();", true);
            }
            con.Close();
        }
    }
}