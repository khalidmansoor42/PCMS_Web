<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="searchUsers.aspx.cs" Inherits="PCMS_Web.Admin.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        
            <div class="col-sm-12">
            <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Update Patient Record</h3>
            </div>

            <div class="row">
                <div class="col-sm-4 col-sm-offset-6">
                    <asp:TextBox ID="searchPatient_txt" runat="server" CssClass="form-control" placeholder="Enter Patient Name Here"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="searchPatient_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="searchPatient_btn_Click" />
                </div>
            </div><br />

            <div class="table-responsive">
                <div class="col-sm-12">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="UserDataSource" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="employee_id">
                        <Columns>
                            <asp:CommandField ShowEditButton="True"></asp:CommandField>
                            <asp:BoundField DataField="employee_id" HeaderText="ID" SortExpression="employee_id" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name"></asp:BoundField>
                            <asp:BoundField DataField="father_name" HeaderText="Father Name" SortExpression="father_name"></asp:BoundField>
                            <asp:BoundField DataField="sex" HeaderText="Gender" SortExpression="sex"></asp:BoundField>
                            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address"></asp:BoundField>
                            <asp:BoundField DataField="mob" HeaderText="Mobile" SortExpression="mob"></asp:BoundField>
                            <asp:BoundField DataField="cnic" HeaderText="CNIC" SortExpression="cnic"></asp:BoundField>
                            <asp:BoundField DataField="dob" HeaderText="Date Of Birth" SortExpression="dob"></asp:BoundField>
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
                            <asp:BoundField DataField="city_id" HeaderText="City ID" SortExpression="city_id"></asp:BoundField>
                            <asp:BoundField DataField="date_registeration" HeaderText="Registeration Date" SortExpression="date_registeration"></asp:BoundField>
                            <asp:BoundField DataField="user_type" HeaderText="User Type" SortExpression="user_type"></asp:BoundField>
                            <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password"></asp:BoundField>
                            <asp:BoundField DataField="user_name" HeaderText="User Name" SortExpression="user_name"></asp:BoundField>
                            <asp:BoundField DataField="active" HeaderText="Active" SortExpression="active"></asp:BoundField>
                            <asp:BoundField DataField="image" HeaderText="Image" SortExpression="image"></asp:BoundField>
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


                    <asp:SqlDataSource runat="server" ID="UserDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT * FROM [user_registeration]" DeleteCommand="DELETE FROM [user_registeration] WHERE [employee_id] = @employee_id" InsertCommand="INSERT INTO [user_registeration] ([employee_id], [full_name], [father_name], [sex], [address], [mob], [cnic], [dob], [email], [city_id], [date_registeration], [user_type], [password], [user_name], [active], [image]) VALUES (@employee_id, @full_name, @father_name, @sex, @address, @mob, @cnic, @dob, @email, @city_id, @date_registeration, @user_type, @password, @user_name, @active, @image)" UpdateCommand="UPDATE [user_registeration] SET [full_name] = @full_name, [father_name] = @father_name, [sex] = @sex, [address] = @address, [mob] = @mob, [cnic] = @cnic, [dob] = @dob, [email] = @email, [city_id] = @city_id, [date_registeration] = @date_registeration, [user_type] = @user_type, [password] = @password, [user_name] = @user_name, [active] = @active, [image] = @image WHERE [employee_id] = @employee_id">
                        <DeleteParameters>
                            <asp:Parameter Name="employee_id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="employee_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="father_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="sex" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="address" Type="String"></asp:Parameter>
                            <asp:Parameter Name="mob" Type="String"></asp:Parameter>
                            <asp:Parameter Name="cnic" Type="String"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="dob"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="city_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="date_registeration"></asp:Parameter>
                            <asp:Parameter Name="user_type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="password" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="active" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="image" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="father_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="sex" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="address" Type="String"></asp:Parameter>
                            <asp:Parameter Name="mob" Type="String"></asp:Parameter>
                            <asp:Parameter Name="cnic" Type="String"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="dob"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="city_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="date_registeration"></asp:Parameter>
                            <asp:Parameter Name="user_type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="password" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="active" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="image" Type="String"></asp:Parameter>
                            <asp:Parameter Name="employee_id" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="UserSearchSqlDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT * FROM [user_registeration] WHERE ([full_name] LIKE '%' + @full_name + '%')" DeleteCommand="DELETE FROM [user_registeration] WHERE [employee_id] = @employee_id" InsertCommand="INSERT INTO [user_registeration] ([employee_id], [full_name], [father_name], [sex], [address], [mob], [cnic], [dob], [email], [city_id], [date_registeration], [user_type], [password], [user_name], [active], [image]) VALUES (@employee_id, @full_name, @father_name, @sex, @address, @mob, @cnic, @dob, @email, @city_id, @date_registeration, @user_type, @password, @user_name, @active, @image)" UpdateCommand="UPDATE [user_registeration] SET [full_name] = @full_name, [father_name] = @father_name, [sex] = @sex, [address] = @address, [mob] = @mob, [cnic] = @cnic, [dob] = @dob, [email] = @email, [city_id] = @city_id, [date_registeration] = @date_registeration, [user_type] = @user_type, [password] = @password, [user_name] = @user_name, [active] = @active, [image] = @image WHERE [employee_id] = @employee_id">
                        <DeleteParameters>
                            <asp:Parameter Name="employee_id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="employee_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="father_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="sex" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="address" Type="String"></asp:Parameter>
                            <asp:Parameter Name="mob" Type="String"></asp:Parameter>
                            <asp:Parameter Name="cnic" Type="String"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="dob"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="city_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="date_registeration"></asp:Parameter>
                            <asp:Parameter Name="user_type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="password" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="active" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="image" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="searchPatient_txt" PropertyName="Text" Name="full_name" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="full_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="father_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="sex" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="address" Type="String"></asp:Parameter>
                            <asp:Parameter Name="mob" Type="String"></asp:Parameter>
                            <asp:Parameter Name="cnic" Type="String"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="dob"></asp:Parameter>
                            <asp:Parameter Name="email" Type="String"></asp:Parameter>
                            <asp:Parameter Name="city_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter DbType="Date" Name="date_registeration"></asp:Parameter>
                            <asp:Parameter Name="user_type" Type="String"></asp:Parameter>
                            <asp:Parameter Name="password" Type="String"></asp:Parameter>
                            <asp:Parameter Name="user_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="active" Type="Byte"></asp:Parameter>
                            <asp:Parameter Name="image" Type="String"></asp:Parameter>
                            <asp:Parameter Name="employee_id" Type="Int32"></asp:Parameter>
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
                
            </div>
                <br/><br/>
            </div>
        </div>
    </form>
</asp:Content>
