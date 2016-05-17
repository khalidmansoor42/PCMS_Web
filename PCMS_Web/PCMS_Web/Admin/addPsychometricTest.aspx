<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="addPsychometricTest.aspx.cs" Inherits="PCMS_Web.Admin.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Add/Update Psychometric Tests</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" runat="server">
                    <div class="box-body">

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Add Test</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Test Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="testName_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <asp:Button ID="addTest_btn" runat="server" Text="Add" CssClass="btn btn-info" OnClick="addTest_btn_Click"/>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Test Record</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-6">
                                <asp:TextBox ID="searchTest_txt" runat="server" CssClass="form-control" placeholder="Enter Test Name Here"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:Button ID="searchTest_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="searchTest_btn_Click"/>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="table-responsive">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="testId" DataSourceID="TestDataSource" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                            <asp:BoundField DataField="testId" HeaderText="Test ID" ReadOnly="True" InsertVisible="False" SortExpression="testId"></asp:BoundField>
                                            <asp:BoundField DataField="test_name" HeaderText="Test Name" SortExpression="test_name"></asp:BoundField>
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
                                    <asp:SqlDataSource runat="server" ID="TestDataSource" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [psychometric_evaluation_tests] WHERE [testId] = @testId" InsertCommand="INSERT INTO [psychometric_evaluation_tests] ([test_name]) VALUES (@test_name)" SelectCommand="SELECT * FROM [psychometric_evaluation_tests]" UpdateCommand="UPDATE [psychometric_evaluation_tests] SET [test_name] = @test_name WHERE [testId] = @testId">
                                        <DeleteParameters>
                                            <asp:Parameter Name="testId" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="test_name" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="test_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="testId" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="TestSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [psychometric_evaluation_tests] WHERE [testId] = @testId" InsertCommand="INSERT INTO [psychometric_evaluation_tests] ([test_name]) VALUES (@test_name)" SelectCommand="SELECT * FROM [psychometric_evaluation_tests] WHERE ([test_name] LIKE '%' + @test_name + '%')" UpdateCommand="UPDATE [psychometric_evaluation_tests] SET [test_name] = @test_name WHERE [testId] = @testId">
                                        <DeleteParameters>
                                            <asp:Parameter Name="testId" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="test_name" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="searchTest_txt" PropertyName="Text" Name="test_name" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="test_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="testId" Type="Int32"></asp:Parameter>
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
