<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="addDiagnosesCode.aspx.cs" Inherits="PCMS_Web.Admin.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Add/Update Diagnoses Code</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" runat="server">
                    <div class="box-body">

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Add Diagnoses Master Code</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Code</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="cityName_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <asp:Button ID="addCity_btn" runat="server" Text="Add" CssClass="btn btn-info" OnClick="addCity_btn_Click" />
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Diagnoses Master Code Record</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-6">
                                <asp:TextBox ID="searchPatient_txt" runat="server" CssClass="form-control" placeholder="Enter Code Here"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:Button ID="searchPatient_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="searchPatient_btn_Click" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="table-responsive">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="DiagnosesMasterDataSource" AutoGenerateColumns="False" DataKeyNames="masterId" AllowPaging="True" AllowSorting="True">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                            <asp:BoundField DataField="masterId" HeaderText="masterId" ReadOnly="True" InsertVisible="False" SortExpression="masterId"></asp:BoundField>
                                            <asp:BoundField DataField="masterCode" HeaderText="masterCode" SortExpression="masterCode"></asp:BoundField>
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

                                    <asp:SqlDataSource runat="server" ID="DiagnosesMasterDataSource" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [diagnosesMaster] WHERE [masterId] = @masterId" InsertCommand="INSERT INTO [diagnosesMaster] ([masterCode]) VALUES (@masterCode)" SelectCommand="SELECT * FROM [diagnosesMaster]" UpdateCommand="UPDATE [diagnosesMaster] SET [masterCode] = @masterCode WHERE [masterId] = @masterId">
                                        <DeleteParameters>
                                            <asp:Parameter Name="masterId" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="masterCode" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="masterCode" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="masterId" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="DiagnosesMasterSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [diagnosesMaster] WHERE [masterId] = @masterId" InsertCommand="INSERT INTO [diagnosesMaster] ([masterCode]) VALUES (@masterCode)" SelectCommand="SELECT * FROM [diagnosesMaster] WHERE ([masterCode] LIKE '%' + @masterCode + '%')" UpdateCommand="UPDATE [diagnosesMaster] SET [masterCode] = @masterCode WHERE [masterId] = @masterId">
                                        <DeleteParameters>
                                            <asp:Parameter Name="masterId" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="masterCode" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="searchPatient_txt" PropertyName="Text" Name="masterCode" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="masterCode" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="masterId" Type="Int32"></asp:Parameter>
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
