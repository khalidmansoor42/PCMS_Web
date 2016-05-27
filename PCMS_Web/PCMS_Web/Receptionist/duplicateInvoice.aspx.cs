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
    public partial class duplicateInvoice : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            dateTime_txt.Text = DateTime.Now.ToString("yyyy-MM-dd");
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
            patientId_txt.Text = GridView1.SelectedRow.Cells[2].Text;
            fullName_txt.Text = GridView1.SelectedRow.Cells[3].Text;
            receiptNumber_txt.Text = GridView1.SelectedRow.Cells[1].Text;
            visitNumber_txt.Text = GridView1.SelectedRow.Cells[5].Text;
            tokenNumber_txt.Text = GridView1.SelectedRow.Cells[6].Text;
            totalAmount_txt.Text = GridView1.SelectedRow.Cells[7].Text;
            assignDoctor_dd.SelectedValue = GridView1.SelectedRow.Cells[9].Text; ;


        }

        protected void printInvoice_btn_Click(object sender, EventArgs e)
        {
            Session["reciept"] = receiptNumber_txt.Text;
            Response.Redirect("../Receptionist/PatientInvoice.aspx");

        }

        protected void updateInvoice_btn_Click(object sender, EventArgs e)
        {
            if (patientId_txt.Text != "")
            {
                try
                {
                    String query;
                    SqlConnection myConn = new SqlConnection(constring);
                    query = "UPDATE visit SET employee_id=@5 WHERE patient_reg=@1 and visit_no=@2;UPDATE receipt SET total=@4,employee_id=@5 WHERE patient_reg=@1 and Receipt_id=@3 and visit_no=@2;";
                    SqlCommand SelectCommand = new SqlCommand(query, myConn);
                    SqlDataReader myReader;
                    myConn.Open();
                    SelectCommand.Parameters.Add(new SqlParameter("@1", Convert.ToInt32(patientId_txt.Text)));
                    SelectCommand.Parameters.Add(new SqlParameter("@2", visitNumber_txt.Text));
                    SelectCommand.Parameters.Add(new SqlParameter("@3", receiptNumber_txt.Text));
                    SelectCommand.Parameters.Add(new SqlParameter("@4", Convert.ToInt32(totalAmount_txt.Text)));
                    SelectCommand.Parameters.Add(new SqlParameter("@5", assignDoctor_dd.SelectedValue));

                    myReader = SelectCommand.ExecuteReader();
                    myConn.Close();
                    Response.Redirect("../Receptionist/duplicateInvoice.aspx");

                    //    MetroMessageBox.Show(this, "\n" + "Data Has Been Updated", ":)", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception ex)
                {
                    //   MetroMessageBox.Show(this, "\n" + ex.Message, ":(", MessageBoxButtons.AbortRetryIgnore, MessageBoxIcon.Error);
                }
            }
            else
            {
             //   MetroMessageBox.Show(this, "\n" + "Please Fill The Required Field", ":/", MessageBoxButtons.RetryCancel, MessageBoxIcon.Warning);
            }

        }
    }
}