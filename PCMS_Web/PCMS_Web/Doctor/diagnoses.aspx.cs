using AjaxControlToolkit;
using PCMS_Web.Class;
using System;
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
    public partial class WebForm16 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        string id = "";
        string tempVisit = "";
        int visit_no = 0;
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
                patientName.Text = patientInfo[0];
                ageTxt.Text = patientInfo[3];
                tempVisit = visitNumber_txt.Text;
                if (!Page.IsPostBack)
                {
                    SetInitialRow();
                    GetHistory();
                }
                visitNumber_txt.Text = patientInfo[2];
            }
        }



        public void GetHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd1 = new SqlCommand("select max(visit_no) as visit_no from patientDiagnosis where patient_reg='" + id + "'", con);
                SqlDataReader dr;
                con.Open();
                dr = cmd1.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["visit_no"].ToString() != "")
                    {
                        visit_no = Convert.ToInt32(dr["visit_no"].ToString());
                    }

                    tempVisit = dr["visit_no"].ToString();
                }
                else
                {
                }
                con.Close();
                SqlCommand cmd = new SqlCommand("Select diseaseMasterCode,diseaseCode,diseaseName,comments from patientDiagnosis  where patient_reg='" + id + "' and  visit_no='" + tempVisit + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds);

                for (int z = 0; z < ds.Tables[0].Rows.Count; z++)
                {
                    ComboBox cb1 = (ComboBox)GridView1.Rows[z].Cells[1].FindControl("ComboBox1");
                    cb1.Text = Convert.ToString(ds.Tables[0].Rows[z]["diseaseMasterCode"]);
                    ComboBox cb2 = (ComboBox)GridView1.Rows[z].Cells[2].FindControl("ComboBox2");
                    cb2.Text = Convert.ToString(ds.Tables[0].Rows[z]["diseaseCode"]);

                    string text = Convert.ToString(ds.Tables[0].Rows[z]["diseaseCode"]);
                    string temp = Convert.ToString(ds.Tables[0].Rows[z]["diseaseName"]);

                    cb2.Text = Convert.ToString(ds.Tables[0].Rows[z]["diseaseName"]);


                    TextBox tb1 = (TextBox)GridView1.Rows[z].Cells[3].FindControl("comments_area");
                    tb1.Text = Convert.ToString(ds.Tables[0].Rows[z]["comments"]);

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

        private void SetInitialRow()
        {

            DataTable dt = new DataTable();
            DataRow dr = null;

            dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));
            dt.Columns.Add(new DataColumn("Column1", typeof(string)));//for combobox selected item  
            dt.Columns.Add(new DataColumn("Column2", typeof(string)));
            dt.Columns.Add(new DataColumn("Column3", typeof(string)));//for TextBox value   



            dr = dt.NewRow();
            dr["RowNumber"] = 1;
            dt.Rows.Add(dr);

            //Store the DataTable in ViewState for future reference   
            ViewState["CurrentTable"] = dt;

            //Bind the Gridview   
            GridView1.DataSource = dt;
            GridView1.DataBind();

            //After binding the gridview, we can then extract and fill the DropDownList with Data   
            ComboBox cb1 = (ComboBox)GridView1.Rows[0].Cells[1].FindControl("ComboBox1");
            ComboBox cb2 = (ComboBox)GridView1.Rows[0].Cells[2].FindControl("ComboBox2");
            TextBox ta = (TextBox)GridView1.Rows[0].Cells[3].FindControl("comments_area");
            FillComboBox(cb1);
            FillComboBox1(cb2);
        }


        private void FillComboBox(ComboBox cb1)
        {

            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("Select masterCode,COUNT(diagnosesCode) from diagnosesDiseases group by masterCode ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            cb1.DataSource = ds;
            cb1.DataTextField = "masterCode";
            // cb1.DataValueField = "diseaseCode";
            cb1.DataBind();
        }

        private void FillComboBox1(ComboBox cb1)
        {

            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("select (diagnosesCode+'-'+diseaseName) as diseaseName,diagnosesCode from diagnosesDiseases", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            cb1.DataSource = ds;
            cb1.DataTextField = "diseaseName";
            cb1.DataValueField = "diagnosesCode";
            cb1.DataBind();
        }

        protected void ButtonAdd_Click(object sender, EventArgs e)
        {

            AddNewRowToGrid();
        }

        private void AddNewRowToGrid()
        {
            try
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
                            TextBox tb1 = (TextBox)GridView1.Rows[i].Cells[3].FindControl("comments_area");
                            dtCurrentTable.Rows[i]["Column3"] = tb1.Text;

                            //extract the DropDownList Selected Items   

                            ComboBox ddl1 = (ComboBox)GridView1.Rows[i].Cells[1].FindControl("ComboBox1");
                            ComboBox ddl2 = (ComboBox)GridView1.Rows[i].Cells[2].FindControl("ComboBox2");


                            // Update the DataRow with the DDL Selected Items   

                            dtCurrentTable.Rows[i]["Column1"] = ddl1.SelectedItem.Text;
                            dtCurrentTable.Rows[i]["Column2"] = ddl2.SelectedItem.Text;
                        }

                        //Rebind the Grid with the current data to reflect changes   
                        GridView1.DataSource = dtCurrentTable;
                        GridView1.DataBind();
                    }
                }
                else
                {
                    Response.Write("ViewState is null");

                }
                //Set Previous Data on Postbacks   
                SetPreviousData();
            }
            catch (Exception ex)
            {
                //alert_fail.Visible = true;
                //error.Text = "Error! " + ex.ToString();
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }


        private void SetPreviousData()
        {
            try
            {
                //Gridview1.Rows[row-1].Cells[5].Text = wordList[row-1];
                int rowIndex = 0;
                if (ViewState["CurrentTable"] != null)
                {

                    DataTable dt = (DataTable)ViewState["CurrentTable"];

                    if (dt.Rows.Count > 0)
                    {

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {

                            //Set the Previous Selected Items on Each DropDownList on Postbacks

                            ComboBox ddl1 = (ComboBox)GridView1.Rows[rowIndex].Cells[1].FindControl("ComboBox1");

                            TextBox ddl2 = (TextBox)GridView1.Rows[rowIndex].Cells[3].FindControl("comments_area");
                            //HtmlTextArea ta=(HtmlTextArea)Gridview1.Rows[rowIndex].cel
                            ComboBox ddl3 = (ComboBox)GridView1.Rows[rowIndex].Cells[2].FindControl("ComboBox2");
                            //Fill the DropDownList with Data

                            FillComboBox(ddl1);

                            //FillDropDownList(ddl2);

                            FillComboBox1(ddl3);



                            if (i < dt.Rows.Count - 1)
                            {


                                ddl2.Text = dt.Rows[i]["Column3"].ToString();


                                //ddl2.Value = dt.Rows[i]["Column5"].ToString();
                                ddl1.ClearSelection();

                                ddl1.Items.FindByText(dt.Rows[i]["Column1"].ToString()).Selected = true;

                                ddl3.ClearSelection();

                                ddl3.Items.FindByText(dt.Rows[i]["Column2"].ToString()).Selected = true;

                            }
                            rowIndex++;

                        }

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

        protected void ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int rowIndex = GridView1.Rows.Count - 1;
                ComboBox ddl1 = (ComboBox)GridView1.Rows[rowIndex].Cells[1].FindControl("ComboBox1");
                ComboBox cb1 = (ComboBox)GridView1.Rows[rowIndex].Cells[2].FindControl("ComboBox2");
                DataTable dt = new DataTable();

                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("select (diagnosesCode+'-'+diseaseName) as diseaseName,diagnosesCode from diagnosesDiseases where masterCode='" + ddl1.SelectedItem.Text + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);

                cb1.DataSource = ds;
                cb1.DataTextField = "diseaseName";
                cb1.DataValueField = "diagnosesCode";
                cb1.DataBind();
            }
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lb = (LinkButton)sender;
                GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
                int rowID = gvRow.RowIndex;
                ComboBox cb1 = (ComboBox)GridView1.Rows[rowID].Cells[1].FindControl("ComboBox2");
                int result;
                if (ViewState["CurrentTable"] != null)
                {

                    DataTable dt = (DataTable)ViewState["CurrentTable"];
                    if (dt.Rows.Count > 1)
                    {
                        if (gvRow.RowIndex < dt.Rows.Count - 1)
                        {
                            //Remove the Selected Row data and reset row number
                            try
                            {
                                using (SqlConnection con = new SqlConnection(constring))
                                {
                                    con.Open();
                                    SqlCommand cmd = new SqlCommand("delete from patientDiagnosis where diseaseCode='" + cb1.SelectedValue + "' and patient_reg='" + id + "'", con);
                                    result = cmd.ExecuteNonQuery();
                                    con.Close();
                                }
                            }
                            catch (Exception ex)
                            { }
                            dt.Rows.Remove(dt.Rows[rowID]);
                            ResetRowID(dt);
                        }
                    }

                    //Store the current data in ViewState for future reference  
                    ViewState["CurrentTable"] = dt;

                    //Re bind the GridView for the updated data  
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }

                //Set Previous Data on Postbacks  
                SetPreviousData();
            }
            catch(Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
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

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            try
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
                visit_no = Convert.ToInt32(tempVisit);
                int count = GridView1.Rows.Count;
                for (int z = 0; z < count; z++)
                {
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand("InsertPatientDiagnosis", con);


                    ComboBox cb1 = (ComboBox)GridView1.Rows[z].Cells[1].FindControl("ComboBox1");
                    ComboBox cb2 = (ComboBox)GridView1.Rows[z].Cells[2].FindControl("ComboBox2");
                    TextBox tb1 = (TextBox)GridView1.Rows[z].Cells[3].FindControl("comments_area");

                    if (cb1.SelectedItem != null)
                    {
                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@patient_reg", Convert.ToInt32(id));
                        cmd.Parameters.AddWithValue("@visit_no", visit_no);
                        cmd.Parameters.AddWithValue("@diseaseMasterCode", cb1.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@diseaseCode", cb2.SelectedValue.ToString());
                        cmd.Parameters.AddWithValue("@diseaseName", cb2.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@comments", tb1.Text);

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
                    }
                    con.Close();
                }
                


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