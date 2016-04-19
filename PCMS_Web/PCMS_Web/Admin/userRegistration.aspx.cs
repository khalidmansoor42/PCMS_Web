using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        Random rnd = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {
            int month = rnd.Next(1, 100);
            employeeId_txt.Text = Convert.ToString(month) + DateTime.Today.ToString("yyMM");
        }

        protected void save_btn_Click(object sender, EventArgs e)
        {
            string ageYear = ageCal.Text;
            string dob = "";
            string age = TextBox1.Text;

            if (ageYear == "Year")
            {
                if (age.Contains('.'))
                {
                    String[] substrings = age.Split('.');
                    string date = DateTime.Today.ToString("yyyy-MM-dd");
                    string[] words = date.Split('-');
                    string dateofbirth = Convert.ToString(Convert.ToInt32(Convert.ToString(words[0])) - Convert.ToInt32(substrings[0]));
                    words[0] = dateofbirth;
                    words[1] = Convert.ToString((Convert.ToInt32(words[1]) + Convert.ToInt32(substrings[1])));
                    dob = words[0] + "-" + words[1] + "-" + words[2];
                }
                else
                {
                    string date = DateTime.Today.ToString("yyyy-MM-dd");
                    string[] words = date.Split('-');
                    string dateofbirth = Convert.ToString(Convert.ToInt32(Convert.ToString(words[0])) - Convert.ToInt32(age));
                    words[0] = dateofbirth;
                    dob = words[0] + "-" + words[1] + "-" + words[2];
                }

            }
            else if (ageYear == "Month")
            {
                string date = DateTime.Today.ToString("yyyy-MM-dd");
                string[] words = date.Split('-');
                string dateofbirth = Convert.ToString(Convert.ToInt32(Convert.ToString(words[1])) - Convert.ToInt32(age));
                words[1] = dateofbirth;
                dob = words[0] + "-" + words[1] + "-" + words[2];
            }

            try
            {
                string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);


                String query = "INSERT INTO user_registeration(employee_id, full_name, father_name, sex, address, mob, cnic, dob, email, city_id, date_registeration, user_type, password, active)VALUES (@EmpId, @name, @fatherName, @gender,@address,@mobile,@cnic,@DOB,@email, @cityid,@regDate,@usertype,@pass,@active); "; 
                SqlCommand SelectCommand1 = new SqlCommand(query, con);
                SqlDataReader myReader1;
                con.Open();
                SelectCommand1.Parameters.Add(new SqlParameter("@EmpId", Convert.ToInt32(employeeId_txt.Text)));
                SelectCommand1.Parameters.Add(new SqlParameter("@cnic", cnic_txt.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@name", fullName_txt.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@fatherName", fatherName_txt.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@usertype", userType_dd.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@pass", password_txt.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@active", '1'));

                if (male_radio.Checked == true)
                {
                    SelectCommand1.Parameters.Add(new SqlParameter("@gender", Convert.ToInt32(1)));
                }
                else
                {
                    SelectCommand1.Parameters.Add(new SqlParameter("@gender", Convert.ToInt32(0)));
                };
                SelectCommand1.Parameters.Add(new SqlParameter("@address", address_area.Value));
                SelectCommand1.Parameters.Add(new SqlParameter("@cityid", Convert.ToInt32(city_dd.SelectedValue)));
                SelectCommand1.Parameters.Add(new SqlParameter("@mobile", mobileNumber_txt.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@email", email_txt.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@DOB", dob));
                SelectCommand1.Parameters.Add(new SqlParameter("@regDate", DateTime.Now.ToString("yyyy-MM-dd")));
                myReader1 = SelectCommand1.ExecuteReader();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex + "')</script>");
            }
        }
    }
}