using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("../General/destroySession.aspx");
            }
            else if (Session["userType"].ToString() != "doctor")
            {
                Response.Redirect("../General/destroySession.aspx");
            }
        }
    }
}