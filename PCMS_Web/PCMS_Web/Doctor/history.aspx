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
                    <div class="col-sm-12">
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
                                    </div>
                              </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <h4 class="col-sm-4 control-label" style="display:block; text-align:left;">Orientation Mood Affect</h4>
                </div>
                    <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Oriented to person place and time</label>
                      <div class="col-sm-8">
                            <label class="radio-inline">
                                <input runat="server" type="radio" name="inlineRadioOptions" id="personOrientationYes_radio" value="option1"> Yes
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" name="inlineRadioOptions" id="personOrientationNo_radio" value="option2"> No
                            </label>
                      </div>
                    </div>                   
                </div>
                  <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Mood Affect</label>

                      <div class="col-sm-8">
                        <textarea class="form-control" cols="20" rows="2" id="moodAffect_area" runat="server"></textarea>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Other</label>

                      <div class="col-sm-8">
                        <textarea class="form-control" cols="20" rows="2" id="other_area" runat="server"></textarea>
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
                                <input runat="server" type="radio" name="inlineRadioOptions" id="diabetesYes_radio" value="option1"> Yes
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" name="inlineRadioOptions" id="diabetesNo_radio" value="option2"> No
                            </label>
                      </div>
                    </div>                   
                </div>
                  <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Control</label>

                      <div class="col-sm-8">
                          <asp:DropDownList ID="diabetesControl_dd" runat="server" CssClass="form-control">
                              <asp:ListItem>Good</asp:ListItem>
                              <asp:ListItem>Fair</asp:ListItem>
                              <asp:ListItem>Worse</asp:ListItem>
                          </asp:DropDownList>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Duration</label>

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
                                <input runat="server" type="radio" name="inlineRadioOptions" id="insulinYes_radio" value="option1"> Yes
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" name="inlineRadioOptions" id="insulinNo_radio" value="option2"> No
                            </label>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">Dosage</label>
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
                                <input runat="server" type="radio" name="inlineRadioOptions" id="Radio1" value="option1"> Yes
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" name="inlineRadioOptions" id="Radio2" value="option2"> No
                            </label>
                      </div>
                    </div>
                
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Control</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="hypertensionControl_dd" runat="server" CssClass="form-control">
                              <asp:ListItem>Good</asp:ListItem>
                              <asp:ListItem>Fair</asp:ListItem>
                              <asp:ListItem>Worse</asp:ListItem>
                          </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Duration</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
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
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                    </div>
                </div>

              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                  <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:5px"/>
                  <asp:Button ID="saveBtn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" style="margin-left:5px"/>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
        </div>
    </div>
</asp:Content>
