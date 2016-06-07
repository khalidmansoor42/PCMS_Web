using PCMS_Web.Class;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PCMS_Web.Doctor
{
    public partial class WebForm19 : System.Web.UI.Page
    {
        string constring = ConfigurationManager.ConnectionStrings["PCMS_ConnectionString"].ConnectionString;
        getInformation info = new getInformation();
        string[] patientInfo = new string[4];
        maxValue obj1 = new maxValue();
        int maxvisit = 0;
        string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PatientId"] != null)
            {
                patientInfo = info.information("SELECT a.full_name, a.father_name,a.dob, b.visit_no FROM patient_registeration a, visit b  WHERE a.patient_reg = b.patient_reg  AND b.visit_date='" + DateTime.Now.ToString("yyyy-MM-dd") + "'And  a.patient_reg ='" + Session["PatientId"].ToString() + "' And b.patient_reg='" + Session["PatientId"].ToString() + "';");
                patientId_txt.Text = Session["PatientId"].ToString();
                visitNumber_txt.Text = patientInfo[2];
                patientName.Text = patientInfo[0];
                ageTxt.Text = patientInfo[3];
                id = Session["PatientId"].ToString();
                if (!Page.IsPostBack)
                {
                    pastHistory();

                }
            }           
        }
        void pastHistory()
        {
            string query = "select * from mentalStateExamination where patient_id='"+ id + "'";
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Connection = con;
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    submit_btn.Visible = false;
                    update.Visible = true;
                    physicalAppearance_txt.Text = dr["Physical_Appearance"].ToString();
                    dress_txt.SelectedItem.Text = dr["Dress"].ToString();
                    posture_txt.SelectedItem.Text = dr["Posture"].ToString();
                    rapport_txt.Text = dr["Rapport"].ToString();
                    eyeContact_txt.Text = dr["Eye_Contact"].ToString();
                    if (dr["Cooperative"].ToString() == "1")
                    {
                        cooperative_radio.Checked = true;
                        uncooperative_radio.Checked = false;

                    }
                    else
                    {
                        cooperative_radio.Checked = false;
                        uncooperative_radio.Checked = true;
                    }

                    if (dr["Communicative"].ToString() == "1")
                    {
                        communicative_radio.Checked = true;
                        mute_radio.Checked = false;
                        nonCommunicative_radio.Checked = false;
                    }
                    else if (dr["Communicative"].ToString() == "2")
                    {
                        nonCommunicative_radio.Checked = true;
                        communicative_radio.Checked = false;
                        mute_radio.Checked = false;
                    }
                    else if (dr["Communicative"].ToString() == "3")
                    {
                        mute_radio.Checked = true;
                        nonCommunicative_radio.Checked = false;
                        communicative_radio.Checked = false;
                    }


                    psychomotorActivity_dd.SelectedValue = dr["Psychomotor_activity"].ToString();
                    movements_dd.SelectedValue = dr["Movements"].ToString();

                    if (dr["Movements"].ToString() == "Abnormal")
                    {
                        involuntary_dd.SelectedValue = dr["Involuntary"].ToString();
                        voluntary_dd.SelectedValue = dr["Voluntary"].ToString();

                    }
                    else
                    {
                        involuntary_dd.SelectedValue = "None";
                        voluntary_dd.SelectedValue = "None";
                    }
                    speech_dd.SelectedValue = dr["Speech"].ToString();
                    tone_txt.Text = dr["Tone"].ToString();
                    relevance_txt.Text = dr["Relevance"].ToString();
                    coherence_txt.Text = dr["Coherence"].ToString();
                    volume_dd.SelectedValue = dr["Volume"].ToString();
                    relevant_dd.SelectedValue = dr["Volume2"].ToString();

                    sampleTalk_area.Value = dr["Sample_of_talk"].ToString();
                    subjective_dd.SelectedValue = dr["mood_Subjective"].ToString();
                    objective_dd.SelectedValue = dr["mood_Objective"].ToString();

                    if (dr["Stream_of_thoughts_Poverty"].ToString() == "1")
                    {
                        povertyOfThought_cb.Checked = true;
                    }
                    else
                    {
                        povertyOfThought_cb.Checked = false;
                    }


                    if (dr["Stream_of_thoughts_Pressure"].ToString() == "1")
                    {
                        pressureOfThought_cb.Checked = true;
                    }
                    else
                    {
                        pressureOfThought_cb.Checked = false;
                    }

                    if (dr["Stream_of_thoughts_Thought"].ToString() == "1")
                    {
                        thoughtBlock_cb.Checked = true;
                    }
                    else
                    {
                        thoughtBlock_cb.Checked = false;
                    }

                    if (dr["Flight_of_Ideas"].ToString() == "1")
                    {
                        flightOfIdeas_cb.Checked = true;
                    }
                    else
                    {
                        flightOfIdeas_cb.Checked = false;
                    }

                    if (dr["Clang_association"].ToString() == "1")
                    {
                        clangAssociation_cb.Checked = true;
                    }
                    else
                    {
                        clangAssociation_cb.Checked = false;
                    }

                    if (dr["Loosening_of_association"].ToString() == "1")
                    {
                        looseningOfAssociation_cb.Checked = true;
                    }
                    else
                    {
                        looseningOfAssociation_cb.Checked = false;
                    }

                    if (dr["Knights_move"].ToString() == "1")
                    {
                        knightsMove_cb.Checked = true;
                    }
                    else
                    {
                        knightsMove_cb.Checked = false;
                    }


                    if (dr["Derailment"].ToString() == "1")
                    {
                        derailment_cb.Checked = true;
                    }
                    else
                    {
                        derailment_cb.Checked = false;
                    }
                    if (dr["Word_salad"].ToString() == "1")
                    {
                        wordSalad_cb.Checked = false;
                    }
                    else
                    {
                        wordSalad_cb.Checked = false;
                    }
                    if (dr["Taking_past_the_point"].ToString() == "1")
                    {
                        takingPastThePoint_cb.Checked = true;
                    }
                    else
                    {
                        takingPastThePoint_cb.Checked = false;
                    }
                    if (dr["Tangentiality"].ToString() == "1")
                    {
                        tangentiality.Checked = true;
                    }
                    else
                    {
                        tangentiality.Checked = false;
                    }
                    if (dr["Circumstanciality"].ToString() == "1")
                    {
                        circumstanciality_cb.Checked = true;
                    }
                    else
                    {
                        circumstanciality_cb.Checked = false;
                    }
                    if (dr["Preservation"].ToString() == "1")
                    {
                        preservation_cb.Checked = true;
                    }
                    else
                    {
                        preservation_cb.Checked = false;
                    }

                    if (dr["Neologism"].ToString() == "1")
                    {
                        neologism_cb.Checked = true;
                    }
                    else
                    {
                        neologism_cb.Checked = false;
                    }

                    if (dr["Suicidal_Ideatio"].ToString() == "1")
                    {
                        suicidalIdeation_cb.Checked = true;
                    }
                    else
                    {
                        suicidalIdeation_cb.Checked = false;
                    }

                    if (dr["Homicidal_Ideation"].ToString() == "1")
                    {
                        homicidalIdeation_cb.Checked = true;
                    }
                    else
                    {
                        homicidalIdeation_cb.Checked = false;
                    }

                    if (dr["Hopelessness"].ToString() == "1")
                    {
                        hopelessness_cb.Checked = true;
                    }
                    else
                    {
                        hopelessness_cb.Checked = false;
                    }

                    if (dr["Helplessness"].ToString() == "1")
                    {
                        helplessness_cb.Checked = true;
                    }
                    else
                    {
                        helplessness_cb.Checked = false;
                    }

                    if (dr["Worthlessness"].ToString() == "1")
                    {
                        worthlessness_cb.Checked = true;
                    }
                    else
                    {
                        worthlessness_cb.Checked = false;
                    }

                     delusions_dd.SelectedItem.Text = dr["DelusionsType"].ToString();
                     delusions2_dd.SelectedItem.Text = dr["DelusionsContent"].ToString();

                    if (dr["Delusions_of_reference"].ToString() == "1")
                    {
                        delusionsOfReference_cb.Checked = true;
                    }
                    else
                    {
                        delusionsOfReference_cb.Checked = false;
                    }
                    if (dr["Grandiose_guilt"].ToString() == "1")
                    {
                        grandioseGuilt_cb.Checked = true;
                    }
                    else
                    {
                        grandioseGuilt_cb.Checked = false;
                    }
                    if (dr["Nihilistic"].ToString() == "1")
                    {
                        nihilistic_cb.Checked = true;
                    }
                    else
                    {
                        nihilistic_cb.Checked = false;
                    }
                    if (dr["Hypochondriacal"].ToString() == "1")
                    {
                        hypochondriacal_cb.Checked = true;
                    }
                    else
                    {
                        hypochondriacal_cb.Checked = false;
                    }
                    if (dr["Religious"].ToString() == "1")
                    {
                        Religious_cb.Checked = true;
                    }
                    else
                    {
                        Religious_cb.Checked = false;
                    }
                    if (dr["Sexual"].ToString() == "1")
                    {
                        sexual_cb.Checked = true;
                    }
                    else
                    {
                        sexual_cb.Checked = false;
                    }
                    if (dr["Delusion_of_control"].ToString() == "1")
                    {
                        delusionOfControl_cb.Checked = true;
                    }
                    else
                    {
                        delusionOfControl_cb.Checked = false;
                    }
                    if (dr["Thought_insertion"].ToString() == "1")
                    {
                        thoughtInsertion_cb.Checked = true;
                    }
                    else
                    {
                        thoughtInsertion_cb.Checked = false;
                    }


                    if (dr["Withdrawal"].ToString() == "1")
                    {
                        withdrawal_cb.Checked = true;
                    }
                    else
                    {
                        withdrawal_cb.Checked = false;
                    }

                    if (dr["Thought_broadcasting"].ToString() == "1")
                    {
                        thoughtBroadcasting_cb.Checked = true;
                    }
                    else
                    {
                        thoughtBroadcasting_cb.Checked = false;
                    }

                    obsessiveCompulsivePhenomena_area.Value = dr["Obsessive_Compulsive_Phenomena"].ToString();
                    phobias_area.Value = dr["PHOBIAS"].ToString();
                    disordersOfPerception_area.Value = dr["Disorders_Of_Perception"].ToString();

                    if (dr["Depersonalization"].ToString() == "1")
                    {
                        depersonalization_radio.Checked = true;
                        derealozation_radio.Checked = false;
                    }
                    else
                    {
                        depersonalization_radio.Checked = false;
                        derealozation_radio.Checked = true;
                    }

                    hallucinations_dd.SelectedValue = dr["hallucinations"].ToString();
                    if (dr["hallucinations"].ToString() == "Auditory")
                    {

                        if (dr["Auditory_redio"].ToString()=="1")
                        {
                            secondPerson_radio.Checked = true;
                       }
                        else if (dr["Auditory_redio"].ToString() == "2")
                        {
                            thirdPerson_radio.Checked = true;
                        }
                        else if (dr["Auditory_redio"].ToString() == "3")
                        {
                            runningCommentary_radio.Checked = true;
                        }
                    }

                    //if (dr["Auditory_redio"].ToString() == "1")
                    //{
                    //    depersonalization_radio.Checked = true;
                    //    depersonalization_radio.Checked = false;
                    //    derealozation_radio.Checked = false;
                    //}
                    //else if (dr["Auditory_redio"].ToString() == "2")
                    //{
                    //    depersonalization_radio.Checked = true;
                    //    depersonalization_radio.Checked = false;
                    //    derealozation_radio.Checked = false;


                    //}
                    //else if (dr["Auditory_redio"].ToString() == "3")
                    //{
                    //    derealozation_radio.Checked = true;
                    //    depersonalization_radio.Checked = false;
                    //    depersonalization_radio.Checked = false;


                    //}
                    if (dr["Illusions"].ToString() == "1")
                    {
                        yesIllusions_radio.Checked = true;
                        noIllusions_radio.Checked = false;
                        illusions_area.Value = dr["IllusionsText"].ToString();
                    }
                    else
                    {
                        noIllusions_radio.Checked = true;
                        yesIllusions_radio.Checked = false;

                        illusions_area.Value = ""; ;
                    }


                    hallucinations_dd.SelectedItem.Text = dr["hallucinations"].ToString();
                    consciouness_dd.SelectedValue = dr["Consciousness"].ToString();
                    Orientation_dd.SelectedValue = dr["Orientation"].ToString();

                    if (dr["Serial_Seven"].ToString() == "1")
                    {
                        sevenTestRado1.Checked = true;
                        sevenTestRado2.Checked = false;

                        serialSevenTest_txt.Text = dr["Serial_Seven_Text"].ToString();
                    }
                    else
                    {
                        sevenTestRado2.Checked = true;
                        sevenTestRado1.Checked = false;

                        serialSevenTest_txt.Text = "";
                    }
                    if (dr["Serial_Three"].ToString() == "1")
                    {
                        threeTestRado1.Checked = true;
                        threeTestRado2.Checked = false;

                        serialThreeTest_txt.Text = dr["Serial_Three_Text"].ToString();
                    }
                    else
                    {
                        threeTestRado1.Checked = false;
                        threeTestRado2.Checked = true;
                        serialThreeTest_txt.Text = "";
                    }

                    intelligence_dd.SelectedValue = dr["Intelligence"].ToString();

                    iq_txt.SelectedValue = dr["IQ"].ToString();
                    memory_dd.SelectedValue = dr["Memory"].ToString();
                    judgement_dd.SelectedValue = dr["Judgement"].ToString();
                    generalKnowledge_dd.SelectedValue = dr["General_Knowledge"].ToString();

                    concreteThinking_area.Value = dr["Concrete_thinking"].ToString();
                    abstractThinking_area.Value = dr["Abstrac_thinking"].ToString();
                    insight_area.Value = dr["Insight"].ToString();
                    
                    con.Close();
                }
                else
                {
                    submit_btn.Visible = true;
                    update.Visible = false;

                }
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

        string query= "INSERT INTO doctor.dbo.mentalStateExamination(Physical_Appearance, Dress, Posture, Rapport, Eye_Contact, Cooperative, Communicative, Psychomotor_activity, Movements, Involuntary, Voluntary, Speech, Tone, Relevance, Coherence , Volume, volume2, Sample_of_talk, mood_Subjective, mood_Objective, Stream_of_thoughts_Poverty, Stream_of_thoughts_Pressure, Stream_of_thoughts_Thought, Flight_of_Ideas, Clang_association, Loosening_of_association, Knights_move, Derailment, Word_salad, Taking_past_the_point, Tangentiality, Circumstanciality , Preservation, Neologism, Suicidal_Ideatio, Homicidal_Ideation , Hopelessness, Helplessness, Worthlessness, DelusionsType , DelusionsContent, Delusions_of_reference, Grandiose_guilt, Nihilistic, Hypochondriacal, Religious, Sexual, Delusion_of_control, Thought_insertion, Withdrawal, Thought_broadcasting, Obsessive_Compulsive_Phenomena, PHOBIAS, Disorders_Of_Perception, Depersonalization, hallucinations, Auditory_redio, Illusions, IllusionsText, Consciousness, Orientation, Serial_Seven, Serial_Three, Serial_Seven_Text, Serial_Three_Text, Intelligence, IQ, Memory , Judgement, General_Knowledge, Concrete_thinking, Concrete_thinking_Text, Abstrac_thinking, Insight, patient_id)VALUES (@Physical_Appearance, @Dress, @Posture, @Rapport, @Eye_Contact, @Cooperative, @Communicative, @Psychomotor_activity, @Movements, @Involuntary, @Voluntary, @Speech, @Tone, @Relevance, @Coherence, @Volume, @volume2, @Sample_of_talk, @mood_Subjective, @mood_Objective, @Stream_of_thoughts_Poverty, @Stream_of_thoughts_Pressure, @Stream_of_thoughts_Thought, @Flight_of_Ideas, @Clang_association, @Loosening_of_association, @Knights_move, @Derailment, @Word_salad, @Taking_past_the_point, @Tangentiality, @Circumstanciality, @Preservation, @Neologism, @Suicidal_Ideatio, @Homicidal_Ideation, @Hopelessness, @Helplessness, @Worthlessness, @DelusionsType, @DelusionsContent, @Delusions_of_reference, @Grandiose_guilt, @Nihilistic, @Hypochondriacal, @Religious, @Sexual, @Delusion_of_control, @Thought_insertion, @Withdrawal, @Thought_broadcasting, @Obsessive_Compulsive_Phenomena, @PHOBIAS, @Disorders_Of_Perception, @Depersonalization, @hallucinations, @Auditory_redio, @Illusions, @IllusionsText, @Consciousness, @Orientation, @Serial_Seven, @Serial_Three, @Serial_Seven_Text, @Serial_Three_Text, @Intelligence, @IQ, @Memory, @Judgement, @General_Knowledge, @Concrete_thinking, @Concrete_thinking_Text, @Abstrac_thinking, @Insight, @patient_id)";
            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand(query, con);
                
                cmd.Parameters.AddWithValue("@patient_id", id);
                cmd.Parameters.AddWithValue("@Physical_Appearance", physicalAppearance_txt.Text);
                cmd.Parameters.AddWithValue("@Dress", dress_txt.Text);
                cmd.Parameters.AddWithValue("@Posture", posture_txt.Text);
                cmd.Parameters.AddWithValue("@Rapport", rapport_txt.Text);
                cmd.Parameters.AddWithValue("@Eye_Contact", eyeContact_txt.Text);
                if (cooperative_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Cooperative", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Cooperative", 0);
                }

                if (communicative_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Communicative", 1);
                }
                else if (nonCommunicative_radio.Checked == true)

                {
                    cmd.Parameters.AddWithValue("@Communicative", 2);
                }
                else if (mute_radio.Checked == true)

                {
                    cmd.Parameters.AddWithValue("@Communicative", 3);
                }


                cmd.Parameters.AddWithValue("@Psychomotor_activity", psychomotorActivity_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Movements", movements_dd.SelectedItem.Text);
                if (movements_dd.SelectedItem.Text == "Abnormal")
                {
                    cmd.Parameters.AddWithValue("@Involuntary", involuntary_dd.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Voluntary", voluntary_dd.SelectedItem.Text);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Involuntary","None");
                    cmd.Parameters.AddWithValue("@Voluntary","None");
                }
                cmd.Parameters.AddWithValue("@Speech", speech_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Tone", tone_txt.Text);
                cmd.Parameters.AddWithValue("@Relevance", relevance_txt.Text);
                cmd.Parameters.AddWithValue("@Coherence", coherence_txt.Text);
                cmd.Parameters.AddWithValue("@Volume", volume_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Volume2", relevant_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@Sample_of_talk", sampleTalk_area.Value);
                cmd.Parameters.AddWithValue("@mood_Subjective", subjective_dd.Text);
                cmd.Parameters.AddWithValue("@mood_Objective", objective_dd.SelectedItem.Text);

                if (povertyOfThought_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Poverty", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Poverty", 0);
                }


                if (pressureOfThought_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Pressure", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Pressure", 0);
                }

                if (thoughtBlock_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Thought", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Thought", 0);
                }

                if (flightOfIdeas_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Flight_of_Ideas", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Flight_of_Ideas", 0);
                }

                if (clangAssociation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Clang_association", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Clang_association", 0);
                }

                if (looseningOfAssociation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Loosening_of_association", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Loosening_of_association", 0);
                }

                if (knightsMove_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Knights_move", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Knights_move", 0);
                }


                if (derailment_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Derailment", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Derailment", 0);
                }
                if (wordSalad_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Word_salad", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Word_salad", 0);
                }
                if (takingPastThePoint_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Taking_past_the_point", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Taking_past_the_point", 0);
                }
                if (tangentiality.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Tangentiality", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Tangentiality", 0);
                }
                if (circumstanciality_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Circumstanciality", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Circumstanciality", 0);
                }
                if (preservation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Preservation", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Preservation", 0);
                }

                if (neologism_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Neologism", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Neologism", 0);
                }

                if (suicidalIdeation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Suicidal_Ideatio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Suicidal_Ideatio", 0);
                }

                if (homicidalIdeation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Homicidal_Ideation", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Homicidal_Ideation", 0);
                }

                if (hopelessness_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Hopelessness", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Hopelessness", 0);
                }

                if (helplessness_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Helplessness", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Helplessness", 0);
                }

                if (worthlessness_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Worthlessness", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Worthlessness", 0);
                }

                cmd.Parameters.AddWithValue("@DelusionsType", delusions_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@DelusionsContent", delusions2_dd.SelectedItem.Text);

                if (delusionsOfReference_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Delusions_of_reference", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Delusions_of_reference", 0);
                }
                if (grandioseGuilt_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Grandiose_guilt", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Grandiose_guilt", 0);
                }
                if (nihilistic_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Nihilistic", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Nihilistic", 0);
                }
                if (hypochondriacal_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Hypochondriacal", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Hypochondriacal", 0);
                }
                if (Religious_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Religious", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Religious", 0);
                }
                if (sexual_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Sexual", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Sexual", 0);
                }
                if (delusionOfControl_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Delusion_of_control", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Delusion_of_control", 0);
                }
                if (thoughtInsertion_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Thought_insertion", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Thought_insertion", 0);
                }


                if (withdrawal_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Withdrawal", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Withdrawal", 0);
                }

                if (thoughtBroadcasting_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Thought_broadcasting", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Thought_broadcasting", 0);
                }

                cmd.Parameters.AddWithValue("@Obsessive_Compulsive_Phenomena", obsessiveCompulsivePhenomena_area.Value);


                cmd.Parameters.AddWithValue("@PHOBIAS", phobias_area.Value);
                cmd.Parameters.AddWithValue("@Disorders_Of_Perception", disordersOfPerception_area.Value);
                if (depersonalization_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Depersonalization", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Depersonalization", 0);
                }

                cmd.Parameters.AddWithValue("@hallucinations", hallucinations_dd.SelectedItem.Text);

                if (hallucinations_dd.SelectedItem.Text == "Auditory")
                {

                    if (secondPerson_radio.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Auditory_redio", 1);
                    }
                    else if (thirdPerson_radio.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Auditory_redio", 2);
                    }
                    else if (runningCommentary_radio.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Auditory_redio", 3);
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Auditory_redio", 0);
                }
                if (yesIllusions_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Illusions", 1);
                    cmd.Parameters.AddWithValue("@IllusionsText", illusions_area.Value);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Illusions", 0);
                    cmd.Parameters.AddWithValue("@IllusionsText","");
                }
                cmd.Parameters.AddWithValue("@Consciousness", consciouness_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Orientation", Orientation_dd.SelectedItem.Text);

                if (sevenTestRado1.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Serial_Seven", 1);
                    cmd.Parameters.AddWithValue("@Serial_Seven_Text", serialSevenTest_txt.Text);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Serial_Seven", 0);
                    cmd.Parameters.AddWithValue("@Serial_Seven_Text","");
                }
                if (threeTestRado1.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Serial_Three", 1);
                    cmd.Parameters.AddWithValue("@Serial_Three_Text", serialThreeTest_txt.Text);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Serial_Three", 0);
                    cmd.Parameters.AddWithValue("@Serial_Three_Text", "");
                }

                cmd.Parameters.AddWithValue("@Intelligence", intelligence_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@IQ", iq_txt.Text);
                cmd.Parameters.AddWithValue("@Memory", memory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Judgement", judgement_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@General_Knowledge", generalKnowledge_dd.SelectedItem.Text);


                if (ConcretePresent.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Concrete_thinking", 1);
                    cmd.Parameters.AddWithValue("@Concrete_thinking_Text", concreteThinking_area.Value);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Concrete_thinking", 0);
                    cmd.Parameters.AddWithValue("@Concrete_thinking_Text", "");
                }
                cmd.Parameters.AddWithValue("@Abstrac_thinking", abstractThinking_area.Value);
                cmd.Parameters.AddWithValue("@Insight", insight_area.Value);
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

        protected void update_Click(object sender, EventArgs e)
        {


            string query = "Update mentalStateExamination set Physical_Appearance=@Physical_Appearance,Dress=@Dress,Posture=@Posture, Rapport=@Rapport, Eye_Contact=@Eye_Contact,Cooperative=@Cooperative,Communicative=@Communicative,Psychomotor_activity =@Psychomotor_activity,Movements = @Movements,Involuntary =@Involuntary,Voluntary = @Voluntary,Speech = @Speech,Tone = @Tone,Relevance = @Relevance ,Coherence = @Coherence,Volume = @Volume ,volume2 = @volume2 ,Sample_of_talk = @Sample_of_talk ,mood_Subjective = @mood_Subjective ,mood_Objective = @mood_Objective ,Stream_of_thoughts_Poverty = @Stream_of_thoughts_Poverty ,Stream_of_thoughts_Pressure = @Stream_of_thoughts_Pressure ,Stream_of_thoughts_Thought = @Stream_of_thoughts_Thought ,Flight_of_Ideas = @Flight_of_Ideas ,Clang_association = @Clang_association ,Loosening_of_association = @Loosening_of_association ,Knights_move = @Knights_move ,Derailment = @Derailment ,Word_salad = @Word_salad ,Taking_past_the_point = @Taking_past_the_point ,Tangentiality = @Tangentiality ,Circumstanciality = @Circumstanciality,Preservation = @Preservation,Neologism = @Neologism ,Suicidal_Ideatio =@Suicidal_Ideatio ,Homicidal_Ideation = @Homicidal_Ideation,Hopelessness = @Hopelessness ,Helplessness = @Helplessness ,Worthlessness =@Worthlessness ,DelusionsType = @DelusionsType,DelusionsContent = @DelusionsContent ,Delusions_of_reference = @Delusions_of_reference ,Grandiose_guilt = @Grandiose_guilt ,Nihilistic = @Nihilistic ,Hypochondriacal = @Hypochondriacal ,Religious = @Religious ,Sexual = @Sexual ,Delusion_of_control = @Delusion_of_control ,Thought_insertion = @Thought_insertion ,Withdrawal = @Withdrawal ,Thought_broadcasting = @Thought_broadcasting ,Obsessive_Compulsive_Phenomena =@Obsessive_Compulsive_Phenomena ,PHOBIAS = @PHOBIAS ,Disorders_Of_Perception =@Disorders_Of_Perception ,Depersonalization = @Depersonalization ,hallucinations = @hallucinations ,Auditory_redio = @Auditory_redio ,Illusions = @Illusions ,IllusionsText = @IllusionsText ,Consciousness =@Consciousness ,Orientation = @Orientation ,Serial_Seven = @Serial_Seven ,Serial_Three = @Serial_Three ,Serial_Seven_Text = @Serial_Seven_Text,Serial_Three_Text = @Serial_Three_Text ,Intelligence = @Intelligence ,IQ = @IQ ,Memory = @Memory ,Judgement = @Judgement ,General_Knowledge = @General_Knowledge ,Concrete_thinking = @Concrete_thinking ,Concrete_thinking_Text =@Concrete_thinking_Text ,Abstrac_thinking = @Abstrac_thinking ,Insight = @Insight  where patient_id =@patient_id";

            try
            {
                SqlConnection con = new SqlConnection(constring);
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@patient_id", id);
                cmd.Parameters.AddWithValue("@Physical_Appearance", physicalAppearance_txt.Text);
                cmd.Parameters.AddWithValue("@Dress", dress_txt.Text);
                cmd.Parameters.AddWithValue("@Posture", posture_txt.Text);
                cmd.Parameters.AddWithValue("@Rapport", rapport_txt.Text);
                cmd.Parameters.AddWithValue("@Eye_Contact", eyeContact_txt.Text);
                if (cooperative_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Cooperative", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Cooperative", 0);
                }

                if (communicative_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Communicative", 1);
                }
                else if (nonCommunicative_radio.Checked == true)

                {
                    cmd.Parameters.AddWithValue("@Communicative", 2);
                }
                else if (mute_radio.Checked == true)

                {
                    cmd.Parameters.AddWithValue("@Communicative", 3);
                }


                cmd.Parameters.AddWithValue("@Psychomotor_activity", psychomotorActivity_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Movements", movements_dd.SelectedItem.Text);
                if (movements_dd.SelectedItem.Text == "Abnormal")
                {
                    cmd.Parameters.AddWithValue("@Involuntary", involuntary_dd.SelectedItem.Text);
                    cmd.Parameters.AddWithValue("@Voluntary", voluntary_dd.SelectedItem.Text);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Involuntary", "None");
                    cmd.Parameters.AddWithValue("@Voluntary", "None");
                }
                cmd.Parameters.AddWithValue("@Speech", speech_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Tone", tone_txt.Text);
                cmd.Parameters.AddWithValue("@Relevance", relevance_txt.Text);
                cmd.Parameters.AddWithValue("@Coherence", coherence_txt.Text);
                cmd.Parameters.AddWithValue("@Volume", volume_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Volume2", relevant_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@Sample_of_talk", sampleTalk_area.Value);
                cmd.Parameters.AddWithValue("@mood_Subjective", subjective_dd.Text);
                cmd.Parameters.AddWithValue("@mood_Objective", objective_dd.SelectedItem.Text);

                if (povertyOfThought_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Poverty", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Poverty", 0);
                }


                if (pressureOfThought_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Pressure", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Pressure", 0);
                }

                if (thoughtBlock_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Thought", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Stream_of_thoughts_Thought", 0);
                }

                if (flightOfIdeas_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Flight_of_Ideas", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Flight_of_Ideas", 0);
                }

                if (clangAssociation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Clang_association", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Clang_association", 0);
                }

                if (looseningOfAssociation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Loosening_of_association", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Loosening_of_association", 0);
                }

                if (knightsMove_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Knights_move", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Knights_move", 0);
                }


                if (derailment_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Derailment", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Derailment", 0);
                }
                if (wordSalad_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Word_salad", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Word_salad", 0);
                }
                if (takingPastThePoint_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Taking_past_the_point", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Taking_past_the_point", 0);
                }
                if (tangentiality.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Tangentiality", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Tangentiality", 0);
                }
                if (circumstanciality_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Circumstanciality", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Circumstanciality", 0);
                }
                if (preservation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Preservation", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Preservation", 0);
                }

                if (neologism_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Neologism", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Neologism", 0);
                }

                if (suicidalIdeation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Suicidal_Ideatio", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Suicidal_Ideatio", 0);
                }

                if (homicidalIdeation_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Homicidal_Ideation", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Homicidal_Ideation", 0);
                }

                if (hopelessness_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Hopelessness", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Hopelessness", 0);
                }

                if (helplessness_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Helplessness", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Helplessness", 0);
                }

                if (worthlessness_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Worthlessness", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Worthlessness", 0);
                }

                cmd.Parameters.AddWithValue("@DelusionsType", delusions_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@DelusionsContent", delusions2_dd.SelectedItem.Text);

                if (delusionsOfReference_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Delusions_of_reference", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Delusions_of_reference", 0);
                }
                if (grandioseGuilt_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Grandiose_guilt", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Grandiose_guilt", 0);
                }
                if (nihilistic_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Nihilistic", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Nihilistic", 0);
                }
                if (hypochondriacal_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Hypochondriacal", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Hypochondriacal", 0);
                }
                if (Religious_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Religious", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Religious", 0);
                }
                if (sexual_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Sexual", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Sexual", 0);
                }
                if (delusionOfControl_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Delusion_of_control", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Delusion_of_control", 0);
                }
                if (thoughtInsertion_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Thought_insertion", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Thought_insertion", 0);
                }


                if (withdrawal_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Withdrawal", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Withdrawal", 0);
                }

                if (thoughtBroadcasting_cb.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Thought_broadcasting", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Thought_broadcasting", 0);
                }

                cmd.Parameters.AddWithValue("@Obsessive_Compulsive_Phenomena", obsessiveCompulsivePhenomena_area.Value);


                cmd.Parameters.AddWithValue("@PHOBIAS", phobias_area.Value);
                cmd.Parameters.AddWithValue("@Disorders_Of_Perception", disordersOfPerception_area.Value);
                if (depersonalization_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Depersonalization", 1);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Depersonalization", 0);
                }

                cmd.Parameters.AddWithValue("@hallucinations", hallucinations_dd.SelectedItem.Text);

                if (hallucinations_dd.SelectedItem.Text == "Auditory")
                {

                    if (secondPerson_radio.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Auditory_redio", 1);
                    }
                    else if (thirdPerson_radio.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Auditory_redio", 2);
                    }
                    else if (runningCommentary_radio.Checked == true)
                    {
                        cmd.Parameters.AddWithValue("@Auditory_redio", 3);
                    }
                }
                else
                {
                    cmd.Parameters.AddWithValue("@Auditory_redio", 0);
                }
                if (yesIllusions_radio.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Illusions", 1);
                    cmd.Parameters.AddWithValue("@IllusionsText", illusions_area.Value);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Illusions", 0);
                    cmd.Parameters.AddWithValue("@IllusionsText","");
                }
                cmd.Parameters.AddWithValue("@Consciousness", consciouness_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Orientation", Orientation_dd.SelectedItem.Text);

                if (sevenTestRado1.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Serial_Seven", 1);
                    cmd.Parameters.AddWithValue("@Serial_Seven_Text", serialSevenTest_txt.Text);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Serial_Seven", 0);
                    cmd.Parameters.AddWithValue("@Serial_Seven_Text", "");
                }
                if (threeTestRado1.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Serial_Three", 1);
                    cmd.Parameters.AddWithValue("@Serial_Three_Text", serialThreeTest_txt.Text);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Serial_Three", 0);
                    cmd.Parameters.AddWithValue("@Serial_Three_Text", "");
                }

                cmd.Parameters.AddWithValue("@Intelligence", intelligence_dd.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@IQ", iq_txt.Text);
                cmd.Parameters.AddWithValue("@Memory", memory_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@Judgement", judgement_dd.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@General_Knowledge", generalKnowledge_dd.SelectedItem.Text);


                if (ConcretePresent.Checked == true)
                {
                    cmd.Parameters.AddWithValue("@Concrete_thinking", 1);
                    cmd.Parameters.AddWithValue("@Concrete_thinking_Text", concreteThinking_area.Value);

                }
                else
                {
                    cmd.Parameters.AddWithValue("@Concrete_thinking", 0);
                    cmd.Parameters.AddWithValue("@Concrete_thinking_Text", "");
                }
                cmd.Parameters.AddWithValue("@Abstrac_thinking", abstractThinking_area.Value);
                cmd.Parameters.AddWithValue("@Insight", insight_area.Value);
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