<%@ Page Title="" Language="C#"  EnableEventValidation="false" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <!-- <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
-->    
<form runat="server">
    <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3 id="patient_waiting">0</h3>
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
              <h3 id="PatientsCheckedToday">0</h3>

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
              <h3 id="PatientRegister">0</h3>

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
                                    <%--<asp:HyperLink ID="complaintAndProblem_btn" runat="server" CssClass="list-group-item" href="problemListAndComplaint.aspx"><i class="fa fa-info-circle" style="margin-right: 15px"></i> Complaint And Problem <label class="small pull-right"">Step 1</label></asp:HyperLink>--%>
                                    <asp:HyperLink ID="history_btn" runat="server" CssClass="list-group-item" href="patientHistory.aspx"><i class="fa fa-history" style="margin-right: 15px" ></i> History <label class="small pull-right">Step 1</label></asp:HyperLink>
                                    <asp:HyperLink ID="diagnosis_btn" runat="server" CssClass="list-group-item" href="diagnoses.aspx"><i class="fa fa-search" style="margin-right: 15px"></i> Diagnosis <label class="small pull-right">Step 2</label></asp:HyperLink>
                                    <asp:HyperLink ID="mentalStateExamination_btn" runat="server" CssClass="list-group-item" href="mentalStateExamination.aspx"><i class="fa fa-stethoscope" style="margin-right: 15px"></i> Mental State Examination <label class="small pull-right">Step 3</label></asp:HyperLink>
                                    <asp:HyperLink ID="generalPhysicalExamination_btn" runat="server" CssClass="list-group-item" href="generalPhysicalExamination.aspx"><i class="fa fa-male" style="margin-right: 18px"></i> General Physical Examination <label class="small pull-right">Step 4</label></asp:HyperLink>
                                    <asp:HyperLink ID="systematicExamination_btn" runat="server" CssClass="list-group-item" href="systematicExamination.aspx"><i class="fa fa-bar-chart" style="margin-right: 11px"></i> Systematic Examination <label class="small pull-right">Step 5</label></asp:HyperLink>
                                    <asp:HyperLink ID="psychometricEvaluation_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-file-text" style="margin-right: 15px"></i> Psychometric Evaluation <label class="small pull-right">Step 6</label></asp:HyperLink>
                                    <asp:HyperLink ID="Investigation_btn" runat="server" CssClass="list-group-item" href="investigation.aspx"><i class="fa fa-user-secret" style="margin-right: 15px"></i> Investigation <label class="small pull-right">Step 7</label></asp:HyperLink>
                                    <asp:HyperLink ID="medication_btn" runat="server" CssClass="list-group-item" href="systematicMedication.aspx"><i class="fa fa-medkit" style="margin-right: 15px"></i> Medication <label class="small pull-right">Step 8</label></asp:HyperLink>
                                    <asp:HyperLink ID="counselling_btn" runat="server" CssClass="list-group-item" href="#"><i class="fa fa-comments-o" style="margin-right: 15px"></i> Counselling <label class="small pull-right">Step 9</label></asp:HyperLink>
                                    <asp:HyperLink ID="formuation_btn" runat="server" CssClass="list-group-item" href="formulation.aspx"><i class="fa fa-pie-chart" style="margin-right: 15px"></i> Formulation <label class="small pull-right">Step 10</label></asp:HyperLink>
                                    <asp:HyperLink ID="addPicture_btn" runat="server" CssClass="list-group-item" href="addPicture.aspx"><i class="fa fa-picture-o" style="margin-right: 15px"></i> Add Picture <label class="small pull-right">Step 11</label></asp:HyperLink>
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
              <asp:TextBox ID="dateToday" hidden runat="server"></asp:TextBox>
              <asp:TextBox ID="employeeId" hidden runat="server"></asp:TextBox>
            
                <div class="box-body" id="muaz">
                    <div class="table-responsive" id="arslan">
                        <asp:GridView ID="patientTokenGrid"   CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="patient_reg" DataSourceID="PatientTokenDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="patientTokenGrid_SelectedIndexChanged" OnRowDataBound="patientTokenGrid_RowDataBound">
                              <Columns>
                                  <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                <asp:BoundField DataField="token_no" HeaderText="Token No." SortExpression="token_no"></asp:BoundField>

                                <asp:BoundField DataField="patient_reg" HeaderText="Patient ID" SortExpression="patient_reg" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name"></asp:BoundField>
                                  <asp:TemplateField HeaderText="Check Out">
                                    <ItemTemplate>
                                   <asp:LinkButton runat="server" ID="lnkView" OnClick="lnkView_Click">Check Out</asp:LinkButton>
                                     </ItemTemplate>
                                   </asp:TemplateField>
                             </Columns>

                  <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                  <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

                  <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                  <RowStyle ForeColor="#000066"></RowStyle>

                  <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                  <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                  <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                  <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                  <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
              </asp:GridView>
                        <asp:SqlDataSource runat="server" ID="PatientTokenDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT p.full_name, p.patient_reg, r.token_no FROM patient_registeration AS p INNER JOIN visit AS v ON p.patient_reg = v.patient_reg INNER JOIN receipt AS r ON p.patient_reg = r.patient_reg AND v.patient_reg = r.patient_reg AND v.employee_id = r.employee_id and v.visit_no = r.visit_no WHERE (v.visit_date = @Param1) AND (v.checks = '0') AND (v.employee_id = @Param2) AND (r.Date = @Param3)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="dateToday" Name="Param1" PropertyName="Text" />
                                <asp:ControlParameter ControlID="employeeId" Name="Param2" PropertyName="Text" />
                                <asp:ControlParameter ControlID="dateToday" PropertyName="Text" Name="Param3"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
        </div>
          <!-- Calendar -->

        </section>
          </div>
    </form>
    <script>
        function grid() {
            var rowscount = $("#<%=patientTokenGrid.ClientID %> tr").length;
            if (rowscount) {

            } else {
                window.location = "dashboard.aspx";
            }

        }
    </script>
  <!--  <script src="http://code.jquery.com/jquery-latest.min.js"type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>-->
</asp:Content>