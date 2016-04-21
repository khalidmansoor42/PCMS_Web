<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="attendantRelation.aspx.cs" Inherits="PCMS_Web.Admin.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Add/Update Attendant Relation</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" runat="server">
                    <div class="box-body">

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Add Relation</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-4 control-label">Relation Name</label>

                                <div class="col-sm-8">
                                    <asp:TextBox ID="relationName_txt" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <asp:Button ID="addRelation_btn" runat="server" Text="Add" CssClass="btn btn-info" OnClick="addRelation_btn_Click"/>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Attendant Record</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-6">
                                <asp:TextBox ID="searchAttendant_txt" runat="server" CssClass="form-control" placeholder="Enter Relation Name Here"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:LinkButton ID="searchRelation_btn" runat="server" CssClass="btn btn-info" OnClick="searchRelation_btn_Click">Search</asp:LinkButton>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="table-responsive">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="relation_id" DataSourceID="RelationDataSource" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True"></asp:CommandField>
                                            <asp:BoundField DataField="relation_id" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="relation_id"></asp:BoundField>
                                            <asp:BoundField DataField="relation_name" HeaderText="Relation Name" SortExpression="relation_name"></asp:BoundField>
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
                                    <asp:SqlDataSource runat="server" ID="RelationDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' DeleteCommand="DELETE FROM [attendantRelation] WHERE [relation_id] = @relation_id" InsertCommand="INSERT INTO [attendantRelation] ([relation_name]) VALUES (@relation_name)" SelectCommand="SELECT * FROM [attendantRelation]" UpdateCommand="UPDATE [attendantRelation] SET [relation_name] = @relation_name WHERE [relation_id] = @relation_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="relation_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="relation_name" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="relation_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="relation_id" Type="Int32"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>

                                    <asp:SqlDataSource ID="RelationSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' DeleteCommand="DELETE FROM [attendantRelation] WHERE [relation_id] = @relation_id" InsertCommand="INSERT INTO [attendantRelation] ([relation_name]) VALUES (@relation_name)" SelectCommand="SELECT * FROM [attendantRelation] WHERE ([relation_name] LIKE '%' + @relation_name + '%')" UpdateCommand="UPDATE [attendantRelation] SET [relation_name] = @relation_name WHERE [relation_id] = @relation_id">
                                        <DeleteParameters>
                                            <asp:Parameter Name="relation_id" Type="Int32"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="relation_name" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="searchAttendant_txt" PropertyName="Text" Name="relation_name" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="relation_name" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="relation_id" Type="Int32"></asp:Parameter>
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
