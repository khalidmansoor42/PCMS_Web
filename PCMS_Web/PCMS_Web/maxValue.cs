using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PCMS_Web
{
    public class maxValue
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        public int max(string query)
        {
            SqlConnection myConn = new SqlConnection(constring);
            myConn.Open();
            try
            {                SqlCommand command = new SqlCommand(query, myConn);

                string c = command.ExecuteScalar().ToString();
                if (c == "")
                {
                    c = "0";

                }
                return  Convert.ToInt32(c);

            }
            finally
            {
                myConn.Close();
            }
        }
    }
}