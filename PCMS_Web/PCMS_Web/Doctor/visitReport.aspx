<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="visitReport.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm17" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server" class="form-inline">
        <div class="col-sm-12">
            <div class="form-group col-sm-6">
                <label class="col-sm-3 control-label" >Patient Id:</label>
                <asp:TextBox ID="patient" class="col-sm-9 form-control"  runat="server" Enabled="false"></asp:TextBox>
            </div>
            <div class="form-group col-sm-6">
                <label class="col-sm-3 control-label" >Visit Number:</label>
                <asp:DropDownList ID="DropDownList1" class="col-sm-4 form-control" runat="server" DataSourceID="visitDetail" DataTextField="visit_no" DataValueField="visit_no"></asp:DropDownList>
                <asp:ObjectDataSource ID="visitDetail" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.visitTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:Button ID="Button1" CssClass="col-sm-3 btn btn-primary pull-right" runat="server" Text="Show Report" OnClick="Button1_Click" />
            </div>            

        </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="800px" Width="800px">
            <LocalReport ReportPath="Reports\fullVisitReport.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource Name="complaint" DataSourceId="problem"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="history" DataSourceId="history"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="physicalExam" DataSourceId="phyExam"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="medicince" DataSourceId="medication"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="formation" DataSourceId="formation"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="investigation" DataSourceId="investigation"></rsweb:ReportDataSource>
                    <rsweb:ReportDataSource Name="systematicExam" DataSourceId="sysExman"></rsweb:ReportDataSource>
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>

        <asp:ObjectDataSource ID="formation" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.FormulationTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="Formulation" Type="String"></asp:Parameter>
                <asp:Parameter Name="managementPlans" Type="String"></asp:Parameter>
                <asp:Parameter Name="visit_no" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>

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
        <asp:ObjectDataSource ID="phyExam" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.generalPhysicalExaminationTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="height" Type="String"></asp:Parameter>
                <asp:Parameter Name="weight" Type="String"></asp:Parameter>
                <asp:Parameter Name="pulse" Type="String"></asp:Parameter>
                <asp:Parameter Name="skinEruption" Type="String"></asp:Parameter>
                <asp:Parameter Name="lying" Type="String"></asp:Parameter>
                <asp:Parameter Name="sitting" Type="String"></asp:Parameter>
                <asp:Parameter Name="standing" Type="String"></asp:Parameter>
                <asp:Parameter Name="temperature" Type="String"></asp:Parameter>
                <asp:Parameter Name="dehydration" Type="String"></asp:Parameter>
                <asp:Parameter Name="pallorRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="pallorTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="jaundiceRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="jaundiceTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="oedemaRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="oedemaTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="kylonychiaRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="kylonychiaTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="thyroidGlandRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="thyroidGlandTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="clubbingRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="clubbingTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="respirationRateRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="respirationRateTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="lymphNodeRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="lymphNodeTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="jvpTxt" Type="String"></asp:Parameter>
                <asp:Parameter Name="jvpDD" Type="String"></asp:Parameter>
                <asp:Parameter Name="visit_no" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="investigation" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.investigationTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="visit_no" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="completeBloodExamination" Type="String"></asp:Parameter>
                <asp:Parameter Name="completeUrineExamination" Type="String"></asp:Parameter>
                <asp:Parameter Name="liverFunctionTest" Type="String"></asp:Parameter>
                <asp:Parameter Name="ecg" Type="String"></asp:Parameter>
                <asp:Parameter Name="bloodSugarRb" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="bloodSugarArea" Type="String"></asp:Parameter>
                <asp:Parameter Name="thyroidFuctionTest" Type="String"></asp:Parameter>
                <asp:Parameter Name="radiography" Type="String"></asp:Parameter>
                <asp:Parameter Name="ulgranSonography" Type="String"></asp:Parameter>
                <asp:Parameter Name="ctScan" Type="String"></asp:Parameter>
                <asp:Parameter Name="otherComments" Type="String"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="medication" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.medicationTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="problem" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.ProblemListAndComplaintsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="sysExman" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.visitReportDataSetTableAdapters.systematicExaminationTableAdapter">
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="meningialIrritation" Type="String"></asp:Parameter>
                <asp:Parameter Name="carnivalNervers" Type="String"></asp:Parameter>
                <asp:Parameter Name="sensorySystem" Type="String"></asp:Parameter>
                <asp:Parameter Name="motorSystem" Type="String"></asp:Parameter>
                <asp:Parameter Name="superficialReflexes" Type="String"></asp:Parameter>
                <asp:Parameter Name="deepReflexes" Type="String"></asp:Parameter>
                <asp:Parameter Name="cerebellarFunctions" Type="String"></asp:Parameter>
                <asp:Parameter Name="fundoscopy" Type="String"></asp:Parameter>
                <asp:Parameter Name="cardioVascularSystem" Type="String"></asp:Parameter>
                <asp:Parameter Name="respiratorySystem" Type="String"></asp:Parameter>
                <asp:Parameter Name="gastroIntestinalSystem" Type="String"></asp:Parameter>
                <asp:Parameter Name="nervousSystem" Type="String"></asp:Parameter>
                <asp:Parameter Name="urogenitalSystem" Type="String"></asp:Parameter>
                <asp:Parameter Name="visit_no" Type="Int32"></asp:Parameter>
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>

        
    </form>
</asp:Content>
