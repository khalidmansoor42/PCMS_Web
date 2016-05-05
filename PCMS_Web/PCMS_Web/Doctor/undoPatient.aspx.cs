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
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            emp.Text = Session["userId"].ToString();
            date.Text = DateTime.Today.ToString("yyyy-MM-dd");

        }
        protected void lnkView_Click(object sender, EventArgs e)
        {
            GridViewRow grdrow = (GridViewRow)((LinkButton)sender).NamingContainer;
            string token = grdrow.Cells[2].Text;
            string patient_reg = grdrow.Cells[1].Text;
            string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;

            try
            {
                SqlConnection myConn = new SqlConnection(constring);
                string query = "UPDATE visit SET visit.checks='0' where patient_reg='"+ patient_reg + "' AND visit_date='"+ DateTime.Now.ToString("yyyy-MM-dd") + "' and visit.visit_no=(select visit_no from receipt where receipt.token_no='"+ token + "' and receipt.receiptdate='"+ DateTime.Now.ToString("yyyy-MM-dd") + "')";
                SqlCommand SelectCommand = new SqlCommand(query, myConn);
                SqlDataReader myReader;
                myConn.Open();
                SelectCommand.Parameters.Add(new SqlParameter("@2", DateTime.Now.ToString("yyyy-MM-dd")));
                SelectCommand.Parameters.Add(new SqlParameter("@3", token));
                SelectCommand.Parameters.Add(new SqlParameter("@1", Convert.ToInt32(patient_reg)));
                
                myReader = SelectCommand.ExecuteReader();
                myConn.Close();
                Response.Redirect("~/Doctor/dashboard.aspx");


            }
            catch (Exception ex)
            {

            }

        }
    }
}