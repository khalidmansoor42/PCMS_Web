<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/adminMaster.Master" AutoEventWireup="true" CodeBehind="myProfile.aspx.cs" Inherits="PCMS_Web.Admin.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="alert alert-success" role="alert" runat="server" visible="false" id="Msg_alert">Record has been updated</div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Msg_alert').delay(2000).fadeOut();
        });
    </script>
     <form runat="server">    
        <div class="col-sm-12">
            <div class="box box-info">
                <div class="box-header with-border">
                  <h3 class="box-title">My Profile</h3>
                </div>
                <div class="box-body">
                    <div class="col-sm-4">
                        <asp:Image ID="userImage_img" runat="server" />
                        <asp:FileUpload ID="pictureUpload" runat="server" />
                    </div>
                    <div class="col-sm-8">
                        <div class="row">
                            <label class="col-sm-4 control-label">Full Name</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="fullName_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <label class="col-sm-4 control-label control-label">Father Name</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="fatherName_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <label class="col-sm-4 control-label control-label">Gender</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="gender_dd" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <label class="col-sm-4 control-label control-label">Mobile Number</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="mobile_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <label class="col-sm-4 control-label control-label">CNIC</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="cnic_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <label class="col-sm-4 control-label control-label">Email</label>
                            <div class="col-sm-8">
                                <asp:TextBox ID="email_txt" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div><br />
                        <div class="row">
                            <label class="col-sm-4 control-label control-label">Address</label>
                            <div class="col-sm-8">
                                <textarea id="address_area" runat="server" class="form-control"></textarea>
                            </div>
                        </div><br />
                    </div>
                </div>
                <div class="box-footer">
                    <asp:Button ID="updateProfile_btn" runat="server" Text="Update Profile" CssClass="btn btn-info pull-right" OnClick="updateProfile_btn_Click"/>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
