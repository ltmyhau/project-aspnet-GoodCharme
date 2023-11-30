<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ChonSanPham.aspx.cs" Inherits="WebsiteBanNuocHoa.ChonSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Styles/chonsanpham.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product">
        <div class="grid wide">
            <div class="row">
                <div class="col l-6 m-6 c-12">
                    <div class="product-img">
                        <asp:Image ID="imgHinhSP" runat="server" />
                    </div>
                </div>
                <div class="col l-6 m-6 c-12">
                    <div class="product-info">
                        <h1 class="product-info_name">
                            <asp:Label ID="lblTenSP" runat="server"></asp:Label>
                        </h1>
                        <div class="star-rating">
                            <i class="star-rating_gold fa-solid fa-star"></i>
                            <i class="star-rating_gold fa-solid fa-star"></i>
                            <i class="star-rating_gold fa-solid fa-star"></i>
                            <i class="star-rating_gold fa-solid fa-star"></i>
                            <i class="star-rating_gold fa-solid fa-star"></i>
                        </div>
                        <p class="product-info_type">
                            Loại sản phẩm:
                            <strong>
                                <asp:Label ID="lblTenLoaiSP" runat="server"></asp:Label>
                            </strong>
                        </p>
                        <h3 class="product-info_price">
                            <asp:Label ID="lblGiaBan" runat="server"></asp:Label>
                        </h3>
                        <p class="product-info_capacity">
                            Dung tích:
                            <asp:Label ID="lblDungTich" runat="server"></asp:Label>
                        </p>
                        <div class="product-info_quantity">
                            Số lượng:
                            <div id="quantity">
                                <div class="minus-btn quantity-btn" onclick="handleMinus()">
                                    <i class="quantity-btn-icon fa-solid fa-minus"></i>
                                </div>
                                <asp:TextBox ID="txtSoLuong" CssClass="quantity-input" runat="server" Text="1"></asp:TextBox>
                                <div class="plus-btn quantity-btn" onclick="handlePlus()">
                                    <i class="quantity-btn-icon fa-solid fa-plus"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product-control">
                        <asp:Button ID="btnThem" runat="server" Text="Thêm vào giỏ hàng" class="product-control_btn btn btn-secondary" OnClick="btnThem_Click" />
                        <asp:Button ID="btnMua" runat="server" Text="Mua ngay" class="product-control_btn btn btn-primary" OnClick="btnMua_Click" />
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="product-desc">
                    <h2 class="product-desc_heading">
                        Mô tả sản phẩm
                    </h2>
                    <p class="product-desc_content">
                        <asp:Label ID="lblMoTa" runat="server"></asp:Label>
                    </p>
                </div>
                <div class="product-desc">
                    <h2 class="product-desc_heading">
                        Thông tin sản phẩm
                    </h2>
                    <table class="product-desc_table">
                        <tr>
                            <td>Dung tích</td>
                            <td>
                                <asp:Label ID="lblDungTich1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Loại sản phẩm</td>
                            <td>
                                <asp:Label ID="lblTenLoaiSP1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Giá sản phẩm</td>
                            <td>
                                <asp:Label ID="lblGiaBan1" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div id="notify" style="display: none;">
        <i class="notify-icon fa-solid fa-circle-check"></i>
        <p class="notify-message">Sản phẩm đã được thông vào giỏ hàng</p>
    </div>

    <script>
        let quantityInput = document.querySelector('.quantity-input');
        let quantity = parseInt(quantityInput.value);

        function render(quantity) {
            quantityInput.value = quantity;
        }

        function handlePlus(){
            quantity++;
            render(quantity);
        }

        function handleMinus() {
            if (quantity > 1){
                quantity--;
                render(quantity);
            } else {
                alert("Số lượng sản phẩm tối thiểu là 1.")
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
