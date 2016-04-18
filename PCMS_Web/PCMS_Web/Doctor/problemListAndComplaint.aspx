<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="problemListAndComplaint.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm4" %>
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
    <head runat="server"></head>
              <form id="form1" runat="server">
                  <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <p>Problem Added Successfully!</p>
                </div>
                  <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label runat="server" ID="error"></asp:Label>
                </div>

                
                    <div class="col-sm-12">
                        <div class="box box-primary">
                          <div class="box-header">
                             <h3 class="box-title">Problem List and Complaints
                             </h3>
                            </div>
                    
	    	        <div class="table-responsive" style="min-height:500px">
                        <div class="col-sm-12">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:GridView ID="Gridview1" CssClass="table" runat="server" ShowFooter="True" AutoGenerateColumns="False" OnRowCreated="Gridview1_RowCreated">
                            <Columns>
                                <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
                                <asp:TemplateField HeaderText="Problem">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true">
                                            <asp:ListItem Value="-1">Select</asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Since">
                                    <ItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox2" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="InActive">
                                    <ItemTemplate>
                                        <asp:Button ID="InActive" runat="server" Text="InActive" OnClick="InActiveButton_Click" />
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
				   </div>
                   <div class="box-footer">
                    <div class="pull-right">
                        <asp:Button ID="Submit_btn" runat="server" Text="Submit" type = "submit" class = "btn btn-primary" OnClick="add_Problem"/>
                    <//div>
                </div>
               </div>
            </div>
</form>

</asp:Content>
