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
    public partial class WebForm2 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;

        getInformation info = new getInformation();
        string[] patientInfo = new string[4];
        maxValue obj1 = new maxValue();
        int maxvisit =0;
        protected void Page_Load(object sender, EventArgs e)
        {    
            if (Session["PatientId"]!=null && !IsPostBack)
            {
                patientInfo = info.information("SELECT a.full_name, a.father_name,a.dob, b.visit_no FROM patient_registeration a, visit b  WHERE a.patient_reg = b.patient_reg  AND b.visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'And  a.patient_reg ='" + Session["PatientId"].ToString() + "' And b.patient_reg='" + Session["PatientId"].ToString() + "';");
                patientId_txt.Text = Session["PatientId"].ToString();
                visitNumber_txt.Text = patientInfo[2];
                patientName.Text = patientInfo[0];
                ageTxt.Text = patientInfo[3];
                pasthistory();
            }
        }
        void pasthistory()
        {
            maxvisit = obj1.max("Select max(visit_no) from general_history where patient_reg='" + patientId_txt.Text + "';");
            if (maxvisit == Convert.ToInt32(visitNumber_txt.Text))
            {
                saveBtn.Visible = false;
                updateBtn.Visible = true;
            }
            else
            {
                updateBtn.Visible = false;
                saveBtn.Visible = true;
            }

            if (maxvisit > 0)
            {
                try
                {
                    string query = "SELECT * FROM general_history where patient_reg=@patientId_txt and visit_no=@visitNumber_txt;";
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand();
                    cmd.Parameters.Add(new SqlParameter("@patientId_txt", Convert.ToInt32(patientId_txt.Text)));
                    cmd.Parameters.Add(new SqlParameter("@visitNumber_txt", Convert.ToInt32(visitNumber_txt.Text)));
                    cmd.Connection = con;
                    cmd.CommandText = query;
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {

                        if (dr["diabetes"].ToString() == "1")
                        {
                            diabetesYes_radio.Checked = true;
                            diabetesDuration_dd.Text = dr["diabetes_duration"].ToString();
                            diabetesControl_dd.Text = dr["diabetes_control"].ToString();
                            hbAic_dd.Text = dr["hbaic"].ToString();
                            diabetesFbs_txt.Text = dr["FBS"].ToString();
                            if (dr["insulin"].ToString() == "1")
                            {
                                insulinYes_radio.Checked = true;
                                insulinDosage_txt.Text = dr["insulin_dosage"].ToString();
                            }
                            else
                            {
                                insulinYes_radio.Checked = false;
                                insulinDosage_txt.Text = "";
                            }
                        }
                        else
                        {
                            diabetesDuration_dd.Text = "";
                            diabetesControl_dd.Text = "";
                            hbAic_dd.Text = "";
                            diabetesFbs_txt.Text = "";
                            diabetesYes_radio.Checked = false;
                        }
                        if (dr["hypertention"].ToString() == "1")
                        {
                            Hypertensionyes.Checked = true;
                            hypertensionControl_dd.Text = dr["hypertention_duration"].ToString();
                            Hypertension_duration.Text = dr["hypertention_control"].ToString();
                        }
                        else
                        {
                            Hypertensionyes.Checked = false;
                            hypertensionControl_dd.Text = "";
                            Hypertension_duration.Text = "";
                        }

                        cardiac_txt.Text = dr["cardiac"].ToString();
                        respiratory_txt.Text = dr["respiratory"].ToString();
                        renal_txt.Text = dr["rinal"].ToString();
                        cancer_txt.Text = dr["cancer"].ToString();
                        OtherIllness_txt.Text = dr["other_illness"].ToString();
                        con.Close();
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {

        }

        protected void saveBtn_Click1(object sender, EventArgs e)
        {
            if (patientId_txt.Text == "")
            {
            }
            else
            {
                    try
                    {
                        SqlConnection myConn = new SqlConnection(constring);
                        String query = "insert into general_history (patient_reg,visit_no,diabetes,diabetes_duration,diabetes_control,hbaic,FBS,insulin,insulin_dosage,hypertention,hypertention_duration,hypertention_control,cardiac,respiratory,rinal,cancer,other_illness) values (@patientId_txt,@visitNumber_txt,@diabetesYes_radio,@diabetesDuration_dd,@diabetesControl_dd, @hbAic_dd, @diabetesFbs_txt, @insulinYes_radio, @insulinDosage_txt, @Hypertensionyes, @Hypertension_duration, @hypertensionControl_dd, @cardiac_txt, @respiratory_txt, @renal_txt, @cancer_txt, @OtherIllness_txt);";                        
                        SqlCommand SelectCommand = new SqlCommand(query, myConn);
                        SqlDataReader myReader;
                        myConn.Open();
                        SelectCommand.Parameters.Add(new SqlParameter("@patientId_txt", Convert.ToInt32(patientId_txt.Text)));
                        SelectCommand.Parameters.Add(new SqlParameter("@visitNumber_txt", Convert.ToInt32(visitNumber_txt.Text)));

                        if (diabetesYes_radio.Checked == true)
                        {
                            SelectCommand.Parameters.Add(new SqlParameter("@diabetesYes_radio", Convert.ToInt32(1)));
                            SelectCommand.Parameters.Add(new SqlParameter("@diabetesDuration_dd", diabetesDuration_dd.Text));
                            SelectCommand.Parameters.Add(new SqlParameter("@diabetesControl_dd", diabetesControl_dd.Text));
                            SelectCommand.Parameters.Add(new SqlParameter("@hbAic_dd", hbAic_dd.Text));
                            SelectCommand.Parameters.Add(new SqlParameter("@diabetesFbs_txt", diabetesFbs_txt.Text));
                            if (insulinYes_radio.Checked == true)
                            {
                                SelectCommand.Parameters.Add(new SqlParameter("@insulinYes_radio", Convert.ToInt32(1)));
                                SelectCommand.Parameters.Add(new SqlParameter("@insulinDosage_txt", insulinDosage_txt.Text));

                            }
                            else
                            {
                                SelectCommand.Parameters.Add(new SqlParameter("@insulinYes_radio", Convert.ToInt32(0)));
                                SelectCommand.Parameters.Add(new SqlParameter("@insulinDosage_txt", Convert.ToInt32(0)));
                            }

                        }
                        else
                        {

                            SelectCommand.Parameters.Add(new SqlParameter("@diabetesDuration_dd", ""));
                            SelectCommand.Parameters.Add(new SqlParameter("@diabetesControl_dd", ""));
                            SelectCommand.Parameters.Add(new SqlParameter("@hbAic_dd", ""));
                            SelectCommand.Parameters.Add(new SqlParameter("@diabetesFbs_txt", ""));
                            SelectCommand.Parameters.Add(new SqlParameter("@diabetesYes_radio", Convert.ToInt32(0)));
                            SelectCommand.Parameters.Add(new SqlParameter("@insulinYes_radio", Convert.ToInt32(0)));
                            SelectCommand.Parameters.Add(new SqlParameter("@insulinDosage_txt", ""));
                        }
                        if (Hypertensionyes.Checked == true)
                        {
                            SelectCommand.Parameters.Add(new SqlParameter("@Hypertensionyes", Convert.ToInt32(1)));
                            SelectCommand.Parameters.Add(new SqlParameter("@hypertensionControl_dd", hypertensionControl_dd.Text));
                            SelectCommand.Parameters.Add(new SqlParameter("@Hypertension_duration", Hypertension_duration.Text));

                        }
                        else
                        {
                            SelectCommand.Parameters.Add(new SqlParameter("@Hypertensionyes", Convert.ToInt32(0)));
                            SelectCommand.Parameters.Add(new SqlParameter("@hypertensionControl_dd", ""));
                            SelectCommand.Parameters.Add(new SqlParameter("@Hypertension_duration", ""));
                        }
                        SelectCommand.Parameters.Add(new SqlParameter("@cardiac_txt", cardiac_txt.Text));
                        SelectCommand.Parameters.Add(new SqlParameter("@renal_txt", renal_txt.Text));
                        SelectCommand.Parameters.Add(new SqlParameter("@respiratory_txt", respiratory_txt.Text));
                        SelectCommand.Parameters.Add(new SqlParameter("@cancer_txt", cancer_txt.Text));
                        SelectCommand.Parameters.Add(new SqlParameter("@OtherIllness_txt", OtherIllness_txt.Text));
                        myReader = SelectCommand.ExecuteReader();
                        myConn.Close();
                        //MetroMessageBox.Show(this, "\n" + "Record has been saved", "", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        pasthistory();

                    }

                    catch (Exception ex)
                    {

                    }
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (patientId_txt.Text == "")
            {
            }
            else
            {
                try
                {                  
                    SqlConnection myConn = new SqlConnection(constring);
                    String query = "update general_history set diabetes=@diabetesYes_radio,diabetes_duration=@diabetesDuration_dd,diabetes_control=@diabetesControl_dd,hbaic=@hbAic_dd,FBS=@diabetesFbs_txt,insulin=@insulinYes_radio,insulin_dosage=@insulinDosage_txt,hypertention=@Hypertensionyes,hypertention_duration=@Hypertension_duration,hypertention_control=@hypertensionControl_dd,cardiac=@cardiac_txt,respiratory= @respiratory_txt,rinal=@renal_txt,cancer=@cancer_txt,other_illness=@OtherIllness_txt where  patient_reg=@patientId_txt and visit_no=@visitNumber_txt;";                                                                                                                                                                                                                                       
                    SqlCommand SelectCommand = new SqlCommand(query, myConn);
                    SqlDataReader myReader;
                    myConn.Open();
                    SelectCommand.Parameters.Add(new SqlParameter("@patientId_txt", Convert.ToInt32(patientId_txt.Text)));
                    SelectCommand.Parameters.Add(new SqlParameter("@visitNumber_txt", Convert.ToInt32(visitNumber_txt.Text)));

                    if (diabetesYes_radio.Checked == true)
                    {
                        SelectCommand.Parameters.Add(new SqlParameter("@diabetesYes_radio", Convert.ToInt32(1)));
                        SelectCommand.Parameters.Add(new SqlParameter("@diabetesDuration_dd", diabetesDuration_dd.Text));
                        SelectCommand.Parameters.Add(new SqlParameter("@diabetesControl_dd", diabetesControl_dd.Text));
                        SelectCommand.Parameters.Add(new SqlParameter("@hbAic_dd", hbAic_dd.Text));
                        SelectCommand.Parameters.Add(new SqlParameter("@diabetesFbs_txt", diabetesFbs_txt.Text));
                        if (insulinYes_radio.Checked == true)
                        {
                            SelectCommand.Parameters.Add(new SqlParameter("@insulinYes_radio", Convert.ToInt32(1)));
                            SelectCommand.Parameters.Add(new SqlParameter("@insulinDosage_txt", insulinDosage_txt.Text));

                        }
                        else
                        {
                            SelectCommand.Parameters.Add(new SqlParameter("@insulinYes_radio", Convert.ToInt32(0)));
                            SelectCommand.Parameters.Add(new SqlParameter("@insulinDosage_txt", Convert.ToInt32(0)));
                        }

                    }
                    else
                    {

                        SelectCommand.Parameters.Add(new SqlParameter("@diabetesDuration_dd", ""));
                        SelectCommand.Parameters.Add(new SqlParameter("@diabetesControl_dd", ""));
                        SelectCommand.Parameters.Add(new SqlParameter("@hbAic_dd", ""));
                        SelectCommand.Parameters.Add(new SqlParameter("@diabetesFbs_txt", ""));
                        SelectCommand.Parameters.Add(new SqlParameter("@diabetesYes_radio", Convert.ToInt32(0)));
                        SelectCommand.Parameters.Add(new SqlParameter("@insulinYes_radio", Convert.ToInt32(0)));
                        SelectCommand.Parameters.Add(new SqlParameter("@insulinDosage_txt", ""));
                    }
                    if (Hypertensionyes.Checked == true)
                    {
                        SelectCommand.Parameters.Add(new SqlParameter("@Hypertensionyes", Convert.ToInt32(1)));
                        SelectCommand.Parameters.Add(new SqlParameter("@hypertensionControl_dd", hypertensionControl_dd.Text));
                        SelectCommand.Parameters.Add(new SqlParameter("@Hypertension_duration", Hypertension_duration.Text));

                    }
                    else
                    {
                        SelectCommand.Parameters.Add(new SqlParameter("@Hypertensionyes", Convert.ToInt32(0)));
                        SelectCommand.Parameters.Add(new SqlParameter("@hypertensionControl_dd", ""));
                        SelectCommand.Parameters.Add(new SqlParameter("@Hypertension_duration", ""));
                    }
                    SelectCommand.Parameters.Add(new SqlParameter("@cardiac_txt", cardiac_txt.Text));
                    SelectCommand.Parameters.Add(new SqlParameter("@renal_txt", renal_txt.Text));
                    SelectCommand.Parameters.Add(new SqlParameter("@respiratory_txt", respiratory_txt.Text));
                    SelectCommand.Parameters.Add(new SqlParameter("@cancer_txt", cancer_txt.Text));
                    SelectCommand.Parameters.Add(new SqlParameter("@OtherIllness_txt", OtherIllness_txt.Text));
                    myReader = SelectCommand.ExecuteReader();
                    myConn.Close();
                    //MetroMessageBox.Show(this, "\n" + "Record has been saved", "", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    pasthistory();

                }

                catch (Exception ex)
                {

                }
            }
        }
    }
}