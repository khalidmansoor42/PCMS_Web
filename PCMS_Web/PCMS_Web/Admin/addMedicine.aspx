<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="addMedicine.aspx.cs" Inherits="PCMS_Web.Admin.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Add/Update Medicine</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" runat="server">
                    <div class="box-body">

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Add Medicine</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Medicine Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="medicineName_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <asp:Button ID="addMedicine_btn" runat="server" Text="Add" CssClass="btn btn-info" OnClick="addMedicine_btn_Click"/>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Medicine Record</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-6">
                                <asp:TextBox ID="searchMedicine_txt" runat="server" CssClass="form-control" placeholder="Enter Medicine Name Here"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:Button ID="searchMedicine_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="searchMedicine_btn_Click"/>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="table-responsive">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="med_id" DataSourceID="MedicineDataSource" AllowPaging="True" AllowSorting="True">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                            <asp:BoundField DataField="med_id" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="med_id"></asp:BoundField>
                                            <asp:BoundField DataField="med_name" HeaderText="Medicine Name" SortExpression="med_name"></asp:BoundField>
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

                                    <asp:SqlDataSource runat="server" ID="MedicineDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' DeleteCommand="DELETE FROM [medicine] WHERE [med_id] = @med_id" InsertCommand="INSERT INTO [medicine] ([med_name]) VALUES (@med_name)" SelectCommand="SELECT * FROM [medicine]" UpdateCommand="UPDATE [medicine] SET [med_name] = @med_name WHERE [med_id] = @med_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="med_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="med_name" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="med_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="med_id" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="MedicineSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT * FROM [medicine] WHERE ([med_name] LIKE '%' + @med_name + '%')" DeleteCommand="DELETE FROM [medicine] WHERE [med_id] = @med_id" InsertCommand="INSERT INTO [medicine] ([med_name]) VALUES (@med_name)" UpdateCommand="UPDATE [medicine] SET [med_name] = @med_name WHERE [med_id] = @med_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="med_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="med_name" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="searchMedicine_txt" PropertyName="Text" Name="med_name" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="med_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="med_id" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.box-body -->

                </form>
            </div>
        </div>
    </div>
</asp:Content>
