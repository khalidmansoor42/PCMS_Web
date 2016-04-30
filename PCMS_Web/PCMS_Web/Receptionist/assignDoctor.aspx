<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="assignDoctor.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm4" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
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
                  
                        <br/>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Full Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="fullName_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Father Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="fatherName_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Age</label>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="age_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Gender</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="gender_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div> 
                        </div>

                        <div class="row">
                            <div class="form-group col-sm-6">
                                 <label class="col-sm-4 control-label">Mobile Number</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="mobileNumber_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            
                        </div>
                        <hr/>                                         
                        <br />

                        <div class="row">
                            <div class="form-group col-sm-6">
                                 <label class="col-sm-4 control-label">Total Fee</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="totalFee_txt" Required="" Title="Enter only number"  Pattern="^[0-9]{1,10}$"  CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Assign Doctor</label>

                                  <div class="col-sm-8">
                                        <asp:DropDownList ID="assignDoctor_dd" CssClass="form-control" runat="server" DataSourceID="AssignDoctorDataSource" DataTextField="full_name" DataValueField="employee_id"></asp:DropDownList>
                                      <asp:SqlDataSource runat="server" ID="AssignDoctorDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT employee_id, full_name FROM user_registeration WHERE (user_type = 'Doctor')">
                                      </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>                        

                    </div>

                    <div class="box-footer">
                        <asp:Button ID="printReceipt_btn" runat="server" Text="Print" CssClass="btn btn-info pull-right" style="margin-left:5px" OnClick="printReceipt_btn_Click"/>
                    </div>
                </form>
                
            </div>
        </div>
    </div>
           
</asp:Content>
