<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="DSSanPham.aspx.cs" Inherits="WebsiteBanNuocHoa.DSSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="./Styles/dssanpham.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="grid wide">
            <div class="row">
                <div class="col l-3 m-4 c-0">
                    <div class="category">
                        <div class="category-menu">
                            <h3 class="category_heading">Loại sản phẩm</h3>
                            <ul class="category-list">
                                <li class="category-item">
                                    <asp:HyperLink ID="HyperLink1" class="category-item_link" runat="server" NavigateUrl="DSSanPham.aspx">Tất cả</asp:HyperLink>
                                </li>
                                <li class="category-item">
                                    <asp:HyperLink ID="HyperLink2" class="category-item_link" runat="server" NavigateUrl="DSSanPham.aspx?MaNhomSP=1">Nước hoa</asp:HyperLink>
                                    <ul class="category-item_list">
                                        <li class="category-item_item">
                                            <asp:HyperLink ID="HyperLink3" class="category-item_item-link" runat="server" NavigateUrl="DSSanPham.aspx?MaLoaiSP=1">Nước hoa nam</asp:HyperLink>
                                        </li>
                                        <li class="category-item_item">
                                            <asp:HyperLink ID="HyperLink4" class="category-item_item-link" runat="server" NavigateUrl="DSSanPham.aspx?MaLoaiSP=2">Nước hoa nữ</asp:HyperLink>
                                        </li>
                                        <li class="category-item_item">
                                            <asp:HyperLink ID="HyperLink5" class="category-item_item-link" runat="server" NavigateUrl="DSSanPham.aspx?MaLoaiSP=3">Nước hoa trẻ em</asp:HyperLink>
                                        </li>
                                        <li class="category-item_item">
                                            <asp:HyperLink ID="HyperLink6" class="category-item_item-link" runat="server" NavigateUrl="DSSanPham.aspx?MaLoaiSP=4">Nước hoa xe hơi</asp:HyperLink>
                                        </li>
                                    </ul>
                                </li>
                                <li class="category-item">
                                    <asp:HyperLink ID="HyperLink7" class="category-item_link" runat="server" NavigateUrl="DSSanPham.aspx?MaNhomSP=2">Sản phẩm khác</asp:HyperLink>
                                    <ul class="category-item_list">
                                        <li class="category-item_item">
                                            <asp:HyperLink ID="HyperLink8" class="category-item_item-link" runat="server" NavigateUrl="DSSanPham.aspx?MaLoaiSP=5">Mỹ phẩm</asp:HyperLink>
                                        </li>
                                        <li class="category-item_item">
                                            <asp:HyperLink ID="HyperLink9" class="category-item_item-link" runat="server" NavigateUrl="DSSanPham.aspx?MaLoaiSP=6">Chăm sóc toàn thân</asp:HyperLink>
                                        </li>
                                        <li class="category-item_item">
                                            <asp:HyperLink ID="HyperLink10" class="category-item_item-link" runat="server" NavigateUrl="DSSanPham.aspx?MaLoaiSP=7">Tinh dầu thiên nhiên</asp:HyperLink>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="category-menu">
                            <h3 class="category_heading">Giá</h3>
                            <div class="category-price">
                                <div class="category-price_inputs">
                                    <asp:TextBox ID="txtTuGia" runat="server" class="category-price_input" placeholder="TỪ"></asp:TextBox>
                                    <asp:Label ID="Label1" class="category-price_label" runat="server" Text="-"></asp:Label>
                                    <asp:TextBox ID="txtDenGia" runat="server" class="category-price_input" placeholder="ĐẾN"></asp:TextBox>
                                </div>
                                <asp:Button ID="btnLocGia" class="btn btn-primary category-price_btn" runat="server" Text="ÁP DỤNG" OnClick="btnLocGia_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col l-9 m-8 c-12">
                    <div class="product">
                        <asp:DataList ID="lstSanPham" runat="server" DataSourceID="srcSanPham" RepeatColumns="3" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkSanPham" runat="server" style="text-decoration: none;" NavigateUrl='<%# "ChonSanPham.aspx?MaSP=" + Eval("MaSP") %>' >
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
                        <asp:SqlDataSource ID="srcSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:QLBH_NuocHoa %>" SelectCommand="SELECT * FROM SanPham"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
