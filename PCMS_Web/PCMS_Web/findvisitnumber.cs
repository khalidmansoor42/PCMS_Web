using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace PCMS_Web
{
    class findvisitnumber
    {
        string a="0";
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        public int findvisits(string user_query)
        {        
           
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = user_query;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                     a = dr["visit_no"].ToString();
                }
                con.Close();
                return Convert.ToInt32(a);  
            }
            catch (Exception )
            {
                return 0;
            }
        }

        public int findpatientid(string user_query)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = user_query;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    a = dr["Patient_reg"].ToString();
                }
                con.Close();
                return Convert.ToInt32(a);
            }
            catch (Exception)
            {
                return 0;
            }
        }
     

    }
 

}
