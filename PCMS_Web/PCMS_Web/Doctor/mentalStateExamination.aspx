<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="mentalStateExamination.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm19" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Mental State Examination</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form runat="server">
                    <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <p>Record is Added!</p>
                    </div>
                    <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label runat="server" ID="error"></asp:Label>
                    </div>
                    <div class="box-body">

                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">Patient Information</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group col-sm-6">
                                                <label class="col-sm-4 control-label">Patient ID</label>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="patientId_txt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="col-sm-4 control-label">Visit Number</label>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="visitNumber_txt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-sm-6">
                                                <label class="col-sm-4 control-label">Patient Name</label>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="patientName" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="col-sm-4 control-label">Age</label>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="ageTxt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <hr />

                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">General Appearance/Behaviour</h4>
                        <br />
                    </div>

                    <div class="row">
                        <br />
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Physical Appearance</label>
                            <div class="col-sm-9">
<%--                                <asp:TextBox ID="physicalAppearance_txt" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                <asp:DropDownList ID="physicalAppearance_txt" runat="server" CssClass="form-control">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Healthy</asp:ListItem>
                                    <asp:ListItem>Un Healthy</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Dress/Hygiene</label>
                            <div class="col-sm-9">
<%--                                <asp:TextBox ID="dress_txt" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                <asp:DropDownList ID="dress_txt" runat="server" CssClass="form-control">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Improper</asp:ListItem>
                                    <asp:ListItem>Proper</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Posture</label>
                            <div class="col-sm-9">
<%--                                <asp:TextBox ID="posture_txt" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                <asp:DropDownList ID="posture_txt" runat="server" CssClass="form-control">
                                     <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Maintained</asp:ListItem>
                                    <asp:ListItem>Not Maintained</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Rapport</label>
                            <div class="col-sm-9">
<%--                                <asp:TextBox ID="rapport_txt" runat="server" CssClass="form-control"></asp:TextBox> --%>
                                <asp:DropDownList ID="rapport_txt" runat="server" CssClass="form-control">
                                     <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Developed</asp:ListItem>
                                    <asp:ListItem>Not Developed</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Eye Contact</label>
                            <div class="col-sm-9">
<%--                                <asp:TextBox ID="eyeContact_txt" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                <asp:DropDownList ID="eyeContact_txt" runat="server" CssClass="form-control">
                                     <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Maintained</asp:ListItem>
                                    <asp:ListItem>Not Maintained</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4">Cooperation</label>
                            <div class="col-sm-8">
                            <label class="radio-inline">
                                <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions1" id="cooperative_radio" value="option1">
                                Cooperative
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions1" id="uncooperative_radio" value="option2">
                                Un-cooperative
                            </label>
                                </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4">Communication</label>
                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions2" id="communicative_radio" value="option1">
                                    Communicative
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions2" id="nonCommunicative_radio" value="option2">
                                    Non Communicative
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio"  onclick="" name="inlineRadioOptions2" id="mute_radio" value="option3">
                                    Mute
                                </label>
                                </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Psychomotor activity</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="psychomotorActivity_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Hyperactive</asp:ListItem>
                                    <asp:ListItem>Retarded</asp:ListItem>
                                    <asp:ListItem>Aggressive</asp:ListItem>
                                    <asp:ListItem>Self Injurious</asp:ListItem>
                                </asp:DropDownList>    
                            </div>
                        </div>
                    </div>
                        <br />
                        <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Movements</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="movements_dd" CssClass="form-control" runat="server" onchange="movementArea()">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Normal</asp:ListItem>
                                    <asp:ListItem>Abnormal</asp:ListItem>
                                </asp:DropDownList>    
                            </div>
                        </div>
                    </div>
                        <br />
                        <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label" id="involuntary_lbl" style="display:none">Involuntary</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="involuntary_dd" CssClass="form-control" style="display:none" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Tremors</asp:ListItem>
                                    <asp:ListItem>Dyskinesia</asp:ListItem>
                                    <asp:ListItem>Dystonia</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>    
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label" id="voluntary_lbl" style="display:none">Voluntary</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="voluntary_dd" CssClass="form-control" runat="server" style="display:none">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Restlessness</asp:ListItem>
                                    <asp:ListItem>Hyperactivity</asp:ListItem>
                                </asp:DropDownList>    
                            </div>
                        </div>
                    </div>
                        <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Speech</h4>
                        <br />
                    </div>

                    <div class="row">
                        <br />
                        <div class="form-group col-sm-6">
                            <div class="col-sm-7 col-sm-offset-3">
                                <asp:DropDownList ID="speech_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Spontaneous</asp:ListItem>
                                    <asp:ListItem>Non Spontaneous</asp:ListItem>
                                </asp:DropDownList>    
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Tone</label>
                            <div class="col-sm-9">
