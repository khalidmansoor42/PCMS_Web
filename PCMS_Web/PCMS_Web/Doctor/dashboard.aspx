<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <div class="col-md-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                      <h3 class="box-title">Start treatment</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form class="form-horizontal" runat="server">
                        <div class="box-body">
                            <div class="list-group">
                              <a href="#" class="list-group-item active">
                                Cras justo odio
                              </a>
                              <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                              <a href="#" class="list-group-item">Morbi leo risus</a>
                              <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                              <a href="#" class="list-group-item">Vestibulum at eros</a>
                            </div>
                        </div>
                    </form>
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
            <form runat="server">
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
            </form>
        </div>
          <!-- Calendar -->

        </section>
          </div>
</asp:Content>