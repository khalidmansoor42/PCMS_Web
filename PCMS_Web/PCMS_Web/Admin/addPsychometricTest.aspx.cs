﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Admin
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addTest_btn_Click(object sender, EventArgs e)
        {
            if (testName_txt.Text != "")
            {
                string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                String query = "INSERT INTO psychometric_evaluation_tests(test_name)VALUES(@testName); ";
                //String query = "INSERT INTO patient_registeration(patient_reg,cnic,full_name,father_name,sex,address,city_id,mob,email,attendant_name,relation_id,attendant_mob,dob,ref_doctor_id,martial_status,education,occupation_id,source)VALUES('3','"+ cnic.Text +"','"+ fullName.Text +"','+ fatherName.Text + ','1',' + TextArea1 + ',' + city_dd.SelectedValue + ',' + mobileNumber.Text + ',' + email.Text + ','+ attendantFullName.Text +',' + attendantRelation_dd.Text + ',' + attMobile.Text + ','+ dateOfBorth.Value.ToString() + ',' + referingDoctor_dd.SelectedValue + ','+ maritalStatus_dd.Text + ',' + patientEducation_dd.Text + ',' + occupationStatus_dd.SelectedValue + ','1'); ";

                SqlCommand SelectCommand1 = new SqlCommand(query, con);
                SqlDataReader myReader1;
                con.Open();
                SelectCommand1.Parameters.Add(new SqlParameter("@testName", testName_txt.Text));
                myReader1 = SelectCommand1.ExecuteReader();
                con.Close();
                testName_txt.Text = "";
                GridView1.DataSourceID = "TestDataSource";
            }
        }

        protected void searchTest_btn_Click(object sender, EventArgs e)
        {
            if (searchTest_txt.Text == "")
            {
                GridView1.DataSourceID = "TestDataSource";
            }
            else
            {
                GridView1.DataSourceID = "TestSearchDataSource";
            }
        }
    }
}