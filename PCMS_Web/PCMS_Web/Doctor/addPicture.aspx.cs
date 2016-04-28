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
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["PatientId"] = 1;
            int id = Convert.ToInt32(Session["PatientId"].ToString());
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
                                        cmd.Parameters.AddWithValue("@id", id);
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