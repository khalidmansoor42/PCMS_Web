<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="patientHistory.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head runat="server"></head>
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Patient History</h3>
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
                        <div class="col-sm-12">

                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Admission</a></li>
                                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Complaints</a></li>
                                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Illness History</a></li>
                                <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Drugs</a></li>
                                <li role="presentation"><a href="#personalInfo" aria-controls="personalInfo" role="tab" data-toggle="tab">Personal Info</a></li>
                                <li role="presentation"><a href="#personality" aria-controls="personality" role="tab" data-toggle="tab">Family</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="home">
                                    <div class="row">
                                        <br />
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Type of Admission</h4>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <div class="col-sm-12">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions3" id="assessment_radio" value="option1">
                                                    Assessment
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions3" id="treatment_radio" value="option2">
                                                    Treatment
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions3" id="urgent_radio" value="option3">
                                                    Urgent
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions3" id="emergency_radio" value="option4">
                                                    Emergency Holding
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions3" id="care_radio" value="option5">
                                                    Care & treatment on informal / voluntary basis
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Patient classification</h4>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <div class="col-sm-12">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions1" id="judicial_radio" value="option1">
                                                    Judicial Proceeding
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions1" id="nonJudicial_radio" value="option2">
                                                    Non Judicial
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions1" id="reception_radio" value="option3">
                                                    Reception Order
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--End tab 1-->
                                <div role="tabpanel" class="tab-pane fade" id="profile">
                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Presenting Complaints</h4>
                                        <br />
                                    </div>
                                    <div class="table-responsive" style="min-height: 500px">
                                        <div class="col-sm-12">
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:GridView ID="Gridview1" CssClass="table" runat="server" ShowFooter="True" AutoGenerateColumns="False" OnRowCreated="Gridview1_RowCreated">
                                                <Columns>
                                                    <asp:BoundField DataField="RowNumber" HeaderText="Row Number" ItemStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="Problem" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                                                <asp:ListItem Value="-1">Select</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Since" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox2" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="InActive" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:Button ID="InActive" runat="server" CssClass="btn btn-danger" Text="Inactive" OnClick="InActiveButton_Click" />
                                                        </ItemTemplate>

                                                        <FooterStyle HorizontalAlign="Right" />
                                                        <FooterTemplate>
                                                            <asp:Button ID="ButtonAdd" runat="server" CssClass="btn btn-info" Text="Add New Row" OnClick="ButtonAdd_Click" />
                                                        </FooterTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                                                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                                <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                                                <RowStyle ForeColor="#000066"></RowStyle>

                                                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                                                <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                                                <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                                                <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                                                <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
                                            </asp:GridView>
                                        </div>
                                    </div>

                                    <div class="pull-right">
                                        <asp:Button ID="Submit_btn" runat="server" Text="Submit" type="submit" class="btn btn-primary" OnClick="add_Problem" />
                                    </div>
                                </div>
                                <!--End tab 2-->
                                <div role="tabpanel" class="tab-pane fade" id="messages">
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">History of present illness</label>
                                            <div class="col-sm-7">
                                                <textarea id="historyOfPresentIllness_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Current drug treatment</label>
                                            <div class="col-sm-7">
                                                <textarea id="CurrentDrugTreatment_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Past medical history</label>
                                            <div class="col-sm-7">
                                                <textarea id="pastMedicalHistory_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Past psychiatric history</label>
                                            <div class="col-sm-7">
                                                <textarea id="pastPsychiatricHistory_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Course of illness</label>
                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions2" id="Radio1" value="option1">
                                                    Continuous
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions2" id="Radio2" value="option2">
                                                    Intermittent
                                                </label>
                                            </div>
                                            <div class="col-sm-7">
                                                <textarea id="courseOfIllness_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Previous admission / hospitalization</label>
                                            <div class="col-sm-7">
                                                <textarea id="previousAdmission_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                <!--End tab 3-->
                                <div role="tabpanel" class="tab-pane fade" id="settings">
                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Detail of past treatment</h4>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Drugs</label>
                                            <div class="col-sm-7">
                                                <textarea id="drugs_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-2">Dosage of drugs</label>
                                            <div class="col-sm-4">
                                                <textarea id="dosageOfDrugs_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>

                                            <label class="col-sm-2">Duration</label>
                                            <div class="col-sm-4">
                                                <textarea id="duration_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Response to treatment</label>
                                            <div class="col-sm-7">
                                                <textarea id="responseToTreatment_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Drug Reaction</label>
                                            <div class="col-sm-7">
                                                <textarea id="drugReaction_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Treatment by faith healer</label>
                                            <div class="col-sm-7">
                                                <textarea id="treatmentByFaithHealer_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Forensic history</label>
                                            <div class="col-sm-7">
                                                <textarea id="forensicHistory_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                <!--End tab 4-->
                                <div role="tabpanel" class="tab-pane fade" id="personalInfo">
                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Personal History</h4>
                                        <br />
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-3">Birth History</label>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Prenatal</label>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="prenatal_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <label class="col-sm-2">Perinatal</label>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="perinatal_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>

                                            <label class="col-sm-2">Postnatal</label>
                                            <div class="col-sm-2">
                                                <asp:TextBox ID="postnatal_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4">Mile stones of development</label>

                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions5" id="normal_radio" value="option1">
                                                    Normal
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions5" id="delayed_radio" value="option2">
                                                    Delayed
                                                </label>
                                            </div>

                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Childhood</label>
                                            <div class="col-sm-4">
                                                <textarea id="childhood_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>

                                            <label class="col-sm-2">Start of schooling</label>
                                            <div class="col-sm-4">
                                                <textarea id="startOfSchooling_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4">Education</label>

                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions7" id="good_radio" value="option1">
                                                    Good
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions7" id="average_radio" value="option2">
                                                    Average
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions7" id="belowAverage_radio" value="option2">
                                                    Below Average
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Work/Occupation record</label>
                                            <div class="col-sm-4">
                                                <textarea id="workOccupationRecord_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>

                                            <label class="col-sm-2">Monthly Income</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="monthlyIncome_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Psychosexual history</label>
                                            <div class="col-sm-8">
                                                <textarea id="pschosexualHistory_area" cols="20" rows="5" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <div class="row">
                                                <label class="col-sm-4">Menstrual history</label>
                                                <div class="col-sm-7">
                                                    <textarea id="menstrualHistory_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <br />
                                                <label class="col-sm-4">Menopause</label>
                                                <div class="col-sm-7">
                                                    <textarea id="menopause_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Marital status</label>

                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="maritalStatus_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Single</asp:ListItem>
                                                    <asp:ListItem>Married</asp:ListItem>
                                                    <asp:ListItem>Divorced</asp:ListItem>
                                                    <asp:ListItem>Widow</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="gender_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Number of children</label>
                                            <div class="col-sm-8">
                                                <asp:TextBox ID="numberOfChildren_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Relationship with spouse</label>
                                            <div class="col-sm-8">
                                                <textarea id="relationshipOfSpouse_txt" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Premorbid Personality</h4>
                                        <br />
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Hobbies/Interests</label>
                                            <div class="col-sm-8">
                                                <textarea id="hobbies_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Characteristic</label>
                                            <div class="col-sm-8">
                                                <textarea id="characteristic_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Behaviour</label>
                                            <div class="col-sm-8">
                                                <textarea id="behaviour_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Attitude</label>
                                            <div class="col-sm-8">
                                                <textarea id="attitude_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Relations</label>
                                            <div class="col-sm-8">
                                                <textarea id="relations_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Achievements</label>
                                            <div class="col-sm-8">
                                                <textarea id="achievements_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Religous/Moral Values</label>
                                            <div class="col-sm-8">
                                                <textarea id="religousMoralValues_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Aptitudes</label>
                                            <div class="col-sm-8">
                                                <textarea id="Aptitudes_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Others</label>
                                            <div class="col-sm-10">
                                                <textarea id="others_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                </div>
                                <!--End tab 5-->

                                <div role="tabpanel" class="tab-pane fade" id="personality">
                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Temperament</h4>
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />

                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="temperament_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Euthymic</asp:ListItem>
                                                    <asp:ListItem>Irritable</asp:ListItem>
                                                    <asp:ListItem>Hyperthymic</asp:ListItem>
                                                    <asp:ListItem>Dysthymic</asp:ListItem>
                                                    <asp:ListItem>Cyclothymic</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Family history of psychiatric illness</h4>
                                        <br />
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="familyHistory_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>No</asp:ListItem>
                                                    <asp:ListItem>Yes</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Father</label>
                                            <div class="col-sm-8">
                                                <textarea id="father_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Mother</label>
                                            <div class="col-sm-8">
                                                <textarea id="mother_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Siblings</label>
                                            <div class="col-sm-10">
                                                <textarea id="siblings_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Type Of Family History</h4>
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="TypeOfFamilyHistory_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>None</asp:ListItem>
                                                    <asp:ListItem>Schizophrenic</asp:ListItem>
                                                    <asp:ListItem>Bipolar</asp:ListItem>
                                                    <asp:ListItem>OCD</asp:ListItem>
                                                    <asp:ListItem>Depression</asp:ListItem>
                                                    <asp:ListItem>GAD</asp:ListItem>
                                                    <asp:ListItem>PD</asp:ListItem>
                                                    <asp:ListItem>Epilepsy</asp:ListItem>
                                                    <asp:ListItem>M.R.</asp:ListItem>
                                                    <asp:ListItem>Others</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">History Of Substance Abuse</h4>
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="historyOfSubstanceAbuse_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>None</asp:ListItem>
                                                    <asp:ListItem>Heroin</asp:ListItem>
                                                    <asp:ListItem>Opium</asp:ListItem>
                                                    <asp:ListItem>Charas</asp:ListItem>
                                                    <asp:ListItem>Bhang</asp:ListItem>
                                                    <asp:ListItem>Alcohol</asp:ListItem>
                                                    <asp:ListItem>Benzodiazepines</asp:ListItem>
                                                    <asp:ListItem>Others</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Type</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="type_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <label class="col-sm-2">Duration</label>
                                            <div class="col-sm-4">
                                                <asp:TextBox ID="duration_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Amount</label>
                                            <div class="col-sm-4">
                                                <textarea id="amount_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                            <label class="col-sm-2">Mode of abuse</label>
                                            <div class="col-sm-4">
                                                <textarea id="modeOfAbuse_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-3">Any admission for detoxification</label>
                                            <div class="col-sm-9">
                                                <textarea id="detoxification_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                </div>
                                <!--End tab 6-->
                            </div>
                            <!--End tab content-->
                        </div>
                    </div>
                    <div class="box-footer">
                        <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="btn btn-info pull-right" Style="margin-left: 5px" OnClick="updateBtn_Click" />
                        <asp:Button ID="saveBtn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" Style="margin-left: 5px" OnClick="saveBtn_Click" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script>
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=alert_success.ClientID %>").style.display = "none";
            }, seconds * 1000);

            setTimeout(function () {
                document.getElementById("<%=alert_fail.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

        $('#myTabs a').click(function (e) {
            e.preventDefault()
            $(this).tab('show')
        })
    </script>
</asp:Content>
