<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="investigation.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm12" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">    
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Investigation</h3>
                </div>
                <div class="box-body">

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Complete Blood Examination</label>
                            <div class="col-sm-8">
                                <textarea id="completeBloodExaminationComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Complete Urine Examination</label>
                            <div class="col-sm-8">
                                <textarea id="completeUrineExaminationComments_txt" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Liver Function Test</label>
                            <div class="col-sm-8">
                                <textarea id="liverTestComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">ECG</label>
                            <div class="col-sm-8">
                                <textarea id="ecgComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />
                    
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-5 control-label">Blood Sugar</label>
                            <div class="col-sm-7">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions" id="fasting_radio" value="option1">
                                    Fasting
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions" id="random_radio" value="option2">
                                    Random
                                </label>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <div class="col-sm-12">
                                <textarea id="bloodSugarComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Thyroid Function Test</label>
                            <div class="col-sm-8">
                                <textarea id="thyroidFunctionComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Radiography</label>
                            <div class="col-sm-8">
                                <textarea id="radiographyComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Ulgrasonography</label>
                            <div class="col-sm-8">
                                <textarea id="ulgrasonographyComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">CT Scan</label>
                            <div class="col-sm-8">
                                <textarea id="ctScanComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-2 control-label">Any Other</label>
                            <div class="col-sm-10">
                                <textarea id="otherComments_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br />

                </div>
                <div class="box-footer">
                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:10px"/>
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
