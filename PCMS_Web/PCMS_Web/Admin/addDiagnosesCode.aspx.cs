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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchPatient_btn_Click(object sender, EventArgs e)
        {
            if (searchPatient_txt.Text == "")
            {
                GridView1.DataSourceID = "DiagnosesMasterDataSource";
            }
            else
            {
                GridView1.DataSourceID = "DiagnosesMasterSearchDataSource";
            }
        }

        protected void addCity_btn_Click(object sender, EventArgs e)
        {
            if (cityName_txt.Text != "")
            {
                string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(constring);
                String query = "INSERT INTO diagnosesMaster(masterCode)VALUES(@masterCode); ";
                
                SqlCommand SelectCommand1 = new SqlCommand(query, con);
                SqlDataReader myReader1;
                con.Open();
                SelectCommand1.Parameters.Add(new SqlParameter("@masterCode", cityName_txt.Text));
                myReader1 = SelectCommand1.ExecuteReader();
                con.Close();
                cityName_txt.Text = "";
                GridView1.DataSourceID = "DiagnosesMasterDataSource";
            }
        }
    }
}