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
    public partial class WebForm1 : System.Web.UI.Page
    {
        Random rnd = new Random();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("../General/login.aspx");
            //}
            // creates a number between 1 and 12
            int month = rnd.Next(1, 100);
            patientId_txt.Text = Convert.ToString(month)+DateTime.Today.ToString("yyMM");
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
                SqlConnection con = new  SqlConnection(constring);
                String query = "INSERT INTO patient_registeration(patient_reg,cnic,full_name,father_name,sex,address,city_id,mob,email,attendant_name,relation_id,attendant_mob,dob,ref_doctor_id,martial_status,education,occupation_id,source)VALUES(@patient_reg,@cnic,@name,@fatherName,@gender,@address,@cityid,@mobile,@email,@attName,@attRelationId,@attmob,@DOB,@referDoctorID,@MaritalStatus,@education,@occupation_id,@source); ";
                //String query = "INSERT INTO patient_registeration(patient_reg,cnic,full_name,father_name,sex,address,city_id,mob,email,attendant_name,relation_id,attendant_mob,dob,ref_doctor_id,martial_status,education,occupation_id,source)VALUES('3','"+ cnic.Text +"','"+ fullName.Text +"','+ fatherName.Text + ','1',' + TextArea1 + ',' + city_dd.SelectedValue + ',' + mobileNumber.Text + ',' + email.Text + ','+ attendantFullName.Text +',' + attendantRelation_dd.Text + ',' + attMobile.Text + ','+ dateOfBorth.Value.ToString() + ',' + referingDoctor_dd.SelectedValue + ','+ maritalStatus_dd.Text + ',' + patientEducation_dd.Text + ',' + occupationStatus_dd.SelectedValue + ','1'); ";

                SqlCommand SelectCommand1 = new  SqlCommand(query, con);
                SqlDataReader myReader1;
                con.Open();
                SelectCommand1.Parameters.Add(new SqlParameter("@patient_reg",Convert.ToInt32(patientId_txt.Text)));
                SelectCommand1.Parameters.Add(new SqlParameter("@cnic", cnic.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@name", fullName.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@fatherName", fatherName.Text));
                if (inlineRadio1.Checked == true)
                {
                    SelectCommand1.Parameters.Add(new SqlParameter("@gender", Convert.ToInt32(1)));
                }
                else
                {
                    SelectCommand1.Parameters.Add(new SqlParameter("@gender", Convert.ToInt32(0)));
                };
                SelectCommand1.Parameters.Add(new SqlParameter("@address", "dfsdfsd"));
                SelectCommand1.Parameters.Add(new SqlParameter("@cityid", Convert.ToInt32(city_dd.SelectedValue)));
                SelectCommand1.Parameters.Add(new SqlParameter("@mobile", mobileNumber.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@email", email.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@attName", attendantFullName.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@attRelationId", Convert.ToInt32(attendantRelation_dd.SelectedValue)));
                SelectCommand1.Parameters.Add(new SqlParameter("@attmob", attMobile.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@DOB", dateOfBorth.Value.ToString()));
                SelectCommand1.Parameters.Add(new SqlParameter("@referDoctorID", Convert.ToInt32(referingDoctor_dd.SelectedValue)));
                SelectCommand1.Parameters.Add(new SqlParameter("@MaritalStatus", maritalStatus_dd.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@education", patientEducation_dd.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@occupation_id", Convert.ToInt32(occupationStatus_dd.SelectedValue)));
                if (reliableRadio.Checked== true){
                    SelectCommand1.Parameters.Add(new SqlParameter("@source", Convert.ToInt32(1)));
                }
                else 

                {
                    SelectCommand1.Parameters.Add(new SqlParameter("@source", Convert.ToInt32(0)));
                }

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