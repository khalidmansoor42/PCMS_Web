﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="prescription.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm10" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <form runat="server" class="form-inline">
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">Prescription Report</h3>
                </div>
                <div class="box-body">
                    <div class="form-group col-sm-6">
                        <label class="col-sm-3 control-label">Patient Id:</label>
                        <asp:TextBox ID="patient" class="col-sm-9 form-control" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="form-group col-sm-6">
                        <label class="col-sm-3 control-label">Visit Number:</label>
                        <asp:DropDownList ID="DropDownList1" class="col-sm-4 form-control" runat="server" DataSourceID="visitDetail" DataTextField="visit_no" DataValueField="visit_no"></asp:DropDownList>
                        <asp:ObjectDataSource ID="visitDetail" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.visitTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:Button ID="Button1" CssClass="col-sm-3 btn btn-primary pull-right" runat="server" Text="Show Report" OnClick="Button1_Click" />
                        <a class="btn btn-primary" onclick="Print()" runat="server">Print Report</a>
                        <br /><br />
                    </div>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="800px" Width="800px" ZoomMode="PageWidth">
                    <LocalReport ReportPath="Reports/prescription.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource Name="medication" DataSourceId="medication"></rsweb:ReportDataSource>
                            <rsweb:ReportDataSource Name="investingation" DataSourceId="investigation"></rsweb:ReportDataSource>
                            <rsweb:ReportDataSource Name="direction" DataSourceId="direction"></rsweb:ReportDataSource>
                            <rsweb:ReportDataSource Name="PatientDaignoses" DataSourceId="diagnoses"></rsweb:ReportDataSource>
                            <rsweb:ReportDataSource Name="counselling" DataSourceId="conselling"></rsweb:ReportDataSource>
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                    <asp:ObjectDataSource ID="medication" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.pres_medicationTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="investigation" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.pres_InvestigationTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="direction" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.visit1TableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>    
                    <asp:ObjectDataSource ID="diagnoses" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.patientDiagnosisTableAdapter">
                        <InsertParameters>
                            <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="visit_no" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="diseaseMasterCode" Type="String"></asp:Parameter>
                            <asp:Parameter Name="diseaseCode" Type="String"></asp:Parameter>
                            <asp:Parameter Name="diseaseName" Type="String"></asp:Parameter>
                            <asp:Parameter Name="comments" Type="String"></asp:Parameter>
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource> 
                    <asp:ObjectDataSource ID="conselling" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.counsellingTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                               
         
                </div>
            </div>
        </div>

    </form>
    <script type="text/javascript">
function Print() {
    var report = document.getElementById("<%=ReportViewer1.ClientID %>");
    var div = report.getElementsByTagName("DIV");
    var reportContents;
    for (var i = 0; i < div.length; i++) {
        if (div[i].id.indexOf("VisibleReportContent") != -1) {
            reportContents = div[i].innerHTML;
            break;
        }
    }
    var frame1 = document.createElement('iframe');
    frame1.name = "frame1";
    frame1.style.position = "absolute";
    frame1.style.top = "-1000000px";
    document.body.appendChild(frame1);
    var frameDoc = frame1.contentWindow ? frame1.contentWindow : frame1.contentDocument.document ? frame1.contentDocument.document : frame1.contentDocument;
    frameDoc.document.open();
    frameDoc.document.write('<html><head><title>RDLC Report</title>');
    frameDoc.document.write('</head><body style = "font-family:arial;font-size:10pt;">');
    frameDoc.document.write(reportContents);
    frameDoc.document.write('</body></html>');
    frameDoc.document.close();
    setTimeout(function () {
        window.frames["frame1"].focus();
        window.frames["frame1"].print();
        document.body.removeChild(frame1);
    }, 500);
}
</script>
</asp:Content>
