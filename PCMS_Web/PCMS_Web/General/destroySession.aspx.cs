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
    public partial class destroySession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Logout(Session["userId"].ToString());
            Session["userId"] = null;
            Session["userName"] = null;
            Session["fullName"] = null;
            Session["userType"] = null;
            Response.Redirect("login.aspx");

        }
        void Logout(string id)
        {
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
                string hostName = Dns.GetHostName(); // Retrive the Name of HOST
                // Get the IP
                string myIP = Dns.GetHostByName(hostName).AddressList[0].ToString();
                SqlConnection myConn = new SqlConnection(constring);
                String query = "update login_history set logout=@date where logout='0000-00-00 00:00:00' and employee_id=@id ;";
                SqlCommand SelectCommand = new SqlCommand(query, myConn);
                SqlDataReader myReader;
                myConn.Open();
                SelectCommand.Parameters.Add(new SqlParameter("@id", id));
                SelectCommand.Parameters.Add(new SqlParameter("@date", DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss")));
                

                myReader = SelectCommand.ExecuteReader();
                myConn.Close();

            }

            catch (Exception ex)
            {

            }
        }
    }
}