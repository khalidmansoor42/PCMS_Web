<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="generalPhysicalExamination.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm10" %>
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

        function Radio_Click() {
            var radio1 = document.getElementById("<%=oedemaYes_radio.ClientID %>");
               var textBox = document.getElementById("<%=oedemaComments_txt.ClientID %>");
               textBox.disabled = !radio1.checked;
               textBox.focus();

               var radio2 = document.getElementById("<%=pallorYes_radio.ClientID %>");
                var textBox1 = document.getElementById("<%=pallorComment_txt.ClientID %>");
               textBox1.disabled = !radio2.checked;
               textBox1.focus();

               var radio3 = document.getElementById("<%=jaundiceYes_radio.ClientID %>");
                var textBox2 = document.getElementById("<%=jaundiceComment_txt.ClientID %>");
               textBox2.disabled = !radio3.checked;
               textBox2.focus();

               var radio4 = document.getElementById("<%=kylonychiaYes_radio.ClientID %>");
                var textBox3 = document.getElementById("<%=kylonchiaComments_txt.ClientID %>");
               textBox3.disabled = !radio4.checked;
               textBox3.focus();

               var radio5 = document.getElementById("<%=thyroidYes_radio.ClientID %>");
                var textBox4 = document.getElementById("<%=thyroidComments_txt.ClientID %>");
               textBox4.disabled = !radio5.checked;
               textBox4.focus();

               var radio6 = document.getElementById("<%=clubbingYes_radio.ClientID %>");
                var textBox5 = document.getElementById("<%=clubbingComments_txt.ClientID %>");
               textBox5.disabled = !radio6.checked;
               textBox5.focus();

               var radio7 = document.getElementById("<%=respirationYes_radio.ClientID %>");
                var textBox6 = document.getElementById("<%=respirationComments_txt.ClientID %>");
               textBox6.disabled = !radio7.checked;
               textBox6.focus();

               var radio8 = document.getElementById("<%=lymphYes_radio.ClientID %>");
                var textBox7 = document.getElementById("<%=lymphComments_txt.ClientID %>");
               textBox7.disabled = !radio8.checked;
               textBox7.focus();


           }
        </script>
   </head>
    <form runat="server">
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


        <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <p>Added Successfully!</p>
        </div>
        <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label runat="server" ID="error"></asp:Label>
        </div>
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">General Physical Examination</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Height</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="heightComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Weight</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="weightComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Pulse</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="pulseComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Skin Eruption</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="skinEruption_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <h4>Blood Pressure</h4>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-4">
                            <label class="col-sm-4 control-label">Lying</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="lyingComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-4">
                            <label class="col-sm-4 control-label">Sitting</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="sittingComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-4">
                            <label class="col-sm-4 control-label">Standing</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="standingComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Temperature</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="temperatureComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Dehydration</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="dehydrationComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Pallor</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions" id="pallorYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions" id="pallorNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="pallorComment_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Jaundice</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions1" id="jaundiceYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions1" id="jaundiceNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="jaundiceComment_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Oedema</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions9" id="oedemaYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions9" id="oedemaNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="oedemaComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Kylonychia</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions10" id="kylonychiaYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions10" id="kylonchiaNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="kylonchiaComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Thyroid Gland</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions2" id="thyroidYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions2" id="thyroidNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="thyroidComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Clubbing</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions3" id="clubbingYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions3" id="clubbingNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="clubbingComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Respiration Rate</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions6" id="respirationYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions6" id="respirationNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="respirationComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Lymph Node</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions7" id="lymphYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions7" id="lymphNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="lymphComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-8">
                            <label class="col-sm-2 control-label">JVP</label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="jvpComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-4">
                            <div class="col-sm-12">
                                <asp:DropDownList ID="jvp_dd" runat="server" CssClass="form-control">
                                    <asp:ListItem>Neuro Fibromas</asp:ListItem>
                                    <asp:ListItem>Pigmentation</asp:ListItem>
                                    <asp:ListItem>Depigmentation</asp:ListItem>
                                    <asp:ListItem>Lumps</asp:ListItem>
                                    <asp:ListItem>Swellings</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
                <div class="box-footer">
                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" Style="margin-left: 10px" OnClick="update_btn_Click" />
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="submit_btn_Click" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>
