<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="formulation.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">    
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Formulation</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <label class="col-sm-2 col-sm-offset-2 control-label">Formulations</label>
                        <div class="col-sm-5">
                            <textarea id="formulation_area" cols="20" rows="5" class="form-control"></textarea>
                        </div>
                    </div><br />
                    <div class="row">
                        <label class="col-sm-2 col-sm-offset-2 control-label">Management Plans</label>
                        <div class="col-sm-5">
                            <textarea id="managementSkills_area" cols="20" rows="5" class="form-control"></textarea>
                        </div>
                    </div><br />
                </div>
                <div class="box-footer">
                    <asp:Button ID="submit_btn" runat="server" Text="Submit" CssClass="btn btn-info pull-right"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
