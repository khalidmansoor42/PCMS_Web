using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userId"] = "233";
            employeeId.Text = (string)(Session["userId"]); 
            dateToday.Text = DateTime.Today.ToString("yyyy-MM-dd");     
            
            
                   
        }
        [WebMethod(EnableSession = true)]
        public static string notification()
        {
            string PatientRegisterToday = "";
            string name = "";
            string patient_reg = "";
            string token = "";
            string employeeid = System.Web.HttpContext.Current.Session["userId"].ToString();
            string user_query = "select r.token_no,v.visit_no, p.full_name,v.patient_reg from visit v inner join patient_registeration p on v.patient_reg=p.patient_reg inner join receipt r on v.patient_reg=r.patient_reg and v.visit_date=r.Date where v.noti='1' and v.visit_date='"+DateTime.Today.ToString("yyyy-MM-dd")+ "' and v.employee_id='"+employeeid+"'";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = user_query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    token = dr["token_no"].ToString();
                    patient_reg = dr["patient_reg"].ToString();
                    name = dr["full_name"].ToString();
                    PatientRegisterToday = "                Token No"+ token.PadRight(21) + "Patient Id"+ patient_reg.PadRight(21) + "Name" + name;
                    updatenoti(patient_reg,dr["visit_no"].ToString());
                }
            }
            con.Close();
            return PatientRegisterToday;
        }
        public static void updatenoti(string id,string visit)
        {
            try
            {
                SqlConnection myConn = new SqlConnection(constring);
                String query = "update visit set noti=@noti where patient_reg=@patient_reg and visit_no=@visit ;";
                SqlCommand SelectCommand = new SqlCommand(query, myConn);
                SqlDataReader myReader;
                myConn.Open();
                SelectCommand.Parameters.Add(new SqlParameter("@patient_reg", id));
                SelectCommand.Parameters.Add(new SqlParameter("@noti", 3));
                SelectCommand.Parameters.Add(new SqlParameter("@visit",visit));
                myReader = SelectCommand.ExecuteReader();
                myConn.Close();
            }
            catch (Exception)
            {
            }
        }
        [WebMethod(EnableSession = true)]
        public static string ServerSideMethod()
        {
            return totalWaitingPatient() +"+"+ PatientChecks()+"+"+PatientRegister();
        }
        public static string totalWaitingPatient()
        {
            string totalWaitingPatient = "0";
            string employeeid = System.Web.HttpContext.Current.Session["userId"].ToString();
            string user_query = "select count(patient_reg) as totalPatient from visit where checks='0' and visit_date='" + DateTime.Today.ToString("yyyy-MM-dd") + "' and employee_id='" + 233 + "'";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = user_query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    totalWaitingPatient = dr["totalPatient"].ToString();
                   
                }
            }
            con.Close();
            return totalWaitingPatient;
        }
        public static string PatientChecks()
        {
            string totalPatientChecks = "0";
            string employeeid = System.Web.HttpContext.Current.Session["userId"].ToString();
            string user_query = "select count(patient_reg) as totalPatient from visit where checks='1' and visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "' and employee_id='" + 233 + "'";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = user_query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    totalPatientChecks = dr["totalPatient"].ToString();

                }
            }
            con.Close();
            return totalPatientChecks;
        }
        public static string PatientRegister()
        {
            string totalPatientChecks = "0";
            string employeeid = System.Web.HttpContext.Current.Session["userId"].ToString();
            string user_query = "select count(patient_reg) as totalPatient from patient_registeration where regDate='" + DateTime.Now.ToString("yyyy-MM-dd") + "' ";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = user_query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    totalPatientChecks = dr["totalPatient"].ToString();

                }
            }
            con.Close();
            return totalPatientChecks;
        }
        public static string PatientRegisterToday()
        {
            string PatientRegisterToday = "0";
            string employeeid = System.Web.HttpContext.Current.Session["userId"].ToString();
            string user_query = "select count(patient_reg) as totalPatient from visit where checks='1' and visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "' and employee_id='" + employeeid + "'";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = user_query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (dr.HasRows)
                {
                    PatientRegisterToday = dr["totalPatient"].ToString();

                }
            }
            con.Close();
            return PatientRegisterToday;
        }

        [System.Web.Services.WebMethod]
        public static string patientList()
        {
            string PatientRegisterToday = "No Patient";
            string name = "";
            string patient_reg = "";
            string token = "";

            string employeeid = System.Web.HttpContext.Current.Session["userId"].ToString();
            string user_query = "select distinct r.token_no,p.full_name,p.patient_reg from  receipt r inner join patient_registeration p on r.patient_reg=p.patient_reg inner join visit v on v.visit_no=r.visit_no and v.visit_date=r.receiptdate and v.checks='0' where r.employee_id =@employeeid and v.visit_date=@datetoday";
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.AddWithValue("@employeeid", employeeid);
            cmd.Parameters.AddWithValue("@datetoday", DateTime.Today.ToString("yyyy-MM-dd"));


            cmd.Connection = con;
            cmd.CommandText = user_query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                token = dr["token_no"].ToString();
                patient_reg = dr["patient_reg"].ToString();
                name = dr["full_name"].ToString();
                PatientRegisterToday = PatientRegisterToday + "+Token#=" + token.PadRight(21) + " ID=" + patient_reg.PadRight(21) + " Name=" + name;

            }

            return PatientRegisterToday;
        }  
    }
}