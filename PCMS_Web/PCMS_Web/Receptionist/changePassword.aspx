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
                    <asp:Button ID="changePassword_btn" runat="server" Text="Change Password"  currentPassword_txtCssClass="btn btn-info pull-right"/>
                </div>
                
                
                <asp:Button ID="Button1" runat="server" Text="Click" />
                   <br /><br />
                    <div id="myDiv"></div>
            
            
            
            </div>
        </div>
    </form>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
      <script type ="text/javascript">
          $(document).ready(function () {
              $('#<%=Button1.ClientID %>').click(function () {
                  var obj = {};
                  obj.name = $.trim($("[id*=currentPassword_txt]").val());
                  obj.age = $.trim($("[id*=newPassword_txt]").val());
                  $.ajax({
                      type: "POST",
                      url: "changePassword.aspx/ServerSideMethod",
                      data: JSON.stringify(obj),
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (r) {
                          alert(r.d);
                      }
                 })
                 return false;
             });
         });
     </script>

</asp:Content>
