using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Receptionist
{
    public partial class receptionMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["userType"] == null)
            //{
            //    Response.Redirect("../General/destroySession.aspx");
            //}
            //else if (Session["userType"].ToString() != "staff")
            //{
            //    Response.Redirect("../General/destroySession.aspx");
            //}
            //else
            //{
            //    docName_lbl.Text = Session["fullName"].ToString();
            //    docNameTop_lbl.Text = Session["fullName"].ToString();
            //    userType_lbl.Text = Session["userType"].ToString();
            //    docNameMain_lbl.Text = Session["fullName"].ToString();
            //}
        }
    }
}