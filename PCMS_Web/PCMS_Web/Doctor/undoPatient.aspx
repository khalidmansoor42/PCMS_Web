<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="undoPatient.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">
        <asp:TextBox ID="emp" runat="server" Hidden></asp:TextBox>
        <asp:TextBox ID="date" runat="server" Hidden></asp:TextBox>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="patient_reg" DataSourceID="undo">
        <Columns>
            <asp:BoundField DataField="full_name" HeaderText="Name" SortExpression="full_name"></asp:BoundField>
            <asp:BoundField DataField="patient_reg" HeaderText="Patient_reg" ReadOnly="True" SortExpression="patient_reg"></asp:BoundField>
            <asp:BoundField DataField="token_no" HeaderText="Token No." SortExpression="token_no"></asp:BoundField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="lnkView_Click">Uncheck</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="undo" ConnectionString='<%$ ConnectionStrings:PCMS_ConnectionString %>' SelectCommand="SELECT p.full_name, p.patient_reg, r.token_no FROM patient_registeration AS p INNER JOIN visit AS v ON p.patient_reg = v.patient_reg INNER JOIN receipt AS r ON p.patient_reg = r.patient_reg AND v.patient_reg = r.patient_reg AND v.employee_id = r.employee_id and v.visit_no = r.visit_no WHERE (v.visit_date = @Param1) AND (v.checks = '1') AND (v.employee_id = @Param2) AND (r.Date = @Param3)">
        <SelectParameters>
            <asp:ControlParameter ControlID="date" PropertyName="Text" Name="Param1"></asp:ControlParameter>
            <asp:ControlParameter ControlID="emp" PropertyName="Text" Name="Param2"></asp:ControlParameter>
            <asp:ControlParameter ControlID="date" PropertyName="Text" Name="Param3"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
   </form>

</asp:Content>
