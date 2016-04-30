﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["patient_reg"] = 1;
            if (Session["patient_reg"] != null)
            {
                id = Session["patient_reg"].ToString();
                if (!Page.IsPostBack)
                {
                    GetHistory();

                }
            }
        }

        public void GetHistory()
        {
            try
            {
                patientId_txt.Text = id;
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SELECT visit_no ,completeBloodExamination ,completeUrineExamination ,liverFunctionTest ,ecg ,bloodSugarRb ,bloodSugarArea ,thyroidFuctionTest ,radiography ,ulgranSonography ,ctScan ,otherComments FROM investigation where id='" + id + "'", con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    completeBloodExaminationComments_area.InnerText = dr["completeBloodExamination"].ToString();
                    completeUrineExaminationComments_area.InnerText = dr["completeUrineExamination"].ToString();
                    liverTestComments_area.InnerText = dr["liverFunctionTest"].ToString();
                    ecgComments_area.InnerText = dr["ecg"].ToString();

                    if ((Convert.ToInt32(dr["bloodSugarRb"].ToString()) == 1))
                    {
                        fasting_radio.Checked = true;
                        random_radio.Checked = false;
                    }
                    else
                    {
                        random_radio.Checked = true;
                    }

                    bloodSugarComments_area.InnerText = dr["bloodSugarArea"].ToString();
                    thyroidFunctionComments_area.InnerText = dr["thyroidFuctionTest"].ToString();
                    radiographyComments_area.InnerText = dr["radiography"].ToString();
                    ulgrasonographyComments_area.InnerText = dr["ulgranSonography"].ToString();
                    ctScanComments_area.InnerText = dr["ctScan"].ToString();
                    otherComments_area.InnerText = dr["otherComments"].ToString();

                }
                else
                {
                    completeBloodExaminationComments_area.InnerText = "";
                    completeUrineExaminationComments_area.InnerText = "";
                    liverTestComments_area.InnerText = "";
                    ecgComments_area.InnerText = "";
                    bloodSugarComments_area.InnerText = "";
                    thyroidFunctionComments_area.InnerText = "";
                    radiographyComments_area.InnerText = "";
                    ulgrasonographyComments_area.InnerText = "";
                    ctScanComments_area.InnerText = "";
                    otherComments_area.InnerText = "";
                }

                con.Close();
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into investigation ( id,visit_no ,completeBloodExamination ,completeUrineExamination ,liverFunctionTest ,ecg ,bloodSugarRb ,bloodSugarArea ,thyroidFuctionTest ,radiography ,ulgranSonography ,ctScan ,otherComments) values(@id,@visit_no ,@completeBloodExamination ,@completeUrineExamination ,@liverFunctionTest ,@ecg ,@bloodSugarRb ,@bloodSugarArea ,@thyroidFuctionTest ,@radiography ,@ulgranSonography ,@ctScan ,@otherComments)", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@visit_no", 1);
                cmd.Parameters.AddWithValue("@completeBloodExamination", completeBloodExaminationComments_area.InnerText);
                cmd.Parameters.AddWithValue("@completeUrineExamination", completeUrineExaminationComments_area.InnerText);
                cmd.Parameters.AddWithValue("@liverFunctionTest", liverTestComments_area.InnerText);
                cmd.Parameters.AddWithValue("@ecg", ecgComments_area.InnerText);
                if (random_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@bloodSugarRb", 0);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@bloodSugarRb", 1);
                }
                cmd.Parameters.AddWithValue("@bloodSugarArea", bloodSugarComments_area.InnerText);
                cmd.Parameters.AddWithValue("@thyroidFuctionTest", thyroidFunctionComments_area.InnerText);
                cmd.Parameters.AddWithValue("@radiography", radiographyComments_area.InnerText);
                cmd.Parameters.AddWithValue("@ulgranSonography", ulgrasonographyComments_area.InnerText);
                cmd.Parameters.AddWithValue("@ctScan", ctScanComments_area.InnerText);
                cmd.Parameters.AddWithValue("@otherComments", otherComments_area.InnerText);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                alert_success.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }

        protected void update_btn_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("update  investigation set completeBloodExamination=@completeBloodExamination, completeUrineExamination=@completeUrineExamination, liverFunctionTest=@liverFunctionTest, ecg=@ecg, bloodSugarRb=@bloodSugarRb, bloodSugarArea=@bloodSugarArea, thyroidFuctionTest=@thyroidFuctionTest, radiography=@radiography, ulgranSonography=@ulgranSonography, ctScan=@ctScan, otherComments=@otherComments where id='" + id + "' and visit_no=1", con);

                cmd.Parameters.AddWithValue("@completeBloodExamination", completeBloodExaminationComments_area.InnerText);
                cmd.Parameters.AddWithValue("@completeUrineExamination", completeUrineExaminationComments_area.InnerText);
                cmd.Parameters.AddWithValue("@liverFunctionTest", liverTestComments_area.InnerText);
                cmd.Parameters.AddWithValue("@ecg", ecgComments_area.InnerText);
                if (random_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@bloodSugarRb", 0);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@bloodSugarRb", 1);
                }
                cmd.Parameters.AddWithValue("@bloodSugarArea", bloodSugarComments_area.InnerText);
                cmd.Parameters.AddWithValue("@thyroidFuctionTest", thyroidFunctionComments_area.InnerText);
                cmd.Parameters.AddWithValue("@radiography", radiographyComments_area.InnerText);
                cmd.Parameters.AddWithValue("@ulgranSonography", ulgrasonographyComments_area.InnerText);
                cmd.Parameters.AddWithValue("@ctScan", ctScanComments_area.InnerText);
                cmd.Parameters.AddWithValue("@otherComments", otherComments_area.InnerText);

                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                alert_success.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
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