<%--                                 <asp:TextBox ID="tone_txt" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                <asp:DropDownList ID="tone_txt" runat="server" CssClass="form-control">
                                     <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Increased</asp:ListItem>
                                    <asp:ListItem>Decreased</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Relevance </label>
                            <div class="col-sm-9">
                                 <asp:TextBox ID="relevance_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Coherence</label>
                            <div class="col-sm-9">
                                 <asp:TextBox ID="coherence_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3">Volume</label>
                            <div class="col-sm-7">
                                <asp:DropDownList ID="volume_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>High</asp:ListItem>
                                    <asp:ListItem>Low</asp:ListItem>
                                </asp:DropDownList>    
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <div class="col-sm-7 col-sm-offset-3">
                            <asp:DropDownList ID="relevant_dd" CssClass="form-control" runat="server">
                                <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Relevant</asp:ListItem>
                                    <asp:ListItem>Irrelevant</asp:ListItem>
                                </asp:DropDownList>
                                </div>
                        </div>
                    </div><br />

                        <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-2">Sample of talk</label>
                            <div class="col-sm-10">
                                <textarea id="sampleTalk_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                </div>
                        </div>
                    </div>
                           <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Mood</h4>
                        <br />
                    </div>
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3">Subjective</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="subjective_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Anxious</asp:ListItem>
                                    <asp:ListItem>Low</asp:ListItem>
                                    <asp:ListItem>Irritable</asp:ListItem>
                                    <asp:ListItem>Elated</asp:ListItem>
                                    <asp:ListItem>Labile</asp:ListItem>
                                    <asp:ListItem>Euthymic</asp:ListItem>
                                    <asp:ListItem>Blunt</asp:ListItem>
                                    <asp:ListItem>Inappropriate</asp:ListItem>
                                    <asp:ListItem>Flat</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3">Objective</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="objective_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Anxious</asp:ListItem>
                                    <asp:ListItem>Low</asp:ListItem>
                                    <asp:ListItem>Irritable</asp:ListItem>
                                    <asp:ListItem>Elated</asp:ListItem>
                                    <asp:ListItem>Labile</asp:ListItem>
                                    <asp:ListItem>Euthymic</asp:ListItem>
                                    <asp:ListItem>Blunt</asp:ListItem>
                                    <asp:ListItem>Inappropriate</asp:ListItem>
                                    <asp:ListItem>Flat</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Thoughts</h4>
                        <br />
                    </div>
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-12">
                            <label class="col-sm-2">Stream of thoughts</label>
                            <div class="col-sm-10">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="povertyOfThought_cb" value="option1" runat="server">
                                    Poverty of thought
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="pressureOfThought_cb" value="option2" runat="server">
                                    Pressure of thought
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="thoughtBlock_cb" value="option3" runat="server">
                                    Thought block
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-2" style="margin-left:15px">Form of thoughts</label>
                        <br /><br />
                        <div class="form-group col-sm-12">
                            <label class="col-sm-1">1</label>
                            <div class="col-sm-11">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="flightOfIdeas_cb" value="option1" runat="server">
                                    Flight of Ideas
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="clangAssociation_cb" value="option2" runat="server">
                                    Clang association
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-1">2</label>
                            <div class="col-sm-11">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="looseningOfAssociation_cb" value="option1" runat="server">
                                    Loosening of association
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="knightsMove_cb" value="option2" runat="server">
                                    Knights move
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="derailment_cb" value="option3" runat="server">
                                    Derailment
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="wordSalad_cb" value="option4" runat="server">
                                    Word salad
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="takingPastThePoint_cb" value="option5" runat="server">
                                    Taking past the point
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="tangentiality" value="option6" runat="server">
                                    Tangentiality
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="circumstanciality_cb" value="option7" runat="server">
                                    Circumstanciality
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-1">3</label>
                            <div class="col-sm-11">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="preservation_cb" value="option1" runat="server">
                                    Preservation
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-1">4</label>
                            <div class="col-sm-11">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="neologism_cb" value="option1" runat="server">
                                    Neologism
                                </label>
                            </div>
                        </div>
                    </div>

                        <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-1">5</label>
                            <div class="col-sm-11">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="suicidalIdeation_cb" value="option1" runat="server">
                                    Suicidal Ideation
                                </label>
                            </div>
                        </div>
                    </div>

                        <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-1">6</label>
                            <div class="col-sm-11">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="homicidalIdeation_cb" value="option1" runat="server">
                                    Homicidal Ideation
                                </label>
                            </div>
                        </div>
                    </div>
                        <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Content of thoughts</h4>
                        <br />
                    </div>
                        
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <div class="col-sm-10 col-sm-offset-2">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="hopelessness_cb" value="option1" runat="server">
                                    Hopelessness
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="helplessness_cb" value="option2" runat="server">
                                    Helplessness
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="worthlessness_cb" value="option3" runat="server">
                                    Worthlessness
                                </label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-2">Delusions</label>
                            <label class="col-sm-1">Type</label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="delusions_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Primary delusions</asp:ListItem>
                                    <asp:ListItem>Secondary delusions</asp:ListItem>
                                    <asp:ListItem>Shared delusions</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <label class="col-sm-1">Content</label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="delusions2_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Persecution</asp:ListItem>
                                    <asp:ListItem>Paranoid</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <div class="col-sm-12">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="delusionsOfReference_cb" value="option1" runat="server">
                                    Delusions of reference
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="grandioseGuilt_cb" value="option2" runat="server">
                                    Grandiose guilt & worthlessness
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="nihilistic_cb" value="option3" runat="server">
                                    Nihilistic
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="hypochondriacal_cb" value="option4" runat="server">
                                    Hypochondriacal
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="Religious_cb" value="option5" runat="server">
                                    Religious
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="sexual_cb" value="option6" runat="server">
                                    Sexual
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="delusionOfControl_cb" value="option7" runat="server">
                                    Delusion of control
                                </label>
                            </div>
                        </div>
                    </div>

                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-12">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="thoughtInsertion_cb" value="option8" runat="server">
                                        Thought insertion
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="withdrawal_cb" value="option9" runat="server">
                                        Withdrawal
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="thoughtBroadcasting_cb" value="option10" runat="server">
                                        Thought broadcasting
                                    </label>
                                </div>
                            </div>
                        </div>
                        <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Obsessive Compulsive Phenomena</h4>
                        <br />
                    </div>
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-10 col-sm-offset-1">
                            <textarea id="obsessiveCompulsivePhenomena_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                        </div>
                    </div>
                        <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">PHOBIAS</h4>
                        <br />
                    </div>
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-10 col-sm-offset-1">
                            <textarea id="phobias_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                        </div>
                    </div>
                        <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Disorders Of Perception</h4>
                        <br />
                    </div>
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-10 col-sm-offset-1">
                            <textarea id="disordersOfPerception_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-10 col-sm-offset-1">
                            <label class="radio-inline">
                                <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions3" id="depersonalization_radio" value="option1">
                                Depersonalization
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions3" id="derealozation_radio" value="option2">
                                Derealization
                            </label>
                        </div>
                    </div>
                    
                        <div class="row">
                            <label class="col-sm-2" style="margin-left:15px">Hallucinations</label>
                        </div>

                    <div class="row">
                        <br />
                        <div class="form-group col-sm-6">
                        <label class="col-sm-5" >Types of hallucinations</label>
                        <div class="col-sm-7">
                            <asp:DropDownList ID="hallucinations_dd" CssClass="form-control" runat="server" onchange="hallucinations()">
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Auditory</asp:ListItem>
                                <asp:ListItem>Visual</asp:ListItem>
                                <asp:ListItem>Olfactory</asp:ListItem>
                                <asp:ListItem>Tactile</asp:ListItem>
                                <asp:ListItem>Gustatory</asp:ListItem>
                                <asp:ListItem>Kinesthetic</asp:ListItem>
                            </asp:DropDownList>    
                        </div>
                            </div>

                        <div class="form-group col-sm-6">
                            <label class="col-sm-2" style="margin-left:15px; display:none" id="auditory_lbl">Auditory</label>
                        
                        <div class="col-sm-9" id="auditory_div" style="display:none">
                            <label class="radio-inline">
                                <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions4" id="secondPerson_radio" value="option1">
                                2nd Person
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions4" id="thirdPerson_radio" value="option2">
                                3rd Person
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions4" id="runningCommentary_radio" value="option3">
                                Running Commentary
                            </label>
                        </div>
                            </div>
                    </div>

                    <div class="form-group col-sm-12">
                        <br />
                        <label class="col-sm-2">Illusions</label>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions4" id="yesIllusions_radio" value="option1">
                                Yes
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions4" id="noIllusions_radio" checked value="option2">
                                No
                            </label>
                        </div>
                        <div class="col-sm-6">
                            <textarea id="illusions_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                        </div>
                    </div>
                        <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Cognitive Functions</h4>
                        <br />
                    </div>
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-12">
                            <div class="form-group col-sm-5">
                                <label class="col-sm-3 control-label">Consciousness</label>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="consciouness_dd" CssClass="form-control" runat="server">
                                        <asp:ListItem>None</asp:ListItem>
                                        <asp:ListItem>Conscious</asp:ListItem>
                                        <asp:ListItem>Semi Conscious</asp:ListItem>
                                         <asp:ListItem>unconscious</asp:ListItem>                                        
                                    </asp:DropDownList>   
                                </div>
                            </div>
                            <div class="form-group col-sm-7">
                                <label class="col-sm-3 control-label">Orientation</label>
                                <div class="col-sm-5">
                                <asp:DropDownList ID="Orientation_dd" CssClass="form-control" runat="server">
                                        <asp:ListItem>None</asp:ListItem>
                                        <asp:ListItem>Well Oriented</asp:ListItem>
                                        <asp:ListItem>Partially Oriented</asp:ListItem>
                                         <asp:ListItem>Disoriented</asp:ListItem>  
                                    </asp:DropDownList>  
                                    </div>
                            </div>
                        </div>
                    </div>

                        <div class="row">
                            <label class="col-sm-3" style="margin-left:15px">Attention and concentration</label>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-3">
                                    <label>Serial Seven Test</label>
                                </div>
                                <div class="col-sm-3">
                                        <label class="radio-inline">
                                          <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions44" id="sevenTestRado1" value="option1">
                                          Able to perform
                                     </label>
                                     <label class="radio-inline">
                                         <input runat="server" type="radio" onclick="" name="inlineRadioOptions44" id="sevenTestRado2" checked value="option2">
                                         Unable to perform
                                    </label>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="serialSevenTest_txt" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-3">
                                    <label>Serial Three Test</label>
                                </div>
                                <div class="col-sm-3">
                                        <label class="radio-inline">
                                          <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions45" id="threeTestRado1" value="option1">
                                          Able to perform
                                     </label>
                                     <label class="radio-inline">
                                         <input runat="server" type="radio" onclick="" checked name="inlineRadioOptions45" id="threeTestRado2" value="option2">
                                         Unable to perform
                                    </label>
                                </div>
                                <div class="col-sm-6">
                                    <asp:TextBox ID="serialThreeTest_txt" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-6 col-sm-offset-6">
                                    <span>*Days of week in forward and backward direction</span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <div class="col-sm-3">
                                    <label>Intelligence</label>
                                </div>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="intelligence_dd" CssClass="form-control" runat="server">
                                        <asp:ListItem>None</asp:ListItem>
                                        <asp:ListItem>Above Average</asp:ListItem>
                                        <asp:ListItem>Below Average</asp:ListItem>
                                        <asp:ListItem>Normal</asp:ListItem>
                                    </asp:DropDownList> 
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="col-sm-3">
                                    <label>IQ</label>
                                </div>
                                <div class="col-sm-9">
