<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="addPicture.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm13" %>
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
                <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="Upload" />
                <hr />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                        <asp:BoundField DataField="FileName" HeaderText="File Name" />
                        <asp:BoundField DataField="FilePath" HeaderText="File Path" />
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

    </form> 
</asp:Content>
