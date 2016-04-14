using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.General
{
    public partial class destroySession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userId"] = null;
            Session["userName"] = null;
            Session["fullName"] = null;
            Session["userType"] = null;
            Response.Redirect("login.aspx");
        }
    }
}