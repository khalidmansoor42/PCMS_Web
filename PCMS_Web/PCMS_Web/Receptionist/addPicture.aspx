<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="addPicture.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=alert_success.ClientID %>").style.display = "none";
            }, seconds * 1000);

            setTimeout(function () {
                document.getElementById("<%=alert_fail.ClientID %>").style.display = "none";
     }, seconds * 1000);
 };

</script>
    <form id="form1" runat="server">
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">General Physical Examination</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="col-sm-10 col-sm-offset-1">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Patient Information</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4 control-label">Patient ID</label>

                                            <div class="col-sm-8">
                                                <asp:TextBox ID="patientId_txt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4 control-label">Visit Number</label>

                                            <div class="col-sm-8">
                                                <asp:TextBox ID="visitNumber_txt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4 control-label">Patient Name</label>

                                            <div class="col-sm-8">
                                                <asp:TextBox ID="patientName" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <label class="col-sm-4 control-label">Age</label>

                                            <div class="col-sm-8">
                                                <asp:TextBox ID="ageTxt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <hr />
                    <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <p>Problem Added Successfully!</p>
                    </div>
                    <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label runat="server" ID="error"></asp:Label>
                    </div>

                    <div class="panel-heading" style="background-color: lightblue">
                        <h3 class="panel-title"><i class=""></i>Upload Files</h3>
                    </div>

                    <div id="Div1" class="panel-body" runat="server" style="background-color: white">
                        <div class="table-responsive">
                            <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" CssClass="btn btn-primary"/>
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" CssClass="btn btn-default"/>
                            <hr />
                            <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="fileId" DataSourceID="FileDataSource" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                                    <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id"></asp:BoundField>
                                    <asp:BoundField DataField="FileName" HeaderText="File Name" SortExpression="FileName"></asp:BoundField>
                                    <asp:BoundField DataField="FilePath" HeaderText="File Path" SortExpression="FilePath"></asp:BoundField>
                                    <asp:BoundField DataField="ContentType" HeaderText="Content Type" SortExpression="ContentType"></asp:BoundField>
                                    <asp:BoundField DataField="fileId" HeaderText="File ID" ReadOnly="True" InsertVisible="False" SortExpression="fileId"></asp:BoundField>
                                    <asp:TemplateField HeaderText="View File">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="link1" runat="server" Text="View" NavigateUrl='<%# "../dist/"+"Files/" + Eval("FileName") %>' Target="_blank"></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                            <asp:SqlDataSource runat="server" ID="FileDataSource" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' DeleteCommand="DELETE FROM [UploadedFiles] WHERE [fileId] = @fileId" InsertCommand="INSERT INTO [UploadedFiles] ([id], [FileName], [FilePath], [ContentType]) VALUES (@id, @FileName, @FilePath, @ContentType)" SelectCommand="SELECT * FROM [UploadedFiles] WHERE ([id] = @id)" UpdateCommand="UPDATE [UploadedFiles] SET [id] = @id, [FileName] = @FileName, [FilePath] = @FilePath, [ContentType] = @ContentType WHERE [fileId] = @fileId">
                                <DeleteParameters>
                                    <asp:Parameter Name="fileId" Type="Int64"></asp:Parameter>
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="FileName" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="FilePath" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="ContentType" Type="String"></asp:Parameter>
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="PatientId" Name="id" Type="Int32"></asp:SessionParameter>
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                                    <asp:Parameter Name="FileName" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="FilePath" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="ContentType" Type="String"></asp:Parameter>
                                    <asp:Parameter Name="fileId" Type="Int64"></asp:Parameter>
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form> 
</asp:Content>
