using PCMS_Web.Class;
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
    public partial class WebForm22 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        string id = "1";
        getInformation info = new getInformation();
        string[] patientInfo = new string[4];
        maxValue obj1 = new maxValue();
        int maxvisit = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            patientInfo = info.information("SELECT a.full_name, a.father_name,a.dob, b.visit_no FROM patient_registeration a, visit b  WHERE a.patient_reg = b.patient_reg  AND b.visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'And  a.patient_reg ='" + Session["PatientId"].ToString() + "' And b.patient_reg='" + Session["PatientId"].ToString() + "';");
            id = Session["PatientId"].ToString();
            patientId_txt.Text = Session["PatientId"].ToString();
            visitNumber_txt.Text = patientInfo[2];
            patientName.Text = patientInfo[0];
            ageTxt.Text = patientInfo[3];
            if (!Page.IsPostBack)
            {
                admissionHistory();
            }
        }

        public void admissionHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SELECT admissionType,patientClassification from admissionHistory where patient_reg='" + id + "'", con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    saveBtn.Visible = false;
                    if ((Convert.ToInt32(dr["admissionType"].ToString()) == 1))
                    {
                        treatment_radio.Checked = false;
                        assessment_radio.Checked = true;
                    }
                    else if ((Convert.ToInt32(dr["admissionType"].ToString()) == 2))
                    {
                        treatment_radio.Checked = true;
                    }
                    else if ((Convert.ToInt32(dr["admissionType"].ToString()) == 3))
                    {
                        treatment_radio.Checked = false;
                        urgent_radio.Checked = true;
                    }
                    else if ((Convert.ToInt32(dr["admissionType"].ToString()) == 4))
                    {
                        treatment_radio.Checked = false;
                        emergency_radio.Checked = true;
                    }
                    else if ((Convert.ToInt32(dr["admissionType"].ToString()) == 5))
                    {
                        treatment_radio.Checked = false;
                        care_radio.Checked = true;
                    }
                    else
                    {
                        treatment_radio.Checked = true;
                    }

                    if ((Convert.ToInt32(dr["patientClassification"].ToString()) == 1))
                    {
                        reception_radio.Checked = false;
                        judicial_radio.Checked = true;

                    }

                    else if ((Convert.ToInt32(dr["patientClassification"].ToString()) == 2))
                    {
                        reception_radio.Checked = false;
                        nonJudicial_radio.Checked = true;
                    }

                    else if ((Convert.ToInt32(dr["patientClassification"].ToString()) == 3))
                    {
                        reception_radio.Checked = true;
                    }
                    else
                    {
                        reception_radio.Checked = true;
                    }

                }
                else
                {
                    saveBtn.Visible = true;
                    updateBtn.Visible = false;
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

        public void insertAdmissionHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into admissionHistory (patient_reg,admissionType,patientClassification) values(@id,@type,@classification)", con);

                cmd.Parameters.AddWithValue("@id", id);
                if (assessment_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 1);
                }

                else if (treatment_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 2);
                }
                else if (urgent_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 3);
                }
                else if (emergency_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 4);
                }
                else if (care_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 5);
                }
                else
                {
                }
                if (judicial_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@classification", 1);
                }

                else if (nonJudicial_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@classification", 2);
                }
                else if (reception_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@classification", 3);
                }
                else
                {
                    alert_fail.Visible = true;
                    error.Text = "Error! ";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
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

        public void updateAdmissionHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("update admissionHistory set admissionType=@type,patientClassification=@classification where patient_reg='" + id + "'", con);


                if (assessment_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 1);
                }

                else if (treatment_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 2);
                }
                else if (urgent_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 3);
                }
                else if (emergency_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 4);
                }
                else if (care_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@type", 5);
                }
                else
                {
                }
                if (judicial_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@classification", 1);
                }

                else if (nonJudicial_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@classification", 2);
                }
                else if (reception_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@classification", 3);
                }
                else
                {
                    alert_fail.Visible = true;
                    error.Text = "Error! ";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
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

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            try 
            { 
                updateAdmissionHistory();
            }
            catch(Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            try 
            {
                insertAdmissionHistory();
            }
            catch(Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }
    }
}