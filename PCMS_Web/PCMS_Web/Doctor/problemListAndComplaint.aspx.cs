﻿using System;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
            {
                Response.Redirect("../General/destroySession.aspx");
            }
            else if (Session["userType"].ToString() != "doctor")
            {
                Response.Redirect("../General/destroySession.aspx");
            }
            else
            {
                Session["patient_reg"] = 1;
                if (Session["patient_reg"] != null)
                {
                    id = Session["patient_reg"].ToString();

                    if (!Page.IsPostBack)
                    {
                        SetInitialRow();
                        GetHistory();

                    }
                }
            }
        }

        public void GetHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand("Select (select disease_name from diseases where disease_id = p.diseases_id) as Disease,convert(date,p.diagnose_date) as diagnose_date from problem_list_and_diagnoses p  where patient_reg='" + id + "' and inactive_date is NULL", con);
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
                    box2.Text = tempDate.ToString("dd-MM-yyyy");



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
                string query = "Update problem_list_and_diagnoses set inactive_date='" + date + "' where patient_reg='" + id + "'";
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = query;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                Button lb = (Button)sender;
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

                string temp = "";
                int count = Gridview1.Rows.Count;
                for (int z = 0; z < count; z++)
                {
                    string query = "insert into problem_list_and_diagnoses(patient_reg,diseases_id,diagnose_date) values(@id,@diseaseId,@date)";
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand(query, con);

                    DropDownList ddl = (DropDownList)Gridview1.Rows[z].Cells[1].FindControl("DropDownList1");
                    TextBox sinceDate_txt = (TextBox)Gridview1.Rows[z].Cells[2].FindControl("TextBox2");
                    int validation = -1;
                    validation = Convert.ToInt32(ddl.SelectedValue);
                    if (sinceDate_txt.Text != "" && validation > 0)
                    {

                        temp = ddl.SelectedValue;

                        DateTime testDate = DateTime.Parse(sinceDate_txt.Text);
                        date = testDate.ToString("yyyy-MM-dd");
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@diseaseId", temp);
                        cmd.Parameters.AddWithValue("@date", date);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {

                        alert_fail.Visible = true;
                        error.Text = "Error! cells should not be empty";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                    }


                }

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