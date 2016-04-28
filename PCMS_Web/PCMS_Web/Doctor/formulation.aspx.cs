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
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PatientId"] = 1;
            if (Session["PatientId"] != null)
            {
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
                SqlCommand cmd = new SqlCommand("Select Formulation,managementPlans from Formulation where id='" + id + "'", con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    formulation_area.InnerText = dr["Formulation"].ToString();
                    managementSkills_area.InnerText = dr["managementPlans"].ToString();
                }
                else
                {
                    formulation_area.InnerText = "";
                    managementSkills_area.InnerText = "";
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

        protected void addFormulation(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into Formulation (id,visit_no,Formulation,managementPlans) values(@id,@visit_no,@formulation,@plan)", con);
                if (formulation_area.InnerText != "" && managementSkills_area.InnerText != "")
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.Parameters.AddWithValue("@visit_no", 1);
                    cmd.Parameters.AddWithValue("@formulation", formulation_area.InnerText);
                    cmd.Parameters.AddWithValue("@plan", managementSkills_area.InnerText);
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