<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form runat="server">    
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">Change Password</h3>
                </div>
                <div class="box-body">
                    <div class="row">
                        <label class="col-sm-2 col-sm-offset-3 control-label">Current Password</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="currentPassword_txt" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div><br />
                    <div class="row">
                        <label class="col-sm-2 col-sm-offset-3 control-label">New Password</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="newPassword_txt" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div><br />
                    <div class="row">
                        <label class="col-sm-2 col-sm-offset-3 control-label">Confirm New Password</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="confirmPass_txt" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div><br />
                </div>
                <div class="box-footer">
                    <asp:Button ID="changePassword_btn" runat="server" Text="Change Password" CssClass="btn btn-info pull-right"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
