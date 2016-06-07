<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="investigation.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm12" %>
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

        function cbe()
        {
            if (document.getElementById("<%=yesCompleteBloodExamination_radio.ClientID%>").checked) {
                var a = document.getElementById("<%=completeBloodExaminationComments_area.ClientID%>").style.display = 'none';
            }
            else {
                var b = document.getElementById("<%=completeBloodExaminationComments_area.ClientID%>").style.display = 'block';
            }
        }

        function cue() {
            if (document.getElementById("<%=yesCompleteUrineExamination_radio.ClientID%>").checked) {
                var a = document.getElementById("<%=completeUrineExaminationComments_area.ClientID%>").style.display = 'none';
            }
            else {
                var b = document.getElementById("<%=completeUrineExaminationComments_area.ClientID%>").style.display = 'block';
            }
        }

        function lft() {
            if (document.getElementById("<%=yesLiverFunction_radio.ClientID%>").checked) {
                var a = document.getElementById("<%=liverTestComments_area.ClientID%>").style.display = 'none';
            }
            else {
                var b = document.getElementById("<%=liverTestComments_area.ClientID%>").style.display = 'block';
            }
        }

        function ecg() {
            if (document.getElementById("<%=yesECG_radio.ClientID%>").checked) {
                var a = document.getElementById("<%=ecgComments_area.ClientID%>").style.display = 'none';
            }
            else {
                var b = document.getElementById("<%=ecgComments_area.ClientID%>").style.display = 'block';
            }
        }

        function bs() {
            if (document.getElementById("<%=yesBloodSugar_radio.ClientID%>").checked) {
                var a = document.getElementById("bloodSugar_div").style.display = 'none';
            }
            else {
                var b = document.getElementById("bloodSugar_div").style.display = 'block';
            }
        }

        function tft() {
            if (document.getElementById("<%=yesThyroid_radio.ClientID%>").checked) {
                var a = document.getElementById("<%=thyroidFunctionComments_area.ClientID%>").style.display = 'none';
            }
            else {
                var b = document.getElementById("<%=thyroidFunctionComments_area.ClientID%>").style.display = 'block';
            }
        }

        function r() {
            if (document.getElementById("<%=yesRadiography_radio.ClientID%>").checked) {
                var a = document.getElementById("<%=radiographyComments_area.ClientID%>").style.display = 'none';
            }
            else {
                var b = document.getElementById("<%=radiographyComments_area.ClientID%>").style.display = 'block';
            }
        }

        function ua() {
            if (document.getElementById("<%=yesUlgra_radio.ClientID%>").checked) {
                var a = document.getElementById("<%=ulgrasonographyComments_area.ClientID%>").style.display = 'none';
            }
            else {
                var b = document.getElementById("<%=ulgrasonographyComments_area.ClientID%>").style.display = 'block';
            }
        }

        function ctsb() {
            if (document.getElementById("<%=yesCT_radio.ClientID%>").checked) {
                var a = document.getElementById("<%=ctScanComments_area.ClientID%>").style.display = 'none';
            }
            else {
                var b = document.getElementById("<%=ctScanComments_area.ClientID%>").style.display = 'block';
            }
        }

        window.onload = function ()
        {
            if (document.getElementById("<%=noCompleteBloodExamination_radio.ClientID%>").checked)
            {
                cbe();
            }
            if (document.getElementById("<%=noCompleteUrineExamination_radio.ClientID%>").checked) {
                cue();
            }
            if (document.getElementById("<%=noLiverFuntion_radio.ClientID%>").checked) {
                lft();
            }
            if (document.getElementById("<%=noECG_radio.ClientID%>").checked) {
                ecg();
            }
            if (document.getElementById("<%=noBloodSugar_radio.ClientID%>").checked) {
                bs();
            }
            if (document.getElementById("<%=noThyroid_radio.ClientID%>").checked) {
                tft();
            }
            if (document.getElementById("<%=noRadiography_radio.ClientID%>").checked) {
                r();
            }
            if (document.getElementById("<%=noUlgra_radio.ClientID%>").checked) {
                ua();
            }
            if (document.getElementById("<%=noCT_radio.ClientID%>").checked) {
                ctsb();
            }
        }
    </script>
   </head> 
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">Investigation</h3>
        </div>
        <div class="box-body">
            <form runat="server">
            <div class="row">
                <div class="col-sm-12" runat="server">
                    <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <p>Added Successfully!</p>
                    </div>
                    <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label runat="server" ID="error"></asp:Label>
                    </div>

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
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Complete Blood Examination</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions1" id="yesCompleteBloodExamination_radio" value="option1" onclick="cbe()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions1" id="noCompleteBloodExamination_radio" value="option2" onclick="cbe()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="completeBloodExaminationComments_area" runat="server" cols="20" rows="2" class="form-control" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Complete Urine Examination</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions2" id="yesCompleteUrineExamination_radio" value="option1" onclick="cue()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions2" id="noCompleteUrineExamination_radio" value="option2" onclick="cue()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="completeUrineExaminationComments_area" runat="server" cols="20" rows="2" class="form-control" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Liver Function Test</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions3" id="yesLiverFunction_radio" value="option1" onclick="lft()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions3" id="noLiverFuntion_radio" value="option2" onclick="lft()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="liverTestComments_area" runat="server" cols="20" rows="2" class="form-control" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">ECG</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions4" id="yesECG_radio" value="option1" onclick="ecg()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions4" id="noECG_radio" value="option2" onclick="ecg()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="ecgComments_area" runat="server" cols="20" rows="2" class="form-control" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-5">
                            <label class="col-sm-5 control-label">Blood Sugar</label>
                            <div class="col-sm-7">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions5" id="yesBloodSugar_radio" value="option1" onclick="bs()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions5" id="noBloodSugar_radio" value="option2" onclick="bs()">
                                    Abnormal
                                </label>
                            </div>
                        </div>

                        <div class="form-group col-sm-7" id="bloodSugar_div" style="display:none">
                            <div class="col-sm-4">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions6" id="fasting_radio" value="option1">
                                    Fasting
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions6" id="random_radio" value="option2">
                                    Random
                                </label>
                            </div>
                            <div class="col-sm-8">
                                <textarea id="bloodSugarComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Thyroid Function Test</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions7" id="yesThyroid_radio" value="option1" onclick="tft()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions7" id="noThyroid_radio" value="option2" onclick="tft()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="thyroidFunctionComments_area" runat="server" cols="20" rows="2" class="form-control" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                <div class="row">
                    <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Radiography</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions8" id="yesRadiography_radio" value="option1" onclick="r()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions8" id="noRadiography_radio" value="option2" onclick="r()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="radiographyComments_area" runat="server" cols="20" rows="2" class="form-control" style="display:none"></textarea>
                            </div>
                        </div>
                </div>
                <br />
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Ulgrasonography Abdomen</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions9" id="yesUlgra_radio" value="option1" onclick="ua()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions9" id="noUlgra_radio" value="option2" onclick="ua()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="ulgrasonographyComments_area" runat="server" cols="20" rows="2" class="form-control" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">CT Scan Brain</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions10" id="yesCT_radio" value="option1" onclick="ctsb()">
                                    Normal
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions10" id="noCT_radio" value="option2" onclick="ctsb()">
                                    Abnormal
                                </label>
                            </div>
                            <div class="col-sm-5">
                                <textarea id="ctScanComments_area" runat="server" cols="20" rows="2" class="form-control" style="display:none"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-2 control-label">Any Other</label>
                            <div class="col-sm-10">
                                <textarea id="otherComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
            </div>
            <div class="box-footer">
                <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" Style="margin-left: 10px" OnClick="update_btn_Click" />
                <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="submit_btn_Click" />
            </div>
            </form>
        </div>
    </div>
    
</asp:Content>
