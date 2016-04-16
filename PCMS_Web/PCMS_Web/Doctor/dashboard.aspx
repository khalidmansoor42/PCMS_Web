<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<form runat="server">
    <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>

              <p>Patients Waiting</p>
            </div>
            <div class="icon">
              <i class="fa fa-clock-o"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53</h3>

              <p>Patients Checked Today</p>
            </div>
            <div class="icon">
              <i class="fa fa-check-square-o"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>

              <p>Patients Registered Today</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65</h3>

              <p>Appointments</p>
            </div>
            <div class="icon">
              <i class="fa fa-calendar-check-o"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <section class="col-lg-7">
        <div class="row">
            <div class="col-sm-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                      <h3 class="box-title">Start treatment</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                        <div class="box-body">
                            <div class="row">
                                <div class="list-group col-sm-10 col-sm-offset-1">
                                    <asp:HyperLink ID="complaintAndProblem_btn" runat="server" CssClass="list-group-item" href="problemListAndComplaint.aspx"><i class="fa fa-info-circle" style="margin-right: 15px"></i> Complaint And Problem <label class="small pull-right"">Step 1</label></asp:HyperLink>
                                    <asp:HyperLink ID="history_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-history" style="margin-right: 15px"></i> History <label class="small pull-right">Step 2</label></asp:HyperLink>
                                    <asp:HyperLink ID="diagnosis_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-search" style="margin-right: 15px"></i> Diagnosis <label class="small pull-right">Step 3</label></asp:HyperLink>
                                    <asp:HyperLink ID="mentalStateExamination_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-stethoscope" style="margin-right: 15px"></i> Mental State Examination <label class="small pull-right">Step 4</label></asp:HyperLink>
                                    <asp:HyperLink ID="generalPhysicalExamination_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-male" style="margin-right: 18px"></i> General Physical Examination <label class="small pull-right">Step 5</label></asp:HyperLink>
                                    <asp:HyperLink ID="systematicExamination_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-bar-chart" style="margin-right: 11px"></i> Systematic Examination <label class="small pull-right">Step 6</label></asp:HyperLink>
                                    <asp:HyperLink ID="psychometricEvaluation_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-file-text" style="margin-right: 15px"></i> Psychometric Evaluation <label class="small pull-right">Step 7</label></asp:HyperLink>
                                    <asp:HyperLink ID="Investigation_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-user-secret" style="margin-right: 15px"></i> Investigation <label class="small pull-right">Step 8</label></asp:HyperLink>
                                    <asp:HyperLink ID="medication_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-medkit" style="margin-right: 15px"></i> Medication <label class="small pull-right">Step 9</label></asp:HyperLink>
                                    <asp:HyperLink ID="counselling_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-comments-o" style="margin-right: 15px"></i> Counselling <label class="small pull-right">Step 10</label></asp:HyperLink>
                                    <asp:HyperLink ID="addPicture_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-picture-o" style="margin-right: 15px"></i> Add Picture <label class="small pull-right">Step 11</label></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        </section>

          <section class="col-lg-5">

          <!-- Map box -->
          <div class="box box-solid bg-light-blue-gradient">
            <div class="box-header">
              
              <h3 class="box-title">
                Patient List
              </h3>
            </div>
            
                <div class="box-body">
                    <div class="table-responsive">
                            <asp:GridView ID="patientTokenGrid" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="city_id" DataSourceID="PatientTokenDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" AllowSorting="True">
                              <Columns>
                                  <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                  <asp:BoundField DataField="city_id" HeaderText="city_id" ReadOnly="True" SortExpression="city_id"></asp:BoundField>
                                  <asp:BoundField DataField="city_name" HeaderText="city_name" SortExpression="city_name"></asp:BoundField>
                              </Columns>
                  <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                  <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

                  <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                  <RowStyle ForeColor="#000066"></RowStyle>

                  <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                  <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                  <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                  <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                  <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
              </asp:GridView>
                          <asp:SqlDataSource runat="server" ID="PatientTokenDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT * FROM [city]"></asp:SqlDataSource>

                    </div>
                </div>
            
        </div>
          <!-- Calendar -->

        </section>
          </div>
    </form>
</asp:Content>