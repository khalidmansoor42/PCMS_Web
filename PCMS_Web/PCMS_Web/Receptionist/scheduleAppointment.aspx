<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="scheduleAppointment.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Appointment Scheduling</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" runat="server">
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
                                <label class="col-sm-4 control-label">Date</label>
                                <div class="col-sm-8">
                                    <label class="col-sm-1 control-label">dd</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="date_txt" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <label class="col-sm-1 control-label">mm</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="month_txt" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <label class="col-sm-1 control-label">yy</label>
                                    <div class="col-sm-3">
                                        <asp:TextBox ID="year_txt" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Time</label>
                                <div class="col-sm-8">
                                    <label class="col-sm-2 control-label">h</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="hour_text" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>

                                    <label class="col-sm-2 control-label">m</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox ID="minute_txt" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />

                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
