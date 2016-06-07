using PCMS_Web.Class;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm18 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        string date = DateTime.Now.ToString("yyyy-MM-dd");
        string id = "1";
        getInformation info = new getInformation();
        string[] patientInfo = new string[4];
        maxValue obj1 = new maxValue();
        int maxvisit = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PatientId"] != null)
            {
                patientInfo = info.information("SELECT a.full_name, a.father_name,a.dob, b.visit_no FROM patient_registeration a, visit b  WHERE a.patient_reg = b.patient_reg  AND b.visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'And  a.patient_reg ='" + Session["PatientId"].ToString() + "' And b.patient_reg='" + Session["PatientId"].ToString() + "';");
                id = Session["PatientId"].ToString();
                patientId_txt.Text = Session["PatientId"].ToString();
                visitNumber_txt.Text = patientInfo[2];
                patientName.Text = patientInfo[0];
                ageTxt.Text = patientInfo[3];
                if (!Page.IsPostBack)
                {
                    SetInitialRow();
                    GetHistory();
                    //admissionHistory();
                    illnessHistory();
                    drugs();
                    personalInfo();
                    family();

                }
            }
        }

        //public void admissionHistory()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(constring);
        //        SqlCommand cmd = new SqlCommand("SELECT admissionType,patientClassification from admissionHistory where patient_reg='" + id + "'", con);
        //        cmd.Connection = con;
        //        SqlDataReader dr;
        //        con.Open();
        //        dr = cmd.ExecuteReader();
        //        if (dr.Read())
        //        {
        //            saveBtn.Visible = false;
        //            updateBtn.Visible = true;
        //            if ((Convert.ToInt32(dr["admissionType"].ToString()) == 1))
        //            {
        //                treatment_radio.Checked = false;
        //                assessment_radio.Checked = true;
        //            }
        //            else if ((Convert.ToInt32(dr["admissionType"].ToString()) == 2))
        //            {
        //                treatment_radio.Checked = true;
        //            }
        //            else if ((Convert.ToInt32(dr["admissionType"].ToString()) == 3))
        //            {
        //                treatment_radio.Checked = false;
        //                urgent_radio.Checked = true;
        //            }
        //            else if ((Convert.ToInt32(dr["admissionType"].ToString()) == 4))
        //            {
        //                treatment_radio.Checked = false;
        //                emergency_radio.Checked = true;
        //            }
        //            else if ((Convert.ToInt32(dr["admissionType"].ToString()) == 5))
        //            {
        //                treatment_radio.Checked = false;
        //                care_radio.Checked = true;
        //            }
        //            else
        //            {
        //                treatment_radio.Checked = true;
        //            }

        //            if ((Convert.ToInt32(dr["patientClassification"].ToString()) == 1))
        //            {
        //                reception_radio.Checked = false;
        //                judicial_radio.Checked = true;

        //            }

        //            else if ((Convert.ToInt32(dr["patientClassification"].ToString()) == 2))
        //            {
        //                reception_radio.Checked = false;
        //                nonJudicial_radio.Checked = true;
        //            }

        //            else if ((Convert.ToInt32(dr["patientClassification"].ToString()) == 3))
        //            {
        //                reception_radio.Checked = true;
        //            }
        //            else
        //            {
        //                reception_radio.Checked = true;
        //            }

        //        }
        //        else
        //        {
        //            updateBtn.Visible = false;
        //            saveBtn.Visible = true;
        //        }

        //        con.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        alert_fail.Visible = true;
        //        error.Text = "Error! " + ex.ToString();
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //    }
        //}

        public void illnessHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SELECT * from illnessHistory where patient_reg='" + id + "'", con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    saveBtn.Visible = false;
                    updateBtn.Visible = true;
                    historyOfPresentIllness_area.InnerText = dr["illHistoryText"].ToString();
                    CurrentDrugTreatment_area.InnerText = dr["currentTreatmentText"].ToString();
                    pastMedicalHistory_area.InnerText = dr["pastMedHistoryText"].ToString();
                    pastPsychiatricHistory_area.InnerText = dr["pastPsychHistoryText"].ToString();
                    courseOfIllness_area.InnerText = dr["cureText"].ToString();
                    noOfAdmissions_dd.SelectedValue = dr["previousText"].ToString();
                    //treatmentHistory_dd.SelectedValue = dr["treatmentHistoryDd"].ToString();
                    //pastMedicalHistory_dd.SelectedItem.Text = dr["pastMedicalHistoryDd"].ToString();
                    //pastPsychiatricHistory_dd.SelectedItem.Text = dr["pastPsychiatricHistoryDd"].ToString();
                    //cureRb radios
                    if ((Convert.ToInt32(dr["cureRb"].ToString()) == 1))
                    {
                        Radio2.Checked = true;
                    }
                    else if ((Convert.ToInt32(dr["cureRb"].ToString()) == 2))
                    {
                        Radio3.Checked = true;
                    }
                    else if ((Convert.ToInt32(dr["cureRb"].ToString()) == 3))
                    {
                        Radio4.Checked = true;
                    }
                    else
                    {
                        Radio1.Checked = true;
                    }
                    //previous admission radios
                    if ((Convert.ToInt32(dr["previousAdmissions"].ToString()) == 1))
                    {
                        noPreviousAdmission_radio.Checked = false;
                        yesPreviousAdmission_radio.Checked = true;
                    }
                    else
                    {
                        noPreviousAdmission_radio.Checked = true;
                    }
                }
                else
                {
                    updateBtn.Visible = false;
                    saveBtn.Visible = true;
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

        public void drugs()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SELECT * from drugHistory where patient_reg='" + id + "'", con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    saveBtn.Visible = false;
                    updateBtn.Visible = true;
                    drugs_area.InnerText = dr["drugsText"].ToString();
                    dosageOfDrugs_area.InnerText = dr["dosageText"].ToString();
                    duration_area.InnerText = dr["durationText"].ToString();
                    responseToTreatment_area.InnerText = dr["reponseText"].ToString();
                    drugReaction_area.InnerText = dr["reactionText"].ToString();
                    treatmentByFaithHealer_area.InnerText = dr["faithTreatmentText"].ToString();
                    forensicHistory_area.InnerText = dr["forensicHistoryText"].ToString();
                    if ((Convert.ToInt32(dr["faithTreatmentRadio"].ToString()) == 1))
                    {
                        yesTreatmentByFaithHealer_radio.Checked = true;
                    }
                    else
                    {
                        noTreatmentByFaithHealer_radio.Checked = true;
                    }

                    if ((Convert.ToInt32(dr["forensicHistoryRadio"].ToString()) == 1))
                    {
                        yesForensicHistory_radio.Checked = true;
                    }
                    else
                    {
                        noForensicHistory_radio.Checked = true;
                    }

                    if ((Convert.ToInt32(dr["policeCaseRadio"].ToString()) == 1))
                    {
                         yesPoliceCase_radio.Checked = true;
                    }
                    else
                    {
                        noPoliceCase_radio.Checked = true;
                    }
                }
                else
                {
                    updateBtn.Visible = false;
                    saveBtn.Visible = true;
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

        public void personalInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SELECT * FROM personalDetails where patient_reg='" + id + "'", con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    saveBtn.Visible = false;
                    updateBtn.Visible = true;
                    prenatal_dd.SelectedValue = dr["prenatalText"].ToString();
                    perinatal_dd.SelectedValue = dr["perinatalText"].ToString();
                    postnatal_dd.SelectedValue  = dr["postnatalText"].ToString();
                    childhood_dd.SelectedValue  = dr["childhoodText"].ToString();
                    startOfSchooling_dd.SelectedValue  = dr["startOfSchooling"].ToString();
                    startOfSchooling_area.InnerText = dr["schoolingText"].ToString();
                    workOccupationRecord_area.InnerText = dr["occupationText"].ToString();
                    workOccupation_dd.SelectedValue  = dr["occupation"].ToString();
                    monthlyIncome_dd.SelectedValue  = dr["incomeText"].ToString();

                    pschosexualHistory_area.InnerText = dr["psychoSexualhistoryText"].ToString();
                    menstrualHistory_dd.SelectedValue  = dr["menstrualHistoryText"].ToString();
                    maritalStatus_dd.SelectedValue  = dr["maritalStatusDD"].ToString();
                    gender_dd.SelectedValue  = dr["genderDD"].ToString();
                    numberOfChildren_txt.Text = dr["childrenText"].ToString();
                    relationshipWithSpouse_dd.SelectedValue  = dr["spouseRelationshipText"].ToString();

                    hobbies_dd.SelectedValue  = dr["hobbiesText"].ToString();
                    characteristic_dd.SelectedValue  = dr["characteristicText"].ToString();
                    behaviour_dd.SelectedValue  = dr["behaviorText"].ToString();
                    attitude_dd.SelectedValue  = dr["attitudeText"].ToString();
                    relations_area.InnerText = dr["relationText"].ToString();
                    achievements_area.InnerText = dr["achievementsText"].ToString();
                    religousMoralValues_area.InnerText = dr["religiousText"].ToString();

                    Aptitudes_area.InnerText = dr["aptitudesText"].ToString();
                    others_area.InnerText = dr["otherText"].ToString();

                    if ((Convert.ToInt32(dr["milestoneRb"].ToString()) == 1))
                    {
                        delayed_radio.Checked = true;
                    }
                    else
                    {
                        normal_radio.Checked = true;
                    }

                    if ((Convert.ToInt32(dr["educationRb"].ToString()) == 0))
                    {
                        good_radio.Checked = true;
                    }
                    else if ((Convert.ToInt32(dr["educationRb"].ToString()) == 1))
                    {
                        good_radio.Checked = false;
                        average_radio.Checked = true;
                    }
                    else if ((Convert.ToInt32(dr["educationRb"].ToString()) == 2))
                    {
                        good_radio.Checked = false;
                        belowAverage_radio.Checked = true;
                    }
                    else
                    {
                        good_radio.Checked = true;
                    }

                }

                else
                {
                    updateBtn.Visible = false;
                    saveBtn.Visible = true;
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

        public void family()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("SELECT temperamentDD,familyPsychIllDD,fatherText,motherText,siblingsText,illnessTypeDD,abuseHistoryDD,typeText,durationText,amountText,abuseModeText,detoxificationText,admissionToxificationRadio, noOfDetoxAdmissionsDd from familyHistory where patient_reg='" + id + "'", con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    saveBtn.Visible = false;
                    updateBtn.Visible = true;
                    temperament_dd.SelectedValue  = dr["temperamentDD"].ToString();
                    familyHistory_dd.SelectedValue  = dr["familyPsychIllDD"].ToString();
                    father_dd.SelectedValue  = dr["fatherText"].ToString();
                    mother_dd.SelectedValue  = dr["motherText"].ToString();
                    siblings_dd.SelectedValue  = dr["siblingsText"].ToString();
                    TypeOfFamilyHistory_dd.SelectedValue  = dr["illnessTypeDD"].ToString();
                    historyOfSubstanceAbuse_dd.SelectedValue  = dr["abuseHistoryDD"].ToString();

                    historyOfSubstanceAbuse_dd.SelectedValue  = dr["typeText"].ToString();
                    duration_dd.SelectedValue  = dr["durationText"].ToString();
                    amount_area.InnerText = dr["amountText"].ToString();
                    modeOfAbuse_dd.SelectedValue  = dr["abuseModeText"].ToString();
                    detoxification_area.InnerText = dr["detoxificationText"].ToString();
                    numberOfadmissionsDetox_dd.SelectedValue = dr["noOfDetoxAdmissionsDd"].ToString();
                    if ((Convert.ToInt32(dr["admissionToxificationRadio"].ToString()) == 1))
                    {
                        yesAdmissionForDetoxification_radio.Checked = true;
                        noAdmissionForDetoxification_radio.Checked = false;
                    }
                    else
                    {
                        noAdmissionForDetoxification_radio.Checked = true;
                    }
                }
                else
                {
                    updateBtn.Visible = false;
                    saveBtn.Visible = true;
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

        private ArrayList GetDummyData()
        {

            ArrayList arr = new ArrayList();

            arr.Add(new ListItem("InActive", "1"));



            return arr;
        }

        private void FillDropDownList(DropDownList ddl)
        {
            string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("Select * from diseases", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            ddl.DataSource = ds;
            ddl.DataTextField = "disease_name";
            ddl.DataValueField = "disease_id";
            ddl.DataBind();
        }

        private void FillDropDownList1(DropDownList ddl)
        {
            ArrayList arr = GetDummyData();

            foreach (ListItem item in arr)
            {
                ddl.Items.Add(item);
            }
        }
        private void SetInitialRow()
        {

            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Column1", typeof(string)));//for DropDownList selected item  
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));//for TextBox value   



            dr = dt.NewRow();
            dr["RowNumber"] = 1;

            dr["Column2"] = string.Empty;
            dt.Rows.Add(dr);

            //Store the DataTable in ViewState for future reference   
            ViewState["CurrentTable"] = dt;

            //Bind the Gridview   
            Gridview1.DataSource = dt;
            Gridview1.DataBind();

            //After binding the gridview, we can then extract and fill the DropDownList with Data   
            DropDownList ddl1 = (DropDownList)Gridview1.Rows[0].Cells[3].FindControl("DropDownList1");
            // DropDownList ddl2 = (DropDownList)Gridview1.Rows[0].Cells[4].FindControl("DropDownList2");
            FillDropDownList(ddl1);
            Button button_txt = (Button)Gridview1.Rows[0].Cells[4].FindControl("InActive");


            //FillDropDownList1(ddl2);
        }

        private void AddNewRowToGrid()
        {

            if (ViewState["CurrentTable"] != null)
            {

                DataTable dtCurrentTable = (DataTable)ViewState["CurrentTable"];
                DataRow drCurrentRow = null;

                if (dtCurrentTable.Rows.Count > 0)
                {
                    drCurrentRow = dtCurrentTable.NewRow();
                    drCurrentRow["RowNumber"] = dtCurrentTable.Rows.Count + 1;

                    //add new row to DataTable   
                    dtCurrentTable.Rows.Add(drCurrentRow);
                    //Store the current data to ViewState for future reference   

                    ViewState["CurrentTable"] = dtCurrentTable;


                    for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                    {

                        //extract the TextBox values   


                        TextBox box2 = (TextBox)Gridview1.Rows[i].Cells[2].FindControl("TextBox2");


                        dtCurrentTable.Rows[i]["Column2"] = box2.Text;

                        //extract the DropDownList Selected Items   

                        DropDownList ddl1 = (DropDownList)Gridview1.Rows[i].Cells[3].FindControl("DropDownList1");
                        // DropDownList ddl2 = (DropDownList)Gridview1.Rows[i].Cells[4].FindControl("DropDownList2");
                        Button inActive_btn = (Button)Gridview1.Rows[i].Cells[3].FindControl("InActive");
                        inActive_btn.Visible = false;
                        // Update the DataRow with the DDL Selected Items   

                        dtCurrentTable.Rows[i]["Column1"] = ddl1.SelectedItem.Text;
                        // dtCurrentTable.Rows[i]["Column3"] = ddl2.SelectedItem.Text;

                    }

                    //Rebind the Grid with the current data to reflect changes   
                    Gridview1.DataSource = dtCurrentTable;
                    Gridview1.DataBind();
                }
            }
            else
            {
                Response.Write("ViewState is null");

            }
            //Set Previous Data on Postbacks   
            SetPreviousData();
        }

        private void SetPreviousData()
        {

            int rowIndex = 0;
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 0)
                {

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {


                        TextBox box2 = (TextBox)Gridview1.Rows[i].Cells[2].FindControl("TextBox2");

                        DropDownList ddl1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[3].FindControl("DropDownList1");
                        //DropDownList ddl2 = (DropDownList)Gridview1.Rows[rowIndex].Cells[4].FindControl("DropDownList2");

                        //Fill the DropDownList with Data   
                        FillDropDownList(ddl1);
                        //FillDropDownList1(ddl2);

                        if (i < dt.Rows.Count - 1)
                        {

                            //Assign the value from DataTable to the TextBox   

                            box2.Text = dt.Rows[i]["Column2"].ToString();

                            //Set the Previous Selected Items on Each DropDownList  on Postbacks   
                            ddl1.ClearSelection();
                            ddl1.Items.FindByText(dt.Rows[i]["Column1"].ToString()).Selected = true;

                            // ddl2.ClearSelection();
                            //ddl2.Items.FindByText(dt.Rows[i]["Column3"].ToString()).Selected = true;

                        }

                        rowIndex++;
                    }
                }
            }
        }


        public void GetHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("Select (select disease_name from diseases where disease_id = p.diseases_id) as Disease,convert(date,p.diagnose_date) as diagnose_date from problem_list_and_diagnoses p  where patient_reg='" + id + "' and inactive_date='1111-01-01'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                //DataGridViewRow row = (DataGridViewRow)dataGridView1.Rows[0].Clone();
                //dataGridView1.Rows.Add(row);


                for (int z = 0; z < ds.Tables[0].Rows.Count; z++)
                {
                    DropDownList ddl = (DropDownList)Gridview1.Rows[z].Cells[1].FindControl("DropDownList1");
                    ddl.SelectedItem.Text = Convert.ToString(ds.Tables[0].Rows[z]["Disease"]);

                    TextBox box2 = (TextBox)Gridview1.Rows[z].Cells[2].FindControl("TextBox2");
                    date = Convert.ToString(ds.Tables[0].Rows[z]["diagnose_date"]);
                    DateTime tempDate = DateTime.Parse(date);
                    box2.Text = tempDate.ToString("MM/dd/yyyy");



                    AddNewRowToGrid();


                }
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }

        }

        protected void InActiveButton_Click(object sender, EventArgs e)
        {
            try
            {
                Button lb = (Button)sender;
                GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
                int rowID = gvRow.RowIndex;
                DropDownList ddl = (DropDownList)Gridview1.Rows[rowID].Cells[1].FindControl("DropDownList1");

                string query = "Update problem_list_and_diagnoses set inactive_date='" + date + "' where patient_reg='" + id + "' and  diseases_id='" + ddl.SelectedValue.ToString() + "'";
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();


                if (ViewState["CurrentTable"] != null)
                {

                    DataTable dt = (DataTable)ViewState["CurrentTable"];
                    if (dt.Rows.Count > 1)
                    {
                        if (gvRow.RowIndex < dt.Rows.Count - 1)
                        {
                            //Remove the Selected Row data and reset row number  
                            dt.Rows.Remove(dt.Rows[rowID]);
                            ResetRowID(dt);
                        }
                    }

                    //Store the current data in ViewState for future reference  
                    ViewState["CurrentTable"] = dt;

                    //Re bind the GridView for the updated data  
                    Gridview1.DataSource = dt;
                    Gridview1.DataBind();
                }

                //Set Previous Data on Postbacks  
                SetPreviousData();
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }

        protected void add_Problem(object sender, EventArgs e)
        {
            try
            {
                int row = 0;
                int count = Gridview1.Rows.Count;
                for (int z = 0; z < count; z++)
                {
                    row++;
                }

                if (count == row)
                {
                    insert();
                }
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }
        }

        protected void insert()
        {
            try
            {

                string temp = "";
                int count = Gridview1.Rows.Count;
                for (int z = 0; z < count; z++)
                {

                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand("InsertProblem", con);

                    DropDownList ddl = (DropDownList)Gridview1.Rows[z].Cells[1].FindControl("DropDownList1");
                    TextBox sinceDate_txt = (TextBox)Gridview1.Rows[z].Cells[2].FindControl("TextBox2");
                    int validation = -1;
                    validation = Convert.ToInt32(ddl.SelectedValue);
                    if (sinceDate_txt.Text != "" && validation > 0)
                    {

                        temp = ddl.SelectedValue;

                        DateTime testDate = DateTime.Parse(sinceDate_txt.Text);
                        date = testDate.ToString("yyyy-MM-dd");
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@patient_reg", id);
                        cmd.Parameters.AddWithValue("@disease_id", temp);
                        cmd.Parameters.AddWithValue("@diagnose_date", date);
                        cmd.Parameters.AddWithValue("@inactive_date", "1111-01-01");
                        con.Open();
                        bool success = Convert.ToBoolean(cmd.ExecuteScalar());
                        if (success)
                        {
                            alert_success.Visible = true;
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                        }
                        else
                        {
                        }
                        con.Close();


                    }
                    else
                    {
                    }


                }


            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }



        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {
            AddNewRowToGrid();
        }

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataTable dt = (DataTable)ViewState["CurrentTable"];
                LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
                Button b = (Button)e.Row.FindControl("InActive");
                if (lb != null)
                {
                    if (dt.Rows.Count > 1)
                    {
                        if (e.Row.RowIndex == dt.Rows.Count - 1)
                        {
                            lb.Visible = false;
                        }
                    }
                    else
                    {
                        lb.Visible = false;
                    }
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lb = (LinkButton)sender;
            GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
            int rowID = gvRow.RowIndex;
            if (ViewState["CurrentTable"] != null)
            {

                DataTable dt = (DataTable)ViewState["CurrentTable"];
                if (dt.Rows.Count > 1)
                {
                    if (gvRow.RowIndex < dt.Rows.Count - 1)
                    {
                        //Remove the Selected Row data and reset row number  
                        dt.Rows.Remove(dt.Rows[rowID]);
                        ResetRowID(dt);
                    }
                }

                //Store the current data in ViewState for future reference  
                ViewState["CurrentTable"] = dt;

                //Re bind the GridView for the updated data  
                Gridview1.DataSource = dt;
                Gridview1.DataBind();
            }

            //Set Previous Data on Postbacks  
            SetPreviousData();
        }

        private void ResetRowID(DataTable dt)
        {
            int rowNumber = 1;
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    row[0] = rowNumber;
                    rowNumber++;
                }
            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                //updateAdmissionHistory();
                updateIllnessHistory();
                updateDrugs();
                updatePersonalInfo();
                updateFamily();
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }

        protected void saveBtn_Click(object sender, EventArgs e)
        {
            try
            {
                //insertAdmissionHistory();
                insertIllnessHistory();
                insertDrugs();
                insertPersonalInfo();
                insertFamily();
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }

        //public void insertAdmissionHistory()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(constring);
        //        SqlCommand cmd = new SqlCommand("insert into admissionHistory (patient_reg,admissionType,patientClassification) values(@id,@type,@classification)", con);

        //        cmd.Parameters.AddWithValue("@id", id);
        //        if (assessment_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 1);
        //        }

        //        else if (treatment_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 2);
        //        }
        //        else if (urgent_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 3);
        //        }
        //        else if (emergency_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 4);
        //        }
        //        else if (care_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 5);
        //        }
        //        else
        //        {
        //        }
        //        if (judicial_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@classification", 1);
        //        }

        //        else if (nonJudicial_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@classification", 2);
        //        }
        //        else if (reception_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@classification", 3);
        //        }
        //        else
        //        {
        //            alert_fail.Visible = true;
        //            error.Text = "Error! ";
        //            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //        }

        //        cmd.Connection = con;
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();

        //        alert_success.Visible = true;
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //    }
        //    catch (Exception ex)
        //    {
        //        alert_fail.Visible = true;
        //        error.Text = "Error! " + ex.ToString();
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //    }
        //}
        public void insertIllnessHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into illnessHistory (patient_reg,illHistoryText,currentTreatmentText,pastMedHistoryText,pastPsychHistoryText,cureRb,cureText,previousText,previousAdmissions,treatmentHistoryDd,pastMedicalHistoryDd,pastPsychiatricHistoryDd) values(@id,@illHistoryText,@currentTreatmentText,@pastMedHistoryText,@pastPsychHistoryText,@cureRb,@cureText,@previousText,@previousAdmissions,@treatmentHistoryDd,@pastMedicalHistoryDd,@pastPsychiatricHistoryDd)", con);

                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@illHistoryText", historyOfPresentIllness_area.InnerText);
                cmd.Parameters.AddWithValue("@currentTreatmentText", CurrentDrugTreatment_area.InnerText);
                cmd.Parameters.AddWithValue("@pastMedHistoryText", pastMedicalHistory_area.InnerText);
                cmd.Parameters.AddWithValue("@pastPsychHistoryText", pastPsychiatricHistory_area.InnerText);
                if (Radio1.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@cureRb", 0);
                }
                else if (Radio2.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@cureRb", 1);
                }
                else if (Radio3.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@cureRb", 2);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@cureRb", 3);
                }
                //previous admission radios
                if (yesPreviousAdmission_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@previousAdmissions", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@previousAdmissions", 2);
                }

                cmd.Parameters.AddWithValue("@cureText", courseOfIllness_area.InnerText);
                cmd.Parameters.AddWithValue("@previousText", noOfAdmissions_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@treatmentHistoryDd", treatmentHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@pastMedicalHistoryDd", pastMedicalHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@pastPsychiatricHistoryDd", pastPsychiatricHistory_dd.SelectedItem.Text);
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
        public void insertDrugs()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into drugHistory (patient_reg,drugsText,dosageText,durationText,reponseText,reactionText,faithTreatmentText,forensicHistoryText,faithTreatmentRadio,forensicHistoryRadio,policeCaseRadio) values(@id,@drugsText,@dosageText,@durationText,@reponseText,@reactionText,@faithTreatmentText,@forensicHistoryText,@treatmentFaithRadio,@forensicHistoryRadio,@policeCaseRadio)", con);

                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@drugsText", drugs_area.InnerText);
                cmd.Parameters.AddWithValue("@dosageText", dosageOfDrugs_area.InnerText);
                cmd.Parameters.AddWithValue("@durationText", duration_area.InnerText);

                cmd.Parameters.AddWithValue("@reponseText", responseToTreatment_area.InnerText);
                cmd.Parameters.AddWithValue("@reactionText", drugReaction_area.InnerText);
                cmd.Parameters.AddWithValue("@faithTreatmentText", treatmentByFaithHealer_area.InnerText);
                cmd.Parameters.AddWithValue("@forensicHistoryText", forensicHistory_area.InnerText);

                if (yesTreatmentByFaithHealer_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@treatmentFaithRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@treatmentFaithRadio", 2);
                }

                if (yesForensicHistory_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@forensicHistoryRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@forensicHistoryRadio", 2);
                }

                if (yesPoliceCase_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@policeCaseRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@policeCaseRadio", 2);
                }

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
        public void insertPersonalInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into personalDetails (patient_reg,prenatalText,perinatalText,postnatalText,milestoneRb,childhoodText,schoolingText,educationRb,occupationText,incomeText,psychoSexualhistoryText,menstrualHistoryText,maritalStatusDD,genderDD,childrenText,spouseRelationshipText,hobbiesText,characteristicText,behaviorText,attitudeText,relationText,achievementsText,religiousText,aptitudesText,otherText,startOfSchooling,occupation) values(@id,@prenatalText,@perinatalText,@postnatalText,@milestoneRb,@childhoodText,@schoolingText,@educationRb,@occupationText,@incomeText,@psychoSexualhistoryText,@menstrualHistoryText,@maritalStatusDD,@genderDD,@childrenText,@spouseRelationshipText,@hobbiesText,@characteristicText,@behaviorText,@attitudeText,@relationText,@achievementsText,@religiousText,@aptitudesText,@otherText,@startOfSchooling,@occupation)", con);

                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@prenatalText", prenatal_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@perinatalText", perinatal_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@postnatalText", postnatal_dd.SelectedItem.Text);
                if (normal_radio.Checked)
                {
                    cmd.Parameters.AddWithValue("@milestoneRb", 0);
                }
                else if (delayed_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@milestoneRb", 1);
                }
                else
                { }


                cmd.Parameters.AddWithValue("@childhoodText", childhood_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@schoolingText", startOfSchooling_area.InnerText);
                if (good_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@educationRb", 0);
                }

                else if (average_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@educationRb", 1);
                }

                else if (belowAverage_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@educationRb", 2);
                }
                else
                { }
                cmd.Parameters.AddWithValue("@occupationText", workOccupationRecord_area.InnerText);

                cmd.Parameters.AddWithValue("@incomeText", monthlyIncome_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@psychoSexualhistoryText", pschosexualHistory_area.InnerText);
                cmd.Parameters.AddWithValue("@menstrualHistoryText", menstrualHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@maritalStatusDD", maritalStatus_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@genderDD", gender_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@childrenText", numberOfChildren_txt.Text);
                cmd.Parameters.AddWithValue("@spouseRelationshipText", relationshipWithSpouse_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@hobbiesText", hobbies_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@characteristicText", characteristic_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@behaviorText", behaviour_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@attitudeText", attitude_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@relationText", relations_area.InnerText);

                cmd.Parameters.AddWithValue("@achievementsText", achievements_area.InnerText);
                cmd.Parameters.AddWithValue("@religiousText", religousMoralValues_area.InnerText);
                cmd.Parameters.AddWithValue("@aptitudesText", Aptitudes_area.InnerText);
                cmd.Parameters.AddWithValue("@otherText", others_area.InnerText);

                cmd.Parameters.AddWithValue("@startOfSchooling", startOfSchooling_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@occupation", workOccupation_dd.SelectedItem.Text);

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

        public void insertFamily()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("insert into familyHistory (patient_reg,temperamentDD,familyPsychIllDD,fatherText,motherText,siblingsText,illnessTypeDD,abuseHistoryDD,typeText,durationText,amountText,abuseModeText,detoxificationText,admissionToxificationRadio, noOfDetoxAdmissionsDd) values(@id,@temperamentDD,@familyPsychIllDD,@fatherText,@motherText,@siblingsText,@illnessTypeDD,@abuseHistoryDD,@typeText,@durationText,@amountText,@abuseModeText,@detoxificationText,@admissionToxificationRadio, @noOfDetoxAdmissionsDd)", con);

                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@temperamentDD", temperament_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@familyPsychIllDD", familyHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@fatherText", father_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@motherText", mother_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@siblingsText", siblings_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@illnessTypeDD", TypeOfFamilyHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@abuseHistoryDD", historyOfSubstanceAbuse_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@typeText", historyOfSubstanceAbuse_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@durationText", duration_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@amountText", amount_area.InnerText);
                cmd.Parameters.AddWithValue("@abuseModeText", modeOfAbuse_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@detoxificationText", detoxification_area.InnerText);
                cmd.Parameters.AddWithValue("@noOfDetoxAdmissionsDd", numberOfadmissionsDetox_dd.SelectedItem.Text);

                if (yesAdmissionForDetoxification_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@admissionToxificationRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@admissionToxificationRadio", 2);
                }

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



        //public void updateAdmissionHistory()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(constring);
        //        SqlCommand cmd = new SqlCommand("update admissionHistory set admissionType=@type,patientClassification=@classification where patient_reg='" + id + "'", con);


        //        if (assessment_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 1);
        //        }

        //        else if (treatment_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 2);
        //        }
        //        else if (urgent_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 3);
        //        }
        //        else if (emergency_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 4);
        //        }
        //        else if (care_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@type", 5);
        //        }
        //        else
        //        {
        //        }
        //        if (judicial_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@classification", 1);
        //        }

        //        else if (nonJudicial_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@classification", 2);
        //        }
        //        else if (reception_radio.Checked == true)
        //        {
        //            cmd.Parameters.AddWithValue("@classification", 3);
        //        }
        //        else
        //        {
        //            alert_fail.Visible = true;
        //            error.Text = "Error! ";
        //            ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //        }

        //        cmd.Connection = con;
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();

        //        alert_success.Visible = true;
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //    }
        //    catch (Exception ex)
        //    {
        //        alert_fail.Visible = true;
        //        error.Text = "Error! " + ex.ToString();
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
        //    }
        //}
        public void updateIllnessHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("update illnessHistory set illHistoryText=@illHistoryText,currentTreatmentText=@currentTreatmentText,pastMedHistoryText=@pastMedHistoryText,pastPsychHistoryText=@pastPsychHistoryText,cureRb=@cureRb,cureText=@cureText,previousText=@previousText,previousAdmissions=@previousAdmissions,treatmentHistoryDd=@treatmentHistoryDd, pastMedicalHistoryDd=@pastMedicalHistoryDd,pastPsychiatricHistoryDd=@pastPsychiatricHistoryDd where patient_reg='" + id + "'", con);


                cmd.Parameters.AddWithValue("@illHistoryText", historyOfPresentIllness_area.InnerText);
                cmd.Parameters.AddWithValue("@currentTreatmentText", CurrentDrugTreatment_area.InnerText);
                cmd.Parameters.AddWithValue("@pastMedHistoryText", pastMedicalHistory_area.InnerText);

                cmd.Parameters.AddWithValue("@pastPsychHistoryText", pastPsychiatricHistory_area.InnerText);
                if (Radio1.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@cureRb", 0);
                }
                else if (Radio2.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@cureRb", 1);
                }
                else if (Radio3.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@cureRb", 2);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@cureRb", 3);
                }
                //previous admissions radio
                if (yesPreviousAdmission_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@previousAdmissions", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@previousAdmissions", 2);
                }

                cmd.Parameters.AddWithValue("@cureText", courseOfIllness_area.InnerText);
                cmd.Parameters.AddWithValue("@previousText", noOfAdmissions_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@treatmentHistoryDd", treatmentHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@pastMedicalHistoryDd", pastMedicalHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@pastPsychiatricHistoryDd", pastPsychiatricHistory_dd.SelectedItem.Text);
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
        public void updateDrugs()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("update drugHistory set drugsText=@drugsText,dosageText=@dosageText,durationText=@durationText,reponseText=@reponseText,reactionText=@reactionText,faithTreatmentText= @faithTreatmentText,forensicHistoryText=@forensicHistoryText,faithTreatmentRadio=@faithTreatmentRadio,forensicHistoryRadio=@forensicHistoryRadio,policeCaseRadio=@policeCaseRadio where patient_reg=@id", con);

                cmd.Parameters.AddWithValue("@id", id);

                cmd.Parameters.AddWithValue("@drugsText", drugs_area.InnerText);
                cmd.Parameters.AddWithValue("@dosageText", dosageOfDrugs_area.InnerText);
                cmd.Parameters.AddWithValue("@durationText", duration_area.InnerText);

                cmd.Parameters.AddWithValue("@reponseText", responseToTreatment_area.InnerText);
                cmd.Parameters.AddWithValue("@reactionText", drugReaction_area.InnerText);
                cmd.Parameters.AddWithValue("@faithTreatmentText", treatmentByFaithHealer_area.InnerText);
                cmd.Parameters.AddWithValue("@forensicHistoryText", forensicHistory_area.InnerText);
                if (yesTreatmentByFaithHealer_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@faithTreatmentRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@faithTreatmentRadio", 2);
                }

                if (yesForensicHistory_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@forensicHistoryRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@forensicHistoryRadio", 2);
                }

                if (yesPoliceCase_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@policeCaseRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@policeCaseRadio", 2);
                }

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
        public void updatePersonalInfo()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("update personalDetails set prenatalText= @prenatalText,perinatalText=@perinatalText,postnatalText=@postnatalText,milestoneRb=@milestoneRb,childhoodText=@childhoodText,schoolingText=@schoolingText,educationRb=@educationRb,occupationText=@occupationText,incomeText=@incomeText,psychoSexualhistoryText=@psychoSexualhistoryText,menstrualHistoryText=@menstrualHistoryText,maritalStatusDD=@maritalStatusDD,genderDD=@genderDD,childrenText=@childrenText,spouseRelationshipText=@spouseRelationshipText,hobbiesText=@hobbiesText,characteristicText=@characteristicText,behaviorText=@behaviorText,attitudeText=@attitudeText,relationText=@relationText,achievementsText=@achievementsText,religiousText=@religiousText,aptitudesText=@aptitudesText,otherText=@otherText,startOfSchooling=@startOfSchooling,occupation=@occupation where patient_reg='" + id + "'", con);


                cmd.Parameters.AddWithValue("@prenatalText", prenatal_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@perinatalText", perinatal_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@postnatalText", postnatal_dd.SelectedItem.Text);
                if (normal_radio.Checked)
                {
                    cmd.Parameters.AddWithValue("@milestoneRb", 0);
                }
                else if (delayed_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@milestoneRb", 1);
                }
                else
                { }


                cmd.Parameters.AddWithValue("@childhoodText", childhood_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@schoolingText", startOfSchooling_area.InnerText);
                if (good_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@educationRb", 0);
                }

                else if (average_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@educationRb", 1);
                }

                else if (belowAverage_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@educationRb", 2);
                }
                else
                { }
                cmd.Parameters.AddWithValue("@occupationText", workOccupationRecord_area.InnerText);

                cmd.Parameters.AddWithValue("@incomeText", monthlyIncome_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@psychoSexualhistoryText", pschosexualHistory_area.InnerText);
                cmd.Parameters.AddWithValue("@menstrualHistoryText", menstrualHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@maritalStatusDD", maritalStatus_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@genderDD", gender_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@childrenText", numberOfChildren_txt.Text);
                cmd.Parameters.AddWithValue("@spouseRelationshipText", relationshipWithSpouse_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@hobbiesText", hobbies_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@characteristicText", characteristic_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@behaviorText", behaviour_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@attitudeText", attitude_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@relationText", relations_area.InnerText);

                cmd.Parameters.AddWithValue("@achievementsText", achievements_area.InnerText);
                cmd.Parameters.AddWithValue("@religiousText", religousMoralValues_area.InnerText);
                cmd.Parameters.AddWithValue("@aptitudesText", Aptitudes_area.InnerText);
                cmd.Parameters.AddWithValue("@otherText", others_area.InnerText);

                cmd.Parameters.AddWithValue("@startOfSchooling", startOfSchooling_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@occupation", workOccupation_dd.SelectedItem.Text);

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

        public void updateFamily()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("update familyHistory set temperamentDD=@temperamentDD,familyPsychIllDD=@familyPsychIllDD,fatherText=@fatherText,motherText=@motherText,siblingsText=@siblingsText,illnessTypeDD=@illnessTypeDD,abuseHistoryDD=@abuseHistoryDD,typeText=@typeText,durationText=@durationText,amountText=@amountText,abuseModeText=@abuseModeText,detoxificationText=@detoxificationText,admissionToxificationRadio=@admissionToxificationRadio, noOfDetoxAdmissionsDd=@noOfDetoxAdmissionsDd where patient_reg='" + id + "'", con);


                cmd.Parameters.AddWithValue("@temperamentDD", temperament_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@familyPsychIllDD", familyHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@fatherText", father_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@motherText", mother_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@siblingsText", siblings_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@illnessTypeDD", TypeOfFamilyHistory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@abuseHistoryDD", historyOfSubstanceAbuse_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@typeText", historyOfSubstanceAbuse_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@durationText", duration_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@amountText", amount_area.InnerText);
                cmd.Parameters.AddWithValue("@abuseModeText", modeOfAbuse_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@detoxificationText", detoxification_area.InnerText);
                cmd.Parameters.AddWithValue("@noOfDetoxAdmissionsDd", numberOfadmissionsDetox_dd.SelectedItem.Text);
                
                if (yesAdmissionForDetoxification_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@admissionToxificationRadio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@admissionToxificationRadio", 2);
                }

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