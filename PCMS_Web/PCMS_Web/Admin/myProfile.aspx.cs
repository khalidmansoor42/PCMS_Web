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
    public partial class WebForm6 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null && !IsPostBack)
            {
                fill_text_fields();
            }
        }
        void fill_text_fields()
        {

            try
            {
                String query = "SELECT * FROM user_registeration where user_name='" + Session["userName"].ToString() + "';";
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    if (dr.HasRows)
                    {
                        this.fullName_txt.Text = dr["full_name"].ToString();
                        this.fatherName_txt.Text = dr["father_name"].ToString();
                        string gender = dr["sex"].ToString();
                        if (gender == "1")
                        {
                            this.gender_dd.Text = "Male";
                        }
                        else
                        {
                            this.gender_dd.Text = "Female";
                        }
                        this.mobile_txt.Text = dr["mob"].ToString();
                        this.cnic_txt.Text = dr["cnic"].ToString();
                        this.email_txt.Text = dr["email"].ToString();
                        this.address_area.Value = dr["address"].ToString();
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void updateProfile_btn_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
            try
            {
                SqlConnection myConn = new SqlConnection(constring);
                String quray = "update user_registeration set full_name=@name,father_name=@father_name,sex=@sex,mob=@mob,cnic=@cnic,address=@address where user_name='" + Session["userName"].ToString() + "' ;";
                SqlCommand SelectCommand = new SqlCommand(quray, myConn);
                SqlDataReader myReader;
                SelectCommand.Parameters.Add(new SqlParameter("@name", fullName_txt.Text));
                SelectCommand.Parameters.Add(new SqlParameter("@father_name", fatherName_txt.Text));
                if (gender_dd.Text == "Male")
                {
                    SelectCommand.Parameters.Add(new SqlParameter("@sex", "1"));
                }
                else
                {
                    SelectCommand.Parameters.Add(new SqlParameter("@sex", "0"));
                }
                SelectCommand.Parameters.Add(new SqlParameter("@mob", mobile_txt.Text));
                SelectCommand.Parameters.Add(new SqlParameter("@cnic", cnic_txt.Text));
                SelectCommand.Parameters.Add(new SqlParameter("@email", email_txt.Text));
                SelectCommand.Parameters.Add(new SqlParameter("@address", address_area.Value));

                myConn.Open();
                myReader = SelectCommand.ExecuteReader();
                myConn.Close();
                Msg_alert.Visible = true;

            }
            catch (Exception ex)
            {
            }
        }
    }
}