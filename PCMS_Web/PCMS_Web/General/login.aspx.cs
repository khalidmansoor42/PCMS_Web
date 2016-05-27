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
    public partial class login : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void signinBtn_Click(object sender, EventArgs e)
        {
            string userType = "";
            string user_query = "select * from user_registeration where email ='" + userEmail.Value + "' and password = '" + userPassword.Value + "'";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandTimeout = 120;
            cmd.CommandText = user_query;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //for insert remove data reader and replace cmd.executenonquery()
                if (dr.HasRows)
                {
                    Session["userId"] = dr["employee_id"];
                    Session["userName"] = dr["user_name"];
                    Session["fullName"] = dr["full_name"];
                    Session["userType"] = dr["user_type"];
                    userType = dr["user_type"].ToString();

                    if(userType == "doctor")
                    {
                        logindetail(Session["userId"].ToString());
                        Response.Redirect("../Doctor/dashboard.aspx");   
                    }
                    else if(userType == "staff")
                    {
                        logindetail(Session["userId"].ToString());
                        Response.Redirect("../Receptionist/dashboard.aspx");
                    }
                    else if (userType == "admin")
                    {
                        logindetail(Session["userId"].ToString());
                        Response.Redirect("../Admin/dashboard.aspx");
                    }
                    else 
                    {
                        Response.Redirect("login.aspx");
                    }
                }
            }
            con.Close();

            errorMsg_alert.Visible = true;
        }
        public void  logindetail(string email)
        {
            try
            {
                string hostName = Dns.GetHostName(); // Retrive the Name of HOST
                // Get the IP
                string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();
                SqlConnection myConn = new SqlConnection(constring);
                String query = "insert into login_history (employee_id,login,ip_address,hostName,logout)VALUES(@email,@date,@ip,@host,@logout) ";
                SqlCommand SelectCommand = new SqlCommand(query, myConn);
                SqlDataReader myReader;
                myConn.Open();               
                SelectCommand.Parameters.Add(new SqlParameter("@email", email));
                SelectCommand.Parameters.Add(new SqlParameter("@date", DateTime.Now));
                SelectCommand.Parameters.Add(new SqlParameter("@ip", myIP));
                SelectCommand.Parameters.Add(new SqlParameter("@host", hostName));
                SelectCommand.Parameters.Add(new SqlParameter("@logout","0000-00-00 00:00:00"));
                
                myReader = SelectCommand.ExecuteReader();
                myConn.Close();

            }

            catch (Exception ex)
            {

            }
        }
    }
}