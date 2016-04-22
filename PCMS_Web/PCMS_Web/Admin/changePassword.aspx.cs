using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod(EnableSession = true)]
        public static string ServerSideMethod(string name, string age, string conpass)
        {
            if (age == conpass)
            {
                string ret = "";
                try
                {
                    string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
                    string id;
                    string userName = System.Web.HttpContext.Current.Session["userName"].ToString();
                    string user_query = "Select password from user_registeration where user_name='" + userName + "'";
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = user_query;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        id = dr["password"].ToString();
                        if (id == name)
                        {
                            ret = passwordchange(age); ;
                        }
                        else
                        {
                            ret = "Previous Password Did Not Match+Error";
                        }
                    }
                }
                catch (Exception ex)
                {
                    ret = ex.Message + "+Error";
                }
                return ret;
            }
            else
            {
                return "Your New Passwords Do Not Match+Error";
            }
        }
        public static string passwordchange(string newpass)
        {
            string ret = "";
            string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
            try
            {
                SqlConnection myConn = new SqlConnection(constring);
                String quray = "update user_registeration set password=@1 where user_name=@2   ;";
                SqlCommand SelectCommand = new SqlCommand(quray, myConn);
                SqlDataReader myReader;
                string userName = System.Web.HttpContext.Current.Session["userName"].ToString();
                SelectCommand.Parameters.Add(new SqlParameter("@1", newpass));
                SelectCommand.Parameters.Add(new SqlParameter("@2", userName));
                myConn.Open();
                myReader = SelectCommand.ExecuteReader();
                myConn.Close();
                ret = "Password Changed Successfully";
            }
            catch (Exception ex)
            {
                ret = ex.Message;
            }
            return ret;
        }
    }
}