<%@ Page Title="" Language="C#" MasterPageFile="~/Receptionist/receptionMaster.Master" AutoEventWireup="true" CodeBehind="receipt.aspx.cs" Inherits="PCMS_Web.Receptionist.WebForm6" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
        <div class="col-md-12">
            <form id="form1" runat="server">
                            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click1" />
<script type="text/javascript">
            function doPrint() {
                var prtContent = document.getElementById('<%= ReportViewer1.ClientID %>');
        prtContent.border = 0; //set no border here
        var WinPrint = window.open('', '', 'left=150,top=100,width=1000,height=1000,toolbar=0,scrollbars=1,status=0,resizable=1');
        WinPrint.document.write(prtContent.outerHTML);
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
        WinPrint.close();
    }
   </script>   
 
</body>

                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
                                <localreport reportembeddedresource="PCMS_Web.Reports.Receipt.rdlc">
                                </localreport>
                            </rsweb:ReportViewer>
               </form>
        </div>
     </div>
    <script type="text/javascript">
        
</script>
</asp:Content>
