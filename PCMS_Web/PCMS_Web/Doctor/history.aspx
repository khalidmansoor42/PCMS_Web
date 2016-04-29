<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Patient History</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" runat="server">
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
                    <h4 class="col-sm-4 control-label" style="display:block; text-align:left;">Medical History</h4>
                </div>
                <br />
                  <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Diabetes</label>
                      <div class="col-sm-8">
                            <label class="radio-inline">
                                <input runat="server" type="radio" onclick="enabletxtDiabetes();"  name="inlineRadioOptions3" id="diabetesYes_radio" value="option1"> Yes
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" checked  onclick="disableDiabetes();" name="inlineRadioOptions3" id="diabetesNo_radio" value="option2"> No
                            </label>
                      </div>
                    </div>                   
                </div>
                  <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label" id="diabtesControl_leb">Control</label>

                      <div class="col-sm-8">
                          <asp:DropDownList ID="diabetesControl_dd" runat="server" CssClass="form-control">
                              <asp:ListItem>Good</asp:ListItem>
                              <asp:ListItem>Fair</asp:ListItem>
                              <asp:ListItem>Worse</asp:ListItem>
                          </asp:DropDownList>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label"id="diabtesDuration_leb">Duration</label>
                      <div class="col-sm-8">
                            <asp:DropDownList ID="diabetesDuration_dd" runat="server" CssClass="form-control">
                                <asp:ListItem>1 day</asp:ListItem>
                                <asp:ListItem>2 days</asp:ListItem>
                                <asp:ListItem>3 days</asp:ListItem>
                                <asp:ListItem>4 days</asp:ListItem>
                                <asp:ListItem>5 days</asp:ListItem>
                                <asp:ListItem>6 days</asp:ListItem>
                                <asp:ListItem>7 days</asp:ListItem>
                                <asp:ListItem>8 days</asp:ListItem>
                                <asp:ListItem>9 days</asp:ListItem>
                                <asp:ListItem>10 days</asp:ListItem>
                                <asp:ListItem>11 days</asp:ListItem>
                                <asp:ListItem>12 days</asp:ListItem>
                                <asp:ListItem>13 days</asp:ListItem>
                                <asp:ListItem>14 days</asp:ListItem>
                                <asp:ListItem>15 days</asp:ListItem>
                                <asp:ListItem>16 days</asp:ListItem>
                                <asp:ListItem>17 days</asp:ListItem>
                                <asp:ListItem>18 days</asp:ListItem>
                                <asp:ListItem>19 days</asp:ListItem>
                                <asp:ListItem>20 days</asp:ListItem>
                                <asp:ListItem>21 days</asp:ListItem>
                                <asp:ListItem>22 days</asp:ListItem>
                                <asp:ListItem>23 days</asp:ListItem>
                                <asp:ListItem>24 days</asp:ListItem>
                                <asp:ListItem>25 days</asp:ListItem>
                                <asp:ListItem>26 days</asp:ListItem>
                                <asp:ListItem>27 days</asp:ListItem>
                                <asp:ListItem>28 days</asp:ListItem>
                                <asp:ListItem>29 days</asp:ListItem>
                                <asp:ListItem>1 Month</asp:ListItem>
                                <asp:ListItem>2 Months</asp:ListItem>
                                <asp:ListItem>3 Months</asp:ListItem>
                                <asp:ListItem>4 Months</asp:ListItem>
                                <asp:ListItem>5 Months</asp:ListItem>
                                <asp:ListItem>6 Months</asp:ListItem>
                                <asp:ListItem>7 Months</asp:ListItem>
                                <asp:ListItem>8 Months</asp:ListItem>
                                <asp:ListItem>9 Months</asp:ListItem>
                                <asp:ListItem>10 Months</asp:ListItem>
                                <asp:ListItem>11 Months</asp:ListItem>
                                <asp:ListItem>1 Year</asp:ListItem>
                                <asp:ListItem>2 Years</asp:ListItem>
                                <asp:ListItem>3 Years</asp:ListItem>
                                <asp:ListItem>4 Years</asp:ListItem>
                                <asp:ListItem>5 Years</asp:ListItem>
                                <asp:ListItem>8 Years</asp:ListItem>
                                <asp:ListItem>10 Years</asp:ListItem>
                                <asp:ListItem>20 Years</asp:ListItem>
                                <asp:ListItem>30 Years</asp:ListItem>
                            </asp:DropDownList>
                      </div>
                    </div>
                </div>

                  <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">HbAic</label>

                      <div class="col-sm-8">
                          <asp:DropDownList ID="hbAic_dd" runat="server" CssClass="form-control">
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
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                          </asp:DropDownList>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">FBS</label>

                      <div class="col-sm-8">
                           <asp:TextBox ID="diabetesFbs_txt" CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Insulin</label>
                      <div class="col-sm-8">
                            <label class="radio-inline">
                                <input runat="server" type="radio"  name="inlineRadioOptions2" onclick="enabletxt();"  id="insulinYes_radio" value="option1"> Yes
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" checked name="inlineRadioOptions2" onclick="disable();"  id="insulinNo_radio" value="option2"> No
                            </label>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label" id="dosage_leb">Dosage</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="insulinDosage_txt" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                                       
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Hypertension</label>
                      <div class="col-sm-8">
                            <label class="radio-inline">
                                <input runat="server" type="radio" name="inlineRadioOptions1" onclick="enabletxtHyper();" id="Hypertensionyes" value="option1"> Yes
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" checked name="inlineRadioOptions1" onclick="disableHyper();" id="HypertensionNo" value="option2"> No
                            </label>
                      </div>
                    </div>
                
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label" id="hyperCon_leb">Control</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="hypertensionControl_dd" runat="server" CssClass="form-control">
                              <asp:ListItem>Good</asp:ListItem>
                              <asp:ListItem>Fair</asp:ListItem>
                              <asp:ListItem>Worse</asp:ListItem>
                          </asp:DropDownList>
                        </div>
                    </div> 
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label"id="hyperdur_leb">Duration</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="Hypertension_duration" runat="server" CssClass="form-control">
                                <asp:ListItem>1 day</asp:ListItem>
                                <asp:ListItem>2 days</asp:ListItem>
                                <asp:ListItem>3 days</asp:ListItem>
                                <asp:ListItem>4 days</asp:ListItem>
                                <asp:ListItem>5 days</asp:ListItem>
                                <asp:ListItem>6 days</asp:ListItem>
                                <asp:ListItem>7 days</asp:ListItem>
                                <asp:ListItem>8 days</asp:ListItem>
                                <asp:ListItem>9 days</asp:ListItem>
                                <asp:ListItem>10 days</asp:ListItem>
                                <asp:ListItem>11 days</asp:ListItem>
                                <asp:ListItem>12 days</asp:ListItem>
                                <asp:ListItem>13 days</asp:ListItem>
                                <asp:ListItem>14 days</asp:ListItem>
                                <asp:ListItem>15 days</asp:ListItem>
                                <asp:ListItem>16 days</asp:ListItem>
                                <asp:ListItem>17 days</asp:ListItem>
                                <asp:ListItem>18 days</asp:ListItem>
                                <asp:ListItem>19 days</asp:ListItem>
                                <asp:ListItem>20 days</asp:ListItem>
                                <asp:ListItem>21 days</asp:ListItem>
                                <asp:ListItem>22 days</asp:ListItem>
                                <asp:ListItem>23 days</asp:ListItem>
                                <asp:ListItem>24 days</asp:ListItem>
                                <asp:ListItem>25 days</asp:ListItem>
                                <asp:ListItem>26 days</asp:ListItem>
                                <asp:ListItem>27 days</asp:ListItem>
                                <asp:ListItem>28 days</asp:ListItem>
                                <asp:ListItem>29 days</asp:ListItem>
                                <asp:ListItem>1 Month</asp:ListItem>
                                <asp:ListItem>2 Months</asp:ListItem>
                                <asp:ListItem>3 Months</asp:ListItem>
                                <asp:ListItem>4 Months</asp:ListItem>
                                <asp:ListItem>5 Months</asp:ListItem>
                                <asp:ListItem>6 Months</asp:ListItem>
                                <asp:ListItem>7 Months</asp:ListItem>
                                <asp:ListItem>8 Months</asp:ListItem>
                                <asp:ListItem>9 Months</asp:ListItem>
                                <asp:ListItem>10 Months</asp:ListItem>
                                <asp:ListItem>11 Months</asp:ListItem>
                                <asp:ListItem>1 Year</asp:ListItem>
                                <asp:ListItem>2 Years</asp:ListItem>
                                <asp:ListItem>3 Years</asp:ListItem>
                                <asp:ListItem>4 Years</asp:ListItem>
                                <asp:ListItem>5 Years</asp:ListItem>
                                <asp:ListItem>8 Years</asp:ListItem>
                                <asp:ListItem>10 Years</asp:ListItem>
                                <asp:ListItem>20 Years</asp:ListItem>
                                <asp:ListItem>30 Years</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                  <div class="row">
                    <div class="form-group col-sm-6">
                          <label class="col-sm-4 control-label">Cardiac</label>
                          <div class="col-sm-8">
                                <asp:TextBox ID="cardiac_txt" CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                    </div>
                    <div class="form-group col-sm-6">
                          <label class="col-sm-4 control-label">Renal</label>
                          <div class="col-sm-8">
                                <asp:TextBox ID="renal_txt" CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                          <label class="col-sm-4 control-label">Respiratory</label>
                          <div class="col-sm-8">
                                <asp:TextBox ID="respiratory_txt" CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                    </div>
                    <div class="form-group col-sm-6">
                          <label class="col-sm-4 control-label">Cancer</label>
                          <div class="col-sm-8">
                                <asp:TextBox ID="cancer_txt" CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                          <label class="col-sm-4 control-label">Other Illness</label>
                          <div class="col-sm-8">
                                <asp:TextBox ID="OtherIllness_txt" CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                    </div>
                </div>

              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                  <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:5px" OnClick="updateBtn_Click"/>
                  <asp:Button ID="saveBtn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" style="margin-left:5px" OnClick="saveBtn_Click1"/>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <script>
        $(document).ready(function () {
            if (document.getElementById('HypertensionNo').checked) {
                alert("");
            } else {
                alert("mds");
            }

        });
        function disable() {           
            document.getElementById('<%= this.insulinDosage_txt.ClientID %>').style.display = 'none';
            document.getElementById('dosage_leb').style.display = 'none';
            }
        function enabletxt()
        {
            document.getElementById('dosage_leb').style.display = 'block';
            document.getElementById('<%= this.insulinDosage_txt.ClientID %>').style.display = 'block';
        }

        function disableDiabetes()
        {           
            document.getElementById('<%= this.diabetesControl_dd.ClientID %>').style.display = 'none';
            document.getElementById('<%= this.diabetesDuration_dd.ClientID %>').style.display = 'none';
              document.getElementById('diabtesControl_leb').style.display = 'none';
            document.getElementById('diabtesDuration_leb').style.display = 'none';
        }
        function enabletxtDiabetes()
        {
            document.getElementById('<%= this.diabetesControl_dd.ClientID %>').style.display = 'block';
            document.getElementById('<%= this.diabetesDuration_dd.ClientID %>').style.display = 'block';
            document.getElementById('diabtesControl_leb').style.display = 'block';
            document.getElementById('diabtesDuration_leb').style.display = 'block';
        }

        function disableHyper()
        {           
            document.getElementById('<%= this.Hypertension_duration.ClientID %>').style.display = 'none';
            document.getElementById('<%= this.hypertensionControl_dd.ClientID %>').style.display = 'none';
            document.getElementById('hyperCon_leb').style.display = 'none';
            document.getElementById('hyperdur_leb').style.display = 'none';
        }
        function enabletxtHyper()
        {
            document.getElementById('<%= this.Hypertension_duration.ClientID %>').style.display = 'block';
            document.getElementById('<%= this.hypertensionControl_dd.ClientID %>').style.display = 'block';
            document.getElementById('hyperCon_leb').style.display = 'block';
            document.getElementById('hyperdur_leb').style.display = 'block';  
        }

    </script>
</asp:Content>
