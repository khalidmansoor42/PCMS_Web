using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Receptionist
{
    public partial class duplicateInvoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dateTime_txt.Text = DateTime.Now.ToString("yyyy-MM-dd");
            totalAmount_txt.Text = "1000";
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
            patientId_txt.Text = GridView1.SelectedRow.Cells[1].Text;
            fullName_txt.Text = GridView1.SelectedRow.Cells[2].Text;
            receiptNumber_txt.Text = GridView1.SelectedRow.Cells[9].Text;
            visitNumber_txt.Text = GridView1.SelectedRow.Cells[7].Text;
            tokenNumber_txt.Text = GridView1.SelectedRow.Cells[6].Text;

        }

        protected void printInvoice_btn_Click(object sender, EventArgs e)
        {
            Session["reciept"] = receiptNumber_txt.Text;
            Response.Redirect("../Receptionist/receipt.aspx");

        }
    }
}