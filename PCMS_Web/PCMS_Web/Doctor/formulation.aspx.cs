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
            if (Session["PatientId"] != null)
            {
                patientInfo = info.information("SELECT a.full_name, a.father_name,a.dob, b.visit_no FROM patient_registeration a, visit b  WHERE a.patient_reg = b.patient_reg  AND b.visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'And  a.patient_reg ='" + Session["PatientId"].ToString() + "' And b.patient_reg='" + Session["PatientId"].ToString() + "';");
                patientId_txt.Text = Session["PatientId"].ToString();
                visitNumber_txt.Text = patientInfo[2];
                patientName.Text = patientInfo[0];
                ageTxt.Text = patientInfo[3];
                id = Session["PatientId"].ToString();
                if (!Page.IsPostBack)
                {
                    GetHistory();

                }
            }
        }

        public void GetHistory()
        {

            maxvisit = obj1.max("Select max(visit_no) from Formulation where id='" + patientId_txt.Text + "';");
            if (maxvisit == Convert.ToInt32(visitNumber_txt.Text))
            {
                submit_btn.Visible = false;
                //update.Visible = true;
            }
            else
            {
                //update.Visible = false;
                submit_btn.Visible = true;
            }
            if (maxvisit > 0)
            {
                try
                {
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand("Select * from Formulation where id='" + id + "'", con);
                    cmd.Connection = con;
                    SqlDataReader dr;
                    con.Open();
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        formulation_area.InnerText = dr["Formulation"].ToString();
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
                        formulation_area.InnerText = "";
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
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into Formulation (id,visit_no,Formulation,investigation,counselling,medication,direction)values (@id,@visit_no,@formulation,@investication,@counseliing_cb,@medication,@directionvalues)", con);
                if (formulation_area.InnerText != "" )
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@visit_no", visitNumber_txt.Text);
                    cmd.Parameters.AddWithValue("@formulation", formulation_area.InnerText);
                    
                    if (medication_cb.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@medication","1");
                    }
                    else {
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

                else
                {
                    alert_fail.Visible = true;
                    error.Text = "Error! Cannot take null value";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("update Formulation set Formulation=@formulation,investigation=@investication,medication=@medication,direction=@directionvalues,counselling=@counseliing_cb where id=@id and visit_no=@visit_no", con);
                if (formulation_area.InnerText != "")
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@visit_no", visitNumber_txt.Text);
                    cmd.Parameters.AddWithValue("@formulation", formulation_area.InnerText);
                    if (medication_cb.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@medication","1");
                    }
                    else {
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

                else
                {
                    alert_fail.Visible = true;
                    error.Text = "Error! Cannot take null value";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
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