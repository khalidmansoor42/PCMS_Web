using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class doctorMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"].ToString() != "doctor" || Session["userType"] == null)
            {
                Response.Redirect("../General/destroySession.aspx");
            }
            else 
            {
                docName_lbl.Text = "Dr." + Session["fullName"].ToString();
                docNameTop_lbl.Text = "Dr." + Session["fullName"].ToString();
                userType_lbl.Text = Session["userType"].ToString();
                docNameMain_lbl.Text = "Dr." + Session["fullName"].ToString();
            }
        }
    }
}