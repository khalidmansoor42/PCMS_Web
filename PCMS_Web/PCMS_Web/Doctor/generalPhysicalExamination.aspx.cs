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
    public partial class WebForm10 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        getInformation info = new getInformation();
        string[] patientInfo = new string[4];
        maxValue obj1 = new maxValue();
        int maxvisit = 0;
        string id = "";
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
                    disableTextBoxes();

                }
            }
        }

        public void disableTextBoxes()
        {
            try
            {
                if (oedemaNo_radio.Checked == true)
                {
                    oedemaComments_txt.Enabled = false;
                }
                else
                {
                    oedemaComments_txt.Enabled = true;
                }

                if (pallorNo_radio.Checked == true)
                {
                    pallorComment_txt.Enabled = false;
                }
                else
                {
                    pallorComment_txt.Enabled = true;
                }
                if (jaundiceNo_radio.Checked == true)
                {
                    jaundiceComment_txt.Enabled = false;
                }
                else
                {
                    jaundiceComment_txt.Enabled = true;
                }
                if (kylonchiaNo_radio.Checked == true)
                {
                    kylonchiaComments_txt.Enabled = false;
                }
                else
                {
                    kylonchiaComments_txt.Enabled = true;
                }
                if (thyroidNo_radio.Checked == true)
                {
                    thyroidComments_txt.Enabled = false;
                }
                else
                {
                    thyroidComments_txt.Enabled = true;
                }
                if (clubbingNo_radio.Checked == true)
                {
                    clubbingComments_txt.Enabled = false;
                }
                else
                {
                    clubbingComments_txt.Enabled = true;
                }
                if (respirationNo_radio.Checked == true)
                {
                    respirationComments_txt.Enabled = false;
                }
                else
                {
                    respirationComments_txt.Enabled = true;
                }
                if (lymphNo_radio.Checked == true)
                {
                    lymphComments_txt.Enabled = false;
                }
                else
                {
                    lymphComments_txt.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }
        public void GetHistory()
        {
            maxvisit = obj1.max("Select max(visit_no) from generalPhysicalExamination where id='" + patientId_txt.Text + "';");
            if (maxvisit == Convert.ToInt32(visitNumber_txt.Text))
            {
                submit_btn.Visible = false;
                update_btn.Visible = true;
            }
            else
            {
                update_btn.Visible = false;
                submit_btn.Visible = true;
            }

            if (maxvisit > 0)
            {
                try
                {
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand("SELECT  * FROM generalPhysicalExamination where id='" + id + "' and visit_no='" + maxvisit + "'", con);
                    cmd.Connection = con;
                    SqlDataReader dr;
                    con.Open();
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        height_dd.SelectedValue = dr["height"].ToString();
                        weight_dd.SelectedValue = dr["weight"].ToString();
                        pulse_dd.SelectedValue = dr["pulse"].ToString();
                        skinEruption_txt.Text = dr["skinEruption"].ToString();
                        skinEruption_dd.Text = dr["skinErruptionDd"].ToString();
                        lyingSystolic_txt.Text = dr["lyingSystolic"].ToString();
                        sittingSystolic_txt.Text = dr["sittingSystolic"].ToString();
                        standingSystolic_txt.Text = dr["standingSystolic"].ToString();
                        lyingDiastolic_txt.Text = dr["lyingDiastolic"].ToString();
                        sittingDiastolic_txt.Text = dr["sittingDiastolic"].ToString();
                        standingDiastolic_txt.Text = dr["standingDiastolic"].ToString();
                        temperatureComments_txt.Text = dr["temperature"].ToString();
                        dehydrationComments_txt.Text = dr["dehydration"].ToString();
                        pallorComment_txt.Text = dr["pallorTxt"].ToString();
                        if ((Convert.ToInt32(dr["pallorRb"].ToString()) == 1))
                        {
                            pallorNo_radio.Checked = false;
                            pallorYes_radio.Checked = true;
                        }
                        else
                        {
                            pallorNo_radio.Checked = true;
                        }
                        jaundiceComment_txt.Text = dr["jaundiceTxt"].ToString();
                        if ((Convert.ToInt32(dr["jaundiceRb"].ToString()) == 1))
                        {
                            jaundiceNo_radio.Checked = false;
                            jaundiceYes_radio.Checked = true;
                        }
                        else
                        {
                            jaundiceNo_radio.Checked = true;
                        }
                        oedemaComments_txt.Text = dr["oedemaTxt"].ToString();
                        if ((Convert.ToInt32(dr["oedemaRb"].ToString()) == 1))
                        {
                            oedemaNo_radio.Checked = false;
                            oedemaYes_radio.Checked = true;
                        }
                        else
                        {
                            oedemaNo_radio.Checked = true;
                        }
                        kylonchiaComments_txt.Text = dr["kylonychiaTxt"].ToString();
                        if ((Convert.ToInt32(dr["kylonychiaRb"].ToString()) == 1))
                        {
                            kylonchiaNo_radio.Checked = false;
                            kylonychiaYes_radio.Checked = true;
                        }
                        else
                        {
                            kylonchiaNo_radio.Checked = true;
                        }
                        thyroidComments_txt.Text = dr["thyroidGlandTxt"].ToString();
                        if ((Convert.ToInt32(dr["thyroidGlandRb"].ToString()) == 1))
                        {
                            thyroidNo_radio.Checked = false;
                            thyroidYes_radio.Checked = true;
                        }
                        else
                        {
                            thyroidNo_radio.Checked = true;
                        }
                        clubbingComments_txt.Text = dr["clubbingTxt"].ToString();
                        if ((Convert.ToInt32(dr["clubbingRb"].ToString()) == 1))
                        {
                            clubbingNo_radio.Checked = false;
                            clubbingYes_radio.Checked = true;
                        }
                        else
                        {
                            clubbingNo_radio.Checked = true;
                        }
                        respirationComments_txt.Text = dr["respirationRateTxt"].ToString();
                        if ((Convert.ToInt32(dr["respirationRateRb"].ToString()) == 1))
                        {
                            respirationNo_radio.Checked = false;
                            respirationYes_radio.Checked = true;
                        }
                        else
                        {
                            respirationNo_radio.Checked = true;
                        }
                        lymphComments_txt.Text = dr["lymphNodeTxt"].ToString();
                        if ((Convert.ToInt32(dr["lymphNodeRb"].ToString()) == 1))
                        {
                            lymphNo_radio.Checked = false;
                            lymphYes_radio.Checked = true;
                        }
                        else
                        {
                            lymphNo_radio.Checked = true;
                        }
                        jvp1_dd.Text = dr["jvpTxt"].ToString();
                        jvp_dd.SelectedValue = dr["jvpDD"].ToString();
                        if ((Convert.ToInt32(dr["dehydrationRadio"].ToString()) == 1))
                        {
                            yesDehydration_radio.Checked = true;
                            noDehydration_radio.Checked = false;
                        }
                        else
                        {
                            noDehydration_radio.Checked = true;
                        }

                        if ((Convert.ToInt32(dr["swellingRadio"].ToString()) == 1))
                        {
                            yesSwelling_radio.Checked = true;
                            noSwelling_radio.Checked = false;
                        }
                        else
                        {
                            noSwelling_radio.Checked = true;
                        }

                        if ((Convert.ToInt32(dr["pigmentationRadio"].ToString()) == 1))
                        {
                            yesPigmentation_radio.Checked = true;
                            noPigmentation_radio.Checked = false;
                        }
                        else
                        {
                            noPigmentation_radio.Checked = true;
                        }

                        if ((Convert.ToInt32(dr["repigmentationRadio"].ToString()) == 1))
                        {
                            yesRepigmentation_radio.Checked = true;
                            noRepigmentation_radio.Checked = false;
                        }
                        else
                        {
                            noRepigmentation_radio.Checked = true;
                        }

                    }
                    else
                    {
                        //height_dd.Text = "";
                        //weight_dd.Text = "";
                        //pulse_dd.Text = "";
                        skinEruption_txt.Text = "";
                        lyingDiastolic_txt.Text = "";
                        sittingDiastolic_txt.Text = "";
                        standingDiastolic_txt.Text = "";
                        lyingSystolic_txt.Text = "";
                        sittingSystolic_txt.Text = "";
                        standingSystolic_txt.Text = "";
                        temperatureComments_txt.Text = "";
                        dehydrationComments_txt.Text = "";
                        pallorComment_txt.Text = "";
                        jaundiceComment_txt.Text = "";
                        oedemaComments_txt.Text = "";
                        kylonchiaComments_txt.Text = "";
                        thyroidComments_txt.Text = "";
                        clubbingComments_txt.Text = "";
                        respirationComments_txt.Text = "";
                        lymphComments_txt.Text = "";
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

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into generalPhysicalExamination ( id,visit_no,height,weight,pulse,skinEruption,lyingSystolic,sittingSystolic,standingSystolic,temperature,dehydration,pallorRb,pallorTxt,jaundiceRb,jaundiceTxt,oedemaRb,oedemaTxt,kylonychiaRb,kylonychiaTxt,thyroidGlandRb,thyroidGlandTxt,clubbingRb,clubbingTxt,respirationRateRb,respirationRateTxt,lymphNodeRb ,lymphNodeTxt,jvpTxt ,jvpDD, lyingDiastolic, standingDiastolic, sittingDiastolic, skinErruptionDd, dehydrationRadio, swellingRadio, pigmentationRadio, repigmentationRadio ) values (@id,@visit_no,@height,@weight,@pulse,@skinEruption,@lyingSystolic,@sittingSystolic,@standingSystolic,@temperature,@dehydration,@pallorRb,@pallorTxt,@jaundiceRb,@jaundiceTxt,@oedemaRb,@oedemaTxt,@kylonychiaRb,@kylonychiaTxt,@thyroidGlandRb,@thyroidGlandTxt,@clubbingRb,@clubbingTxt,@respirationRateRb,@respirationRateTxt,@lymphNodeRb ,@lymphNodeTxt,@jvpTxt ,@jvpDD, @lyingDiastolic, @standingDiastolic, @sittingDiastolic, @skinErruptionDd, @dehydrationRadio, @swellingRadio, @pigmentationRadio, @repigmentationRadio)", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@visit_no", visitNumber_txt.Text);
                cmd.Parameters.AddWithValue("@height", height_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@weight", weight_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@pulse", pulse_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@skinEruption", skinEruption_txt.Text);
                cmd.Parameters.AddWithValue("@lyingSystolic", lyingSystolic_txt.Text);
                cmd.Parameters.AddWithValue("@sittingSystolic", sittingSystolic_txt.Text);
                cmd.Parameters.AddWithValue("@standingSystolic", standingSystolic_txt.Text);
                cmd.Parameters.AddWithValue("@lyingDiastolic", lyingDiastolic_txt.Text);
                cmd.Parameters.AddWithValue("@sittingDiastolic", sittingDiastolic_txt.Text);
                cmd.Parameters.AddWithValue("@standingDiastolic", standingDiastolic_txt.Text);
                cmd.Parameters.AddWithValue("@temperature", temperatureComments_txt.Text);
                cmd.Parameters.AddWithValue("@dehydration", dehydrationComments_txt.Text);
                cmd.Parameters.AddWithValue("@pallorTxt", pallorComment_txt.Text);
                cmd.Parameters.AddWithValue("@jaundiceTxt", jaundiceComment_txt.Text);
                cmd.Parameters.AddWithValue("@oedemaTxt", oedemaComments_txt.Text);
                cmd.Parameters.AddWithValue("@kylonychiaTxt", kylonchiaComments_txt.Text);
                cmd.Parameters.AddWithValue("@thyroidGlandTxt", thyroidComments_txt.Text);
                cmd.Parameters.AddWithValue("@clubbingTxt", clubbingComments_txt.Text);
                cmd.Parameters.AddWithValue("@respirationRateTxt", respirationComments_txt.Text);
                cmd.Parameters.AddWithValue("@lymphNodeTxt", lymphComments_txt.Text);
                cmd.Parameters.AddWithValue("@jvpTxt", jvp1_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@jvpDD", jvp_dd.SelectedItem.Text.ToString());
                cmd.Parameters.AddWithValue("@skinErruptionDd", skinEruption_dd.SelectedItem.Text);
                if (pallorYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@pallorRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@pallorRb", 0);
                }

                if (jaundiceYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@jaundiceRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@jaundiceRb", 0);
                }


                if (oedemaYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@oedemaRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@oedemaRb", 0);
                }
                if (kylonychiaYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@kylonychiaRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@kylonychiaRb", 0);
                }
                if (thyroidYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@thyroidGlandRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@thyroidGlandRb", 0);
                }
                if (clubbingYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@clubbingRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@clubbingRb", 0);
                }
                if (respirationYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@respirationRateRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@respirationRateRb", 0);
                }
                if (lymphYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@lymphNodeRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@lymphNodeRb", 0);
                }

                if (yesDehydration_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@dehydrationRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@dehydrationRadio", 2);
                }

                if (yesSwelling_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@swellingRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@swellingRadio", 2);
                }

                if (yesPigmentation_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@pigmentationRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@pigmentationRadio", 2);
                }

                if (yesRepigmentation_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@repigmentationRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@repigmentationRadio", 2);
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

        protected void update_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("update  generalPhysicalExamination set height=@height, weight=@weight, pulse=@pulse, skinEruption=@skinEruption, lyingSystolic=@lying, sittingSystolic=@sitting, standingSystolic=@standing, temperature=@temperature, dehydration=@dehydration, pallorRb=@pallorRb, pallorTxt=@pallorTxt, jaundiceRb=@jaundiceRb, jaundiceTxt=@jaundiceTxt, oedemaRb=@oedemaRb, oedemaTxt=@oedemaTxt, kylonychiaRb=@kylonychiaRb, kylonychiaTxt=@kylonychiaTxt, thyroidGlandRb=@thyroidGlandRb, thyroidGlandTxt=thyroidGlandTxt, clubbingRb=@clubbingRb, clubbingTxt=@clubbingTxt, respirationRateRb=@respirationRateRb, respirationRateTxt=@respirationRateTxt, lymphNodeRb=@lymphNodeRb, lymphNodeTxt=@lymphNodeTxt, jvpTxt=@jvpTxt , jvpDD=@jvpDD, lyingDiastolic=@lyingDiastolic, standingDiastolic=@standingDiastolic, sittingDiastolic=@sittingDiastolic, skinErruptionDd=@skinErruptionDd, dehydrationRadio=@dehydrationRadio, swellingRadio=@swellingRadio, pigmentationRadio=@pigmentationRadio, repigmentationRadio=@repigmentationRadio where id='" + id + "' and visit_no='" + visitNumber_txt.Text + "'", con);
                cmd.Parameters.AddWithValue("@height", height_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@weight", weight_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@pulse", pulse_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@skinEruption", skinEruption_txt.Text);
                cmd.Parameters.AddWithValue("@lying", lyingSystolic_txt.Text);
                cmd.Parameters.AddWithValue("@sitting", sittingSystolic_txt.Text);
                cmd.Parameters.AddWithValue("@standing", standingSystolic_txt.Text);
                cmd.Parameters.AddWithValue("@temperature", temperatureComments_txt.Text);
                cmd.Parameters.AddWithValue("@dehydration", dehydrationComments_txt.Text);
                cmd.Parameters.AddWithValue("@pallorTxt", pallorComment_txt.Text);
                cmd.Parameters.AddWithValue("@jaundiceTxt", jaundiceComment_txt.Text);
                cmd.Parameters.AddWithValue("@oedemaTxt", oedemaComments_txt.Text);
                cmd.Parameters.AddWithValue("@kylonychiaTxt", kylonchiaComments_txt.Text);
                cmd.Parameters.AddWithValue("@thyroidGlandTxt", thyroidComments_txt.Text);
                cmd.Parameters.AddWithValue("@clubbingTxt", clubbingComments_txt.Text);
                cmd.Parameters.AddWithValue("@respirationRateTxt", respirationComments_txt.Text);
                cmd.Parameters.AddWithValue("@lymphNodeTxt", lymphComments_txt.Text);
                cmd.Parameters.AddWithValue("@jvpTxt", jvp1_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@jvpDD", jvp_dd.SelectedItem.Text.ToString());
                cmd.Parameters.AddWithValue("@lyingDiastolic", lyingDiastolic_txt.Text);
                cmd.Parameters.AddWithValue("@standingDiastolic", standingDiastolic_txt.Text);
                cmd.Parameters.AddWithValue("@sittingDiastolic", sittingDiastolic_txt.Text);
                cmd.Parameters.AddWithValue("@skinErruptionDd", skinEruption_dd.SelectedItem.Text);
                if (pallorYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@pallorRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@pallorRb", 0);
                }

                if (jaundiceYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@jaundiceRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@jaundiceRb", 0);
                }


                if (oedemaYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@oedemaRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@oedemaRb", 0);
                }
                if (kylonychiaYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@kylonychiaRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@kylonychiaRb", 0);
                }
                if (thyroidYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@thyroidGlandRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@thyroidGlandRb", 0);
                }
                if (clubbingYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@clubbingRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@clubbingRb", 0);
                }
                if (respirationYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@respirationRateRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@respirationRateRb", 0);
                }
                if (lymphYes_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@lymphNodeRb", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@lymphNodeRb", 0);
                }

                if (yesDehydration_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@dehydrationRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@dehydrationRadio", 2);
                }

                if (yesSwelling_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@swellingRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@swellingRadio", 2);
                }

                if (yesPigmentation_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@pigmentationRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@pigmentationRadio", 2);
                }

                if (yesRepigmentation_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@repigmentationRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@repigmentationRadio", 2);
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