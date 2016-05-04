using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            emp.Text = Session["userId"].ToString();
            date.Text = DateTime.Today.ToString("yyyy-MM-dd");

        }
        protected void lnkView_Click(object sender, EventArgs e)
        { }
        }
}