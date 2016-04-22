<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="userRegistration.aspx.cs" Inherits="PCMS_Web.Admin.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
        <div class="col-md-12">
            <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">User Registration</h3>
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
                      <label class="col-sm-4 control-label">Employee ID</label>
                      <div class="col-sm-4">
                        <asp:TextBox  ID="employeeId_txt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                      </div>
                    </div>                   
                </div>
                  <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Full Name</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="fullName_txt" Required="true" CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Father Name</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="fatherName_txt" Required="true" CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Email</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="email_txt" TextMode="Email" Required="true" CssClass="form-control" runat="server" placeholder="user@example.com"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                         <label class="col-sm-4 control-label">Mobile Number</label>

                        <div class="col-sm-8">
                            <asp:TextBox ID="mobileNumber_txt" Required="true" CssClass="form-control" runat="server" placeholder="0300-1234567"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">CNIC</label>

                        <div class="col-sm-8">
                            <asp:TextBox ID="cnic_txt" CssClass="form-control" runat="server" placeholder="35202-1234567-8"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Address</label>

                      <div class="col-sm-8">
                        <textarea id="address_area" Required="true" rows="2" cols="20" runat="server" class="form-control"></textarea>
                      </div>
                    </div>
                </div>

                <div class="row">
                      <div class="form-group col-sm-6">
                          <label class="col-sm-4 control-label">Age</label>
                            <div class="col-sm-2">
                            <asp:TextBox ID="TextBox1" Required="true" CssClass="form-control" runat="server"></asp:TextBox>
                          </div>
                         <div class="col-sm-6">
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
                                <input runat="server" type="radio" checked name="inlineRadioOptions" id="male_radio" value="option1"> Male
                            </label>
                            <label class="radio-inline">
                                <input runat="server"  type="radio" name="inlineRadioOptions" id="female_radio" value="option2"> Female
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
                </div>

                  <hr />
                <div class="row">
                    <h4 class="col-sm-4 control-label" style="display:block; text-align:left;">Application User Details</h4>
                </div>
                  
                  <br />

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">User Type</label>
                        <div class="col-sm-8">
                            <asp:DropDownList ID="userType_dd" runat="server" CssClass="form-control">
                                <asp:ListItem Value="doctor">Doctor</asp:ListItem>
                                <asp:ListItem Value="staff">Staff</asp:ListItem>
                                <asp:ListItem Value="admin">Admin</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                
                   <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Password</label>
                        <div class="col-sm-8">
                            <asp:TextBox ID="password_txt" Required="true" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                  <asp:Button ID="update_btn"  runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:5px"/>
                  <asp:Button ID="save_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" style="margin-left:5px" OnClick="save_btn_Click"/>
                  <asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="btn btn-danger pull-right" style="margin-left:5px"/>
                  <asp:Button ID="search_btn" runat="server" Text="Search" CssClass="btn btn-default pull-right" style="margin-left:5px"/>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
        </div>
    </div>

</asp:Content>
