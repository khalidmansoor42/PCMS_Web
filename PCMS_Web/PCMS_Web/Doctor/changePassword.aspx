<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm3" %>
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
                            <asp:TextBox ID="currentPassword_txt" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                    </div><br />
                    <div class="row">
                        <label class="col-sm-2 col-sm-offset-3 control-label">New Password</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="newPassword_txt" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                    </div><br />
                    <div class="row">
                        <label class="col-sm-2 col-sm-offset-3 control-label">Confirm New Password</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="confirmPass_txt" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                        </div>
                    </div><br />
                </div>
                <div class="box-footer">
                <asp:Button Class="btn btn-info pull-right" ID="Button1" runat="server" Text="Change Password" />
                </div>
                
                
                   <br /><br />
            <div class="alert alert-danger" role="alert" hidden style="text-align:center" id="errorMsg_alert"></div>
            <div class="alert alert-success" role="alert" hidden style="text-align:center" id="successMsg_alert"></div>
            </div>
        </div>
    </form>
    <script src="http://code.jquery.com/jquery-latest.min.js"type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
      <script type ="text/javascript">
          $(document).ready(function () {
              $('#<%=Button1.ClientID %>').click(function () {
                  var obj = {};
                  obj.name = $.trim($("[id*=currentPassword_txt]").val());
                  obj.age = $.trim($("[id*=newPassword_txt]").val());
                  obj.conpass = $.trim($("[id*=confirmPass_txt]").val());
                  $.ajax({
                      type: "POST",
                      url: "changePassword.aspx/ServerSideMethod",
                      data: JSON.stringify(obj),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (r) {
                          var msg=r.d;
                          var res = msg.split("+");
                          if (res[1] == "Error") {
                              $("#errorMsg_alert").empty();
                              $("#errorMsg_alert").append(res[0]);
                              $("#errorMsg_alert").show("slow");
                              $('#errorMsg_alert').delay(1000).fadeOut();
                          } else {
                              $("#successMsg_alert").empty();
                              $("#successMsg_alert").append(res[0]);
                              $("#successMsg_alert").show("slow");
                              $('#successMsg_alert').delay(1000).fadeOut();
                          }
                          
                         

                      }
                 })
                 return false;
             });
         });
     </script>
</asp:Content>
