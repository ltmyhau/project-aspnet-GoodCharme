<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="ChiTietSanPham.aspx.cs" Inherits="WebsiteBanNuocHoa.ChiTietSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../Styles/ctsanpham.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <div class="product">
            <h1 class="product-heading">Danh mục sản phẩm</h1>
            <div class="product-filter">
                <p class="product-title">Loại sản phẩm: </p>
                <asp:DropDownList ID="drpLoaiSP" class="product-dropdownlist" runat="server" AutoPostBack="True" DataSourceID="srcLoaiSP" DataTextField="TenLoaiSP" DataValueField="MaLoaiSP"></asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="srcLoaiSP" runat="server" ConnectionString="<%$ ConnectionStrings:QLBH_NuocHoa %>" SelectCommand="SELECT * FROM LoaiSP"></asp:SqlDataSource>
        
            <asp:GridView ID="grdSanPham" runat="server" class="product-list" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="MaSP" DataSourceID="srcMatHang" GridLines="None">
                <Columns>
                    <asp:CommandField DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" ShowEditButton="True" CancelText="Huỷ Bỏ" UpdateText="Cập Nhật" ItemStyle-CssClass="product-control">
                        <HeaderStyle Width="50px" />
                    </asp:CommandField>                    
                    <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" ReadOnly="True" SortExpression="MaSP" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle Width="50px" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" class="product-img"
                                NavigateUrl='<%# Eval("MaSP", "~\\ChonSanPham.aspx?MaSP={0}") %>' >
                                <asp:Image ID="Image1" runat="server" Height="50px" Width="50px"
                                    ImageUrl='<%# Eval("HinhSP")%>' />                     
                            </asp:HyperLink>                        
                        </ItemTemplate>
                        <HeaderStyle Width="50px" HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TenSP" HeaderText="Sản phẩm" >
                        <HeaderStyle Width="180px" HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="GiaBan" HeaderText="Giá bán" SortExpression="GiaBan" DataFormatString="{0:0,000}" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle Width="80px" HorizontalAlign="Center"/>
                    </asp:BoundField>
                    <asp:BoundField DataField="DungTich" HeaderText="Dung tích (ml)" SortExpression="DungTich" ItemStyle-HorizontalAlign="Center">
                        <HeaderStyle Width="80px" HorizontalAlign="Center"/>
                    </asp:BoundField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="srcMatHang" runat="server" ConnectionString="<%$ ConnectionStrings:QLBH_NuocHoa %>" 
                DeleteCommand="DELETE FROM SanPham WHERE MaSP = @MaSP" 
                SelectCommand="SELECT MaSP, TenSP, GiaBan, DungTich, HinhSP FROM SanPham WHERE MaLoaiSP = @MaLoaiSP" 
                UpdateCommand="UPDATE SanPham SET TenSP = @TenSP, GiaBan = @GiaBan, DungTich = @DungTich WHERE MaSP = @MaSP">
                <DeleteParameters>
                    <asp:Parameter Name="MaSP" Type="String" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="drpLoaiSP" Name="MaLoaiSP" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenSP" Type="String" />
                    <asp:Parameter Name="GiaBan" />
                    <asp:Parameter Name="DungTich" Type="Double" />
                    <asp:Parameter Name="MaSP" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>   
        </div>
    </div>
</asp:Content>
