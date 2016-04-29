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
                  <h3 class="box-title">Systematic Examination</h3>
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
                    <h4>CNS</h4><br/>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Signs of Meningial Irritation</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="meningialIrritationComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Cranial Nerves</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="cranialNervesComment_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Sensory System</label>
                            <div class="col-sm-8">
                                <textarea id="sensorySystem_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Motor System</label>
                            <div class="col-sm-8">
                                <textarea id="motorSystem_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <h4>Reflexes</h4><br />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Superficial Reflexes</label>
                            
                            <div class="col-sm-8">
                                <asp:TextBox ID="superficialReflexesComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Deep Reflexes</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="deepReflexComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Cerebellar Functions</label>
                            <div class="col-sm-8">
                                <textarea id="cerebellarFunctions_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Fundoscopy</label>
                            <div class="col-sm-8">
                                <textarea id="fundoscopy_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Cardiovascular System</label>
                            <div class="col-sm-8">
                                <textarea id="cardiovascularSystem_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Respiratory System</label>
                            <div class="col-sm-8">
                                <textarea id="respiratorySystem_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Gastrointestinal System</label>
                            <div class="col-sm-8">
                                <textarea id="gastrointestinalSystem_area" cols="20" rows="2" class="form-control" runat="server"> </textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Nervous System</label>
                            <div class="col-sm-8">
                                <textarea id="nervousSystem_area" cols="20" rows="2" class="form-control"  runat="server"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Urogenital System</label>
                            <div class="col-sm-8">
                                <textarea id="urogenitalSystem_area" cols="20" rows="2" class="form-control" runat="server"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>
                    
                </div>
                <div class="box-footer">
                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:10px" OnClick="update_btn_Click"/>
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="submit_btn_Click"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
