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
                        <p>Problem Added Successfully!</p>
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
                                <asp:TextBox ID="physicalAppearance_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Dress/Hygiene</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="dress_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Posture</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="posture_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Rapport</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="rapport_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Eye Contact</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="eyeContact_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Injury</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="injury_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-5 col-sm-offset-1">
                            <label class="radio-inline">
                                <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions1" id="cooperative_radio" value="option1">
                                Cooperative
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions1" id="uncooperative_radio" value="option2">
                                Un-cooperative
                            </label>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions2" id="communicative_radio" value="option1">
                                Communicative
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions2" id="nonCommunicative_radio" value="option2">
                                Non Communicative
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions2" id="mute_radio" value="option3">
                                Mute
                            </label>
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
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Movements</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="movements_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Abnormal</asp:ListItem>
                                    <asp:ListItem>Involuntary</asp:ListItem>
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
                                 <asp:TextBox ID="tone_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div><br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Rate</label>
                            <div class="col-sm-9">
                                 <asp:TextBox ID="rate_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Rhythm</label>
                            <div class="col-sm-9">
                                 <asp:TextBox ID="rhythm_txt" runat="server" CssClass="form-control"></asp:TextBox>
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
                                <asp:TextBox ID="subjective_txt" runat="server" CssClass="form-control"></asp:TextBox>
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

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-2">Content of thoughts</label>
                            <div class="col-sm-10">
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

                        <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Delusions</h4>
                        <br />
                    </div>
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <div class="col-sm-4 col-sm-offset-1">
                                <asp:DropDownList ID="delusions_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Primary delusions</asp:ListItem>
                                    <asp:ListItem>Secondary delusions</asp:ListItem>
                                    <asp:ListItem>Shared delusions</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm-4 col-sm-offset-1">
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
                        <div class="form-group col-sm-2">
                            <label class="control-label" style="margin-left:15px">Auditory</label>
                        </div>
                        <div class="col-sm-6">
                            <label class="radio-inline">
                                <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions4" id="secondPerson_radio" value="option1">
                                2nd Person
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions4" id="thirdPerson_radio" value="option2">
                                3rd Person
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="" name="inlineRadioOptions4" id="runningCommentary_radio" value="option2">
                                Running Commentary
                            </label>
                        </div>
                        <div class="col-sm-3">
                            <asp:DropDownList ID="hallucinations_dd" CssClass="form-control" runat="server">
                                <asp:ListItem>None</asp:ListItem>
                                <asp:ListItem>Visual</asp:ListItem>
                                <asp:ListItem>Olfactory</asp:ListItem>
                                <asp:ListItem>Tactile</asp:ListItem>
                                <asp:ListItem>Gustatory</asp:ListItem>
                                <asp:ListItem>Kinesthetic</asp:ListItem>
                            </asp:DropDownList>    
                        </div>
                    </div>

                    <div class="form-group col-sm-12">
                        <br />
                        <label class="col-sm-2">Illusions</label>
                        <div class="col-sm-10">
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
                                        <asp:ListItem>Alert</asp:ListItem>
                                        <asp:ListItem>Disturbed</asp:ListItem>
                                        <asp:ListItem>Clouding</asp:ListItem>
                                    </asp:DropDownList>   
                                </div>
                            </div>
                            <div class="form-group col-sm-7">
                                <label class="col-sm-3 control-label">Orientation</label>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="time_txt" runat="server" CssClass="form-control" placeholder="Time"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="place_txt" runat="server" CssClass="form-control" placeholder="Place"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:TextBox ID="person_txt" runat="server" CssClass="form-control" placeholder="Person"></asp:TextBox>
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
                                <div class="col-sm-9">
                                    <asp:TextBox ID="serialSevenTest_txt" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-3">
                                    <label>Serial Three Test</label>
                                </div>
                                <div class="col-sm-9">
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
                                        <asp:ListItem>Average</asp:ListItem>
                                        <asp:ListItem>Below Average</asp:ListItem>
                                    </asp:DropDownList> 
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="col-sm-3">
                                    <label>IQ</label>
                                </div>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="iq_txt" runat="server" CssClass="form-control"></asp:TextBox>
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
                                        <asp:ListItem>Intermediate</asp:ListItem>
                                        <asp:ListItem>Recent</asp:ListItem>
                                        <asp:ListItem>Remote</asp:ListItem>
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
                                    <textarea id="generalKnowledge_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-12">
                                <div class="col-sm-3">
                                    <label>Concrete thinking</label>
                                </div>
                                <div class="col-sm-9">
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
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right"/>
                    <asp:Button ID="update" runat="server" Text="Update" CssClass="btn btn-primary pull-right"/>

                </div>
                    </form>
                </div>
            </div>
        </div>
            
</asp:Content>
