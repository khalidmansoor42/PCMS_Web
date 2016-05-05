<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="prescription.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm14" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form runat="server" class="form-inline">
        <div class="col-md-12">

        <label for="email" class="col-md-3 form-control" >Patient Id:</label>
        <asp:TextBox ID="patient" class="col-md-3 form-control"  runat="server"></asp:TextBox>
        <label for="email" class="col-md-3 form-control" >Visit Number:</label>

        <asp:DropDownList ID="DropDownList1" class="col-md-3 form-control" runat="server" DataSourceID="visitDetail" DataTextField="visit_no" DataValueField="visit_no"></asp:DropDownList>
        <asp:ObjectDataSource ID="visitDetail" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.visitTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:Button ID="Button1" CssClass="col-md-3 btn btn-pinterest" runat="server" Text="Show Report" OnClick="Button1_Click" />
            <script type="text/javascript">
            function doPrint() {
                var prtContent = document.getElementById('<%= ReportViewer1.ClientID %>');
        prtContent.border = 0; //set no border here
        var WinPrint = window.open('', '', 'left=150,top=100,width=1000,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
        WinPrint.document.write(prtContent.outerHTML);
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
        WinPrint.close();
    }
   </script>   
 <asp:Button ID="PrintButton" runat="server" Text="Print" OnClientClick="doPrint();" ToolTip="Print Report"/>
 
        </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="800px" Width="800px">
              <LocalReport ReportPath="Reports\prescription.rdlc">
                  <DataSources>
                      <rsweb:ReportDataSource Name="DataSet1" DataSourceId="ObjectDataSource3"></rsweb:ReportDataSource>
                      <rsweb:ReportDataSource Name="gerneralHistory" DataSourceId="history"></rsweb:ReportDataSource>
                      <rsweb:ReportDataSource Name="medication" DataSourceId="medication"></rsweb:ReportDataSource>
                  </DataSources>
              </LocalReport>
          </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="history" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.general_history1TableAdapter">
            <InsertParameters>
                <asp:Parameter Name="diabetes" Type="Byte"></asp:Parameter>
                <asp:Parameter Name="insulin" Type="Byte"></asp:Parameter>
                <asp:Parameter Name="hypertention" Type="Byte"></asp:Parameter>
                <asp:Parameter Name="cardiac" Type="String"></asp:Parameter>
                <asp:Parameter Name="respiratory" Type="String"></asp:Parameter>
                <asp:Parameter Name="rinal" Type="String"></asp:Parameter>
                <asp:Parameter Name="cancer" Type="String"></asp:Parameter>
                <asp:Parameter Name="other_illness" Type="String"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="medication" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.medicationTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.ProblemListAndComplaintsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
    
     </form>
</asp:Content>
