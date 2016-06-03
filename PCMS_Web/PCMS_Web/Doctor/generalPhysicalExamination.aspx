<%@ Page Title="" Language="C#" MasterPageFile="~/Doctor/doctorMaster.Master" AutoEventWireup="true" CodeBehind="generalPhysicalExamination.aspx.cs" Inherits="PCMS_Web.Doctor.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <head>
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

        function Radio_Click() {
            var radio1 = document.getElementById("<%=oedemaYes_radio.ClientID %>");
               var textBox = document.getElementById("<%=oedemaComments_txt.ClientID %>");
               textBox.disabled = !radio1.checked;
               textBox.focus();

               var radio2 = document.getElementById("<%=pallorYes_radio.ClientID %>");
                var textBox1 = document.getElementById("<%=pallorComment_txt.ClientID %>");
               textBox1.disabled = !radio2.checked;
               textBox1.focus();

               var radio3 = document.getElementById("<%=jaundiceYes_radio.ClientID %>");
                var textBox2 = document.getElementById("<%=jaundiceComment_txt.ClientID %>");
               textBox2.disabled = !radio3.checked;
               textBox2.focus();

               var radio4 = document.getElementById("<%=kylonychiaYes_radio.ClientID %>");
                var textBox3 = document.getElementById("<%=kylonchiaComments_txt.ClientID %>");
               textBox3.disabled = !radio4.checked;
               textBox3.focus();

               var radio5 = document.getElementById("<%=thyroidYes_radio.ClientID %>");
                var textBox4 = document.getElementById("<%=thyroidComments_txt.ClientID %>");
               textBox4.disabled = !radio5.checked;
               textBox4.focus();

               var radio6 = document.getElementById("<%=clubbingYes_radio.ClientID %>");
                var textBox5 = document.getElementById("<%=clubbingComments_txt.ClientID %>");
               textBox5.disabled = !radio6.checked;
               textBox5.focus();

               var radio7 = document.getElementById("<%=respirationYes_radio.ClientID %>");
                var textBox6 = document.getElementById("<%=respirationComments_txt.ClientID %>");
               textBox6.disabled = !radio7.checked;
               textBox6.focus();

               var radio8 = document.getElementById("<%=lymphYes_radio.ClientID %>");
                var textBox7 = document.getElementById("<%=lymphComments_txt.ClientID %>");
               textBox7.disabled = !radio8.checked;
               textBox7.focus();
                
               var radio9 = document.getElementById("<%=yesDehydration_radio.ClientID %>");
            var textBox10 = document.getElementById("<%=dehydrationComments_txt.ClientID %>");
            textBox10.disabled = !radio9.checked;
            textBox10.focus();

        }

            function pigmentation()
            {
                if (document.getElementById("<%= yesPigmentation_radio.ClientID %>").checked) {
                    var repigmenDiv = document.getElementById("repigmentation_div").style.display = 'block';
                }
                else {
                    var repigmenDiv = document.getElementById("repigmentation_div").style.display = 'none';
                }
            }

            function swelling()
            {
                if (document.getElementById("<%= yesSwelling_radio.ClientID %>").checked) {
                    var repigmenDiv = document.getElementById("jvp_div").style.display = 'block';
                }
                else {
                    var repigmenDiv = document.getElementById("jvp_div").style.display = 'none';
                }
            }


            window.onload = function () {
                if (document.getElementById('<%=noDehydration_radio.ClientID %>').checked) {
                    var lblObj = document.getElementById("<%=dehydrationComments_txt.ClientID %>").disabled = true;
                }

                if (document.getElementById('<%=yesPigmentation_radio.ClientID %>').checked) {
                    var repigmenDiv = document.getElementById("repigmentation_div").style.display = 'block';
                }

                if (document.getElementById('<%=yesSwelling_radio.ClientID %>').checked) {
                    var repigmenDiv = document.getElementById("jvp_div").style.display = 'block';
                }
            }
        </script>
   </head>
    
    <div class="row">
        <div class="col-md-12">
            <div class="box box-info">
                <div class="box-header with-border">
                    <h3 class="box-title">General Physical Examination</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form runat="server">
                    <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="Div1">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <p>Problem Added Successfully!</p>
                    </div>
                    <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="Div2">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <asp:Label runat="server" ID="Label1"></asp:Label>
                    </div>
                    <div class="box-body">

                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">Patient Information</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group col-sm-6">
                                                <label class="col-sm-4 control-label">Patient ID</label>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="patientId_txt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="col-sm-4 control-label">Visit Number</label>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="visitNumber_txt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-sm-6">
                                                <label class="col-sm-4 control-label">Patient Name</label>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="patientName" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group col-sm-6">
                                                <label class="col-sm-4 control-label">Age</label>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="ageTxt" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <hr />

        <div class="alert alert-success alert-dismissible" role="alert" runat="server" visible="false" id="alert_success">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <p>Added Successfully!</p>
        </div>
        <div class="alert alert-danger alert-dismissible" role="alert" runat="server" visible="false" id="alert_fail">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <asp:Label runat="server" ID="error"></asp:Label>
        </div>
        
                    <div class="row">
                        <br />
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Height</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="height_dd" runat="server" CssClass="form-control">
                                    <asp:ListItem>Shorter than 5'</asp:ListItem>
                                    <asp:ListItem>5'1 in</asp:ListItem>
                                    <asp:ListItem>5'2 in</asp:ListItem>
                                    <asp:ListItem>5'3 in</asp:ListItem>
                                    <asp:ListItem>5'5 in</asp:ListItem>
                                    <asp:ListItem>5'6 in</asp:ListItem>
                                    <asp:ListItem>5'7 in</asp:ListItem>
                                    <asp:ListItem>5'8 in</asp:ListItem>
                                    <asp:ListItem>5'9 in</asp:ListItem>
                                    <asp:ListItem>5'10 in</asp:ListItem>
                                    <asp:ListItem>5'11 in</asp:ListItem>
                                    <asp:ListItem>5'12 in</asp:ListItem>
                                    <asp:ListItem>6'</asp:ListItem>
                                    <asp:ListItem>taller than 6'</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Weight</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="weight_dd" runat="server" CssClass="form-control">
                                    <asp:ListItem>Less than 30 kg</asp:ListItem>
                                    <asp:ListItem>35-40 kg</asp:ListItem>
                                    <asp:ListItem>40-45 kg</asp:ListItem>
                                    <asp:ListItem>45-50 kg</asp:ListItem>
                                    <asp:ListItem>50-55 kg</asp:ListItem>
                                    <asp:ListItem>55-60 kg</asp:ListItem>
                                    <asp:ListItem>60-65 kg</asp:ListItem>
                                    <asp:ListItem>65-70 kg</asp:ListItem>
                                    <asp:ListItem>75-80 kg</asp:ListItem>
                                    <asp:ListItem>80-85 kg</asp:ListItem>
                                    <asp:ListItem>85-90 kg</asp:ListItem>
                                    <asp:ListItem>90-95 kg</asp:ListItem>
                                    <asp:ListItem>Greater than 100 kg</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Pulse</label>
                            <div class="col-sm-9">
                                <asp:DropDownList ID="pulse_dd" runat="server" CssClass="form-control">
                                    <asp:ListItem>Less than 40</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>41</asp:ListItem>
                                    <asp:ListItem>42</asp:ListItem>
                                    <asp:ListItem>43</asp:ListItem>
                                    <asp:ListItem>44</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                    <asp:ListItem>46</asp:ListItem>
                                    <asp:ListItem>47</asp:ListItem>
                                    <asp:ListItem>48</asp:ListItem>
                                    <asp:ListItem>49</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>51</asp:ListItem>
                                    <asp:ListItem>52</asp:ListItem>
                                    <asp:ListItem>53</asp:ListItem>
                                    <asp:ListItem>54</asp:ListItem>
                                    <asp:ListItem>55</asp:ListItem>
                                    <asp:ListItem>56</asp:ListItem>
                                    <asp:ListItem>57</asp:ListItem>
                                    <asp:ListItem>58</asp:ListItem>
                                    <asp:ListItem>59</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                    <asp:ListItem>61</asp:ListItem>
                                    <asp:ListItem>62</asp:ListItem>
                                    <asp:ListItem>63</asp:ListItem>
                                    <asp:ListItem>64</asp:ListItem>
                                    <asp:ListItem>65</asp:ListItem>
                                    <asp:ListItem>66</asp:ListItem>
                                    <asp:ListItem>67</asp:ListItem>
                                    <asp:ListItem>68</asp:ListItem>
                                    <asp:ListItem>69</asp:ListItem>
                                    <asp:ListItem>70</asp:ListItem>
                                    <asp:ListItem>71</asp:ListItem>
                                    <asp:ListItem>72</asp:ListItem>
                                    <asp:ListItem>73</asp:ListItem>
                                    <asp:ListItem>74</asp:ListItem>
                                    <asp:ListItem>75</asp:ListItem>
                                    <asp:ListItem>76</asp:ListItem>
                                    <asp:ListItem>77</asp:ListItem>
                                    <asp:ListItem>78</asp:ListItem>
                                    <asp:ListItem>79</asp:ListItem>
                                    <asp:ListItem>80</asp:ListItem>
                                    <asp:ListItem>81</asp:ListItem>
                                    <asp:ListItem>82</asp:ListItem>
                                    <asp:ListItem>83</asp:ListItem>
                                    <asp:ListItem>84</asp:ListItem>
                                    <asp:ListItem>85</asp:ListItem>
                                    <asp:ListItem>86</asp:ListItem>
                                    <asp:ListItem>87</asp:ListItem>
                                    <asp:ListItem>88</asp:ListItem>
                                    <asp:ListItem>89</asp:ListItem>
                                    <asp:ListItem>91</asp:ListItem>
                                    <asp:ListItem>92</asp:ListItem>
                                    <asp:ListItem>93</asp:ListItem>
                                    <asp:ListItem>94</asp:ListItem>
                                    <asp:ListItem>95</asp:ListItem>
                                    <asp:ListItem>96</asp:ListItem>
                                    <asp:ListItem>97</asp:ListItem>
                                    <asp:ListItem>98</asp:ListItem>
                                    <asp:ListItem>99</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>Greater than 100</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        
                    </div>
                    <hr />
                    <h4>Blood Pressure</h4>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-2">
                            <label class="col-sm-3 control-label">Lying</label>
                        </div>
                        <div class="col-sm-10">
                            <label class="col-sm-2 control-label">Systolic</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="lyingSystolic_txt" runat="server" CssClass="form-control" placeholder="Readings"></asp:TextBox>
                            </div>
                            <label class="col-sm-2 control-label">Diastolic</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="lyingDiastolic_txt" runat="server" CssClass="form-control" placeholder="Readings"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-2">
                            <label class="col-sm-3 control-label">Sitting</label>
                        </div>
                        <div class="col-sm-10">
                            <label class="col-sm-2 control-label">Systolic</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="sittingSystolic_txt" runat="server" CssClass="form-control" placeholder="Readings"></asp:TextBox>
                            </div>
                            <label class="col-sm-2 control-label">Diastolic</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="sittingDiastolic_txt" runat="server" CssClass="form-control" placeholder="Readings"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                        <br />
                    <div class="row">
                        <div class="form-group col-sm-2">
                            <label class="col-sm-3 control-label">Standing</label>
                        </div>
                        <div class="col-sm-10">
                            <label class="col-sm-2 control-label">Systolic</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="standingSystolic_txt" runat="server" CssClass="form-control" placeholder="Readings"></asp:TextBox>
                            </div>
                            <label class="col-sm-2 control-label">Diastolic</label>
                            <div class="col-sm-4">
                                <asp:TextBox ID="standingDiastolic_txt" runat="server" CssClass="form-control" placeholder="Readings"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                        <br />
                        <div class="row">
                            <div class="form-group col-sm-6">
                                <label class="col-sm-3 control-label">Temperature</label>
                                <div class="col-sm-9">
                                    <asp:TextBox ID="temperatureComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <br />
                    <div class="row">
                        <div class="form-group col-sm-6">    
                            <label class="col-sm-3 control-label">Skin Eruption</label>
                            <div class="col-sm-3">
                                <asp:DropDownList ID="skinEruption_dd" runat="server" CssClass="form-control">
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Regular</asp:ListItem>
                                    <asp:ListItem>Irregular</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="skinEruption_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Dehydration</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptionsF" id="yesDehydration_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptionsF" id="noDehydration_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="dehydrationComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Pallor</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions" id="pallorYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions" id="pallorNo_radio" value="option2" onclick="Radio_Click()">
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
                                    <input runat="server" type="radio" name="inlineRadioOptions1" id="jaundiceYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions1" id="jaundiceNo_radio" value="option2" onclick="Radio_Click()">
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
                            <label class="col-sm-3 control-label">Oedema</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions9" id="oedemaYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions9" id="oedemaNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="oedemaComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Kylonychia</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions10" id="kylonychiaYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions10" id="kylonchiaNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="kylonchiaComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Thyroid Gland</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions2" id="thyroidYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions2" id="thyroidNo_radio" value="option2" onclick="Radio_Click()">
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
                                    <input runat="server" type="radio" name="inlineRadioOptions3" id="clubbingYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions3" id="clubbingNo_radio" value="option2" onclick="Radio_Click()">
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
                            <label class="col-sm-3 control-label">Respiration Rate</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions6" id="respirationYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions6" id="respirationNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="respirationComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="col-sm-3 control-label">Lymph Node</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptions7" id="lymphYes_radio" value="option1" onclick="Radio_Click()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptions7" id="lymphNo_radio" value="option2" onclick="Radio_Click()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-6">
                                <asp:TextBox ID="lymphComments_txt" runat="server" CssClass="form-control" placeholder="Comments"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <div class="form-group col-sm-8">
                            <label class="col-sm-2 control-label">JVP</label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="jvp1_dd" runat="server" CssClass="form-control">
                                    <asp:ListItem>Not Raised</asp:ListItem>
                                    <asp:ListItem>Raised</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="form-group col-sm-12">
                            <label class="col-sm-2 control-label">Swelling</label>
                            <div class="col-sm-3">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptionsD" id="yesSwelling_radio" value="option1" onclick="swelling()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptionsD" id="noSwelling_radio" value="option2" onclick="swelling()">
                                    No
                                </label>
                            </div>
                            <div class="col-sm-3" id="jvp_div" style="display:none">
                                <asp:DropDownList ID="jvp_dd" runat="server" CssClass="form-control">
                                    <asp:ListItem>Neuro Fibromas</asp:ListItem>
                                    <asp:ListItem>Aseess</asp:ListItem>
                                    <asp:ListItem>Lipoma</asp:ListItem>
                                    <asp:ListItem>Lumps</asp:ListItem>
                                    <asp:ListItem>Any other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <br />
                        <div class="row">
                        <div class="form-group col-sm-6">
                            <label class="col-sm-4 control-label">Pigmentation</label>
                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptionsB" id="yesPigmentation_radio" value="option1" onclick="pigmentation()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptionsB" id="noPigmentation_radio" value="option2" onclick="pigmentation()">
                                    No
                                </label>
                            </div>
                        </div>
                            <div class="form-group col-sm-6" id="repigmentation_div" style="display:none">
                            <label class="col-sm-4 control-label">Repigmentation</label>
                            <div class="col-sm-8">
                                <label class="radio-inline">
                                    <input runat="server" type="radio" name="inlineRadioOptionsC" id="yesRepigmentation_radio" value="option1" onclick="pigmentation()">
                                    Yes
                                </label>
                                <label class="radio-inline">
                                    <input runat="server" type="radio" checked name="inlineRadioOptionsC" id="noRepigmentation_radio" value="option2" onclick="pigmentation()">
                                    No
                                </label>
                            </div>
                        </div>
                    </div>
                    <br />
                </div>
                    <div class="box-footer">
                    <asp:Button ID="update_btn" runat="server" Text="Update" CssClass="btn btn-info pull-right" Style="margin-left: 10px" OnClick="update_btn_Click" />
                    <asp:Button ID="submit_btn" runat="server" Text="Save" CssClass="btn btn-primary pull-right" OnClick="submit_btn_Click" />
                </div>
                    </form>
            </div>
        </div>
        </div>
</asp:Content>
