using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Receptionist
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        FindAge agecal = new FindAge();
        maxValue max = new maxValue();
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string patientId= Request.QueryString["id"];
            string user_query = "select * from patient_registeration where patient_reg ='" + patientId+"'";
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
                    fullName_txt.Text= dr["full_name"].ToString();
                    fatherName_txt.Text= dr["father_name"].ToString();
                    if (dr["sex"].ToString() == "1")
                    {
                        gender_txt.Text = "Male";
                    }
                    else
                    {
                        gender_txt.Text = "Female";
                    }
                    mobileNumber_txt.Text= dr["mob"].ToString();
                    age_txt.Text = agecal.calculateAge(Convert.ToDateTime(dr["dob"].ToString()));
                }
            }
            con.Close();
        }

        protected void printReceipt_btn_Click(object sender, EventArgs e)
        {
            int token = max.max("select max(token_no) from receipt where Date = '" + DateTime.Today.ToString("yyyy-MM-dd") + "';") + 1;
            int reciept = max.max("select max(Receipt_id) from receipt") + 1;
            SqlConnection myConn = new SqlConnection(constring);
            String query = "insert into visit(patient_reg,visit_date,visit_no,employee_id,user_name,noti)values(@PatientId,@date,@VisitNo,@DoctorAssign,@user_name,@noti);insert into receipt(token_no, patient_reg, employee_id, total, Date, visit_no, receiptdate)values(@tokenNo, @PatientId, @DoctorAssign, @fee, @date, @VisitNo, @reciptNo)";
            SqlCommand SelectCommand = new SqlCommand(query, myConn);
            SqlDataReader myReader;
            SelectCommand.Parameters.Add(new SqlParameter("@PatientId", Convert.ToInt32(Request.QueryString["id"])));
            SelectCommand.Parameters.Add(new SqlParameter("@date", DateTime.Today));
            SelectCommand.Parameters.Add(new SqlParameter("@VisitNo", Convert.ToInt32("1")));
            SelectCommand.Parameters.Add(new SqlParameter("@DoctorAssign", assignDoctor_dd.SelectedValue));
            SelectCommand.Parameters.Add(new SqlParameter("@user_name", "muaz@yahoo.com"));
            SelectCommand.Parameters.Add(new SqlParameter("@tokenNo", token));
            SelectCommand.Parameters.Add(new SqlParameter("@noti", 1));
            SelectCommand.Parameters.Add(new SqlParameter("@fee", Convert.ToInt32(totalFee_txt.Text)));
            SelectCommand.Parameters.Add(new SqlParameter("@reciptNo", reciept));
            myConn.Open();
            myReader = SelectCommand.ExecuteReader();
            myConn.Close();
            Session["reciept"] = reciept;
            Response.Redirect("../Receptionist/PatientInvoice.aspx");

        }
    }
}