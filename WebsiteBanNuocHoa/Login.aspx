<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebsiteBanNuocHoa.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Styles/dangnhap-dangky.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <asp:Login ID="Login1" class="account" Style="width: 50%;" runat="server" FailureText="Đăng nhập không thành công. Vui lòng thử lại." PasswordRequiredErrorMessage="Mật khẩu không được để trống." UserNameRequiredErrorMessage="Tên đăng nhập không được để trống." DestinationPageUrl="~/Admin/ChiTietSanPham.aspx">
            <LayoutTemplate>
                <table cellpadding="1" cellspacing="0" style="border-collapse:collapse; width: 100%;">
                    <tr>
                        <td>
                            <table cellpadding="0" style="width: 100%;">
                                <tr>
                                    <td align="center" colspan="2" class="account_heading">Đăng nhập</td>
                                </tr>
                                <tr>
                                    <td style="width: 30%;">
                                        <asp:Label ID="UserNameLabel" class="account_title" runat="server" AssociatedControlID="UserName">Tên đăng nhập</asp:Label>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" class="account_star" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" class="account_input" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 30%;">
                                        <asp:Label ID="PasswordLabel" class="account_title" runat="server" AssociatedControlID="Password">Mật khẩu</asp:Label>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" class="account_star" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" class="account_input" runat="server" TextMode="Password"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:CheckBox ID="RememberMe" class="account_checkbox" runat="server" Text="Nhớ mật khẩu?" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="font-size: 1.4rem; color: #999;">
                                        <asp:HyperLink ID="lnkDangKy" class="account_link" runat="server" NavigateUrl="~/DangKy.aspx">Đăng ký</asp:HyperLink>
                                    </td>
                                    <td align="right" colspan="2">
                                        <asp:Button ID="LoginButton" class="btn btn-primary" runat="server" CommandName="Login" Text="Đăng nhập" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
    </div>
</asp:Content>
