<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="systematicMedication.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm8" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <html>
    <head>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script type="text/javascript">
            // Load the Google Transliterate API
            google.load("elements", "1", {
                packages: "transliteration"
            });

            function onLoad() {
                var options = {
                    sourceLanguage:
                    google.elements.transliteration.LanguageCode.ENGLISH,
                    destinationLanguage:
                    [google.elements.transliteration.LanguageCode.URDU],
                    shortcutKey: 'ctrl+e',
                    transliterationEnabled: true
                };

                // Create an instance on TransliterationControl with the required
                // options.
                var control = new google.elements.transliteration.TransliterationControl(options);

                // Enable transliteration in the textbox with id
                // 'transliterateTextarea'.
                control.makeTransliteratable(['transliterateTextarea']);


            }
            google.setOnLoadCallback(onLoad);
        </script>
        <script type="text/javascript">
            function HideLabel() {
                var seconds = 5;
                setTimeout(function () {
                    document.getElementById("<%=alert_success.ClientID %>").style.display = "none";
                   }, seconds * 1000);

                   setTimeout(function () {
                       document.getElementById("<%=alert_fail.ClientID %>").style.display = "none";
                   }, seconds * 1000);
               };
        </script>

    </head>

    <form id="form1" runat="server">

        <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <p>Problem Added Successfully!</p>
        </div>
        <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label runat="server" ID="error"></asp:Label>
        </div>
        <div class="panel-heading" style="background-color: lightblue">
            <h3 class="panel-title"><i class=""></i>Systematic Medication</h3>

        </div>
        <div id="Div1" class="panel-body" runat="server" style="background-color: white">
            <div>

                <div>

                    <asp:GridView ID="Gridview1" runat="server" CssClass="table" ShowFooter="True" AutoGenerateColumns="False" OnRowCreated="Gridview1_RowCreated" Width="742px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">

                        <Columns>

                            <asp:BoundField DataField="RowNumber" HeaderText="Row Number">

                                <HeaderStyle VerticalAlign="Middle" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="Medicine Name">

                                <ItemTemplate>

                                    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true">

                                        <asp:ListItem Value="-1">Select</asp:ListItem>

                                    </asp:DropDownList>

                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="صبح">

                                <ItemTemplate>

                                    <asp:TextBox ID="morning_txt" runat="server" Text="0"> </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="morning_txt" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="morning_txt" ForeColor="Red" ValidationExpression="\d+" Display="Static" EnableClientScript="true" ErrorMessage="numbers only" runat="server" />
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="دوپہر">

                                <ItemTemplate>

                                    <asp:TextBox ID="aterNoon_txt" runat="server" Text="0"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="aterNoon_txt" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="aterNoon_txt" ForeColor="Red" ValidationExpression="\d+" Display="Static" EnableClientScript="true" ErrorMessage="numbers only" runat="server" />
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="شام">

                                <ItemTemplate>

                                    <asp:TextBox ID="evening_txt" runat="server" Text="0"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="evening_txt" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="evening_txt" ForeColor="Red" ValidationExpression="\d+" Display="Static" EnableClientScript="true" ErrorMessage="numbers only" runat="server" />
                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Direction">

                                <ItemTemplate>
                                    <textarea id="transliterateTextarea" name="temp" style="width: 150px; height: 25px"></textarea>


                                </ItemTemplate>

                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Duration">

                                <ItemTemplate>

                                    <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="true">

                                        <asp:ListItem Value="-1">Select</asp:ListItem>

                                    </asp:DropDownList>

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duration Period">

                                <ItemTemplate>

                                    <asp:TextBox ID="durationPeriod_txt" runat="server" Text="0"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" SetFocusOnError="true" ErrorMessage="Required" ControlToValidate="durationPeriod_txt" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="durationPeriod_txt" ForeColor="Red" ValidationExpression="\d+" Display="Static" EnableClientScript="true" ErrorMessage="numbers only" runat="server" />
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />

                                <FooterTemplate>

                                    <asp:Button ID="ButtonAdd" runat="server" Text="Add New Row" OnClick="ButtonAdd_Click" />

                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Remove</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                        <FooterStyle BackColor="White" ForeColor="#000066"></FooterStyle>

                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White"></HeaderStyle>

                        <PagerStyle HorizontalAlign="Left" BackColor="White" ForeColor="#000066"></PagerStyle>

                        <RowStyle ForeColor="#000066"></RowStyle>

                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

                        <SortedAscendingHeaderStyle BackColor="#007DBB"></SortedAscendingHeaderStyle>

                        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

                        <SortedDescendingHeaderStyle BackColor="#00547E"></SortedDescendingHeaderStyle>
                    </asp:GridView>

                </div>
                <div class="pull-right">
                    <asp:Button ID="Submit_btn" runat="server" Text="Save" Style="margin-left: 2px" type="submit" class="btn btn-primary" OnClick="add_Problem" />
                </div>
            </div>
        </div>

    </form>
    </html>
</asp:Content>
