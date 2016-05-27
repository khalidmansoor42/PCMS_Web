using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["PatientId"] != null)
                {
                    ReportViewer1.ShowReportBody = false;
                    patient.Text = Session["PatientId"].ToString();
                }
                else
                {
                    Response.Redirect("dashboard.aspx");
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            ReportViewer1.ShowReportBody = true;
            ReportViewer1.DocumentMapCollapsed = true;
            ReportViewer1.LocalReport.Refresh();
        }
    }
}