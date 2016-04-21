<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="addComplaint.aspx.cs" Inherits="PCMS_Web.Admin.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Add/Update Complaint Name</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" runat="server">
                    <div class="box-body">

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Add Complaint</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Complaint Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="complaintName_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <asp:Button ID="addComplaint_btn" runat="server" Text="Add" CssClass="btn btn-info" OnClick="addComplaint_btn_Click" />
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Complaint Record</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-6">
                                <asp:TextBox ID="searchComplaint_txt" runat="server" CssClass="form-control" placeholder="Enter Complaint Name Here"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:LinkButton ID="searchComplaint_btn" runat="server" CssClass="btn btn-info" OnClick="searchComplaint_btn_Click">Search</asp:LinkButton>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="table-responsive">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataKeyNames="complain_id" DataSourceID="ComplaintDataSource" AllowPaging="True" AllowSorting="True">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                            <asp:BoundField DataField="complain_id" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="complain_id"></asp:BoundField>
                                            <asp:BoundField DataField="complain_name" HeaderText="Complaint Name" SortExpression="complain_name"></asp:BoundField>
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
                                    <asp:SqlDataSource runat="server" ID="ComplaintDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' DeleteCommand="DELETE FROM [complain_names] WHERE [complain_id] = @complain_id" InsertCommand="INSERT INTO [complain_names] ([complain_name]) VALUES (@complain_name)" SelectCommand="SELECT * FROM [complain_names]" UpdateCommand="UPDATE [complain_names] SET [complain_name] = @complain_name WHERE [complain_id] = @complain_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="complain_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="complain_name" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="complain_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="complain_id" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="ComplaintSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' DeleteCommand="DELETE FROM [complain_names] WHERE [complain_id] = @complain_id" InsertCommand="INSERT INTO [complain_names] ([complain_name]) VALUES (@complain_name)" SelectCommand="SELECT * FROM [complain_names] WHERE ([complain_name] LIKE '%' + @complain_name + '%')" UpdateCommand="UPDATE [complain_names] SET [complain_name] = @complain_name WHERE [complain_id] = @complain_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="complain_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="complain_name" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="searchComplaint_txt" PropertyName="Text" Name="complain_name" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="complain_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="complain_id" Type="Int32"></asp:Parameter>
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
