<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="problemListAndComplaint.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=alert_fail.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
              <form id="form1" runat="server">

                  <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <asp:Label runat="server" ID="error"></asp:Label>
                </div>

                <div class="row">
                  <div class="col-md-12">
                    <div class="box box-primary">
                      <div class="box-header">
                         <h3 class="box-title">Dashboard</h3>
                    </div>
                    <div class="box-body">
                    <div class="panel panel-default">
                    <div class="panel-heading"  style="background-color:lightblue">
                     <h3 class="panel-title" ><i class=""></i>Problem And Diagnosis</h3>
                        
                   </div>
                    <div id="Div1" class="panel-body" runat="server">
	    	        <div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                       <asp:gridview ID="Gridview1"  style="margin-left:25%" runat="server"  ShowFooter="True"  AutoGenerateColumns="False"  OnRowCreated="Gridview1_RowCreated" Height="184px" Width="433px">  
                        <Columns>  
                          <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />  
                            <asp:TemplateField  HeaderText="Problem">  
                    <ItemTemplate>  
                        <asp:DropDownList ID="DropDownList1" runat="server"  AppendDataBoundItems="true">  
                        <asp:ListItem Value="-1">Select</asp:ListItem>  
                    </asp:DropDownList>  
                </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Since">  
                <ItemTemplate>  
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>  
                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox2" />
                </ItemTemplate>  
            </asp:TemplateField>  
              
            <asp:TemplateField HeaderText="InActive">  
                <ItemTemplate>  
                   <asp:Button ID="InActive" runat="server"  Text="InActive"   onclick="InActiveButton_Click" /> 
                </ItemTemplate>  
                <FooterStyle HorizontalAlign="Right" />  
                <FooterTemplate>  
                    <asp:Button ID="ButtonAdd" runat="server"   Text="Add New Row"   onclick="ButtonAdd_Click" />  
                </FooterTemplate>  
            </asp:TemplateField>  
            <asp:TemplateField>  
                <ItemTemplate>  
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Remove</asp:LinkButton>  
                </ItemTemplate>  
            </asp:TemplateField>  
        </Columns>  
    </asp:gridview>  

				   </div>
                  <div class="pull-right">
                    <asp:Button ID="Submit_btn" runat="server" Text="Submit Order" style = "margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="add_Problem"/>
                   </div>
                  </div>
                 </div>
                </div>
               </div>
              </div>
             </div>
</form>

</asp:Content>
