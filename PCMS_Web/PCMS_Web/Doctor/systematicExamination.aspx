<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="systematicExamination.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
    <script type="text/javascript">
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=alert_success.ClientID %>").style.display = "none";
            }, seconds * 1000);

            setTimeout(function () {
                document.getElementById("<%=alert_fail.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };

        function cranial()
        {
            if (document.getElementById("<%=yescranialNerves_radio.ClientID %>").checked)
            {
                hideCranialArea();
            }
            else
            {
                showCranialArea();
            }
        }

        function sensory() {
            if (document.getElementById("<%=yessensorySystem_radio.ClientID %>").checked) {
                hideSensoryArea();
            }
            else {
                showSensoryArea();
            }
        }

        function hideSensoryArea() {
            document.getElementById("<%=sensorySystem_area.ClientID %>").style.display = 'none';
        }

        function showSensoryArea() {
            document.getElementById("<%=sensorySystem_area.ClientID %>").style.display = 'block';
        }

        function hideCranialArea()
        {
            document.getElementById("<%=TextBox1.ClientID %>").style.display = 'none';
        }

        function showCranialArea()
        {
            document.getElementById("<%=TextBox1.ClientID %>").style.display = 'block';
        }

        function motor() {
            if (document.getElementById("<%=yesMotorSystem_radio.ClientID %>").checked) {
                hideMotorArea();
            }
            else {
                showMotorArea();
            }
        }

        function hideMotorArea() {
            document.getElementById("<%=Textarea2.ClientID %>").style.display = 'none';
        }

        function showMotorArea() {
            document.getElementById("<%=Textarea2.ClientID %>").style.display = 'block';
        }

        function superficial() {
            if (document.getElementById("<%=yesSuperficial_radio.ClientID %>").checked) {
                hideSuperficialArea();
            }
            else {
                showSuperficialArea();
            }
        }

        function hideSuperficialArea() {
            document.getElementById("<%=superficialReflexesComments_txt.ClientID %>").style.display = 'none';
        }

        function showSuperficialArea() {
            document.getElementById("<%=superficialReflexesComments_txt.ClientID %>").style.display = 'block';
        }

        function deep() {
            if (document.getElementById("<%=yesDeepReflexes_radio.ClientID %>").checked) {
                hideDeepArea();
            }
            else {
                showDeepArea();
            }
        }

        function hideDeepArea() {
            document.getElementById("<%=TextBox3.ClientID %>").style.display = 'none';
        }

        function showDeepArea() {
            document.getElementById("<%=TextBox3.ClientID %>").style.display = 'block';
        }

        function cerebellar() {
            if (document.getElementById("<%=yesCerebellar_radio.ClientID %>").checked) {
                hideCerebellarArea();
            }
            else {
                showCerebellarArea();
            }
        }

        function showCerebellarArea() {
            document.getElementById("<%=cerebellarFunctions_area.ClientID %>").style.display = 'block';
        }

        function hideCerebellarArea() {
            document.getElementById("<%=cerebellarFunctions_area.ClientID %>").style.display = 'none';
        }

        function fundoscopy() {
            if (document.getElementById("<%=yesFundoscopy_radio.ClientID %>").checked) {
                hideFundoscopyArea();
            }
            else {
                showFundoscopyArea();
            }
        }

        function hideFundoscopyArea() {
            document.getElementById("<%=Textarea3.ClientID %>").style.display = 'none';
        }

        function showFundoscopyArea() {
            document.getElementById("<%=Textarea3.ClientID %>").style.display = 'block';
        }

        function cardiovascular() {
            if (document.getElementById("<%=yesCardiovascular_radio.ClientID %>").checked) {
                hideCardioArea();
            }
            else {
                showCardioArea();
            }
        }

        function hideCardioArea() {
            document.getElementById("<%=cardiovascularSystem_area.ClientID %>").style.display = 'none';
        }

        function showCardioArea() {
            document.getElementById("<%=cardiovascularSystem_area.ClientID %>").style.display = 'block';
        }

        function respiratory() {
            if (document.getElementById("<%=yesRespiratory_radio.ClientID %>").checked) {
                hideRespiratoryArea();
            }
            else {
                showRespiratoryArea();
            }
        }

        function hideRespiratoryArea() {
            document.getElementById("<%=respiratorySystem_area.ClientID %>").style.display = 'none';
        }

        function showRespiratoryArea() {
            document.getElementById("<%=respiratorySystem_area.ClientID %>").style.display = 'block';
        }

        function gastroIntestinal() {
            if (document.getElementById("<%=yesGastrointes_radio.ClientID %>").checked) {
                hideGastroArea();
            }
            else {
                showGastroArea();
            }
        }

        function hideGastroArea() {
            document.getElementById("<%=gastrointestinalSystem_area.ClientID %>").style.display = 'none';
        }

        function showGastroArea() {
            document.getElementById("<%=gastrointestinalSystem_area.ClientID %>").style.display = 'block';
        }

        function urogenital() {
            if (document.getElementById("<%=yesUrogenital_radio.ClientID %>").checked) {
                hideUrogenitalArea();
            }
            else {
                showUrogenitalArea();
            }
        }

        function hideUrogenitalArea() {
            document.getElementById("<%=urogenitalSystem_area.ClientID %>").style.display = 'none';
        }

        function showUrogenitalArea() {
            document.getElementById("<%=urogenitalSystem_area.ClientID %>").style.display = 'block';
        }

        window.onload = function ()
        {
            if (document.getElementById("<%=nocranialNerves_radio.ClientID %>").checked)
            {
                showCranialArea();
            }
            if (document.getElementById("<%=nosensorySystem_radio.ClientID %>").checked) {
                showSensoryArea();
            }
            if (document.getElementById("<%=noMotorSystem_radio.ClientID %>").checked) {
                showMotorArea();
            }
            if (document.getElementById("<%=noSuperficial_radio.ClientID %>").checked) {
                showSuperficialArea();
            }
            if (document.getElementById("<%=noDeepReflexes_radio.ClientID %>").checked) {
                showDeepArea();
            }
            if (document.getElementById("<%=noCerebellar_radio.ClientID %>").checked) {
                showCerebellarArea();
            }
            if (document.getElementById("<%=noFundoscopy_radio.ClientID %>").checked) {
                showFundoscopyArea();
            }
            if (document.getElementById("<%=noCardiovascular_radio.ClientID %>").checked) {
                showCardioArea();
            }
            if (document.getElementById("<%=noRespiratory_radio.ClientID %>").checked) {
                showRespiratoryArea();
            }
            if (document.getElementById("<%=noGastrointes_radio.ClientID %>").checked) {
                showGastroArea();
            }
            if (document.getElementById("<%=noUrogenital_radio.ClientID %>").checked) {
                showUrogenitalArea();
            }
        }


    </script>
   </head>
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Systemic Examination</h3>
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
                    <h4>Central Nervous System</h4><br/>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Signs of Meningial Irritation</label>
                            <div class="col-sm-8">
                                <asp:DropDownList ID="signsOfMeningial_dd" runat="server" CssClass="form-control">
                                    <asp:ListItem>Present</asp:ListItem>
                                    <asp:ListItem>Not Present</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                        <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Cranial Nerves</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions1" id="yescranialNerves_radio" value="option1" onclick="cranial()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions1" id="nocranialNerves_radio" value="option2" onclick="cranial()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Comments" style="display:none"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Sensory System</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions2" id="yessensorySystem_radio" value="option1" onclick="sensory()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions2" id="nosensorySystem_radio" value="option2" onclick="sensory()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="sensorySystem_area" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                        <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Motor System</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions5" id="yesMotorSystem_radio" value="option1" onclick="motor()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions5" id="noMotorSystem_radio" value="option2" onclick="motor()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="Textarea2" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <h4>Reflexes</h4><br />
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Superficial Reflexes</label>
                            
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions4" id="yesSuperficial_radio" value="option1" onclick="superficial()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions4" id="noSuperficial_radio" value="option2" onclick="superficial()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="superficialReflexesComments_txt" runat="server" CssClass="form-control" placeholder="Comments" style="display:none"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                        <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Deep Reflexes</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions6" id="yesDeepReflexes_radio" value="option1" onclick="deep()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions6" id="noDeepReflexes_radio" value="option2" onclick="deep()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Comments" style="display:none"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Cerebellar Functions</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions7" id="yesCerebellar_radio" value="option1" onclick="cerebellar()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions7" id="noCerebellar_radio" value="option2" onclick="cerebellar()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="cerebellarFunctions_area" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>

                        <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Fundoscopy</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions8" id="yesFundoscopy_radio" value="option1" onclick="fundoscopy()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions8" id="noFundoscopy_radio" value="option2" onclick="fundoscopy()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="Textarea3" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Cardiovascular System</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions9" id="yesCardiovascular_radio" value="option1" onclick="cardiovascular()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions9" id="noCardiovascular_radio" value="option2" onclick="cardiovascular()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="cardiovascularSystem_area" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Respiratory System</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions10" id="yesRespiratory_radio" value="option1" onclick="respiratory()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions10" id="noRespiratory_radio" value="option2" onclick="respiratory()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="respiratorySystem_area" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Gastrointestinal System</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions11" id="yesGastrointes_radio" value="option1" onclick="gastroIntestinal()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions11" id="noGastrointes_radio" value="option2" onclick="gastroIntestinal()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="gastrointestinalSystem_area" cols="20" rows="2" class="form-control" runat="server" style="display:none"> </textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Urogenital System</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions12" id="yesUrogenital_radio" value="option1" onclick="urogenital()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions12" id="noUrogenital_radio" value="option2" onclick="urogenital()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="urogenitalSystem_area" cols="20" rows="2" class="form-control" runat="server" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>
                    
                </div>
                <div class="box-footer">
                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:10px" OnClick="update_btn_Click"/>
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="submit_btn_Click"/>
                </div>
                    </form>
            </div>
        </div>
        </div>
</asp:Content>
