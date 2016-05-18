using AjaxControlToolkit;
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
    public partial class WebForm21 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        string id = "";
        string tempVisit = "";
        int visit_no = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["patient_reg"] = 1;
            Session["visit_no"] = 0;
            if (Session["patient_reg"] != null)
            {
                tempVisit = Session["visit_no"].ToString();
                id = Session["patient_reg"].ToString();
                if (!Page.IsPostBack)
                {

                    SetInitialRow();
                    GetHistory();
                }
            }
        }



        public void GetHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd1 = new SqlCommand("select max(visit_no) as visit_no from counselling where patient_reg='" + id + "'", con);
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
                    Session["visit_no"] = tempVisit;
                }
                else
                {
                }
                con.Close();
                SqlCommand cmd = new SqlCommand("Select therapy_advise,suggestion,outcome from counselling  where patient_reg='" + id + "' and  visit_no='" + tempVisit + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds);

                for (int z = 0; z < ds.Tables[0].Rows.Count; z++)
                {
                    ComboBox cb1 = (ComboBox)GridView1.Rows[z].Cells[1].FindControl("ComboBox1");
                    cb1.Text = Convert.ToString(ds.Tables[0].Rows[z]["therapy_advise"]);
                    TextBox cb2 = (TextBox)GridView1.Rows[z].Cells[2].FindControl("suggesion_txt");
                    cb2.Text = Convert.ToString(ds.Tables[0].Rows[z]["suggestion"]);
                    TextBox tb1 = (TextBox)GridView1.Rows[z].Cells[3].FindControl("comments_area");
                    tb1.Text = Convert.ToString(ds.Tables[0].Rows[z]["outcome"]);

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
            TextBox cb2 = (TextBox)GridView1.Rows[0].Cells[2].FindControl("suggesion_txt");
            TextBox ta = (TextBox)GridView1.Rows[0].Cells[3].FindControl("comments_area");
            FillComboBox(cb1);

        }


        private void FillComboBox(ComboBox cb1)
        {

            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("Select advise_id,therapy_advise from counselling_advise ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            cb1.DataSource = ds;
            cb1.DataTextField = "therapy_advise";
            cb1.DataValueField = "advise_id";
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
                            TextBox ddl2 = (TextBox)GridView1.Rows[i].Cells[2].FindControl("suggesion_txt");


                            // Update the DataRow with the DDL Selected Items   

                            dtCurrentTable.Rows[i]["Column1"] = ddl1.SelectedItem.Text;
                            dtCurrentTable.Rows[i]["Column2"] = ddl2.Text;
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
                            TextBox ddl3 = (TextBox)GridView1.Rows[rowIndex].Cells[2].FindControl("suggesion_txt");
                            //Fill the DropDownList with Data

                            FillComboBox(ddl1);

                            //FillDropDownList(ddl2);





                            if (i < dt.Rows.Count - 1)
                            {


                                ddl2.Text = dt.Rows[i]["Column3"].ToString();
                                ddl3.Text = dt.Rows[i]["Column2"].ToString();

                                //ddl2.Value = dt.Rows[i]["Column5"].ToString();
                                ddl1.ClearSelection();

                                ddl1.Items.FindByText(dt.Rows[i]["Column1"].ToString()).Selected = true;

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


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lb = (LinkButton)sender;
                GridViewRow gvRow = (GridViewRow)lb.NamingContainer;
                int rowID = gvRow.RowIndex;
                ComboBox cb1 = (ComboBox)GridView1.Rows[rowID].Cells[1].FindControl("ComboBox1");
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
                                    SqlCommand cmd = new SqlCommand("delete from counselling where therapy_advise='" + cb1.SelectedValue + "' and patient_reg='" + id + "'", con);
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
            catch (Exception ex)
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
                visit_no = visit_no + 1;
                int count = GridView1.Rows.Count;

                for (int z = 0; z < count; z++)
                {
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand("InsertPatientCounselling", con);


                    ComboBox cb1 = (ComboBox)GridView1.Rows[z].Cells[1].FindControl("ComboBox1");
                    TextBox cb2 = (TextBox)GridView1.Rows[z].Cells[2].FindControl("suggesion_txt");
                    TextBox tb1 = (TextBox)GridView1.Rows[z].Cells[3].FindControl("comments_area");

                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@therapy_advise", cb1.SelectedValue);
                    cmd.Parameters.AddWithValue("@suggestion", cb2.Text);
                    cmd.Parameters.AddWithValue("@outcome", tb1.Text);
                    cmd.Parameters.AddWithValue("@patient_reg", id);
                    cmd.Parameters.AddWithValue("@visit_no", visit_no);


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