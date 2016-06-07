<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="WebForm23.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm23" %>

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
                        <br /><br />
                        
                    </div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="800px" Width="800px">
                            <LocalReport ReportPath="Reports\FormulationReport.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource Name="illness" DataSourceId="illness"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="HistoryDrug" DataSourceId="HistoryDrug"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="PersonalInfo" DataSourceId="personalinfo"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="HistoryFamily" DataSourceId="historyFamily"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="complaint" DataSourceId="complaint"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="mentalState" DataSourceId="mentalState"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="generalPhysical" DataSourceId="generalPhysicalExam"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="systemicExam" DataSourceId="systemExam"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="investigation" DataSourceId="investigation"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="medication" DataSourceId="medicationsys"></rsweb:ReportDataSource>
                                    <rsweb:ReportDataSource Name="counsellingFormation" DataSourceId="counselling"></rsweb:ReportDataSource>
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                        <asp:ObjectDataSource ID="illness" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.illnessHistoryTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="illHistoryText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="currentTreatmentText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="pastMedHistoryText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="pastPsychHistoryText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="cureRb" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="cureText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="previousText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="previousAdmissions" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="treatmentHistoryDd" Type="String"></asp:Parameter>
                                <asp:Parameter Name="pastMedicalHistoryDd" Type="String"></asp:Parameter>
                                <asp:Parameter Name="pastPsychiatricHistoryDd" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="HistoryDrug" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.drugHistoryTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="drugsText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="dosageText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="durationText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="reponseText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="reactionText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="faithTreatmentText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="forensicHistoryText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="faithTreatmentRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="forensicHistoryRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="policeCaseRadio" Type="Int32"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="personalinfo" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.personalDetailsTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="prenatalText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="perinatalText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="postnatalText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="milestoneRb" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="childhoodText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="schoolingText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="educationRb" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="occupationText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="incomeText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="psychoSexualhistoryText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="menstrualHistoryText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="maritalStatusDD" Type="String"></asp:Parameter>
                                <asp:Parameter Name="genderDD" Type="String"></asp:Parameter>
                                <asp:Parameter Name="childrenText" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="spouseRelationshipText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="hobbiesText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="characteristicText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="behaviorText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="attitudeText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="relationText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="achievementsText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="religiousText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="aptitudesText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="otherText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="startOfSchooling" Type="String"></asp:Parameter>
                                <asp:Parameter Name="occupation" Type="String"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="historyFamily" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.familyHistoryTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="temperamentDD" Type="String"></asp:Parameter>
                                <asp:Parameter Name="familyPsychIllDD" Type="String"></asp:Parameter>
                                <asp:Parameter Name="fatherText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="motherText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="siblingsText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="illnessTypeDD" Type="String"></asp:Parameter>
                                <asp:Parameter Name="abuseHistoryDD" Type="String"></asp:Parameter>
                                <asp:Parameter Name="typeText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="durationText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="amountText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="abuseModeText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="detoxificationText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="patient_reg" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="admissionToxificationRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="noOfDetoxAdmissionsDd" Type="Int32"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="complaint" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.ComplaintTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="mentalState" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.mentalStateExaminationTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="Physical_Appearance" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Dress" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Posture" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Rapport" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Eye_Contact" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Cooperative" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Communicative" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Psychomotor_activity" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Movements" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Involuntary" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Voluntary" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Speech" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Tone" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Relevance" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Coherence" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Volume" Type="String"></asp:Parameter>
                                <asp:Parameter Name="volume2" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Sample_of_talk" Type="String"></asp:Parameter>
                                <asp:Parameter Name="mood_Subjective" Type="String"></asp:Parameter>
                                <asp:Parameter Name="mood_Objective" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Stream_of_thoughts_Poverty" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Stream_of_thoughts_Pressure" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Stream_of_thoughts_Thought" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Flight_of_Ideas" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Clang_association" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Loosening_of_association" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Knights_move" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Derailment" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Word_salad" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Taking_past_the_point" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Tangentiality" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Circumstanciality" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Preservation" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Neologism" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Suicidal_Ideatio" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Homicidal_Ideation" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Hopelessness" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Helplessness" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Worthlessness" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="DelusionsType" Type="String"></asp:Parameter>
                                <asp:Parameter Name="DelusionsContent" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Delusions_of_reference" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Grandiose_guilt" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Nihilistic" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Hypochondriacal" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Religious" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Sexual" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Delusion_of_control" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Thought_insertion" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Withdrawal" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Thought_broadcasting" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Obsessive_Compulsive_Phenomena" Type="String"></asp:Parameter>
                                <asp:Parameter Name="PHOBIAS" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Disorders_Of_Perception" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Depersonalization" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="hallucinations" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Auditory_redio" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Illusions" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="IllusionsText" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Consciousness" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Orientation" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Serial_Seven" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Serial_Three" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Serial_Seven_Text" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Serial_Three_Text" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Intelligence" Type="String"></asp:Parameter>
                                <asp:Parameter Name="IQ" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Memory" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Judgement" Type="String"></asp:Parameter>
                                <asp:Parameter Name="General_Knowledge" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Concrete_thinking" Type="Byte"></asp:Parameter>
                                <asp:Parameter Name="Concrete_thinking_Text" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Abstrac_thinking" Type="String"></asp:Parameter>
                                <asp:Parameter Name="Insight" Type="String"></asp:Parameter>
                                <asp:Parameter Name="patient_id" Type="Int32"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="generalPhysicalExam" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.generalPhysicalExaminationTableAdapter">
                            <InsertParameters>
                                <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="height" Type="String"></asp:Parameter>
                                <asp:Parameter Name="weight" Type="String"></asp:Parameter>
                                <asp:Parameter Name="pulse" Type="String"></asp:Parameter>
                                <asp:Parameter Name="skinEruption" Type="String"></asp:Parameter>
                                <asp:Parameter Name="lyingSystolic" Type="String"></asp:Parameter>
                                <asp:Parameter Name="sittingSystolic" Type="String"></asp:Parameter>
                                <asp:Parameter Name="standingSystolic" Type="String"></asp:Parameter>
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
                                <asp:Parameter Name="lyingDiastolic" Type="String"></asp:Parameter>
                                <asp:Parameter Name="standingDiastolic" Type="String"></asp:Parameter>
                                <asp:Parameter Name="sittingDiastolic" Type="String"></asp:Parameter>
                                <asp:Parameter Name="skinErruptionDd" Type="String"></asp:Parameter>
                                <asp:Parameter Name="dehydrationRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="swellingRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="pigmentationRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="repigmentationRadio" Type="Int32"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="systemExam" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.systematicExaminationTableAdapter">
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
                                <asp:Parameter Name="cranialNervesRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="sensorySystemRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="motorSystemRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="superficialRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="deepReflexRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="cerebellarRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="fundoscopyRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="cardiovascularRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="respiratoryRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="gastrointestinalRadio" Type="Int32"></asp:Parameter>
                                <asp:Parameter Name="urogenitalRadio" Type="Int32"></asp:Parameter>
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="investigation" runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.investigationTableAdapter">
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
                    <asp:ObjectDataSource ID="medicationsys" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.sysMedicationTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="counselling" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="PCMS_Web.AppData.formulationDatasetTableAdapters.counsellingTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="Param2" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="patient" PropertyName="Text" Name="Param1" Type="Int32"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    </div>
                </div>
            </div>
          </form>
</asp:Content>
