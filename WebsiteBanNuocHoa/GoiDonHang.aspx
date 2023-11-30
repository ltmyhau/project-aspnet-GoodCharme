<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeFile="GoiDonHang.aspx.cs" Inherits="WebsiteBanNuocHoa.GoiDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .text {
            font-size: 2rem;
            line-height: 1.6;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="grid wide">
        <asp:Label ID="lblThongBao" runat="server" class="text"></asp:Label>
    </div>
</asp:Content>
