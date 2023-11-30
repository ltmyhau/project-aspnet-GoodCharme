using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteBanNuocHoa
{
    public partial class GoiDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox txtHoTen = (TextBox)Session["txtHoTen"];
            TextBox txtDienThoai = (TextBox)Session["txtDienThoai"];
            TextBox txtDiaChi = (TextBox)Session["txtDiaChi"];
            TextBox txtPhuongXa = (TextBox)Session["txtPhuongXa"];
            TextBox txtQuanHuyen = (TextBox)Session["txtQuanHuyen"];
            TextBox txtTinhThanh = (TextBox)Session["txtTinhThanh"];
            string maDH = (string)Session["maDH"];
            lblThongBao.Text = "<br />Xin chào (anh/chị) " + txtHoTen.Text + ",<br />";
            lblThongBao.Text += "Quý khách vừa đặt thành công các sản phẩm của Good Charme. ";
            lblThongBao.Text += "Số điện thoại của quý khách là: " + txtDienThoai.Text;
            lblThongBao.Text += ". Mã đơn hàng của quý khách là: " + maDH + ".<br />";
            lblThongBao.Text += "Sản phẩm sẽ được giao đến địa chỉ của quý khách tại ";
            lblThongBao.Text += txtDiaChi.Text + ", " + txtPhuongXa.Text + ", " + txtQuanHuyen.Text + ", " + txtTinhThanh.Text;
            lblThongBao.Text += " trong 3 - 5 ngày làm việc.<br />";
            lblThongBao.Text += "Mọi thông tin về đơn hàng sẽ được gửi tới email của quý khách, ";
            lblThongBao.Text += "vui lòng kiểm tra email để biết thêm chi tiết.<br />";
            lblThongBao.Text += "Cảm ơn quý khách đã tin tưởng và giao dịch tại Good Charme.<br />";
            lblThongBao.Text += "Mọi thắc mắc vui lòng liên hệ: 1900 636 638.<br /><br />";
        }
    }
}