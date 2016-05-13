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
                        <br />
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
                        <br />
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
                        <br />
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
                        <br />
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
                        <br />
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
                        <br />
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
                        <br />
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
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3">Stream of thoughts</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="streamOfThought_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>Poverty of thought</asp:ListItem>
                                    <asp:ListItem>Pressure of thought</asp:ListItem>
                                    <asp:ListItem>thought block</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3">Form of thoughts</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="formOfThoughts_dd" CssClass="form-control" runat="server">
                                    <asp:ListItem>Flight of Ideas, Clang association</asp:ListItem>
                                    <asp:ListItem>Loosening of association, knights move, derailment, word salad, taking past the point, Tangentiality, circumstanciality</asp:ListItem>
                                    <asp:ListItem>Perseveration</asp:ListItem>
                                    <asp:ListItem>Neologism</asp:ListItem>
                                    <asp:ListItem>Suicidal Ideation</asp:ListItem>
                                    <asp:ListItem>Homicidal Ideation</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                        <br />

                        <div class="row">
                        <br />
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3">Content of thoughts</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="contentOfThoughts_txt" CssClass="form-control" runat="server">
                                    <asp:ListItem>Hopelessness</asp:ListItem>
                                    <asp:ListItem>Helplessness</asp:ListItem>
                                    <asp:ListItem>Worthlessness</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                        <br />

                        <hr />
                    <div class="row">
                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Delusions</h4>
                        <br />
                    </div>

                </div>

                <div class="box-footer">
                    <%--<asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-info pull-right" OnClick="addFormulation"/>--%>
                    <%--<asp:Button ID="update" runat="server" Text="Update" CssClass="btn btn-info pull-right" OnClick="update_Click" />--%>

                </div>
                    </form>
                </div>
            </div>
        </div>
            
</asp:Content>
