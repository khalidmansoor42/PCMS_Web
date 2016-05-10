<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="formulation.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm9" %>
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
                  <h3 class="box-title">Formulation</h3>
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
                        <br />
                        <label class="col-sm-2 col-sm-offset-2 control-label">Formulations</label>
                        <div class="col-sm-5">
                            <textarea id="formulation_area" cols="20" rows="5" class="form-control" runat="server"></textarea>
                        </div>
                    </div><br />
                    <div class="row">
                        <label class="col-sm-2 col-sm-offset-2 control-label">Management Plans</label>
                        <div class="col-sm-5">
                            <textarea id="managementSkills_area" cols="20" rows="5" class="form-control" runat="server"></textarea>
                        </div>
                    </div><br />
                </div>
                <div class="box-footer">
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-info pull-right" OnClick="addFormulation"/>
                    <asp:Button ID="update" runat="server" Text="Update" CssClass="btn btn-info pull-right" OnClick="update_Click" />

                </div>
            </div>
        </div>
    </form>
</asp:Content>
