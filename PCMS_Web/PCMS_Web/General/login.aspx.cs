using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.General
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void signinBtn_Click(object sender, EventArgs e)
        {
            string userType = "";
            string user_query = "select * from user_registeration where email ='" + userEmail.Value + "' and password = '" + userPassword.Value + "'";
            string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
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
                        Response.Redirect("../Doctor/dashboard.aspx");   
                    }
                    else if(userType == "staff")
                    {
                        Response.Redirect("../Receptionist/dashboard.aspx");
                    }
                    else if (userType == "admin")
                    {
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
    }
}