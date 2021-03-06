﻿using PCMS_Web.Class;
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
    public partial class WebForm9 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        string id = "";
        getInformation info = new getInformation();
        string[] patientInfo = new string[4];
        maxValue obj1 = new maxValue();
        int maxvisit = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
           // patient.Text = "561604";
            if (Session["PatientId"] != null)
                //{
                //patientInfo = info.information("SELECT a.full_name, a.father_name,a.dob, b.visit_no FROM patient_registeration a, visit b  WHERE a.patient_reg = b.patient_reg  AND b.visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'And  a.patient_reg ='" + Session["PatientId"].ToString() + "' And b.patient_reg='" + Session["PatientId"].ToString() + "';");
                patient.Text = Session["PatientId"].ToString();
                //visitNumber_txt.Text = patientInfo[2];
                //patientName.Text = patientInfo[0];
                //ageTxt.Text = patientInfo[3];
                id = patient.Text;// Session["PatientId"].ToString();
                if (!Page.IsPostBack)
                {
                    GetHistory();
                }
        }
        

        public void GetHistory()
        {
            string query1 = "Select max(visit_no) from Formulation where id='" + patient.Text + "';";
            maxvisit = obj1.max(query1);            
               submit_btn.Visible = false;
               update.Visible = true;           
            if (maxvisit > 0)
            {
                try
                {
                    string query = "Select * from Formulation where id='" + id + "' and visit_no='" + maxvisit + "'";
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Connection = con;
                    SqlDataReader dr;
                    con.Open();
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        if (dr["investigation"].ToString() == "1")
                        {
                            investigation_cb.Checked = true;
                        }
                        else
                        {
                            investigation_cb.Checked = false;
                        }
                        if (dr["medication"].ToString() == "1")
                        {
                            medication_cb.Checked = true;
                        }
                        else
                        {
                            medication_cb.Checked = false;
                        }
                        if (dr["counselling"].ToString() == "1")
                        {
                            counseliing_cb.Checked = true;
                        }
                        else
                        {
                            counseliing_cb.Checked = false;
                        }
                        if (dr["direction"].ToString() == "1")
                        {
                            direction_cb.Checked = true;
                        }
                        else
                        {
                            direction_cb.Checked = false;
                        }
                    }
                    else
                    {
                        direction_cb.Checked = false;
                        counseliing_cb.Checked = false;
                        investigation_cb.Checked = false;
                        medication_cb.Checked = false;
                    }

                    con.Close();
                }
                catch (Exception ex)
                {
                    alert_fail.Visible = true;
                    error.Text = "Error! " + ex.ToString();
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
            }
        }

        protected void addFormulation(object sender, EventArgs e)
        {
            
        }

        protected void update_Click(object sender, EventArgs e)
        {
            try
            {
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand("update Formulation set investigation=@investication,medication=@medication,direction=@directionvalues,counselling=@counseliing_cb where id=@id and visit_no=@visit_no", con);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@visit_no", DropDownList1.SelectedItem.Text);
                    if (medication_cb.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@medication", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@medication", "0");
                    }

                    if (investigation_cb.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@investication", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@investication", "0");
                    }

                    if (counseliing_cb.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@counseliing_cb", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@counseliing_cb", "0");
                    }

                    if (direction_cb.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@directionvalues", "1");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@directionvalues", "0");
                    }
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    alert_success.Visible = true;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);               
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }
    }
}