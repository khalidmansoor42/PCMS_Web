<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="searchPatients.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">

        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Update Patient Record</h3>
                </div>

                <div class="row">
                    <div class="col-md-4 col-md-offset-2">
                        <asp:DropDownList ID="cityDDl" runat="server" CssClass="form-control" AppendDataBoundItems="true" DataSourceID="CityDataSource" DataTextField="city_name" DataValueField="city_name">
                            <asp:ListItem Value="%">All</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="CityDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PCMS_ConnectionString %>" SelectCommand="SELECT * FROM [city]"></asp:SqlDataSource>
                    </div>
                    <div class="col-sm-4 col-sm-offset-6">
                        <asp:TextBox ID="searchPatient_txt" runat="server" CssClass="form-control" placeholder="Enter Patient Name Here"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:Button ID="searchPatient_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="searchPatient_btn_Click" />
                    </div>
                </div>
                <br />

                <div class="table-responsive">
                    <div class="col-sm-12">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="PatientDataSource" DataKeyNames="patient_reg" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                            <Columns>
                                <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                <asp:BoundField DataField="patient_reg" HeaderText="ID" SortExpression="patient_reg" ReadOnly="True"></asp:BoundField>
                                <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name"></asp:BoundField>
                                <asp:BoundField DataField="father_name" HeaderText="Father Name" SortExpression="father_name"></asp:BoundField>
                                <asp:BoundField DataField="cnic" HeaderText="CNIC" SortExpression="father_name"></asp:BoundField>
                                <asp:BoundField DataField="city_name" HeaderText="City" SortExpression="father_name"></asp:BoundField>
                                <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address"></asp:BoundField>
                                <asp:BoundField DataField="mob" HeaderText="Mobile Number" SortExpression="mob"></asp:BoundField>
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
                                <asp:BoundField DataField="attendant_name" HeaderText="Attendant Name" SortExpression="attendant_name"></asp:BoundField>
                                <asp:BoundField DataField="attendant_mob" HeaderText="Attendant Mobile" SortExpression="attendant_mob"></asp:BoundField>
                                <asp:BoundField DataField="dob" HeaderText="Date Of Birth" SortExpression="dob"></asp:BoundField>
                                <asp:BoundField DataField="education" HeaderText="Education" SortExpression="education"></asp:BoundField>
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
                        <asp:SqlDataSource runat="server" ID="PatientDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT p.patient_reg,p.cnic,p.full_name,p.father_name,p.sex,p.address,(c.city_name) as city_name,p.mob,p.email,p.attendant_name,p.relation_id,p.attendant_mob,p.dob,p.ref_doctor_id,p.martial_status,p.education,p.occupation_id,p.source FROM patient_registeration as p , city c where p.city_id=c.city_id" DeleteCommand="DELETE FROM [patient_registeration] WHERE [patient_reg] = @patient_reg" InsertCommand="INSERT INTO [patient_registeration] ([patient_reg], [cnic], [full_name], [father_name], [sex], [address], [city_id], [mob], [email], [attendant_name], [relation_id], [attendant_mob], [dob], [ref_doctor_id], [martial_status], [education], [occupation_id], [source]) VALUES (@patient_reg, @cnic, @full_name, @father_name, @sex, @address, @city_id, @mob, @email, @attendant_name, @relation_id, @attendant_mob, @dob, @ref_doctor_id, @martial_status, @education, @occupation_id, @source)" UpdateCommand="UPDATE [patient_registeration] SET [cnic] = @cnic, [full_name] = @full_name, [father_name] = @father_name, [sex] = @sex, [address] = @address,  [mob] = @mob, [email] = @email, [attendant_name] = @attendant_name, [relation_id] = @relation_id, [attendant_mob] = @attendant_mob, [dob] = @dob, [ref_doctor_id] = @ref_doctor_id, [martial_status] = @martial_status, [education] = @education, [occupation_id] = @occupation_id, [source] = @source WHERE [patient_reg] = @patient_reg">
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
                                <asp:Parameter Name="city_name" Type="string"></asp:Parameter>
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
                            <UpdateParameters>
                                <asp:Parameter Name="cnic" Type="String"></asp:Parameter>
                                <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="father_name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="sex" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="address" Type="String"></asp:Parameter>
                                <asp:Parameter Name="city_name" Type="String"></asp:Parameter>
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
                        <asp:SqlDataSource ID="PatientSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT p.patient_reg,p.cnic,p.full_name,p.father_name,p.sex,p.address,(c.city_name) as city_name,p.mob,p.email,p.attendant_name,p.relation_id,p.attendant_mob,p.dob,p.ref_doctor_id,p.martial_status,p.education,p.occupation_id,p.source FROM patient_registeration as p , city c where p.city_id=c.city_id" FilterExpression="[full_name]+[email]+[mob]+[cnic] LIKE '%{0}%' and [city_name] like '{1}%'" DeleteCommand="DELETE FROM [patient_registeration] WHERE [patient_reg] = @patient_reg" InsertCommand="INSERT INTO [patient_registeration] ([patient_reg], [cnic], [full_name], [father_name], [sex], [address], [city_id], [mob], [email], [attendant_name], [relation_id], [attendant_mob], [dob], [ref_doctor_id], [martial_status], [education], [occupation_id], [source], [regDate]) VALUES (@patient_reg, @cnic, @full_name, @father_name, @sex, @address, @city_id, @mob, @email, @attendant_name, @relation_id, @attendant_mob, @dob, @ref_doctor_id, @martial_status, @education, @occupation_id, @source, @regDate)" UpdateCommand="UPDATE [patient_registeration] SET [cnic] = @cnic, [full_name] = @full_name, [father_name] = @father_name, [sex] = @sex, [address] = @address, [mob] = @mob, [email] = @email, [attendant_name] = @attendant_name, [relation_id] = @relation_id, [attendant_mob] = @attendant_mob, [dob] = @dob, [ref_doctor_id] = @ref_doctor_id, [martial_status] = @martial_status, [education] = @education, [occupation_id] = @occupation_id, [source] = @source, [regDate] = @regDate WHERE [patient_reg] = @patient_reg">
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
                                <asp:Parameter Name="city_name" Type="String"></asp:Parameter>
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
                                <asp:Parameter DbType="Date" Name="regDate"></asp:Parameter>
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="cnic" Type="String"></asp:Parameter>
                                <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="father_name" Type="String"></asp:Parameter>
                                <asp:Parameter Name="sex" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="address" Type="String"></asp:Parameter>
                                <asp:Parameter Name="city_name" Type="String"></asp:Parameter>
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
                                <asp:Parameter DbType="Date" Name="regDate"></asp:Parameter>
                                <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                            </UpdateParameters>
                            <FilterParameters>
                                <asp:ControlParameter Name="Name"
                                    ControlID="searchPatient_txt" PropertyName="Text" />
                                <asp:ControlParameter Name="City" ControlID="cityDDl" PropertyName="SelectedValue" Type="String" />
                            </FilterParameters>
                        </asp:SqlDataSource>
                    </div>

                </div>
                <br />
                <br />
            </div>
        </div>
    </form>
</asp:Content>