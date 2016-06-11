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
                    <h4 class="col-sm-4 control-label" style="display:block; text-align:left;">Personal Details</h4>
                </div>
                    <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Patient ID</label>
                      <div class="col-sm-8">
                        <asp:TextBox  ID="patientId_txt" ReadOnly  CssClass="form-control" runat="server" ></asp:TextBox>
                      </div>
                    </div> 
                    <div class="form-group col-sm-6">
                    
                    </div>
                      </div>                  
                </div>
                  <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Full Name</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="fullName" CssClass="form-control" runat="server" Pattern="[A-Za-z][A-Z a-z]*" Title="enter only characters"  Required=""></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Father Name</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="fatherName" CssClass="form-control" runat="server" Pattern="[A-Za-z][A-Z a-z]*" Title="enter only characters"  Required=""></asp:TextBox>
                      </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Email</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="email" CssClass="form-control" Type="email" runat="server"  Title="Enter valid email"  ></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                         <label class="col-sm-4 control-label">Mobile Number</label>

                        <div class="col-sm-8">
                            <asp:TextBox ID="mobileNumber" CssClass="form-control" runat="server" Title="Enter valid mobile number" placeholder="xxxx-xxxxxxx" Pattern="\d\d\d\d-\d\d\d\d\d\d\d" Required></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">CNIC</label>

                        <div class="col-sm-8">
                            <asp:TextBox ID="cnic" CssClass="form-control" runat="server" Title="Enter valid cnic number" placeholder="xxxxx-xxxxxxx-x" Pattern="\d\d\d\d\d-\d\d\d\d\d\d\d-\d"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Address</label>

                      <div class="col-sm-8">
                        <textarea id="TextArea1" rows="2" cols="20" runat="server" Title="Enter Address" class="form-control" required></textarea>
                      </div>
                    </div>
                </div>

                <div class="row">
                      <div class="form-group col-sm-6">
                          <label class="col-sm-4 control-label">Age</label>
                            <div class="col-sm-2">
                            <asp:TextBox ID="TextBox1" CssClass="form-control"  runat="server" Title="Enter only digit" placeholder="xxx"  ></asp:TextBox>
                            </div>
                          <div class="col-sm-6">
 <!--                           <input type="date" id="dateOfBorth" runat="server"  class="form-control"  required/>-->
                              <asp:DropDownList ID="ageCal" runat="server" CssClass="form-control">
                                  <asp:ListItem>Year</asp:ListItem>
                                  <asp:ListItem>Month</asp:ListItem>
                              </asp:DropDownList>
                          </div>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">Gender</label>

                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input runat="server" type="radio" checked name="inlineRadioOptions" id="inlineRadio1" value="option1"> Male
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Female
                            </label>
                        </div>
                    </div>                              
                </div>
                  <div class="row">
                    <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">Marital Status</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="maritalStatus_dd" runat="server" CssClass="form-control">
                              <asp:ListItem>Single</asp:ListItem>
                              <asp:ListItem>Married</asp:ListItem>
                              <asp:ListItem>Divorced</asp:ListItem>
                              <asp:ListItem>Widow</asp:ListItem>
                          </asp:DropDownList>
                        </div>
                    </div>

                      <div class="form-group col-sm-6">
                        <label class="col-sm-4 control-label">Occupation</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="occupationStatus_dd" CssClass="form-control" runat="server" DataSourceID="OccupationDataSource" DataTextField="occupation" DataValueField="occupation_id"></asp:DropDownList>
                          <asp:SqlDataSource runat="server" ID="OccupationDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT * FROM [occupation]"></asp:SqlDataSource>
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
                      <label class="col-sm-4 control-label">Education</label>
                        <div class="col-sm-8">
                            <asp:DropDownList CssClass="form-control" ID="patientEducation_dd" runat="server">
                                <asp:ListItem>Middle Pass</asp:ListItem>
                                <asp:ListItem>Matric</asp:ListItem>
                                <asp:ListItem>Intermediate</asp:ListItem>
                                <asp:ListItem>Bachelors</asp:ListItem>
                                <asp:ListItem>Masters</asp:ListItem>
                                <asp:ListItem>PHD</asp:ListItem>
                            </asp:DropDownList>
                        </div>                        
                    </div>                  
                </div>
                  <hr />
                <div class="row">
                    <h4 class="col-sm-4 control-label" style="display:block; text-align:left;">Attendant Details</h4>
                </div>
                  
                  <br />

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Full Name</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="attendantFullName" Pattern="[A-Za-z][A-Z a-z]*" Title="enter only characters" CssClass="form-control" runat="server" ></asp:TextBox>
                        </div>
                    </div>
                
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Phone Number</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="attMobile" CssClass="form-control" Placeholder="xxxx-xxxxxxx" Pattern="\d\d\d\d-\d\d\d\d\d\d\d"  runat="server"></asp:TextBox>
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
                                <input runat="server" type="radio" checked name="inlineRadioOption" id="reliableRadio" value="option1"> Reliable
                            </label>
                            <label class="radio-inline">
                                <input runat="server" type="radio" name="inlineRadioOption" id="unreliableRadio" value="option2"> Unreliable
                            </label>
                        </div>
                    </div>                           
                </div>

              <!-- /.box-body -->
              <div class="box-footer">
                  <asp:Button ID="saveBtn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" style="margin-left:5px" OnClick="saveBtn_Click"/>
              </div>
              <!-- /.box-footer -->
            </form>
                </div>
          </div>
        </div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>

    <script>
        $(document).ready(function () {
            $("#dateOfBorth").val('02/22/2014 00:00:00');
        });
        
        function calculate_DOB()
        {
            var obj = {};
            obj.age = $.trim($("[id*=TextBox1]").val());
            $.ajax({
                    type: "POST",
                    url: "registerPatients.aspx/ServerSideMethod",
                    data: JSON.stringify(obj),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        var msg = r.d;
                       
                        document.getElementById("date").value = msg
                        alert(msg);
                        //document.getElementById('dateOfBorth').value = r.d;;


                         }

                })
                return false;
        }
    </script>

</asp:Content>