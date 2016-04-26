<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="systematicExamination.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">    
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Systematic Examination</h3>
                </div>
                <div class="box-body">
                    <h4>CNS</h4><br/>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Signs of Meningial Irritation</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="meningialIrritationComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Cranial Nerves</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="cranialNervesComment_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Sensory System</label>
                            <div class="col-sm-8">
                                <textarea id="sensorySystem_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Motor System</label>
                            <div class="col-sm-8">
                                <textarea id="motorSystem_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <h4>Reflexes</h4><br />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Superficial Reflexes</label>
                            
                            <div class="col-sm-8">
                                <asp:TextBox ID="superficialReflexesComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Deep Reflexes</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="deepReflexComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Cerebellar Functions</label>
                            <div class="col-sm-8">
                                <textarea id="cerebellarFunctions_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Fundoscopy</label>
                            <div class="col-sm-8">
                                <textarea id="fundoscopy_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <hr/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Cardiovascular System</label>
                            <div class="col-sm-8">
                                <textarea id="cardiovascularSystem_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Respiratory System</label>
                            <div class="col-sm-8">
                                <textarea id="respiratorySystem_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Gastrointestinal System</label>
                            <div class="col-sm-8">
                                <textarea id="gastrointestinalSystem_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Nervous System</label>
                            <div class="col-sm-8">
                                <textarea id="nervousSystem_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-4 control-label">Urogenital System</label>
                            <div class="col-sm-8">
                                <textarea id="urogenitalSystem_area" cols="20" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <br/>
                    
                </div>
                <div class="box-footer">
                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" style="margin-left:10px"/>
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
