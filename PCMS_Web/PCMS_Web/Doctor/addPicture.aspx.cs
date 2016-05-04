using PCMS_Web.Class;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        string id = "";
        getInformation info = new getInformation();
        string[] patientInfo = new string[4];
        maxValue obj1 = new maxValue();
        int maxvisit = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PatientId"] != null && !IsPostBack)
            {

                patientInfo = info.information("SELECT a.full_name, a.father_name,a.dob, b.visit_no FROM patient_registeration a, visit b  WHERE a.patient_reg = b.patient_reg  AND b.visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'And  a.patient_reg ='" + Session["PatientId"].ToString() + "' And b.patient_reg='" + Session["PatientId"].ToString() + "';");
                patientId_txt.Text = Session["PatientId"].ToString();
                visitNumber_txt.Text = patientInfo[2];
                patientName.Text = patientInfo[0];
                ageTxt.Text = patientInfo[3];
                 id = Session["PatientId"].ToString();
            }
        }


        protected void Upload(object sender, EventArgs e)
        {
            try
            {
                if (Context.Request.Files.Count > 0)
                {

                    foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
                    {

                        string filename = Path.GetFileName(postedFile.FileName);
                        string contentType = postedFile.ContentType;

                        string path = "../dist/Files/" + Path.GetFileName(filename);

                        string fName = Context.Server.MapPath("../dist/Files/" + postedFile.FileName);
                        postedFile.SaveAs(fName);

                        using (Stream fs = postedFile.InputStream)
                        {
                            using (BinaryReader br = new BinaryReader(fs))
                            {


                                using (SqlConnection con = new SqlConnection(constring))
                                {
                                    string query = "insert into UploadedFiles(id,FileName,FilePath,ContentType) values (@id,@Name,@path, @ContentType)";
                                    using (SqlCommand cmd = new SqlCommand(query))
                                    {
                                        cmd.Connection = con;
                                        cmd.Parameters.AddWithValue("@id", patientId_txt.Text);
                                        cmd.Parameters.AddWithValue("@path", path);
                                        cmd.Parameters.AddWithValue("@Name", filename);
                                        cmd.Parameters.AddWithValue("@ContentType", contentType);

                                        con.Open();
                                        cmd.ExecuteNonQuery();
                                        con.Close();

                                    }
                                }
                            }
                        }
                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                alert_success.Visible = true;

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