using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Receptionist
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        maxValue maxvalue = new maxValue();
        string visit = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void searchPatient_btn_Click(object sender, EventArgs e)
        {
            if (searchPatient_txt.Text == "")
            {
                GridView1.DataSourceID = "PatientDataSource";
            }
            else
            {
                GridView1.DataSourceID = "PatientSearchDataSource";
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            fullName_txt.Text = GridView1.SelectedRow.Cells[2].Text;
            patientId_txt.Text= GridView1.SelectedRow.Cells[1].Text;
        }

        protected void printReceipt_btn_Click(object sender, EventArgs e)
        {
            if (patientId_txt.Text != "")
            {
                findvisitnumber obj1 = new findvisitnumber();
                int pat = obj1.findpatientid("SELECT patient_reg  FROM visit where patient_reg='" + patientId_txt.Text + "' and checks=0 and visit.visit_date='" + DateTime.Today + "';");
                if (pat == 0)
                {
                    getvisitid();
                    if (assignDoctor_dd.Text != "" && patientId_txt.Text != "")
                    {
                        try
                        {
                            SqlConnection myConn = new SqlConnection(constring);
                            String query = "insert into visit(patient_reg,visit_date,visit_no,employee_id,user_name,noti)values(@patient_reg, @date, @visit, @Refdoc, @userName,@noti);  insert into receipt (token_no,patient_reg,employee_id,total,Date,visit_no,receiptdate )values (@token, @patient_reg, @Refdoc, @fee, @date, @visit, @date);INSERT INTO Formulation (id,medication,investigation,counselling,direction,visit_no)VALUES(@patient_reg,'1','1','1','1',@visit)  ;";
                            SqlCommand SelectCommand = new SqlCommand(query, myConn);
                            SqlDataReader myReader;
                            myConn.Open();
                            int token = maxvalue.max("select max(token_no) from receipt where Date = '" + DateTime.Today.ToString("yyyy-MM-dd") + "';") + 1;
                            int reciept = maxvalue.max("select max(Receipt_id) from receipt") + 1;
                            SelectCommand.Parameters.Add(new SqlParameter("@token", Convert.ToInt32(token)));
                            SelectCommand.Parameters.Add(new SqlParameter("@patient_reg", Convert.ToInt32(patientId_txt.Text)));
                            SelectCommand.Parameters.Add(new SqlParameter("@Refdoc", assignDoctor_dd.SelectedValue));
                            SelectCommand.Parameters.Add(new SqlParameter("@date", DateTime.Today));
                            SelectCommand.Parameters.Add(new SqlParameter("@userName", "muaz"));
                            SelectCommand.Parameters.Add(new SqlParameter("@noti", 1));
                            SelectCommand.Parameters.Add(new SqlParameter("@visit", Convert.ToInt32(visit)));
                            SelectCommand.Parameters.Add(new SqlParameter("@fee", fee.Text));
                            myReader = SelectCommand.ExecuteReader();
                            myConn.Close();
                            Session["reciept"] = reciept;
                            Response.Redirect("../Receptionist/PatientInvoice.aspx");
                        }
                        catch (Exception ex)
                        {
                            errorMsg_alert.Visible = true;
                            error_lb.Text = ex.Message;
                        }
                    }
                    else
                    {
                        errorMsg_alert.Visible = true;
                        error_lb.Text = "Fill Required Fields";
                    }
                }
                else
                {
                    errorMsg_alert.Visible = true;
                    error_lb.Text = "Patient Already Exists";
                }
            }else
            {
                errorMsg_alert.Visible = true;
                error_lb.Text = "Please Select patient";
            }
        }
        void getvisitid()
        {
            visit = Convert.ToString(maxvalue.max("select max(visit_no) from visit where patient_reg = '" + patientId_txt.Text + "'") + 1);
        }
    }
}