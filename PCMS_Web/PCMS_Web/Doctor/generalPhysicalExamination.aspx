<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="generalPhysicalExamination.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">    
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">General Physical Examination</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Pallor</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions" id="pallorYes_radio" value="option1">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions" id="pallorNo_radio" value="option2">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="pallorComment_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Jaundice</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions1" id="jaundiceYes_radio" value="option1">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions1" id="jaundiceNo_radio" value="option2">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="jaundiceComment_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Thyroid</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions2" id="thyroidYes_radio" value="option1">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions2" id="thyroidNo_radio" value="option2">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="thyroidComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Clubbing</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions3" id="clubbingYes_radio" value="option1">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions3" id="clubbingNo_radio" value="option2">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="clubbingComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Pulse</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions4" id="pulseYes_radio" value="option1">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions4" id="pulseNo_radio" value="option2">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="pulseComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Blood Pressure</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions5" id="bpYes_radio" value="option1">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions5" id="bpNo_radio" value="option2">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="bpComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Respiration Rate</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions6" id="repirationYes_radio" value="option1">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions6" id="respirationNo_radio" value="option2">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="respirationComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Lymph Nodes</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions7" id="lymphYes_radio" value="option1">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions7" id="lymphNo_radio" value="option2">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="lymphComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
                <div class="box-footer">
                    <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-info pull-right"/>
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
