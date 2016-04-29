<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="duplicateInvoice.aspx.cs" Inherits="PCMS_Web.Receptionist.duplicateInvoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        
    <div class="col-sm-12">
        <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Duplicate Invoice</h3>
            </div>
        <div class="box-body">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-6">
                    <asp:TextBox ID="searchPatient_txt" runat="server" CssClass="form-control" placeholder="Enter Patient Name Here"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="searchPatient_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="searchPatient_btn_Click" />
                </div>
            </div><br />
            <asp:TextBox ID="dateTime_txt" runat="server" Visible="false"></asp:TextBox>
            <div class="table-responsive">
                <div class="col-sm-12">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="PatientDataSource" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Receipt_id" HeaderText="Receipt Id" SortExpression="Receipt_id" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="patient_reg" HeaderText="Patient Id" SortExpression="patient_reg"></asp:BoundField>
                            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name"></asp:BoundField>
                            <asp:BoundField DataField="father_name" HeaderText="Father Name" SortExpression="father_name"></asp:BoundField>
                            <asp:BoundField DataField="visit_no" HeaderText="Visit No." SortExpression="visit_no"></asp:BoundField>
                            <asp:BoundField DataField="token_no" HeaderText="Token No" SortExpression="token_no"></asp:BoundField>
                            <asp:BoundField DataField="total" HeaderText="Fee" SortExpression="total"></asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Dr Name" SortExpression="Name"></asp:BoundField>
                            <asp:BoundField DataField="employee_id"  HeaderText="Employee ID" SortExpression="employee_id"></asp:BoundField>
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
                    <asp:SqlDataSource runat="server" ID="PatientDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="select p.full_name,p.father_name, r.Receipt_id,v.patient_reg,v.visit_no,r.token_no,r.total, u.full_name as Name,v.employee_id  from visit v  inner join receipt r on v.patient_reg=r.patient_reg
inner join user_registeration u on v.employee_id=u.employee_id inner join patient_registeration p on p.patient_reg=v.patient_reg
 where v.visit_date=@Param1 and r.receiptdate=@Param1 and v.checks='0'"
                        DeleteCommand="DELETE FROM [patient_registeration] WHERE [patient_reg] = @patient_reg" InsertCommand="INSERT INTO [patient_registeration] ([patient_reg], [cnic], [full_name], [father_name], [sex], [address], [city_id], [mob], [email], [attendant_name], [relation_id], [attendant_mob], [dob], [ref_doctor_id], [martial_status], [education], [occupation_id], [source]) VALUES (@patient_reg, @cnic, @full_name, @father_name, @sex, @address, @city_id, @mob, @email, @attendant_name, @relation_id, @attendant_mob, @dob, @ref_doctor_id, @martial_status, @education, @occupation_id, @source)" UpdateCommand="UPDATE [patient_registeration] SET [cnic] = @cnic, [full_name] = @full_name, [father_name] = @father_name, [sex] = @sex, [address] = @address, [city_id] = @city_id, [mob] = @mob, [email] = @email, [attendant_name] = @attendant_name, [relation_id] = @relation_id, [attendant_mob] = @attendant_mob, [dob] = @dob, [ref_doctor_id] = @ref_doctor_id, [martial_status] = @martial_status, [education] = @education, [occupation_id] = @occupation_id, [source] = @source WHERE [patient_reg] = @patient_reg">
                        <DeleteParameters>
                            <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="cnic" Type="String"></asp:Parameter>
                            <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="father_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="sex" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="address" Type="String"></asp:Parameter>
                            <asp:Parameter Name="city_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="mob" Type="String"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="attendant_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="relation_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="attendant_mob" Type="String"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="dob"></asp:Parameter>
                            <asp:Parameter Name="ref_doctor_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="martial_status" Type="String"></asp:Parameter>
                            <asp:Parameter Name="education" Type="String"></asp:Parameter>
                            <asp:Parameter Name="occupation_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="source" Type="Byte"></asp:Parameter>
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="dateTime_txt" Name="Param1" PropertyName="Text" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="cnic" Type="String"></asp:Parameter>
                            <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="father_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="sex" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="address" Type="String"></asp:Parameter>
                            <asp:Parameter Name="city_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="mob" Type="String"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="attendant_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="relation_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="attendant_mob" Type="String"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="dob"></asp:Parameter>
                            <asp:Parameter Name="ref_doctor_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="martial_status" Type="String"></asp:Parameter>
                            <asp:Parameter Name="education" Type="String"></asp:Parameter>
                            <asp:Parameter Name="occupation_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="source" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="PatientSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT * FROM [patient_registeration] WHERE ([full_name] LIKE '%' + @full_name + '%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="searchPatient_txt" PropertyName="Text" Name="full_name" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                
            </div>
            <hr/>
                <div class="row">
                    <h4 class="col-sm-4 control-label">Selected Invoice</h4>
                </div>
                  <br />
                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Patient ID</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="patientId_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Full Name</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="fullName_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                </div>

           

                <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Receipt Number</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="receiptNumber_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                         <label class="col-sm-4 control-label">Visit Number</label>

                        <div class="col-sm-8">
                            <asp:TextBox ID="visitNumber_txt" ReadOnly CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

            <div class="row">
                    <div class="form-group col-sm-6">
                      <label class="col-sm-4 control-label">Token Number</label>

                      <div class="col-sm-8">
                        <asp:TextBox ID="tokenNumber_txt" disabled  CssClass="form-control"  runat="server" required></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group col-sm-6">
                    <label class="col-sm-4 control-label">Assign Doctor</label>

                        <div class="col-sm-8">
                            <asp:DropDownList ID="assignDoctor_dd" CssClass="form-control" runat="server" DataSourceID="AssignDoctorDataSource" DataTextField="full_name" DataValueField="employee_id"></asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="AssignDoctorDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT [full_name], [employee_id] FROM [user_registeration] where user_type='Doctor'"></asp:SqlDataSource>
                    </div>
                </div> 
                </div>  

            <div class="row">
                 
                <div class="form-group col-sm-6">
                         <label class="col-sm-4 control-label">Total Amount</label>

                        <div class="col-sm-8">
                            <asp:TextBox ID="totalAmount_txt"  CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
            </div>    
            <br/>
            </div>
            
        <div class="box-footer">
            <asp:Button ID="updateInvoice_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" OnClick="updateInvoice_btn_Click"/>
            <asp:Button ID="deleteInvoice_btn" runat="server" Text="Delete" CssClass="btn btn-danger pull-right" style="margin-right:10px"/>
            <asp:Button ID="printInvoice_btn" runat="server" Text="Print" CssClass="btn btn-default pull-right" style="margin-right:10px" OnClick="printInvoice_btn_Click"/>
        </div>
            </div>
        </div>
    </form>
</asp:Content>