<%--                                    <asp:TextBox ID="iq_txt" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                    <asp:DropDownList ID="iq_txt" CssClass="form-control" runat="server">
                                        
                                        <asp:ListItem>None</asp:ListItem>
                                        <asp:ListItem>140 and over</asp:ListItem>
                                        <asp:ListItem>120-140</asp:ListItem>
                                        <asp:ListItem>110-120</asp:ListItem>
                                        <asp:ListItem>80-90	</asp:ListItem>
                                        <asp:ListItem>70-80</asp:ListItem>
                                        <asp:ListItem>60-70</asp:ListItem>
                                        <asp:ListItem>50-60</asp:ListItem>
                                        <asp:ListItem>Below 50</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <div class="col-sm-3">
                                    <label>Memory</label>
                                </div>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="memory_dd" CssClass="form-control" runat="server">
                                        <asp:ListItem>None</asp:ListItem>
                                        <asp:ListItem>impaired</asp:ListItem>
                                        <asp:ListItem>unmpaired</asp:ListItem>
                                    </asp:DropDownList> 
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="col-sm-3">
                                    <label>Judgement</label>
                                </div>
                                <div class="col-sm-9">
                                    <asp:DropDownList ID="judgement_dd" CssClass="form-control" runat="server">
                                        <asp:ListItem>Good</asp:ListItem>
                                        <asp:ListItem>Disturbed</asp:ListItem>
                                    </asp:DropDownList> 
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-3">
                                    <label>General Knowledge</label>
                                </div>
                                <div class="col-sm-9">
