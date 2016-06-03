<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="admission.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Patient Admission Information</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" runat="server">
              <div class="box-body">
                <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <p>Problem Added Successfully!</p>
                    </div>
                    <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label runat="server" ID="error"></asp:Label>
                    </div>
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
                  <br />

                  </div>
                    <div class="box-footer">
                        <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="btn btn-info pull-right" Style="margin-left: 5px" OnClick="updateBtn_Click" />
                        <asp:Button ID="saveBtn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" Style="margin-left: 5px" OnClick="saveBtn_Click" />
                    </div>
                </form>
                </div>
            </div>
        </div>
</asp:Content>
