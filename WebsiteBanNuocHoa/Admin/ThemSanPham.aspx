<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ThemSanPham.aspx.cs" Inherits="WebsiteBanNuocHoa.ThemSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/themsanpham.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product">
        <div class="grid wide">
            <h1 class="product-heading">Thêm sản phẩm</h1>
            <div class="product-info">
                <div class="product-item">
                    <p class="product-text">Tên sản phẩm</p>
                    <asp:TextBox ID="txtTenSP" class="product-input" runat="server"></asp:TextBox>
                </div>
                <div class="product-item">
                    <p class="product-text">Giá bán</p>
                    <asp:TextBox ID="txtGiaBan" class="product-input" runat="server"></asp:TextBox>
                </div>
                <div class="product-item">
                    <p class="product-text">Dung tích (ml)</p>
                    <asp:TextBox ID="txtDungTich" class="product-input" runat="server"></asp:TextBox>
                </div>
                <div class="product-item">
                    <p class="product-text">Loại sản phẩm</p>
                    <asp:DropDownList ID="drpLoaiSP" runat="server" class="product-dropdownlist"
                        DataSourceID="srcLoaiSP" 
                        DataTextField="TenLoaiSP" 
                        DataValueField="MaLoaiSP">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="srcLoaiSP" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:QLBH_NuocHoa %>" 
                        SelectCommand="SELECT MaLoaiSP, TenLoaiSP FROM LoaiSP">
                    </asp:SqlDataSource>
                </div>
                <div class="product-item">
                    <p class="product-text">Hình sản phẩm</p>
                    <asp:FileUpload ID="upHinh" runat="server" />
                </div>
                <div class="control">
                    <asp:Button ID="btnHuyBo" class="btn btn-secondary control-btn" runat="server" Text="Hủy bỏ" />
                    <asp:Button ID="btnThem" class="btn btn-primary control-btn" runat="server" Text="Thêm" OnClick="btnThem_Click" />
                </div>
            </div>
            <asp:Label ID="lblThongBao" runat="server" ></asp:Label>
        </div>
    </div>
</asp:Content>
