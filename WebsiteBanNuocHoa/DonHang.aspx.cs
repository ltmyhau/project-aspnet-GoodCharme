using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace WebsiteBanNuocHoa
{
    public partial class DonHang : System.Web.UI.Page
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        protected void LoadData()
        {
            if (Session["GioHang"] != null)
            {
                dt = (DataTable)Session["GioHang"];
                grdGioHang.DataSource = dt;
                grdGioHang.DataBind();

                if (dt != null)
                {
                    double tong = (double)Session["tong"];
                    lblTongTien.Text = String.Format("{0:0,000}", tong);
                }
            }
        }

        protected void btnDatHang_Click(object sender, EventArgs e)
        {
            DateTime d = DateTime.Now;
            string maDonHang = d.Day.ToString() + d.Month.ToString() +
                (d.Year % 100).ToString() + d.Hour.ToString() +
                d.Minute.ToString() + d.Second.ToString();
            Session["txtHoTen"] = txtHoTen;
            Session["txtEmail"] = txtEmail;
            Session["txtDienThoai"] = txtDienThoai;
            Session["txtDiaChi"] = txtDiaChi;
            Session["txtPhuongXa"] = txtPhuongXa;
            Session["txtQuanHuyen"] = txtQuanHuyen;
            Session["txtTinhThanh"] = txtTinhThanh;
            Session["maDH"] = maDonHang;

            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(txtEmail.Text);
                mail.From = new MailAddress("2121001000@sv.ufm.edu.vn");
                mail.Subject = "Đặt hàng thành công - Good Charme";
                mail.Body = "Đơn hàng có mã là " + maDonHang + " đã được đặt thành công. Đơn hàng sẽ được gởi đến quý khách " +
                        txtHoTen.Text + "trong vòng 3 - 5 ngày làm việc. Xin cảm ơn!";
                SmtpClient client = new SmtpClient();
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential("2121001000@sv.ufm.edu.vn", "Kop15348");
                client.Send(mail);
                Server.Transfer("GoiDonHang.aspx");
            }
            catch (SmtpFailedRecipientException ex)
            {
                lblStatus.Text = "Mail không được gởi! " + ex.FailedRecipient;
            }
        }
    }
}