<%--                                    <textarea id="generalKnowledge_area" cols="20" rows="4" class="form-control" runat="server"></textarea>--%>
                                <asp:DropDownList ID="generalKnowledge_dd" CssClass="form-control" runat="server">
                                        <asp:ListItem>None</asp:ListItem>
                                        <asp:ListItem>Above Avg</asp:ListItem>
                                        <asp:ListItem>Below Avg</asp:ListItem>
                                        <asp:ListItem>Avg</asp:ListItem>

                                    </asp:DropDownList> 
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-3">
                                    <label>Concrete thinking</label>
                                </div>
                                 <div class="col-sm-3">
                                        <label class="radio-inline">
                                          <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions4" id="ConcretePresent" value="option1">
                                          Present
                                     </label>
                                     <label class="radio-inline">
                                         <input runat="server" type="radio" onclick="" name="inlineRadioOptions4" id="ConcreteNoPresent" value="option2">
                                         Not Present
                                    </label>
                                </div>
                                <div class="col-sm-6">
                                    <textarea id="concreteThinking_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-3">
                                    <label>Abstract thinking</label>
                                </div>
                                <div class="col-sm-9">
                                    <textarea id="abstractThinking_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                </div>
                            </div>
                        </div>

                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Insight</h4>
                        <br />
                    </div>

                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-9 col-sm-offset-2">
                                    <textarea id="insight_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                </div>
                            </div>
                        </div>

                </div>

                <div class="box-footer">
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="submit_btn_Click"/>
                    <asp:Button ID="update" runat="server" Text="Update" CssClass="btn btn-primary pull-right" OnClick="update_Click"/>

                </div>
                    </form>
                </div>
            </div>
        </div>
            <script type="text/javascript">
                function showMovementsArea()
                {
                    var involLbl = document.getElementById("involuntary_lbl").style.display = 'block';
                    var volLbl = document.getElementById("voluntary_lbl").style.display = 'block';
                    var invDd = document.getElementById("<%= involuntary_dd.ClientID %>").style.display = 'block';
                    var volDd = document.getElementById("<%= voluntary_dd.ClientID %>").style.display = 'block';
                }
                function hideMovementsArea() {
                    var involLbl = document.getElementById("involuntary_lbl").style.display = 'none';
                    var volLbl = document.getElementById("voluntary_lbl").style.display = 'none';
                    var invDd = document.getElementById("<%= involuntary_dd.ClientID %>").style.display = 'none';
                    var volDd = document.getElementById("<%= voluntary_dd.ClientID %>").style.display = 'none';
                }
                function movementArea()
                {
                    var movDd = document.getElementById("<%= movements_dd.ClientID %>");
                    var selectedValue = movDd.value;
                    if(selectedValue == "Abnormal")
                    {
                        showMovementsArea();
                    }
                    else
                    {
                        hideMovementsArea();
                    }
                }
                function hallucinations()
                {
                    var halDd = document.getElementById("<%= hallucinations_dd.ClientID %>");
                    var selectedValue = halDd.value;
                    if(selectedValue == "Auditory")
                    {
                        showAuditoryCb();
                    }
                    else
                    {
                        hideAuditoryCb();
                    }
                }

                function showAuditoryCb()
                {
                    var involLbl = document.getElementById("auditory_lbl").style.display = 'block';
                    var auditoryDiv = document.getElementById("auditory_div").style.display = 'block';
                }

                function hideAuditoryCb() {
                    var involLbl = document.getElementById("auditory_lbl").style.display = 'none';
                    var auditoryDiv = document.getElementById("auditory_div").style.display = 'none';
                }

                window.onload = function ()
                {
                    var movDd = document.getElementById("<%= movements_dd.ClientID %>");
                    var selectedValue = movDd.value;
                    if(selectedValue == "Abnormal")
                    {
                        showMovementsArea();
                    }

                    var halDd = document.getElementById("<%= hallucinations_dd.ClientID %>");
                    var selectedValue = halDd.value;
                    if(selectedValue == "Auditory")
                    {
                        showAuditoryCb();
                    }
                }
            </script>
</asp:Content>
