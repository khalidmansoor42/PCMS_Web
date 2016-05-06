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
    public partial class WebForm4 : System.Web.UI.Page
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
            if (Session["PatientId"]!= null)
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

                }
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
    }
}