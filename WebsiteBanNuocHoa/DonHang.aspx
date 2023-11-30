<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="WebsiteBanNuocHoa.DonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Styles/donhang.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <asp:GridView ID="grdGioHang" runat="server" class="cart" AutoGenerateColumns="False" GridLines="None">
            <Columns>
                <asp:ImageField DataImageUrlField="HinhSP" HeaderText="Sản phẩm">
                    <ControlStyle Height="100px" Width="100px" />
                </asp:ImageField>
                <asp:BoundField DataField="TenSP" />
                <asp:TemplateField HeaderText="Số lượng">
                    <ItemTemplate>
                        <div class="quantity">
                            <asp:TextBox ID="txtSoLuong" CssClass="quantity-input" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SoLuong") %>'></asp:TextBox>
                        </div>
                    </ItemTemplate>
                    <HeaderStyle Width="150px" />
                </asp:TemplateField>
                <asp:BoundField DataField="GiaBan" HeaderText="Giá bán" >
                <HeaderStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" >
                <HeaderStyle Width="200px" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>

        <div class="payment">
                <span class="payment-text">Tổng thanh toán: </span>
                <asp:Label ID="lblTongTien" class="payment-total" runat="server"></asp:Label>
                <span class="payment-text">VNĐ</span>
        </div>

        <div class="order">
            <div class="order-info">
                <div>
                    <p class="order-title">Thông tin giao hàng</p>
                </div>
                <asp:TextBox ID="txtHoTen" runat="server" class="order-input" placeholder="Họ và tên"></asp:TextBox>
                <div style="display: flex; justify-content: space-between;">
                    <asp:TextBox ID="txtEmail" runat="server" class="order-input" Width="70%" placeholder="Email"></asp:TextBox>
                    <asp:TextBox ID="txtDienThoai" runat="server" class="order-input" Width="25%" placeholder="Số điện thoại"></asp:TextBox>
                </div>
                <asp:TextBox ID="txtDiaChi" runat="server" class="order-input" placeholder="Địa chỉ"></asp:TextBox>
                <div style="display: flex; justify-content: space-between;">
                    <asp:TextBox ID="txtPhuongXa" runat="server" class="order-input" Width="30%" placeholder="Phường/Xã"></asp:TextBox>
                    <asp:TextBox ID="txtQuanHuyen" runat="server" class="order-input" Width="30%" placeholder="Quận/Huyện"></asp:TextBox>
                    <asp:TextBox ID="txtTinhThanh" runat="server" class="order-input" Width="30%" placeholder="Tỉnh/Thành"></asp:TextBox>
                </div>
            </div>
            <div class="order-info">
                <div>
                    <p class="order-title">Phương thức thanh toán</p>
                    <ul class="payment-list">
                        <li class="payment-item">
                            <asp:RadioButton ID="rdoTienMat" runat="server" class="order-radio" Text="Thanh toán khi giao hàng (COD)" GroupName="PaymentMethod" Checked="True" />
                        </li>
                        <li class="payment-item">
                            <asp:RadioButton ID="rdoChuyenKhoan" runat="server" class="order-radio" Text="Thanh toán qua ngân hàng" GroupName="PaymentMethod" />
                        </li>
                    </ul>
                    <asp:Label ID="lblStatus" runat="server"></asp:Label>
                </div>
                <asp:Button ID="btnDatHang" runat="server" class="btn btn-primary" Style="margin: 8px 0;" Text="Đặt hàng" OnClick="btnDatHang_Click" />
            </div>
        </div>
    </div>
</asp:Content>
