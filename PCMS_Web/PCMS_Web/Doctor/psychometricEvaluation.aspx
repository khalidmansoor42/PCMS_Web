<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="psychometricEvaluation.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm20" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head id="Head1" runat="server">
    </head>
    <script type="text/javascript">
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<% =alert_success.ClientID %>").style.display = "none";
            }, seconds * 1000);

            setTimeout(function () {
                document.getElementById("<% =alert_fail.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <p>Problem Added Successfully!</p>
    </div>
        <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label runat="server" ID="error"></asp:Label>
        </div>

    <div style="background-color: white">
        <div class="box-header with-border">
            <h3 class="box-title">Psychometric Evaluation</h3>
        </div>
        <!-- /.box-header -->
        <!-- form start -->
        <form class="form-horizontal" runat="server">
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
                <div class="table-responsive">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" ShowFooter="true" OnRowCreated="GridView1_RowCreated" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <Columns>
                            <asp:BoundField DataField="RowNumber" HeaderText="Row Number">
                                <HeaderStyle VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Test">
                                <ItemTemplate>
                                    <ajaxToolkit:ComboBox ID="ComboBox1" runat="server" AutoCompleteMode="Suggest">
                                    </ajaxToolkit:ComboBox>
                                    <asp:RequiredFieldValidator ID="cbValidator1" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="ComboBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Score">
                                <ItemTemplate>
                                    <asp:TextBox ID="score_txt" CssClass="form-control" runat="server" Text="0"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="tbValidator1" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="score_txt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Findings">
                                <ItemTemplate>
                                    <asp:TextBox ID="comments_area" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>

                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <FooterTemplate>
                                    <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click" />
                                </FooterTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Remove</asp:LinkButton>
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
                </div>
                <div class="box-footer">
                    <asp:Button ID="Submit_btn" runat="server" Text="Save" Style="margin-left: 2px" type="submit" class="btn btn-primary pull-right" OnClick="add_Problem" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>
