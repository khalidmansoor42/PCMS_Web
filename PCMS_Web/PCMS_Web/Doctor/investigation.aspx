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
    </script>
   </head>
    <form runat="server">  
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
                  <h3 class="box-title">Investigation</h3>
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
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Complete Blood Examination</label>
                            <div class="col-sm-8">
                                <textarea id="completeBloodExaminationComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Complete Urine Examination</label>
                            <div class="col-sm-8">
                                <textarea id="completeUrineExaminationComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Liver Function Test</label>
                            <div class="col-sm-8">
                                <textarea id="liverTestComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">ECG</label>
                            <div class="col-sm-8">
                                <textarea id="ecgComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />
                    
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-5 control-label">Blood Sugar</label>
                            <div class="col-sm-7">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions" id="fasting_radio" value="option1">
                                    Fasting
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions" id="random_radio" value="option2">
                                    Random
                                </label>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <div class="col-sm-12">
                                <textarea id="bloodSugarComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Thyroid Function Test</label>
                            <div class="col-sm-8">
                                <textarea id="thyroidFunctionComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Radiography</label>
                            <div class="col-sm-8">
                                <textarea id="radiographyComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Ulgrasonography</label>
                            <div class="col-sm-8">
                                <textarea id="ulgrasonographyComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">CT Scan</label>
                            <div class="col-sm-8">
                                <textarea id="ctScanComments_area" runat="server" cols="20" rows="2" class="form-control"></textarea>
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
                <div class="box-footer">
                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:10px" OnClick="update_btn_Click"/>
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="submit_btn_Click"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
