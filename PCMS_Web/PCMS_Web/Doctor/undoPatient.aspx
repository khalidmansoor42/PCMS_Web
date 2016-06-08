<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="undoPatient.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Undo Patient</h3>
                </div>
                <div class="box-body">

                        <div class="row">
                                
                <form runat="server">
                    <asp:TextBox ID="emp" runat="server" Hidden></asp:TextBox>
                    <asp:TextBox ID="date" runat="server" Hidden></asp:TextBox>

                    <div class="col-sm-12">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="patient_reg" DataSourceID="undo" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="full_name" HeaderText="Patient Name" SortExpression="full_name"></asp:BoundField>
                                    <asp:BoundField DataField="patient_reg" HeaderText="Patient ID" ReadOnly="True" SortExpression="patient_reg"></asp:BoundField>
                                    <asp:BoundField DataField="token_no" HeaderText="Token Number" SortExpression="token_no"></asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkView_Click">Uncheck</asp:LinkButton>
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
                    <asp:SqlDataSource runat="server" ID="undo" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' SelectCommand="SELECT p.full_name, p.patient_reg, r.token_no FROM patient_registeration AS p INNER JOIN visit AS v ON p.patient_reg = v.patient_reg INNER JOIN receipt AS r ON p.patient_reg = r.patient_reg AND v.patient_reg = r.patient_reg AND v.employee_id = r.employee_id and v.visit_no = r.visit_no WHERE (v.visit_date = @Param1) AND (v.checks = '1') AND (v.employee_id = @Param2) AND (r.Date = @Param3)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="date" PropertyName="Text" Name="Param1"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="emp" PropertyName="Text" Name="Param2"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="date" PropertyName="Text" Name="Param3"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </form>
            </div>
    </div>
                </div>
            </div>
        </div>
</asp:Content>
