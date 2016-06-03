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
    public partial class WebForm11 : System.Web.UI.Page
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
            maxvisit = obj1.max("Select max(visit_no) from systematicExamination where id='" + patientId_txt.Text + "';");
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
                    SqlCommand cmd = new SqlCommand("SELECT * FROM systematicExamination where id='" + id + "' and visit_no='"+ maxvisit + "'", con);
                    cmd.Connection = con;
                    SqlDataReader dr;
                    con.Open();
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        signsOfMeningial_dd.SelectedValue = dr["meningialIrritation"].ToString();
                        if ((Convert.ToInt32(dr["cranialNervesRadio"].ToString()) == 1))
                        {
                            nocranialNerves_radio.Checked = false;
                            yescranialNerves_radio.Checked = true;
                        }
                        else
                        {
                            nocranialNerves_radio.Checked = true;
                        }
                        sensorySystem_area.InnerText = dr["sensorySystem"].ToString();
                        if ((Convert.ToInt32(dr["motorSystemRadio"].ToString()) == 1))
                        {
                            noMotorSystem_radio.Checked = false;
                            yesMotorSystem_radio.Checked = true;
                        }
                        else
                        {
                            noMotorSystem_radio.Checked = true;
                        }
                        TextBox1.Text = dr["carnivalNervers"].ToString();
                        Textarea2.InnerText = dr["motorSystem"].ToString();
                        superficialReflexesComments_txt.Text = dr["superficialReflexes"].ToString();
                        TextBox3.Text = dr["deepReflexes"].ToString();
                        cerebellarFunctions_area.InnerText = dr["cerebellarFunctions"].ToString();
                        Textarea3.InnerText = dr["fundoscopy"].ToString();
                        cardiovascularSystem_area.InnerText = dr["cardioVascularSystem"].ToString();
                        respiratorySystem_area.InnerText = dr["respiratorySystem"].ToString();
                        gastrointestinalSystem_area.InnerText = dr["gastroIntestinalSystem"].ToString();
                        urogenitalSystem_area.InnerText = dr["urogenitalSystem"].ToString();
                        if ((Convert.ToInt32(dr["sensorySystemRadio"].ToString()) == 1))
                        {
                            nosensorySystem_radio.Checked = false;
                            yessensorySystem_radio.Checked = true;
                        }
                        else
                        {
                            nosensorySystem_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["motorSystemRadio"].ToString()) == 1))
                        {
                            noMotorSystem_radio.Checked = false;
                            yesMotorSystem_radio.Checked = true;
                        }
                        else
                        {
                            noMotorSystem_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["superficialRadio"].ToString()) == 1))
                        {
                            noSuperficial_radio.Checked = false;
                            yesSuperficial_radio.Checked = true;
                        }
                        else
                        {
                            noSuperficial_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["deepReflexRadio"].ToString()) == 1))
                        {
                            noDeepReflexes_radio.Checked = false;
                            yesDeepReflexes_radio.Checked = true;
                        }
                        else
                        {
                            noDeepReflexes_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["cerebellarRadio"].ToString()) == 1))
                        {
                            noCerebellar_radio.Checked = false;
                            yesCerebellar_radio.Checked = true;
                        }
                        else
                        {
                            noCerebellar_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["fundoscopyRadio"].ToString()) == 1))
                        {
                            noFundoscopy_radio.Checked = false;
                            yesFundoscopy_radio.Checked = true;
                        }
                        else
                        {
                            noFundoscopy_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["cardiovascularRadio"].ToString()) == 1))
                        {
                            noCardiovascular_radio.Checked = false;
                            yesCardiovascular_radio.Checked = true;
                        }
                        else
                        {
                            noCardiovascular_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["respiratoryRadio"].ToString()) == 1))
                        {
                            noRespiratory_radio.Checked = false;
                            yesRespiratory_radio.Checked = true;
                        }
                        else
                        {
                            noRespiratory_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["gastrointestinalRadio"].ToString()) == 1))
                        {
                            noGastrointes_radio.Checked = false;
                            yesGastrointes_radio.Checked = true;
                        }
                        else
                        {
                            noGastrointes_radio.Checked = true;
                        }
                        if ((Convert.ToInt32(dr["urogenitalRadio"].ToString()) == 1))
                        {
                            noUrogenital_radio.Checked = false;
                            yesUrogenital_radio.Checked = true;
                        }
                        else
                        {
                            noUrogenital_radio.Checked = true;
                        }
                    }
                    else
                    {
                        sensorySystem_area.InnerText = "";
                        Textarea2.InnerText = "";
                        superficialReflexesComments_txt.Text = "";
                        TextBox3.Text = "";
                        cerebellarFunctions_area.InnerText = "";
                        Textarea3.InnerText = "";
                        cardiovascularSystem_area.InnerText = "";
                        respiratorySystem_area.InnerText = "";
                        gastrointestinalSystem_area.InnerText = "";
                        urogenitalSystem_area.InnerText = "";
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

        protected void update_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("Update systematicExamination Set meningialIrritation= @meningialIrritation ,carnivalNervers= @carnivalNervers,sensorySystem=@sensorySystem,motorSystem=@motorSystem  ,superficialReflexes=@superficialReflexes  ,deepReflexes=@deepReflexes  ,cerebellarFunctions=@cerebellarFunctions  ,fundoscopy=@fundoscopy  ,cardioVascularSystem=@cardioVascularSystem ,respiratorySystem=@respiratorySystem  ,gastroIntestinalSystem=@gastroIntestinalSystem ,urogenitalSystem =@urogenitalSystem, cranialNervesRadio=@cranialNervesRadio, sensorySystemRadio=@sensorySystemRadio, motorSystemRadio=@motorSystemRadio, superficialRadio=@superficialRadio, deepReflexRadio=@deepReflexRadio, cerebellarRadio = @cerebellarRadio, fundoscopyRadio=@fundoscopyRadio, cardiovascularRadio=@cardiovascularRadio, respiratoryRadio=@respiratoryRadio, gastrointestinalRadio=@gastrointestinalRadio, urogenitalRadio=@urogenitalRadio where id='" + id + "' and visit_no='" + visitNumber_txt.Text + "'", con);

                cmd.Parameters.AddWithValue("@meningialIrritation", signsOfMeningial_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@carnivalNervers", TextBox1.Text);
                cmd.Parameters.AddWithValue("@sensorySystem", sensorySystem_area.InnerText);
                cmd.Parameters.AddWithValue("@motorSystem", Textarea2.InnerText);
                cmd.Parameters.AddWithValue("@superficialReflexes", superficialReflexesComments_txt.Text);
                cmd.Parameters.AddWithValue("@deepReflexes", TextBox3.Text);
                cmd.Parameters.AddWithValue("@cerebellarFunctions", cerebellarFunctions_area.InnerText);
                cmd.Parameters.AddWithValue("@fundoscopy", Textarea3.InnerText);
                cmd.Parameters.AddWithValue("@cardioVascularSystem", cardiovascularSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@respiratorySystem", respiratorySystem_area.InnerText);
                cmd.Parameters.AddWithValue("@gastroIntestinalSystem", gastrointestinalSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@urogenitalSystem", urogenitalSystem_area.InnerText);

                if (yescranialNerves_radio.Checked)
                    cmd.Parameters.AddWithValue("@cranialNervesRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@cranialNervesRadio", 2);

                if (yessensorySystem_radio.Checked)
                    cmd.Parameters.AddWithValue("@sensorySystemRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@sensorySystemRadio", 2);

                if (yesMotorSystem_radio.Checked)
                    cmd.Parameters.AddWithValue("@motorSystemRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@motorSystemRadio", 2);

                if (yesSuperficial_radio.Checked)
                    cmd.Parameters.AddWithValue("@superficialRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@superficialRadio", 2);

                if (yesDeepReflexes_radio.Checked)
                    cmd.Parameters.AddWithValue("@deepReflexRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@deepReflexRadio", 2);

                if (yesCerebellar_radio.Checked)
                    cmd.Parameters.AddWithValue("@cerebellarRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@cerebellarRadio", 2);

                if (yesFundoscopy_radio.Checked)
                    cmd.Parameters.AddWithValue("@fundoscopyRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@fundoscopyRadio", 2);

                if (yesCardiovascular_radio.Checked)
                    cmd.Parameters.AddWithValue("@cardiovascularRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@cardiovascularRadio", 2);

                if (yesRespiratory_radio.Checked)
                    cmd.Parameters.AddWithValue("@respiratoryRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@respiratoryRadio", 2);

                if (yesGastrointes_radio.Checked)
                    cmd.Parameters.AddWithValue("@gastrointestinalRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@gastrointestinalRadio", 2);

                if (yesUrogenital_radio.Checked)
                    cmd.Parameters.AddWithValue("@urogenitalRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@urogenitalRadio", 2);

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

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into systematicExamination(id,visit_no, meningialIrritation,carnivalNervers,sensorySystem,motorSystem ,superficialReflexes ,deepReflexes ,cerebellarFunctions ,fundoscopy ,cardioVascularSystem ,respiratorySystem ,gastroIntestinalSystem ,urogenitalSystem, cranialNervesRadio, sensorySystemRadio, motorSystemRadio, superficialRadio, deepReflexRadio, cerebellarRadio, fundoscopyRadio, cardiovascularRadio, respiratoryRadio, gastrointestinalRadio, urogenitalRadio) values(@id,@visit_no, @meningialIrritation,@carnivalNervers,@sensorySystem,@motorSystem ,@superficialReflexes ,@deepReflexes ,@cerebellarFunctions ,@fundoscopy ,@cardioVascularSystem ,@respiratorySystem ,@gastroIntestinalSystem ,@urogenitalSystem, @cranialNervesRadio, @sensorySystemRadio, @motorSystemRadio, @superficialRadio, @deepReflexRadio, @cerebellarRadio, @fundoscopyRadio, @cardiovascularRadio, @respiratoryRadio, @gastrointestinalRadio, @urogenitalRadio  )", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@visit_no", visitNumber_txt.Text);
                cmd.Parameters.AddWithValue("@meningialIrritation", signsOfMeningial_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@carnivalNervers", TextBox1.Text);
                cmd.Parameters.AddWithValue("@sensorySystem", sensorySystem_area.InnerText);
                cmd.Parameters.AddWithValue("@motorSystem", Textarea2.InnerText);
                cmd.Parameters.AddWithValue("@superficialReflexes", superficialReflexesComments_txt.Text);
                cmd.Parameters.AddWithValue("@deepReflexes", TextBox3.Text);
                cmd.Parameters.AddWithValue("@cerebellarFunctions", cerebellarFunctions_area.InnerText);
                cmd.Parameters.AddWithValue("@fundoscopy", Textarea3.InnerText);
                cmd.Parameters.AddWithValue("@cardioVascularSystem", cardiovascularSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@respiratorySystem", respiratorySystem_area.InnerText);
                cmd.Parameters.AddWithValue("@gastroIntestinalSystem", gastrointestinalSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@urogenitalSystem", urogenitalSystem_area.InnerText);

                if(yescranialNerves_radio.Checked)
                    cmd.Parameters.AddWithValue("@cranialNervesRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@cranialNervesRadio", 2);

                if (yessensorySystem_radio.Checked)
                    cmd.Parameters.AddWithValue("@sensorySystemRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@sensorySystemRadio", 2);

                if (yesMotorSystem_radio.Checked)
                    cmd.Parameters.AddWithValue("@motorSystemRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@motorSystemRadio", 2);

                if (yesSuperficial_radio.Checked)
                    cmd.Parameters.AddWithValue("@superficialRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@superficialRadio", 2);

                if (yesDeepReflexes_radio.Checked)
                    cmd.Parameters.AddWithValue("@deepReflexRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@deepReflexRadio", 2);

                if (yesCerebellar_radio.Checked)
                    cmd.Parameters.AddWithValue("@cerebellarRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@cerebellarRadio", 2);

                if (yesFundoscopy_radio.Checked)
                    cmd.Parameters.AddWithValue("@fundoscopyRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@fundoscopyRadio", 2);

                if (yesCardiovascular_radio.Checked)
                    cmd.Parameters.AddWithValue("@cardiovascularRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@cardiovascularRadio", 2);

                if (yesRespiratory_radio.Checked)
                    cmd.Parameters.AddWithValue("@respiratoryRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@respiratoryRadio", 2);

                if (yesGastrointes_radio.Checked)
                    cmd.Parameters.AddWithValue("@gastrointestinalRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@gastrointestinalRadio", 2);

                if (yesUrogenital_radio.Checked)
                    cmd.Parameters.AddWithValue("@urogenitalRadio", 1);
                else
                    cmd.Parameters.AddWithValue("@urogenitalRadio", 2);


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