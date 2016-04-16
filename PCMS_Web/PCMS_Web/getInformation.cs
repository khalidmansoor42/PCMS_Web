using PCMS_Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PCMS_Web.Class
{
    class getInformation
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        FindAge obj = new FindAge();
        FindAge agecal = new FindAge();
        string[] patientInfo = new string[4];
        public string [] information(string query)
        {
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = query;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //for insert remove data reader and replace cmd.executenonquery()
                if (dr.HasRows)
                {
                    patientInfo[0] = dr["full_name"].ToString();
                    patientInfo[1] = dr["father_name"].ToString();
                    patientInfo[2] = dr["visit_no"].ToString();
                    patientInfo[3] = agecal.calculateAge(Convert.ToDateTime(dr["dob"].ToString()));
                }
            }
            con.Close();
            return patientInfo;
        }
    }
}
