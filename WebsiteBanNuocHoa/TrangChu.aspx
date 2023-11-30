<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="TrangChu.aspx.cs" Inherits="WebsiteBanNuocHoa.TrangChu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Styles/trangchu.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <div class="banner">
            <div class="banner_list">
                <img src="./Images/banner-1.jpg" alt="" class="banner_item">
                <img src="./Images/banner-2.jpg" alt="" class="banner_item">
                <img src="./Images/banner-3.jpg" alt="" class="banner_item">
                <img src="./Images/banner-4.jpg" alt="" class="banner_item">
            </div>

            <div class="banner_control">
                <div class="banner_btn-left control-btn">
                    <i class="fa-solid fa-angle-left"></i>
                </div>
                <div class="banner_btn-right control-btn">
                    <i class="fa-solid fa-angle-right"></i>
                </div>
            </div>

            <div class="banner_index">
                <div class="banner_index-item banner_index-item-0 banner_index-active"></div>
                <div class="banner_index-item banner_index-item-1"></div>
                <div class="banner_index-item banner_index-item-2"></div>
                <div class="banner_index-item banner_index-item-3"></div>
            </div>
        </div>
    
        <div class="product">
            <h3 class="product_heading">Danh Sách Sản Phẩm</h3>
            <div class="product_list">
                <asp:DataList ID="lstSanPham" runat="server" DataSourceID="srcNuocHoaNam" RepeatColumns="5" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkSanPham" runat="server" style="text-decoration: none;" NavigateUrl='<%# "ChonSanPham.aspx?MaSP=" + Eval("MaSP") %>'>
                            <div class="product_item">
                                <div style="overflow: hidden;">
                                    <asp:Image ID="imgHinhSP" runat="server" class="product_item-img" ImageUrl='<%# Eval("HinhSP") %>' />
                                </div>
                                <asp:Label ID="lblTenSP" runat="server" class="product_item-name" Text='<%# Eval("TenSP") %>'></asp:Label>
                                <div class="star-rating">
                                    <i class="star-rating_gold fa-solid fa-star"></i>
                                    <i class="star-rating_gold fa-solid fa-star"></i>
                                    <i class="star-rating_gold fa-solid fa-star"></i>
                                    <i class="star-rating_gold fa-solid fa-star"></i>
                                    <i class="star-rating_gold fa-solid fa-star"></i>
                                </div>
                                <asp:Label ID="lblGiaBan" runat="server" class="product_item-price" Text='<%# Eval("GiaBan","{0:0,000 VNĐ}") %>'></asp:Label>
                            </div>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="srcNuocHoaNam" runat="server" ConnectionString="<%$ ConnectionStrings:QLBH_NuocHoa %>" SelectCommand="SELECT [MaSP], [TenSP], [GiaBan], [HinhSP] FROM [SanPham] ORDER BY [TenSP]"></asp:SqlDataSource>
            </div>
        </div>
    </div>

    <script>
        const listImage = document.querySelector('.banner_list');
        const imgs = document.querySelectorAll('.banner_item');
        const btnLeft = document.querySelector('.banner_btn-left');
        const btnRight = document.querySelector('.banner_btn-right');
        let current = 0;

        const changeImage = () => {
            if (current == imgs.length - 1) {
                current = 0;
                let width = imgs[0].offsetWidth;
                listImage.style.transform = `translateX(0)`;
                document.querySelector('.banner_index-active').classList.remove('banner_index-active');
                document.querySelector('.banner_index-item-' + current).classList.add('banner_index-active');
            } else {
                current++;
                let width = imgs[0].offsetWidth;
                listImage.style.transform = `translateX(${width * -1 * current}px)`;
                document.querySelector('.banner_index-active').classList.remove('banner_index-active');
                document.querySelector('.banner_index-item-' + current).classList.add('banner_index-active');
            }
        }

        let eventChangeImage = setInterval(changeImage, 4000);

        btnRight.addEventListener('click', () => {
            clearInterval(eventChangeImage);
            changeImage();
            eventChangeImage = setInterval(changeImage, 4000);
        })

        btnLeft.addEventListener('click', () => {
            clearInterval(eventChangeImage);
            if (current == 0) {
                current = imgs.length - 1;
                let width = imgs[0].offsetWidth;
                listImage.style.transform = `translateX(${width * -1 * current}px)`;
                document.querySelector('.banner_index-active').classList.remove('banner_index-active');
                document.querySelector('.banner_index-item-' + current).classList.add('banner_index-active');
            } else {
                current--;
                let width = imgs[0].offsetWidth;
                listImage.style.transform = `translateX(${width * -1 * current}px)`;
                document.querySelector('.banner_index-active').classList.remove('banner_index-active');
                document.querySelector('.banner_index-item-' + current).classList.add('banner_index-active');
            }
            eventChangeImage = setInterval(changeImage, 4000);
        })
    </script>
</asp:Content>
