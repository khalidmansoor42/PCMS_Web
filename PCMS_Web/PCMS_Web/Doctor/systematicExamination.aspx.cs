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
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SELECT meningialIrritation,carnivalNervers,sensorySystem,motorSystem ,superficialReflexes ,deepReflexes ,cerebellarFunctions ,fundoscopy ,cardioVascularSystem ,respiratorySystem ,gastroIntestinalSystem ,nervousSystem ,urogenitalSystem FROM systematicExamination where id='" + id + "'", con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    meningialIrritationComments_txt.Text = dr["meningialIrritation"].ToString();
                    cranialNervesComment_txt.Text = dr["carnivalNervers"].ToString();
                    sensorySystem_area.InnerText = dr["sensorySystem"].ToString();
                    motorSystem_area.InnerText = dr["motorSystem"].ToString();
                    superficialReflexesComments_txt.Text = dr["superficialReflexes"].ToString();
                    deepReflexComments_txt.Text = dr["deepReflexes"].ToString();
                    cerebellarFunctions_area.InnerText = dr["cerebellarFunctions"].ToString();
                    fundoscopy_area.InnerText = dr["fundoscopy"].ToString();
                    cardiovascularSystem_area.InnerText = dr["cardioVascularSystem"].ToString();
                    respiratorySystem_area.InnerText = dr["respiratorySystem"].ToString();
                    gastrointestinalSystem_area.InnerText = dr["gastroIntestinalSystem"].ToString();
                    nervousSystem_area.InnerText = dr["nervousSystem"].ToString();
                    urogenitalSystem_area.InnerText = dr["urogenitalSystem"].ToString();

                }
                else
                {
                    meningialIrritationComments_txt.Text = "";
                    cranialNervesComment_txt.Text = "";
                    sensorySystem_area.InnerText = "";
                    motorSystem_area.InnerText = "";
                    superficialReflexesComments_txt.Text = "";
                    deepReflexComments_txt.Text = "";
                    cerebellarFunctions_area.InnerText = "";
                    fundoscopy_area.InnerText = "";
                    cardiovascularSystem_area.InnerText = "";
                    respiratorySystem_area.InnerText = "";
                    gastrointestinalSystem_area.InnerText = "";
                    nervousSystem_area.InnerText = "";
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

        protected void update_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("Update systematicExamination Set meningialIrritation= @meningialIrritation ,carnivalNervers= @carnivalNervers,sensorySystem=@sensorySystem,motorSystem=@motorSystem  ,superficialReflexes=@superficialReflexes  ,deepReflexes=@deepReflexes  ,cerebellarFunctions=@cerebellarFunctions  ,fundoscopy=@fundoscopy  ,cardioVascularSystem=@cardioVascularSystem ,respiratorySystem=@respiratorySystem  ,gastroIntestinalSystem=@gastroIntestinalSystem  ,nervousSystem=@nervousSystem  ,urogenitalSystem =@urogenitalSystem where id='" + id + "' and visit_no=1", con);

                cmd.Parameters.AddWithValue("@meningialIrritation", meningialIrritationComments_txt.Text);
                cmd.Parameters.AddWithValue("@carnivalNervers", cranialNervesComment_txt.Text);
                cmd.Parameters.AddWithValue("@sensorySystem", sensorySystem_area.InnerText);
                cmd.Parameters.AddWithValue("@motorSystem", motorSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@superficialReflexes", superficialReflexesComments_txt.Text);
                cmd.Parameters.AddWithValue("@deepReflexes", deepReflexComments_txt.Text);
                cmd.Parameters.AddWithValue("@cerebellarFunctions", cerebellarFunctions_area.InnerText);
                cmd.Parameters.AddWithValue("@fundoscopy", fundoscopy_area.InnerText);
                cmd.Parameters.AddWithValue("@cardioVascularSystem", cardiovascularSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@respiratorySystem", respiratorySystem_area.InnerText);
                cmd.Parameters.AddWithValue("@gastroIntestinalSystem", gastrointestinalSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@nervousSystem", nervousSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@urogenitalSystem", urogenitalSystem_area.InnerText);
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
                SqlCommand cmd = new SqlCommand("insert into systematicExamination(id,visit_no, meningialIrritation,carnivalNervers,sensorySystem,motorSystem ,superficialReflexes ,deepReflexes ,cerebellarFunctions ,fundoscopy ,cardioVascularSystem ,respiratorySystem ,gastroIntestinalSystem ,nervousSystem ,urogenitalSystem ) values(@id,@visit_no, @meningialIrritation,@carnivalNervers,@sensorySystem,@motorSystem ,@superficialReflexes ,@deepReflexes ,@cerebellarFunctions ,@fundoscopy ,@cardioVascularSystem ,@respiratorySystem ,@gastroIntestinalSystem ,@nervousSystem ,@urogenitalSystem  )", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@visit_no", 1);
                cmd.Parameters.AddWithValue("@meningialIrritation", meningialIrritationComments_txt.Text);
                cmd.Parameters.AddWithValue("@carnivalNervers", cranialNervesComment_txt.Text);
                cmd.Parameters.AddWithValue("@sensorySystem", sensorySystem_area.InnerText);
                cmd.Parameters.AddWithValue("@motorSystem", motorSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@superficialReflexes", superficialReflexesComments_txt.Text);
                cmd.Parameters.AddWithValue("@deepReflexes", deepReflexComments_txt.Text);
                cmd.Parameters.AddWithValue("@cerebellarFunctions", cerebellarFunctions_area.InnerText);
                cmd.Parameters.AddWithValue("@fundoscopy", fundoscopy_area.InnerText);
                cmd.Parameters.AddWithValue("@cardioVascularSystem", cardiovascularSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@respiratorySystem", respiratorySystem_area.InnerText);
                cmd.Parameters.AddWithValue("@gastroIntestinalSystem", gastrointestinalSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@nervousSystem", nervousSystem_area.InnerText);
                cmd.Parameters.AddWithValue("@urogenitalSystem", urogenitalSystem_area.InnerText);
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