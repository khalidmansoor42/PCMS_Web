using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Admin
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchDisease_btn_Click(object sender, EventArgs e)
        {
            if (searchDisease_txt.Text == "")
            {
                GridView1.DataSourceID = "DiseaseNameDataSource";
            }
            else
            {
                GridView1.DataSourceID = "DiseaseNameSearchDataSource";
            }
        }

        protected void addDisease_btn_Click(object sender, EventArgs e)
        {
            if (diseaseName_txt.Text != "" && diseaseCode_txt.Text !="")
            {
                string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                String query = "INSERT INTO diagnosesDiseases(diagnosesCode, masterCode, diseaseName)VALUES(@diagnoseCode, @masterCode, @diseaseName); ";
                
                SqlCommand SelectCommand1 = new SqlCommand(query, con);
                SqlDataReader myReader1;
                con.Open();
                SelectCommand1.Parameters.Add(new SqlParameter("@diagnoseCode", diseaseCode_txt.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@masterCode", masterCode_ddl.SelectedItem.Text));
                SelectCommand1.Parameters.Add(new SqlParameter("@diseaseName", diseaseName_txt.Text));
                myReader1 = SelectCommand1.ExecuteReader();
                con.Close();
                diseaseName_txt.Text = "";
                GridView1.DataSourceID = "DiseaseNameDataSource";
            }
        }
    }
}