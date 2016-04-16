using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("../General/destroySession.aspx");
            }
            else if (Session["userType"].ToString() != "admin")
            {
                Response.Redirect("../General/destroySession.aspx");
            }
        }
        protected void searchPatient_btn_Click(object sender, EventArgs e)
        {
            if (searchPatient_txt.Text == "")
            {
                GridView1.DataSourceID = "PatientDataSource";
            }
            else
            {
                GridView1.DataSourceID = "PatientSearchDataSource";
            }
        }
    }
}