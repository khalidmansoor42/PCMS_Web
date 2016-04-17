using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace PCMS_Web.Receptionist
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        
        ReportParameter[] parameters = new ReportParameter[18];
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        string mob = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                
                Response.Redirect("../General/destroySession.aspx");
            }
            else if (Session["userType"].ToString() != "staff")
            {
                Response.Redirect("../General/destroySession.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            this.ReportViewer1.ShowPrintButton = true;


            string receiptid = Session["reciept"].ToString(); ;

        string user_query = "SELECT p.full_name,p.patient_reg,r.Date,r.token_no,r.Receipt_id,r.total,r.Receipt_id,r.visit_no,u.full_name as DocName FROM receipt r inner join patient_registeration p on r.patient_reg = p.patient_reg inner join user_registeration u on r.employee_id=u.employee_id where r.Receipt_id =" + receiptid;
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
            cmd.CommandText = user_query;

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //for insert remove data reader and replace cmd.executenonquery()
                if (dr.HasRows)
                {
                    this.ReportViewer1.LocalReport.ReportEmbeddedResource = "Reports//Receipt.rdlc";
                    ReportParameter rp = new ReportParameter("Patientid", dr["patient_reg"].ToString());
                    ReportParameter rp1 = new ReportParameter("Name", dr["full_name"].ToString());
                    ReportParameter rp2 = new ReportParameter("date", dr["Date"].ToString());
                    ReportParameter rp3 = new ReportParameter("token",  dr["token_no"].ToString());
                    ReportParameter rp4 = new ReportParameter("userName", "muaz");
                    ReportParameter rp5 = new ReportParameter("invNo", dr["Receipt_id"].ToString());
                    ReportParameter rp6 = new ReportParameter("doc", dr["DocName"].ToString());
                    ReportParameter rp7 = new ReportParameter("fee", dr["total"].ToString());
                    ReportParameter rp8 = new ReportParameter("Name", dr["Receipt_id"].ToString());
                    ReportParameter rp9 = new ReportParameter("visitNo", dr["visit_no"].ToString());
                    this.ReportViewer1.LocalReport.SetParameters(new ReportParameter[] { rp, rp1, rp2, rp3, rp4, rp5, rp6, rp7, rp8, rp9 });
                }
            }
            


        }

        protected void Button2_Click(object sender, EventArgs e)
        {           
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {

        }
    }
}