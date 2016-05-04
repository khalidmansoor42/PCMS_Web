<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="addDiagnosesDiseases.aspx.cs" Inherits="PCMS_Web.Admin.WebForm13" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Add/Update Diagnoses Diseases</h3>
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
                                <label class="col-sm-3 control-label">Master Code</label>

                                <div class="col-sm-5">
                                    <asp:DropDownList ID="masterCode_ddl" CssClass="form-control" runat="server" DataSourceID="MasterCodeDataSource" DataTextField="masterCode" DataValueField="masterId"></asp:DropDownList>
                                    <asp:SqlDataSource runat="server" ID="MasterCodeDataSource" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' SelectCommand="SELECT * FROM [diagnosesMaster]"></asp:SqlDataSource>
                                </div>
                                <div class="col-sm-4">
                                    <asp:TextBox ID="diseaseCode_txt" CssClass="form-control" runat="server" placeholder="Type Disease Code"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <div class="col-sm-9">
                                    <asp:TextBox ID="diseaseName_txt" CssClass="form-control" runat="server" placeholder="Type Disease Name here"></asp:TextBox>
                                </div>
                                <div class="col-sm-3">
                                    <asp:Button ID="addDisease_btn" runat="server" Text="Add" CssClass="btn btn-info" OnClick="addDisease_btn_Click" />
                                </div>
                            </div>
                        </div>
                        <hr />

                        <div class="row">
                            <h4 class="col-sm-4 control-label" style="display: block; text-align: left;">Diagnoses Master Code Record</h4>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-6">
                                <asp:TextBox ID="searchDisease_txt" runat="server" CssClass="form-control" placeholder="Enter Disease Code Here"></asp:TextBox>
                            </div>
                            <div class="col-sm-2">
                                <asp:Button ID="searchDisease_btn" runat="server" Text="Search" CssClass="btn btn-info" OnClick="searchDisease_btn_Click" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="table-responsive">
                                <div class="col-sm-12">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="DiseaseNameDataSource" AutoGenerateColumns="False" DataKeyNames="diagnosesCode" AllowPaging="True" AllowSorting="True">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                                            <asp:BoundField DataField="diagnosesCode" HeaderText="Diagnoses Code" ReadOnly="True" SortExpression="diagnosesCode"></asp:BoundField>
                                            <asp:BoundField DataField="masterCode" HeaderText="Master Code" SortExpression="masterCode"></asp:BoundField>
                                            <asp:BoundField DataField="diseaseName" HeaderText="Disease Name" SortExpression="diseaseName"></asp:BoundField>
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
                                    <asp:SqlDataSource runat="server" ID="DiseaseNameDataSource" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [diagnosesDiseases] WHERE [diagnosesCode] = @diagnosesCode" InsertCommand="INSERT INTO [diagnosesDiseases] ([diagnosesCode], [masterCode], [diseaseName]) VALUES (@diagnosesCode, @masterCode, @diseaseName)" SelectCommand="SELECT * FROM [diagnosesDiseases]" UpdateCommand="UPDATE [diagnosesDiseases] SET [diseaseName] = @diseaseName WHERE [diagnosesCode] = @diagnosesCode">
                                        <DeleteParameters>
                                            <asp:Parameter Name="diagnosesCode" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="diagnosesCode" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="masterCode" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="diseaseName" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="diseaseName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="diagnosesCode" Type="String"></asp:Parameter>
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="DiseaseNameSearchDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [diagnosesDiseases] WHERE [diagnosesCode] = @diagnosesCode" InsertCommand="INSERT INTO [diagnosesDiseases] ([diagnosesCode], [masterCode], [diseaseName]) VALUES (@diagnosesCode, @masterCode, @diseaseName)" SelectCommand="SELECT * FROM [diagnosesDiseases] WHERE ([diagnosesCode] LIKE '%' + @diagnosesCode + '%')" UpdateCommand="UPDATE [diagnosesDiseases] SET [diseaseName] = @diseaseName WHERE [diagnosesCode] = @diagnosesCode">
                                        <DeleteParameters>
                                            <asp:Parameter Name="diagnosesCode" Type="String"></asp:Parameter>
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="diagnosesCode" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="masterCode" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="diseaseName" Type="String"></asp:Parameter>
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="searchDisease_txt" PropertyName="Text" Name="diagnosesCode" Type="String"></asp:ControlParameter>
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="diseaseName" Type="String"></asp:Parameter>
                                            <asp:Parameter Name="diagnosesCode" Type="String"></asp:Parameter>
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
