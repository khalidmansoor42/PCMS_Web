<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="loginHistory.aspx.cs" Inherits="PCMS_Web.Admin.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        
            <div class="col-sm-12">
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Login History</h3>
                    </div>
                    <div class="box-body">
                        <div class="col-sm-12">
                                <div class="table-responsive">
                                    <asp:GridView ID="loginHistory_grid" runat="server" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" DataSourceID="LoginHistoryDataSource" AllowSorting="True" AllowPaging="True">
                                        <Columns>
                                            <asp:BoundField DataField="login" HeaderText="Login Time" SortExpression="login"></asp:BoundField>
                                            <asp:BoundField DataField="logout" HeaderText="Logout Time" SortExpression="logout"></asp:BoundField>
                                            <asp:BoundField DataField="ip_address" HeaderText="IP Address" SortExpression="ip_address"></asp:BoundField>
                                            <asp:BoundField DataField="hostname" HeaderText="Host Name" SortExpression="hostname"></asp:BoundField>
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
                                    <asp:SqlDataSource runat="server" ID="LoginHistoryDataSource" ConnectionString='<%$ ConnectionStrings:doctorConnectionString %>' SelectCommand="SELECT [login], [logout], [ip_address], [hostname] FROM [login_history] WHERE ([employee_id] = @employee_id)">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="userId" Name="employee_id" Type="Int32"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</asp:Content>
