<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="assignDoctor.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Assign Doctor</h3>
                </div>
            
                <form class="form-horizontal" runat="server">
                    <div class="box-body">
                        <div class="row">
                            <h4 class="col-sm-4 control-label">Patient Personal Details</h4>
                        </div>
                  
                        <br />
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Full Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="fullName_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Father Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="fatherName_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Age</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="age_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Gender</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="gender_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                 <label class="col-sm-4 control-label">Mobile Number</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="mobileNumber_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>
                        <hr/>
                        <div class="row">
                            <h4 class="col-sm-4 control-label">Token Details</h4>
                        </div>
                  
                        <br />

                        <div class="row">
                            <div class="form-group col-sm-6">
                                 <label class="col-sm-4 control-label">Token Number</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="tokenNumber_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Assign Doctor</label>

                                  <div class="col-sm-8">
                                        <asp:DropDownList ID="assignDoctor_dd" CssClass="form-control" runat="server" DataSourceID="AssignDoctorDataSource" DataTextField="doctor_name" DataValueField="doctor_id"></asp:DropDownList>
                                        <asp:SqlDataSource runat="server" ID="AssignDoctorDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT [doctor_id], [doctor_name] FROM [doctor_registeration]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                              <label class="col-sm-4 control-label">Receipt Number</label>

                              <div class="col-sm-8">
                                <asp:TextBox ID="receiptNumber_txt" CssClass="form-control" runat="server"></asp:TextBox>
                              </div>
                            </div>
                        </div>

                    </div>

                    <div class="box-footer">
                        <asp:Button ID="printReceipt_btn" runat="server" Text="Print" CssClass="btn btn-info pull-right" style="margin-left:5px"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
