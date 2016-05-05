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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        ArrayList list = new ArrayList();
        List<String> wordList = new List<String>();
        int count_tb = 0;
        string id = "";
        int visit_no = 0;
        string tempVisit = "";
        getInformation info = new getInformation();
        string[] patientInfo = new string[4];
        maxValue obj1 = new maxValue();
        int maxvisit = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PatientId"] != null)
            {
                id = Session["PatientId"].ToString();
                patientInfo = info.information("SELECT a.full_name, a.father_name,a.dob, b.visit_no FROM patient_registeration a, visit b  WHERE a.patient_reg = b.patient_reg  AND b.visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'And  a.patient_reg ='" + Session["PatientId"].ToString() + "' And b.patient_reg='" + Session["PatientId"].ToString() + "';");
                patientId_txt.Text = Session["PatientId"].ToString();

                visitNumber_txt.Text = patientInfo[2];
                patientName.Text = patientInfo[0];
                ageTxt.Text = patientInfo[3];
                Session["visit_no"] = patientInfo[2];
                tempVisit = Session["visit_no"].ToString();
                if (!Page.IsPostBack)
                {

                    Session["MyArr"] = "";

                    SetInitialRow();
                    GetHistory();
                    directions_txt.Enabled = false;
                    DropDownList2.Enabled = false;

                }
            }

        }

        public void GetHistory()
        {
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd1 = new SqlCommand("select max(visit_no) as visit_no from systematicMedication where patient_reg='" + id + "'", con);
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
                con.Close();
                SqlCommand cmd = new SqlCommand("Select (select med_name from medicine where med_id = s.med_id) as Medicine, s.morning,s.afternoon,s.night,s.quantity,s.directions,s.durations from systematicMedication s where visit_no='" + tempVisit + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds);



                for (int z = 0; z < ds.Tables[0].Rows.Count; z++)
                {
                    DropDownList ddl = (DropDownList)Gridview1.Rows[z].Cells[1].FindControl("DropDownList1");
                    ddl.SelectedItem.Text = Convert.ToString(ds.Tables[0].Rows[z]["Medicine"]);
                    string text = Convert.ToString(ds.Tables[0].Rows[z]["directions"]);


                    Session["MyArr"] = Session["MyArr"].ToString() + text + "@";
                    string[] split = Session["MyArr"].ToString().Split('@');


                    TextBox tb1 = (TextBox)Gridview1.Rows[z].Cells[2].FindControl("morning_txt");
                    tb1.Text = Convert.ToString(ds.Tables[0].Rows[z]["morning"]);

                    TextBox tb2 = (TextBox)Gridview1.Rows[z].Cells[3].FindControl("aterNoon_txt");
                    tb2.Text = Convert.ToString(ds.Tables[0].Rows[z]["afternoon"]);
                    TextBox tb3 = (TextBox)Gridview1.Rows[z].Cells[4].FindControl("evening_txt");
                    tb3.Text = Convert.ToString(ds.Tables[0].Rows[z]["night"]);
                    TextBox tb4 = (TextBox)Gridview1.Rows[z].Cells[7].FindControl("durationPeriod_txt");
                    int result = ((Convert.ToInt32(tb1.Text)) + (Convert.ToInt32(tb2.Text)) + (Convert.ToInt32(tb3.Text)));
                    int temp = Convert.ToInt32(ds.Tables[0].Rows[z]["quantity"]);
                    tb4.Text = Convert.ToString(temp / result);
                    HtmlTextArea ddl2 = (HtmlTextArea)Gridview1.Rows[z].Cells[5].FindControl("transliterateTextarea");



                    if (z == 0)
                    {
                        Gridview1.Rows[z].Cells[5].Text = split[z];
                    }
                    else
                    {
                        string check = split[z + 1];
                        Gridview1.Rows[z].Cells[5].Text = check;

                    }
                    DropDownList ddl3 = (DropDownList)Gridview1.Rows[z].Cells[6].FindControl("DropDownList3");
                    ddl3.SelectedItem.Text = Convert.ToString(ds.Tables[0].Rows[z]["durations"]);
                    int dropDownValue = Convert.ToInt32(ddl3.SelectedValue);
                    if (ddl3.SelectedItem.Text == "دن")
                    {
                        tb4.Text = Convert.ToString(temp / result);

                    }
                    else if (ddl3.SelectedItem.Text == "ہفتہ")
                    {
                        result = 7 * result;
                        tb4.Text = Convert.ToString(temp / result);
                    }
                    else if (ddl3.SelectedItem.Text == "مہینہ")
                    {
                        result = 30 * result;
                        tb4.Text = Convert.ToString(temp / result);
                    }

                    else if (ddl3.SelectedItem.Text == "سال")
                    {
                        result = 365 * result;
                        tb4.Text = Convert.ToString(temp / result);
                    }






                    AddNewRowToGrid(false);


                }
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

            arr.Add(new ListItem("کھانے کے بعد", "1"));

            arr.Add(new ListItem("کھانے سے پہلے", "2"));

            arr.Add(new ListItem("سونے سے پہلے", "3"));

            // arr.Add(new ListItem("Drop", "4"));

            //arr.Add(new ListItem("Item5", "5"));

            return arr;

        }

        private ArrayList GettempDummyData()
        {

            ArrayList arr = new ArrayList();

            arr.Add(new ListItem("دن", "1"));

            arr.Add(new ListItem("ہفتہ", "2"));

            arr.Add(new ListItem("مہینہ", "3"));

            arr.Add(new ListItem("سال", "4"));



            //arr.Add(new ListItem("Item5", "5"));

            return arr;

        }

        private void FillDropDownListDuration(DropDownList ddl)
        {

            ArrayList arr = GettempDummyData();

            foreach (ListItem item in arr)
            {

                ddl.Items.Add(item);

            }

        }

        private void FillDbDropDownList(DropDownList ddl)
        {

            SqlConnection con = new SqlConnection(constring);
            SqlCommand cmd = new SqlCommand("Select * from medicine", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            ddl.DataSource = ds;
            ddl.DataTextField = "med_name";
            ddl.DataValueField = "med_id";
            ddl.DataBind();
        }

        private void FillDropDownList(DropDownList ddl)
        {

            ArrayList arr = GetDummyData();

            foreach (ListItem item in arr)
            {

                ddl.Items.Add(item);

            }

        }



        private void SetInitialRow()
        {
            try
            {

                DataTable dt = new DataTable();

                DataRow dr = null;



                //Define the Columns

                dt.Columns.Add(new DataColumn("RowNumber", typeof(string)));

                dt.Columns.Add(new DataColumn("Column1", typeof(string)));

                dt.Columns.Add(new DataColumn("Column2", typeof(string)));

                dt.Columns.Add(new DataColumn("Column3", typeof(string)));

                dt.Columns.Add(new DataColumn("Column4", typeof(string)));

                dt.Columns.Add(new DataColumn("Column5", typeof(string)));

                dt.Columns.Add(new DataColumn("Column6", typeof(string)));

                dt.Columns.Add(new DataColumn("Column7", typeof(string)));



                //Add a Dummy Data on Initial Load

                dr = dt.NewRow();

                dr["RowNumber"] = 1;

                dt.Rows.Add(dr);



                //Store the DataTable in ViewState

                ViewState["CurrentTable"] = dt;

                //Bind the DataTable to the Grid

                Gridview1.DataSource = dt;

                Gridview1.DataBind();



                //Extract and Fill the DropDownList with Data

                DropDownList ddl1 = (DropDownList)Gridview1.Rows[0].Cells[1].FindControl("DropDownList1");
                TextBox tb1 = (TextBox)Gridview1.Rows[0].Cells[2].FindControl("morning_txt");


                TextBox tb2 = (TextBox)Gridview1.Rows[0].Cells[3].FindControl("aterNoon_txt");
                TextBox tb3 = (TextBox)Gridview1.Rows[0].Cells[4].FindControl("evening_txt");
                TextBox tb4 = (TextBox)Gridview1.Rows[0].Cells[7].FindControl("durationPeriod_txt");
                HtmlTextArea ddl2 = (HtmlTextArea)Gridview1.Rows[0].Cells[5].FindControl("transliterateTextarea");

                DropDownList ddl3 = (DropDownList)Gridview1.Rows[0].Cells[6].FindControl("DropDownList3");


                FillDbDropDownList(ddl1);

                //FillDropDownList(ddl2);

                FillDropDownListDuration(ddl3);
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

                string med_id = "";
                int result = 0;
                visit_no = Convert.ToInt32(tempVisit);
                visit_no = visit_no;
                int count = Gridview1.Rows.Count;
                int initialRow = count - 1;

                if (directions_check.Checked == true)
                {
                    int ddlvalue = Convert.ToInt32(DropDownList2.SelectedValue);
                    if (ddlvalue > 0)
                    {
                        SqlConnection con = new SqlConnection(constring);
                        SqlCommand cmd = new SqlCommand("update visit set durationDDl=@duarationDDL , durationTxt=@durationTxt where patient_reg='" + id + "' and visit_no='" + visit_no + "'", con);
                        cmd.Parameters.AddWithValue("@duarationDDL", DropDownList2.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@durationTxt", directions_txt.Text);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }
                else
                {
                }

                if (count == 1)
                {
                    if (Gridview1.Rows[count - 1].Cells[1].Text != "Select")
                    {
                        AddNewRowToGrid(true);
                    }
                }
                else if (count > 1)
                {
                    if (Gridview1.Rows[count - 1].Cells[5].Text != "")
                    {
                        AddNewRowToGrid(true);
                    }
                }
                else
                {
                }
                for (int z = 0; z < count; z++)
                {

                    //string query = "insert into systemic_medications(patient_reg,visit_no,med_id,quantity,morning,afternoon,night,directions,durations) values(@id,@VisitNo,@MedId,@Quantity,@Morning,@AfterNoon,@night,@Direction,@Duration)";
                    SqlConnection con = new SqlConnection(constring);
                    SqlCommand cmd = new SqlCommand("InsertSystematicmedication", con);

                    string[] split = Session["MyArr"].ToString().Split('@');
                    DropDownList ddl1 = (DropDownList)Gridview1.Rows[z].Cells[1].FindControl("DropDownList1");
                    TextBox tb1 = (TextBox)Gridview1.Rows[z].Cells[2].FindControl("morning_txt");


                    TextBox tb2 = (TextBox)Gridview1.Rows[z].Cells[3].FindControl("aterNoon_txt");
                    TextBox tb3 = (TextBox)Gridview1.Rows[z].Cells[4].FindControl("evening_txt");
                    TextBox tb4 = (TextBox)Gridview1.Rows[z].Cells[7].FindControl("durationPeriod_txt");
                    HtmlTextArea ddl2 = (HtmlTextArea)Gridview1.Rows[z].Cells[5].FindControl("transliterateTextarea");
                    string text = split[z];
                    DropDownList ddl3 = (DropDownList)Gridview1.Rows[z].Cells[6].FindControl("DropDownList3");
                    int validation = -1;

                    int chkDdl3 = -1;
                    validation = Convert.ToInt32(ddl1.SelectedValue);
                    chkDdl3 = Convert.ToInt32(ddl3.SelectedValue);
                    if (tb1.Text != "" && validation > 0 && chkDdl3 > 0 && tb2.Text != "" && tb3.Text != "" && tb4.Text != "")
                    {
                        med_id = ddl1.SelectedValue;

                        int tempTb1 = Convert.ToInt32(tb1.Text);
                        int tempTb2 = Convert.ToInt32(tb2.Text);
                        int tempTb3 = Convert.ToInt32(tb3.Text);
                        int tempTb4 = Convert.ToInt32(tb4.Text);

                        if (chkDdl3 == 1)
                        {
                            result = (tempTb1 + tempTb2 + tempTb3) * tempTb4;
                        }
                        else if (chkDdl3 == 2)
                        {
                            tempTb4 = tempTb4 * 7;
                            result = (tempTb1 + tempTb2 + tempTb3) * tempTb4;
                        }
                        else if (chkDdl3 == 3)
                        {
                            tempTb4 = tempTb4 * 30;
                            result = (tempTb1 + tempTb2 + tempTb3) * tempTb4;
                        }
                        else if (chkDdl3 == 4)
                        {
                            tempTb4 = tempTb4 * 365;
                            result = (tempTb1 + tempTb2 + tempTb3) * tempTb4;
                        }
                        else
                        {
                        }

                        cmd.Connection = con;
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@patient_reg", id);
                        cmd.Parameters.AddWithValue("@visit_no", visit_no);
                        cmd.Parameters.AddWithValue("@med_id", med_id);
                        cmd.Parameters.AddWithValue("@quantity", result);
                        cmd.Parameters.AddWithValue("@morning", tb1.Text);
                        cmd.Parameters.AddWithValue("@afternoon", tb2.Text);
                        cmd.Parameters.AddWithValue("@night", tb3.Text);
                        cmd.Parameters.AddWithValue("@directions", text);
                        cmd.Parameters.AddWithValue("@durations", ddl3.SelectedItem.ToString());

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

        private void AddNewRowToGrid(bool checkRow)
        {
            try
            {
                if (checkRow == true)
                {
                    string text = Request.Form["temp"];
                    int row = Gridview1.Rows.Count;

                    Session["MyArr"] = Session["MyArr"].ToString() + text + "@";
                }

                ///list.Insert(row,text);
                ///

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

                        //Store the current data to ViewState

                        ViewState["CurrentTable"] = dtCurrentTable;



                        for (int i = 0; i < dtCurrentTable.Rows.Count - 1; i++)
                        {

                            //extract the DropDownList Selected Items

                            DropDownList ddl1 = (DropDownList)Gridview1.Rows[i].Cells[1].FindControl("DropDownList1");

                            HtmlTextArea ddl2 = (HtmlTextArea)Gridview1.Rows[i].Cells[5].FindControl("transliterateTextarea");

                            DropDownList ddl3 = (DropDownList)Gridview1.Rows[i].Cells[6].FindControl("DropDownList3");

                            //wordList.Insert(i,text);

                            TextBox tb1 = (TextBox)Gridview1.Rows[i].Cells[2].FindControl("morning_txt");
                            TextBox tb2 = (TextBox)Gridview1.Rows[i].Cells[3].FindControl("aterNoon_txt");
                            TextBox tb3 = (TextBox)Gridview1.Rows[i].Cells[4].FindControl("evening_txt");
                            TextBox tb4 = (TextBox)Gridview1.Rows[i].Cells[7].FindControl("durationPeriod_txt");

                            dtCurrentTable.Rows[i]["Column2"] = tb1.Text;
                            dtCurrentTable.Rows[i]["Column3"] = tb2.Text;
                            dtCurrentTable.Rows[i]["Column4"] = tb3.Text;
                            dtCurrentTable.Rows[i]["Column7"] = tb4.Text;


                            // Update the DataRow with the DDL Selected Items

                            dtCurrentTable.Rows[i]["Column1"] = ddl1.SelectedItem.Text;

                            //dtCurrentTable.Rows[row]["Column5"] = Request.Form["temp"];
                            //dtCurrentTable.Rows[i]["Column5"] = ddl2.InnerText;

                            dtCurrentTable.Rows[i]["Column6"] = ddl3.SelectedItem.Text;

                        }
                        //Rebind the Grid with the current data

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
            catch (Exception ex)
            {
                alert_fail.Visible = true;
                error.Text = "Error! " + ex.ToString();
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }

        }






        private void SetPreviousData()
        {
            try
            {

                int row = Gridview1.Rows.Count;
                int rowIndex = 0;

                //Gridview1.Rows[row-1].Cells[5].Text = wordList[row-1];

                if (ViewState["CurrentTable"] != null)
                {

                    DataTable dt = (DataTable)ViewState["CurrentTable"];

                    if (dt.Rows.Count > 0)
                    {

                        for (int i = 0; i < dt.Rows.Count; i++)
                        {

                            //Set the Previous Selected Items on Each DropDownList on Postbacks

                            DropDownList ddl1 = (DropDownList)Gridview1.Rows[rowIndex].Cells[1].FindControl("DropDownList1");

                            HtmlTextArea ddl2 = (HtmlTextArea)Gridview1.Rows[rowIndex].Cells[5].FindControl("transliterateTextarea");
                            //HtmlTextArea ta=(HtmlTextArea)Gridview1.Rows[rowIndex].cel
                            DropDownList ddl3 = (DropDownList)Gridview1.Rows[rowIndex].Cells[6].FindControl("DropDownList3");


                            TextBox tb1 = (TextBox)Gridview1.Rows[rowIndex].Cells[2].FindControl("morning_txt");
                            TextBox tb2 = (TextBox)Gridview1.Rows[rowIndex].Cells[3].FindControl("aterNoon_txt");
                            TextBox tb3 = (TextBox)Gridview1.Rows[rowIndex].Cells[4].FindControl("evening_txt");
                            TextBox tb4 = (TextBox)Gridview1.Rows[rowIndex].Cells[7].FindControl("durationPeriod_txt");

                            //Fill the DropDownList with Data

                            FillDbDropDownList(ddl1);

                            //FillDropDownList(ddl2);

                            FillDropDownListDuration(ddl3);



                            if (i < dt.Rows.Count - 1)
                            {
                                string[] split = Session["MyArr"].ToString().Split('@');
                                tb1.Text = dt.Rows[i]["Column2"].ToString();
                                tb2.Text = dt.Rows[i]["Column3"].ToString();
                                tb3.Text = dt.Rows[i]["Column4"].ToString();
                                tb4.Text = dt.Rows[i]["Column7"].ToString();
                                Gridview1.Rows[i].Cells[5].Text = split[i];
                                // Gridview1.Rows[i].Cells[5].Text = dt.Rows[row-1]["Column5"].ToString();
                                //ddl2.Value = dt.Rows[i]["Column5"].ToString();
                                ddl1.ClearSelection();

                                ddl1.Items.FindByText(dt.Rows[i]["Column1"].ToString()).Selected = true;



                                //ddl2.ClearSelection();

                                //ddl2.Items.FindByText(dt.Rows[i]["Column5"].ToString()).Selected = true;



                                ddl3.ClearSelection();

                                ddl3.Items.FindByText(dt.Rows[i]["Column6"].ToString()).Selected = true;

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




        protected void ButtonAdd_Click(object sender, EventArgs e)
        {


            AddNewRowToGrid(true);

        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
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

        protected void Gridview1_RowCreated(object sender, GridViewRowEventArgs e)
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
    }
}