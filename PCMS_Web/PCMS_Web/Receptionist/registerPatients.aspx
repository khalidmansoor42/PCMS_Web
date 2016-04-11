<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="registerPatients.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Patient Registration</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" runat="server">
              <div class="box-body">

                <div class="row">
                    <h4 class="col-sm-4 control-label">Personal Details</h4>
                </div>
                  <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Full Name</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="fullName" CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Father Name</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="fatherName" CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Email</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                         <label class="col-sm-4 control-label">Mobile Number</label>

                        <div class="col-sm-8">
                            <asp:TextBox ID="mobileNumber" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">CNIC</label>

                        <div class="col-sm-8">
                            <asp:TextBox ID="cnic" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Address</label>

                      <div class="col-sm-8">
                        <textarea id="TextArea1" rows="2" cols="20" runat="server" class="form-control"></textarea>
                      </div>
                    </div>
                </div>

                <div class="row">
                      <div class="form-group col-sm-6">
                          <label class="col-sm-4 control-label">Age</label>
                            <div class="col-sm-2">
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                          <div class="col-sm-6">
                            <input type="date" id="dateOfBorth" runat="server" class="form-control"/>
                          </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">Gender</label>

                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> Male
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Female
                            </label>
                        </div>
                    </div>                              
                </div>
                <div class="row">
                  <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">City</label>
                        <div class="col-sm-6">
                            <asp:DropDownList ID="city_dd" CssClass="form-control" runat="server" DataSourceID="cityDataSource" DataTextField="city_name" DataValueField="city_id"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="cityDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT [city_id], [city_name] FROM [city]"></asp:SqlDataSource>
                        </div>
                        <div class="col-sm-2">
                            <a href="#" class="button"><i class="fa fa-plus fa-1x"></i></a>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Referring Doctor</label>
                      <div class="col-sm-6">
                        <asp:DropDownList ID="referingDoctor_dd" CssClass="form-control" runat="server" DataSourceID="doctorDataSource" DataTextField="doctor_name" DataValueField="doctor_id"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="doctorDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT [doctor_id], [doctor_name] FROM [doctor_registeration]"></asp:SqlDataSource>
                        </div>
                          <div class="col-sm-2">
                        <a href="#" class="button"><i class="fa fa-plus fa-1x"></i></a>
                      </div>
                    </div>
                </div>
                  <hr />
                <div class="row">
                    <h4 class="col-sm-4 control-label">Attendant Details</h4>
                </div>
                  
                  <br />

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Full Name</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="attendantFullName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Phone Number</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Relation</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="attendantRelation_dd" runat="server" CssClass="form-control" DataSourceID="attendantDataSource" DataTextField="relation_name" DataValueField="relation_id"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="attendantDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT * FROM [attendantRelation]"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Attendant Reliability</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="reliableRadio" value="option1"> Reliable
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="inlineRadioOptions" id="unreliableRadio" value="option2"> Unreliable
                            </label>
                        </div>
                    </div>
                </div>

              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                  <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:5px"/>
                  <asp:Button ID="saveBtn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" style="margin-left:5px" OnClick="saveBtn_Click"/>
                  <asp:Button ID="clearBtn" runat="server" Text="Clear" CssClass="btn btn-danger pull-right" style="margin-left:5px"/>
                  <asp:Button ID="searchBtn" runat="server" Text="Search" CssClass="btn btn-default pull-right" style="margin-left:5px"/>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
        </div>
    </div>
</asp:Content>