<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="addCounsellingTherapy.aspx.cs" Inherits="PCMS_Web.Admin.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Add/Update Counselling Advice</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" runat="server">
                    <div class="box-body">

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Add Therapy Advice</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Therapy Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="therapyName_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <asp:Button ID="addTherapy_btn" runat="server" Text="Add" CssClass="btn btn-info" OnClick="addTherapy_btn_Click"/>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Test Record</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-6">
                                <asp:TextBox ID="searchTherapy_txt" runat="server" CssClass="form-control" placeholder="Enter Therapy Name Here"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:Button ID="searchTherapy_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="searchTherapy_btn_Click"/>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="table-responsive">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="advise_id" DataSourceID="CounsellingDataSource" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                            <asp:BoundField DataField="advise_id" HeaderText="Advise ID" ReadOnly="True" SortExpression="advise_id"></asp:BoundField>
                                            <asp:BoundField DataField="therapy_advise" HeaderText="Therapy" SortExpression="therapy_advise"></asp:BoundField>
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
                                    <asp:SqlDataSource runat="server" ID="CounsellingDataSource" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [counselling_advise] WHERE [advise_id] = @advise_id" InsertCommand="INSERT INTO [counselling_advise] ([advise_id], [therapy_advise]) VALUES (@advise_id, @therapy_advise)" SelectCommand="SELECT * FROM [counselling_advise]" UpdateCommand="UPDATE [counselling_advise] SET [therapy_advise] = @therapy_advise WHERE [advise_id] = @advise_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="advise_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="advise_id" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="therapy_advise" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="therapy_advise" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="advise_id" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="CounsellingSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [counselling_advise] WHERE [advise_id] = @advise_id" InsertCommand="INSERT INTO [counselling_advise] ([advise_id], [therapy_advise]) VALUES (@advise_id, @therapy_advise)" SelectCommand="SELECT * FROM [counselling_advise] WHERE ([therapy_advise] LIKE '%' + @therapy_advise + '%')" UpdateCommand="UPDATE [counselling_advise] SET [therapy_advise] = @therapy_advise WHERE [advise_id] = @advise_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="advise_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="advise_id" Type="Int32"></asp:Parameter>
                                            <asp:Parameter Name="therapy_advise" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="searchTherapy_txt" PropertyName="Text" Name="therapy_advise" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="therapy_advise" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="advise_id" Type="Int32"></asp:Parameter>
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
