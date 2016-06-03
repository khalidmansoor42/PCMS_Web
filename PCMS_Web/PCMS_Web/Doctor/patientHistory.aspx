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
                                <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Complaints</a></li>
                                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Illness History</a></li>
                                <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Detail of past treatment</a></li>
                                <li role="presentation"><a href="#personalInfo" aria-controls="personalInfo" role="tab" data-toggle="tab">Personal Info</a></li>
                                <li role="presentation"><a href="#personality" aria-controls="personality" role="tab" data-toggle="tab">Family</a></li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade in active" id="profile">
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
                                            <label class="col-sm-3 col-sm-offset-1">Treatment history</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="treatmentHistory_dd" name="treatmentHistory_dd" runat="server" CssClass="form-control" DataSourceID="MedicineDataSource" DataTextField="med_name" DataValueField="med_id">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="MedicineDataSource" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' SelectCommand="SELECT * FROM [medicine]"></asp:SqlDataSource>
                                            </div>
                                            <div class="col-sm-1">
                                                <a onclick="addTreatmentHist()"><i class="fa fa-plus"></i> Add</a>
                                            </div>
                                            <div class="col-sm-4">
                                                <textarea id="CurrentDrugTreatment_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Past medical history</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="pastMedicalHistory_dd" name="pastMedicalHistory_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Hyperthymic</asp:ListItem>
                                                    <asp:ListItem>Hypothyroid</asp:ListItem>
                                                    <asp:ListItem>Hypertension</asp:ListItem>
                                                    <asp:ListItem>Diabetes</asp:ListItem>
                                                    <asp:ListItem>Heart Disease</asp:ListItem>
                                                    <asp:ListItem>Renal Disease</asp:ListItem>
                                                    <asp:ListItem>Liver Disorder</asp:ListItem>
                                                    <asp:ListItem>CVA</asp:ListItem>
                                                    <asp:ListItem>Other Illness</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-1">
                                                <a onclick="addPastMedHist()"><i class="fa fa-plus"></i> Add</a>
                                            </div>
                                            <div class="col-sm-4">
                                                <textarea id="pastMedicalHistory_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Past psychiatric history</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="pastPsychiatricHistory_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>None</asp:ListItem>
                                                    <asp:ListItem>Schizophrenic</asp:ListItem>
                                                    <asp:ListItem>Bipolar Disorder</asp:ListItem>
                                                    <asp:ListItem>Obsessive Compulsive Disorder</asp:ListItem>
                                                    <asp:ListItem>Depression</asp:ListItem>
                                                    <asp:ListItem>Generalized Anxiety Disorder</asp:ListItem>
                                                    <asp:ListItem>Personality Disorder</asp:ListItem>
                                                    <asp:ListItem>Epilepsy</asp:ListItem>
                                                    <asp:ListItem>Mental Disorder</asp:ListItem>
                                                    <asp:ListItem>Others</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-1">
                                                <a onclick="addpastPsycHistory()"><i class="fa fa-plus"></i> Add</a>
                                            </div>
                                            <div class="col-sm-4">
                                                <textarea id="pastPsychiatricHistory_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3 col-sm-offset-1">Course of illness</label>
                                            <div class="col-sm-6">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions1" id="Radio1" value="option1">
                                                    Continuous
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions1" id="Radio2" value="option2">
                                                    Intermittent
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions1" id="Radio3" value="option3">
                                                    Relaxed
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions1" id="Radio4" value="option4">
                                                    Remission
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
                                            <div class="col-sm-3">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="showAdmissionArea()" name="inlineRadioOptions2" id="yesPreviousAdmission_radio" value="option1">
                                                    Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="hideAdmissionArea()" name="inlineRadioOptions2" id="noPreviousAdmission_radio" value="option2">
                                                    No
                                                </label>
                                            </div>
                                            <label class="col-sm-2" id="numberOfAdmissions_lbl" hidden>Number of admissions</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="noOfAdmissions_dd" runat="server" CssClass="form-control" style="display: none">
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                    <asp:ListItem>5</asp:ListItem>
                                                    <asp:ListItem>6</asp:ListItem>
                                                    <asp:ListItem>7</asp:ListItem>
                                                    <asp:ListItem>8</asp:ListItem>
                                                    <asp:ListItem>9</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                </div>
                                <!--End tab 3-->
                                <div role="tabpanel" class="tab-pane fade" id="settings">
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-2">Drugs</label>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="drugs_dd" runat="server" CssClass="form-control" DataSourceID="MedicineDataSource" DataTextField="med_name" DataValueField="med_id">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' SelectCommand="SELECT * FROM [medicine]"></asp:SqlDataSource>
                                            </div>
                                            <div class="col-sm-1">
                                                <a onclick="addDrugs()"><i class="fa fa-plus"></i> Add</a>
                                            </div>
                                            <div class="col-sm-6">
                                                <textarea id="drugs_area" cols="20" rows="3" class="form-control" runat="server"></textarea>
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
                                            <label class="col-sm-2">Response to treatment</label>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="responseToTreatment_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Improvement</asp:ListItem>
                                                    <asp:ListItem>Partial Improvement</asp:ListItem>
                                                    <asp:ListItem>No Improvement</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-7">
                                                <textarea id="responseToTreatment_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-2">Drug Reaction</label>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="drugReaction_dd" runat="server" CssClass="form-control" DataSourceID="MedicineDataSource" DataTextField="med_name" DataValueField="med_id">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' SelectCommand="SELECT * FROM [medicine]"></asp:SqlDataSource>
                                            </div>
                                            <div class="col-sm-1">
                                                <a onclick="addDrugReaction()"><i class="fa fa-plus"></i> Add</a>
                                            </div>
                                            <div class="col-sm-6">
                                                <textarea id="drugReaction_area" cols="20" rows="4" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3">Treatment by faith healer</label>
                                            <div class="col-sm-3">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="showTreatmentFaithHealerArea()" name="inlineRadioOptions3" id="yesTreatmentByFaithHealer_radio" value="option1">
                                                    Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="hideTreatmentFaithHealerArea()" name="inlineRadioOptions3" id="noTreatmentByFaithHealer_radio" value="option2">
                                                    No
                                                </label>
                                            </div>
                                            <div class="col-sm-6">
                                                <textarea id="treatmentByFaithHealer_area" cols="20" rows="4" class="form-control" runat="server" style="display:none"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-3">Forensic history</label>
                                            <div class="col-sm-2">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions4" id="yesForensicHistory_radio" value="option1">
                                                    Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions4" id="noForensicHistory_radio" value="option2">
                                                    No
                                                </label>
                                            </div>
                                            <label class="col-sm-2">Police Case</label>
                                            <div class="col-sm-2">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions5" id="yesPoliceCase_radio" value="option1">
                                                    Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions5" id="noPoliceCase_radio" value="option2">
                                                    No
                                                </label>
                                            </div>
                                            <div class="col-sm-3">
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
                                    </div>
                                    <div class="row">
                                        <br />
                                        <label class="col-sm-3">Birth History</label>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-1">Prenatal</label>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="prenatal_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Mother Illness</asp:ListItem>
                                                    <asp:ListItem>History Of Drug Intake</asp:ListItem>
                                                    <asp:ListItem>Physical Trauma</asp:ListItem>
                                                    <asp:ListItem>Psychological Trauma</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <label class="col-sm-1">Perinatal</label>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="perinatal_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Trauma</asp:ListItem>
                                                    <asp:ListItem>Asphyxia</asp:ListItem>
                                                    <asp:ListItem>Illness</asp:ListItem>
                                                    <asp:ListItem>Fits</asp:ListItem>
                                                    <asp:ListItem>Premature Delivery</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <label class="col-sm-1">Postnatal</label>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="postnatal_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Trauma</asp:ListItem>
                                                    <asp:ListItem>Asphyxia</asp:ListItem>
                                                    <asp:ListItem>Illness</asp:ListItem>
                                                    <asp:ListItem>Fits</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-4">Mile stones of development</label>

                                            <div class="col-sm-4">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="" name="inlineRadioOptions6" id="normal_radio" value="option1">
                                                    Normal
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions6" id="delayed_radio" value="option2">
                                                    Delayed
                                                </label>
                                            </div>

                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Childhood</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="childhood_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Trauma</asp:ListItem>
                                                    <asp:ListItem>Asphyxia</asp:ListItem>
                                                    <asp:ListItem>Illness</asp:ListItem>
                                                    <asp:ListItem>Fits</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                            <label class="col-sm-2">Start of schooling</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="startOfSchooling_dd" runat="server" CssClass="form-control" onchange="startOfSchoolingDd()">
                                                    <asp:ListItem>In time</asp:ListItem>
                                                    <asp:ListItem>Delayed</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-4">
                                                <textarea id="startOfSchooling_area" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
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
                                                    <input runat="server" type="radio" onclick="" name="inlineRadioOptions7" id="belowAverage_radio" value="option3">
                                                    Below Average
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Work/Occupation record</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="workOccupation_dd" runat="server" CssClass="form-control" onchange="occupationArea()">
                                                    <asp:ListItem>Satisfactory</asp:ListItem>
                                                    <asp:ListItem>Unsatisfactory</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-2">
                                                <textarea id="workOccupationRecord_area" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
                                            </div>

                                            <label class="col-sm-2">Monthly Income</label>
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="monthlyIncome_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Poor</asp:ListItem>
                                                    <asp:ListItem>Middle Class</asp:ListItem>
                                                    <asp:ListItem>Lower Middle Class</asp:ListItem>
                                                    <asp:ListItem>Upper Middle Class</asp:ListItem>
                                                    <asp:ListItem>Middle Class</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Psychosexual history</label>
                                            <div class="col-sm-8">
                                                <textarea id="pschosexualHistory_area" cols="20" rows="3" class="form-control" runat="server"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <div class="row">
                                                <label class="col-sm-4">Menstrual history</label>
                                                <div class="col-sm-7">
                                                    <asp:DropDownList ID="menstrualHistory_dd" runat="server" CssClass="form-control">
                                                        <asp:ListItem>Dysmenorrhea</asp:ListItem>
                                                        <asp:ListItem>Amenorrhea</asp:ListItem>
                                                        <asp:ListItem>Menorrhagia</asp:ListItem>
                                                        <asp:ListItem>Menopause</asp:ListItem>
                                                        <asp:ListItem>Middle Class</asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Marital status</label>

                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="maritalStatus_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Single</asp:ListItem>
                                                    <asp:ListItem>Married</asp:ListItem>
                                                    <asp:ListItem>Divorced</asp:ListItem>
                                                    <asp:ListItem>Widow</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <label class="col-sm-2">Gender</label>
                                            <div class="col-sm-4">
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
                                                <asp:DropDownList ID="relationshipWithSpouse_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Good</asp:ListItem>
                                                    <asp:ListItem>Fair</asp:ListItem>
                                                    <asp:ListItem>Bad</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <hr />
                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Premorbid Personality</h4>
                                    </div>

                                    <div class="row">
                                        <br />
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Hobbies/Interests</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="hobbies_dd" runat="server" CssClass="form-control">
                                                        <asp:ListItem>Reading</asp:ListItem>
                                                        <asp:ListItem>Watching TV</asp:ListItem>
                                                        <asp:ListItem>Going to Movies</asp:ListItem>
                                                        <asp:ListItem>Fishing</asp:ListItem>
                                                        <asp:ListItem>Computer</asp:ListItem>
                                                        <asp:ListItem>Gardening</asp:ListItem>
                                                        <asp:ListItem>Exercise</asp:ListItem>
                                                        <asp:ListItem>Listening to Music</asp:ListItem>
                                                        <asp:ListItem>Traveling</asp:ListItem>
                                                        <asp:ListItem>Sleeping</asp:ListItem>
                                                        <asp:ListItem>Watching Sports</asp:ListItem>
                                                        <asp:ListItem>Cooking</asp:ListItem>
                                                        <asp:ListItem>Hiking</asp:ListItem>
                                                        <asp:ListItem>Swimming</asp:ListItem>
                                                        <asp:ListItem>Bicycling</asp:ListItem>
                                                        <asp:ListItem>Camping</asp:ListItem>
                                                        <asp:ListItem>Socializing</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Characteristic</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="characteristic_dd" runat="server" CssClass="form-control">
                                                        <asp:ListItem>Achiever</asp:ListItem>
                                                        <asp:ListItem>Active</asp:ListItem>
                                                        <asp:ListItem>Ambitious</asp:ListItem>
                                                        <asp:ListItem>Balanced</asp:ListItem>
                                                        <asp:ListItem>Communicative</asp:ListItem>
                                                        <asp:ListItem>Compassionate</asp:ListItem>
                                                        <asp:ListItem>Competitive</asp:ListItem>
                                                        <asp:ListItem>Emotional</asp:ListItem>
                                                        <asp:ListItem>Fast</asp:ListItem>
                                                        <asp:ListItem>Forgiving</asp:ListItem>
                                                        <asp:ListItem>Generous</asp:ListItem>
                                                        <asp:ListItem>Patient</asp:ListItem>
                                                        <asp:ListItem>Open Minded</asp:ListItem>
                                                        <asp:ListItem>Pleasant</asp:ListItem>
                                                        <asp:ListItem>Political</asp:ListItem>
                                                        <asp:ListItem>Sensitive</asp:ListItem>
                                                        <asp:ListItem>Sporty</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Behaviour</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="behaviour_dd" runat="server" CssClass="form-control">
                                                        <asp:ListItem>Achiever</asp:ListItem>
                                                        <asp:ListItem>Active</asp:ListItem>
                                                        <asp:ListItem>Ambitious</asp:ListItem>
                                                        <asp:ListItem>Balanced</asp:ListItem>
                                                        <asp:ListItem>Communicative</asp:ListItem>
                                                        <asp:ListItem>Compassionate</asp:ListItem>
                                                        <asp:ListItem>Competitive</asp:ListItem>
                                                        <asp:ListItem>Emotional</asp:ListItem>
                                                        <asp:ListItem>Fast</asp:ListItem>
                                                        <asp:ListItem>Forgiving</asp:ListItem>
                                                        <asp:ListItem>Generous</asp:ListItem>
                                                        <asp:ListItem>Patient</asp:ListItem>
                                                        <asp:ListItem>Open Minded</asp:ListItem>
                                                        <asp:ListItem>Pleasant</asp:ListItem>
                                                        <asp:ListItem>Political</asp:ListItem>
                                                        <asp:ListItem>Sensitive</asp:ListItem>
                                                        <asp:ListItem>Sporty</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4">Attitude</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="attitude_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Affectionate</asp:ListItem>
                                                    <asp:ListItem>Acceptance</asp:ListItem>
                                                    <asp:ListItem>Aspiring</asp:ListItem>
                                                    <asp:ListItem>Arrogant</asp:ListItem>
                                                    <asp:ListItem>Affected</asp:ListItem>
                                                    <asp:ListItem>Ambitious</asp:ListItem>
                                                    <asp:ListItem>Motivated</asp:ListItem>
                                                    <asp:ListItem>Caring</asp:ListItem>
                                                    <asp:ListItem>Cruel</asp:ListItem>
                                                    <asp:ListItem>Cheerless</asp:ListItem>
                                                    <asp:ListItem>Cheerful</asp:ListItem>
                                                    <asp:ListItem>Dishonest</asp:ListItem>
                                                    <asp:ListItem>Dependent</asp:ListItem>
                                                    <asp:ListItem>Emotional</asp:ListItem>
                                                    <asp:ListItem>Envious</asp:ListItem>
                                                    <asp:ListItem>Cooperative</asp:ListItem>
                                                    <asp:ListItem>Courageous</asp:ListItem>
                                                    <asp:ListItem>Determined</asp:ListItem>
                                                    <asp:ListItem>Honest</asp:ListItem>
                                                    <asp:ListItem>Hard working</asp:ListItem>
                                                    <asp:ListItem>Reliable</asp:ListItem>
                                                    <asp:ListItem>Responsible</asp:ListItem>
                                                    <asp:ListItem>Self-confident</asp:ListItem>
                                                    <asp:ListItem>Sincere</asp:ListItem>
                                                    <asp:ListItem>Trusting</asp:ListItem>
                                                    <asp:ListItem>Rude</asp:ListItem>
                                                    <asp:ListItem>Selfish</asp:ListItem>
                                                    <asp:ListItem>Self-centered</asp:ListItem>
                                                    <asp:ListItem>Work-oriented</asp:ListItem>
                                                </asp:DropDownList>
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
                                            <label class="col-sm-4">Religious/Moral Values</label>
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
                                    <hr />

                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Temperament</h4>
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-2">Temperament</label>
                                            <div class="col-sm-4">
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

                                </div>
                                <!--End tab 5-->

                                <div role="tabpanel" class="tab-pane fade" id="personality">
                                   
                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Family history of psychiatric illness</h4>
                                        <br />
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <br />
                                            <label class="col-sm-2">Psychiatric illness</label>
                                            <div class="col-sm-3">
                                                <asp:DropDownList ID="familyHistory_dd" runat="server" CssClass="form-control" onchange="fatherSiblingMotherArea()">
                                                    <asp:ListItem>No</asp:ListItem>
                                                    <asp:ListItem>Yes</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4" id="father_lbl" style="display:none">Father</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="father_dd" runat="server" CssClass="form-control" style="display:none">
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
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4" id="mother_lbl" style="display:none">Mother</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="mother_dd" runat="server" CssClass="form-control" style="display:none">
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
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2" id="siblings_lbl" style="display:none">Siblings</label>
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="siblings_dd" runat="server" CssClass="form-control" style="display:none">
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
                                    <hr />

                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Family History</h4>
                                    </div>
                                    <div class="row">
                                        <br />
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">History</label>
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
                                    <hr />

                                    <div class="row">
                                        <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">History Of Substance Abuse</h4>
                                    </div>
                                    <div class="row">
                                        <br />
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-2">Substance</label>
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
                                            <label class="col-sm-2">Duration</label>
                                            <div class="col-sm-4">
                                                <asp:DropDownList ID="duration_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>3 months</asp:ListItem>
                                                    <asp:ListItem>6 months</asp:ListItem>
                                                    <asp:ListItem>1 year</asp:ListItem>
                                                    <asp:ListItem>2 years</asp:ListItem>
                                                    <asp:ListItem>3 years</asp:ListItem>
                                                    <asp:ListItem>4 years</asp:ListItem>
                                                    <asp:ListItem>More than 5 years</asp:ListItem>
                                                    <asp:ListItem>More than 10 years</asp:ListItem>
                                                </asp:DropDownList>
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
                                                <asp:DropDownList ID="modeOfAbuse_dd" runat="server" CssClass="form-control">
                                                    <asp:ListItem>Sniffing</asp:ListItem>
                                                    <asp:ListItem>Drinking</asp:ListItem>
                                                    <asp:ListItem>Injection</asp:ListItem>
                                                    <asp:ListItem>Tablet</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <br />

                                    <div class="row">
                                        <div class="form-group col-sm-12">
                                            <label class="col-sm-3">Any admission for detoxification</label>
                                            <div class="col-sm-2">
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" onclick="changeAdmissionDetox()" name="inlineRadioOptions8" id="yesAdmissionForDetoxification_radio" value="option1">
                                                    Yes
                                                </label>
                                                <label class="radio-inline">
                                                    <input runat="server" type="radio" checked onclick="changeAdmissionDetox()" name="inlineRadioOptions8" id="noAdmissionForDetoxification_radio" value="option2">
                                                    No
                                                </label>
                                            </div>
                                            <label id="noOfAdmissionsDetox" class="col-sm-2" style="display:none">Number of admissions</label>
                                            <div class="col-sm-2">
                                                <asp:DropDownList ID="numberOfadmissionsDetox_dd" runat="server" CssClass="form-control" style="display: none">
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                    <asp:ListItem>5</asp:ListItem>
                                                    <asp:ListItem>6</asp:ListItem>
                                                    <asp:ListItem>7</asp:ListItem>
                                                    <asp:ListItem>8</asp:ListItem>
                                                    <asp:ListItem>9</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-3">
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

        function addPastMedHist()
        {
            var ddlObj = document.getElementById("<%=pastMedicalHistory_dd.ClientID %>");
            var selectedText = ddlObj.options[ddlObj.selectedIndex].innerHTML;
            var selectedValue = ddlObj.value;

            var textArea = document.getElementById("<%=pastMedicalHistory_area.ClientID %>");
            var str = textArea.value;
            var pos = str.search(selectedValue);
            if(pos == -1)
            {
                if (textArea.value == "") {
                    textArea.value = textArea.value + selectedValue;
                }
                else {
                    textArea.value = textArea.value + ", " + selectedValue;
                }
            }
        }

        function addTreatmentHist()
        {
            var ddlObj = document.getElementById("<%=treatmentHistory_dd.ClientID %>");
            var selectedText = ddlObj.options[ddlObj.selectedIndex].innerHTML;
            var selectedValue = ddlObj.value;

            var textArea = document.getElementById("<%=CurrentDrugTreatment_area.ClientID %>");
            var str = textArea.value;
            var pos = str.search(selectedText);
            if (pos == -1) {
                if (textArea.value == "")
                {
                    textArea.value = textArea.value + selectedText;
                }
                else
                {
                    textArea.value = textArea.value + ", " + selectedText;
                }
            }
        }

        function addpastPsycHistory() {
            var ddlObj = document.getElementById("<%=pastPsychiatricHistory_dd.ClientID %>");
            var selectedText = ddlObj.options[ddlObj.selectedIndex].innerHTML;
            var selectedValue = ddlObj.value;

            var textArea = document.getElementById("<%=pastPsychiatricHistory_area.ClientID %>");
            var str = textArea.value;
            var pos = str.search(selectedValue);
            if (pos == -1) {
                if (textArea.value == "") {
                    textArea.value = textArea.value + selectedValue;
                }
                else {
                    textArea.value = textArea.value + ", " + selectedValue;
                }
            }
        }

        function showAdmissionArea()
        {
            var ddlObj = document.getElementById("<%=yesPreviousAdmission_radio.ClientID %>");
            var selectedValue = ddlObj.value;
            if(selectedValue == "option1")
            {
                var lblObj = document.getElementById("numberOfAdmissions_lbl").style.display = 'block';
                var ddObj = document.getElementById("<%=noOfAdmissions_dd.ClientID %>").style.display = 'block';
            }
        }

        function hideAdmissionArea() {
            var ddlObj = document.getElementById("<%=noPreviousAdmission_radio.ClientID %>");
            var selectedValue = ddlObj.value;

            if (selectedValue == "option2") {
                var lblObj = document.getElementById("numberOfAdmissions_lbl").style.display = 'none';
                var ddObj = document.getElementById("<%=noOfAdmissions_dd.ClientID %>").style.display = 'none';
            }
        }

        function startOfSchoolingDd()
        {
            var ddlObj = document.getElementById("<%=startOfSchooling_dd.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "In time")
            {
                hideStartOfSchoolingArea();
            }
            else
            {
                showStartOfSchoolingArea();
            }
        }

        function occupationArea()
        {
            var ddlObj = document.getElementById("<%=workOccupation_dd.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "Satisfactory") {
                hideWorkOccupationArea();
            }
            else {
                showWorkOccupationArea();
            }
        }

        function hideWorkOccupationArea() {
            var ddlObj = document.getElementById("<%=workOccupation_dd.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "Satisfactory") {
                var areaObj = document.getElementById("<%=workOccupationRecord_area.ClientID %>").style.display = 'none';
            }
        }

        function showWorkOccupationArea() {
            var ddlObj = document.getElementById("<%=workOccupation_dd.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "Unsatisfactory") {
                var areaObj = document.getElementById("<%=workOccupationRecord_area.ClientID %>").style.display = 'block';
            }
        }


        function showStartOfSchoolingArea() {
            var ddlObj = document.getElementById("<%=startOfSchooling_dd.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "Delayed") {
                var areaObj = document.getElementById("<%=startOfSchooling_area.ClientID %>").style.display = 'block';
            }
        }

        function hideStartOfSchoolingArea() {
            var ddlObj = document.getElementById("<%=startOfSchooling_dd.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "In time") {
                var areaObj = document.getElementById("<%=startOfSchooling_area.ClientID %>").style.display = 'none';
            }
        }

        function addDrugs()
        {
            var ddlObj = document.getElementById("<%=drugs_dd.ClientID %>");
            var selectedText = ddlObj.options[ddlObj.selectedIndex].innerHTML;
            var selectedValue = ddlObj.value;

            var textArea = document.getElementById("<%=drugs_area.ClientID %>");
            var str = textArea.value;
            var pos = str.search(selectedText);
            if (pos == -1) {
                if (textArea.value == "") {
                    textArea.value = textArea.value + selectedText;
                }
                else {
                    textArea.value = textArea.value + ", " + selectedText;
                }
            }
        }

        function addDrugReaction() {
            var ddlObj = document.getElementById("<%=drugReaction_dd.ClientID %>");
            var selectedText = ddlObj.options[ddlObj.selectedIndex].innerHTML;
            var selectedValue = ddlObj.value;

            var textArea = document.getElementById("<%=drugReaction_area.ClientID %>");
            var str = textArea.value;
            var pos = str.search(selectedText);
            if (pos == -1) {
                if (textArea.value == "") {
                    textArea.value = textArea.value + selectedText;
                }
                else {
                    textArea.value = textArea.value + ", " + selectedText;
                }
            }
        }

        function showTreatmentFaithHealerArea() {
            var ddlObj = document.getElementById("<%=yesTreatmentByFaithHealer_radio.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "option1") {
                var ddObj = document.getElementById("<%=treatmentByFaithHealer_area.ClientID %>").style.display = 'block';
            }
        }

        function hideTreatmentFaithHealerArea() {
            var ddlObj = document.getElementById("<%=noTreatmentByFaithHealer_radio.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "option2") {
                var ddObj = document.getElementById("<%=treatmentByFaithHealer_area.ClientID %>").style.display = 'none';
            }
        }

        function fatherSiblingMotherArea() {
            var ddlObj = document.getElementById("<%=familyHistory_dd.ClientID %>");
            var selectedValue = ddlObj.value;
            if (selectedValue == "No") {
                hideFatherMotherSibArea();
            }
            else {
                showFatherMotherSibArea();
            }
        }

        function showFatherMotherSibArea() {
            var fatherLbl = document.getElementById("father_lbl").style.display = 'block';
            var motherLbl = document.getElementById("mother_lbl").style.display = 'block';
            var siblingsLbl = document.getElementById("siblings_lbl").style.display = 'block';
            var fatherDd = document.getElementById("<%=father_dd.ClientID %>").style.display = 'block';
            var motherDd = document.getElementById("<%=mother_dd.ClientID %>").style.display = 'block';
            var siblingsDd = document.getElementById("<%=siblings_dd.ClientID %>").style.display = 'block';
        }

        function hideFatherMotherSibArea() {
            var fatherLbl = document.getElementById("father_lbl").style.display = 'none';
            var motherLbl = document.getElementById("mother_lbl").style.display = 'none';
            var siblingsLbl = document.getElementById("siblings_lbl").style.display = 'none';
            var fatherDd = document.getElementById("<%=father_dd.ClientID %>").style.display = 'none';
            var motherDd = document.getElementById("<%=mother_dd.ClientID %>").style.display = 'none';
            var siblingsDd = document.getElementById("<%=siblings_dd.ClientID %>").style.display = 'none';
        }

        function changeAdmissionDetox()
        {
            if (document.getElementById('<%=yesAdmissionForDetoxification_radio.ClientID %>').checked) {
                var lblObj = document.getElementById("noOfAdmissionsDetox").style.display = 'block';
                var ddObj = document.getElementById("<%=numberOfadmissionsDetox_dd.ClientID %>").style.display = 'block';
            }
            else{
                var lblObj = document.getElementById("noOfAdmissionsDetox").style.display = 'none';
                var ddObj = document.getElementById("<%=numberOfadmissionsDetox_dd.ClientID %>").style.display = 'none';
            }
        }

        window.onload = function () {
            if (document.getElementById('<%=yesPreviousAdmission_radio.ClientID %>').checked) {
                var lblObj = document.getElementById("numberOfAdmissions_lbl").style.display = 'block';
                var ddObj = document.getElementById("<%=noOfAdmissions_dd.ClientID %>").style.display = 'block';
            }
            if (document.getElementById('<%=yesTreatmentByFaithHealer_radio.ClientID %>').checked) {
                var ddObj = document.getElementById("<%=treatmentByFaithHealer_area.ClientID %>").style.display = 'block';
            }
            if (document.getElementById('<%=yesAdmissionForDetoxification_radio.ClientID %>').checked) {
                var ddObj = document.getElementById("<%=detoxification_area.ClientID %>").style.display = 'block';
                var ddObj1 = document.getElementById("<%=numberOfadmissionsDetox_dd.ClientID %>").style.display = 'block'; 
                var lblObj = document.getElementById("noOfAdmissionsDetox").style.display = 'block';
            }
            if (document.getElementById('<%=startOfSchooling_dd.ClientID %>').value == "Delayed") {
                var areaObj = document.getElementById("<%=startOfSchooling_area.ClientID %>").style.display = 'block';
            }
            if (document.getElementById('<%=workOccupation_dd.ClientID %>').value == "Unsatisfactory") {
                var areaObj = document.getElementById("<%=workOccupationRecord_area.ClientID %>").style.display = 'block';
            }
            if (document.getElementById('<%=familyHistory_dd.ClientID %>').value == "Yes") {
                showFatherMotherSibArea();
            }
        };
    </script>
</asp:Content>
