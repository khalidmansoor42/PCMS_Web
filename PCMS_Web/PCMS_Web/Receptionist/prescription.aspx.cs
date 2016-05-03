﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Receptionist
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            ReportViewer1.ShowReportBody = true;
            ReportViewer1.DocumentMapCollapsed = true;
            ReportViewer1.LocalReport.Refresh();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ReportViewer1.ShowReportBody = false;
                patient.Text = "941604";
            }
        }
    }
}