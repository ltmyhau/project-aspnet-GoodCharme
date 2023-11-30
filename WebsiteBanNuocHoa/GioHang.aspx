<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="WebsiteBanNuocHoa.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Styles/giohang.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <asp:GridView ID="grdGioHang" runat="server" class="cart" AutoGenerateColumns="False" OnRowdeleting="grdGioHang_RowDeleting" GridLines="None">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkChon" runat="server" />
                    </ItemTemplate>
                    <HeaderStyle Width="30px" />
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="HinhSP" HeaderText="Sản phẩm">
                    <ControlStyle Height="100px" Width="100px" />
                </asp:ImageField>
                <asp:BoundField DataField="TenSP" />
                <asp:TemplateField HeaderText="Số lượng">
                    <ItemTemplate>
                        <div class="quantity">
                            <div class="quantity-control">
                                <div class="minus-btn quantity-btn" onclick="handleMinus(this)">
                                    <i class="quantity-btn-icon fa-solid fa-minus"></i>
                                </div>
                                <asp:TextBox ID="txtSoLuong" CssClass="quantity-input" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "SoLuong") %>'></asp:TextBox>
                                <div class="plus-btn quantity-btn" onclick="handlePlus(this)">
                                    <i class="quantity-btn-icon fa-solid fa-plus"></i>
                                </div>
                            </div>
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
                <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" ControlStyle-CssClass="cart-btn" ItemStyle-CssClass="text-center" ButtonType="Button" >
                    <ControlStyle CssClass="cart-btn"></ControlStyle>
                    <HeaderStyle Width="60px" />
                    <ItemStyle CssClass="text-center"></ItemStyle>
                </asp:CommandField>
            </Columns>
        </asp:GridView>
        <asp:Panel ID="pnlGioHangTrong" runat="server" class="cart-empty">
            <asp:Label ID="lblGioHangTrong" class="cart-empty-text" runat="server" Text="Chưa có sản phẩm trong giỏ hàng"></asp:Label>
            <asp:HyperLink ID="lnkMuaNgay" class="btn btn-primary cart-empty-btn" runat="server" NavigateUrl="~/TrangChu.aspx">Mua ngay</asp:HyperLink>
        </asp:Panel>
        
        <asp:Panel ID="pnlDatHang" runat="server" class="order-wrapper">
            <div class="grid wide">
                <div class="order">
                    <div style="margin-right: 36px; line-height: 60px;">
                        <span class="order-text">Tổng thanh toán: </span>
                        <asp:Label ID="lblTongTien" class="order-price" runat="server"></asp:Label>
                        <span class="order-text">VNĐ</span>
                    </div>
                    <asp:HyperLink ID="HyperLink1" class="btn btn-primary order-btn" runat="server" NavigateUrl="~/DonHang.aspx">Đặt hàng</asp:HyperLink>
                </div>
            </div>
        </asp:Panel>
    </div>

    <script>
        function render(quantityInput, quantity) {
            quantityInput.value = quantity;
        }

        function handlePlus(element) {
            var quantityInput = element.closest('.quantity-control').querySelector('.quantity-input');
            var quantity = parseInt(quantityInput.value);
            quantity++;
            render(quantityInput, quantity);
        }

        function handleMinus(element) {
            var quantityInput = element.closest('.quantity-control').querySelector('.quantity-input');
            var quantity = parseInt(quantityInput.value);
            if (quantity > 1) {
                quantity--;
                render(quantityInput, quantity);
            }
            else {
                //quantityInput.value = 0;
                alert("Số lượng sản phẩm tối thiểu là 1.");
            }
        }

        function thongBaoThemSPThanhCong() {
            var notify = document.getElementById("notify");
            notify.style.display = "flex";

            setTimeout(function () {
                notify.style.display = "none";
            }, 3000);
        }
    </script>
</asp:Content>
