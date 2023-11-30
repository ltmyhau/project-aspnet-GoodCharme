<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="WebsiteBanNuocHoa.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Styles/dangnhap-dangky.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <asp:CreateUserWizard ID="CreateUserWizard1" class="account" style="width: 70%;" runat="server" DuplicateEmailErrorMessage="Địa chỉ email bạn nhập đã được sử dụng. Vui lòng nhập một địa chỉ email khác." DuplicateUserNameErrorMessage="Vui lòng nhập một tên người dùng khác nhau." InvalidAnswerErrorMessage="Vui lòng nhập câu trả lời bảo mật khác." InvalidEmailErrorMessage="Vui lòng nhập địa chỉ email hợp lệ." InvalidPasswordErrorMessage="Độ dài mật khẩu tối thiểu: {0}. Yêu cầu ký tự không phải chữ và số: {1}." InvalidQuestionErrorMessage="Vui lòng nhập một câu hỏi bảo mật khác." UnknownErrorMessage="Tài khoản của bạn chưa được tạo. Vui lòng thử lại." ContinueDestinationPageUrl="~/Login.aspx">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server">
                <ContentTemplate>
                    <table style="width: 100%;">
                        <tr>
                            <td align="center" colspan="2" class="account_heading">Đăng ký</td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <asp:Label ID="UserNameLabel" class="account_title" runat="server" AssociatedControlID="UserName">Tên đăng nhập</asp:Label>
                                <asp:RequiredFieldValidator ID="UserNameRequired" class="account_star" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" class="account_input" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <asp:Label ID="PasswordLabel" class="account_title" runat="server" AssociatedControlID="Password">Mật khẩu</asp:Label>
                                <asp:RequiredFieldValidator ID="PasswordRequired" class="account_star" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" class="account_input" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <asp:Label ID="ConfirmPasswordLabel" class="account_title" runat="server" AssociatedControlID="ConfirmPassword">Nhập lại mật khẩu</asp:Label>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" class="account_star" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" class="account_input" runat="server" TextMode="Password"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <asp:Label ID="EmailLabel" class="account_title" runat="server" AssociatedControlID="Email">Email</asp:Label>
                                <asp:RequiredFieldValidator ID="EmailRequired" class="account_star" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" class="account_input" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <asp:Label ID="QuestionLabel" class="account_title" runat="server" AssociatedControlID="Question">Câu hỏi bảo mật</asp:Label>
                                <asp:RequiredFieldValidator ID="QuestionRequired" class="account_star" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" class="account_input" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <asp:Label ID="AnswerLabel" class="account_title" runat="server" AssociatedControlID="Answer">Đáp án</asp:Label>
                                <asp:RequiredFieldValidator ID="AnswerRequired" class="account_star" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" class="account_input" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="height: 16px; color: red; font-size: 1.6rem;">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Mật khẩu và mật khẩu xác nhận phải trùng khớp." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <CustomNavigationTemplate>
                    <table border="0" cellspacing="5" style="width:100%;height:100%; border-spacing: 0;">
                        <tr>
                            <td align="left" style="font-size: 1.4rem; color: #999;">
                                Bạn đã có tài khoản?
                                <asp:HyperLink ID="lnkDangNhap" class="account_link" runat="server" NavigateUrl="~/Login.aspx">Đăng nhập</asp:HyperLink>
                            </td>
                            <td align="right">
                                <asp:Button ID="StepNextButton" class="btn btn-primary" runat="server" CommandName="MoveNext" Text="Tạo tài khoản" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td class="account_heading" align="center">Đăng ký thành công</td>
                        </tr>
                        <tr>
                            <td>
                                <p class="account_text">Tài khoản của bạn đã được tạo thành công.</p>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 25%;">
                                <asp:Button ID="ContinueButton" runat="server" CssClass="btn btn-primary" CausesValidation="False" CommandName="Continue" Text="Đăng nhập" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </div>
</asp:Content>
