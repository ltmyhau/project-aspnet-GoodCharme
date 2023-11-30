using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebsiteBanNuocHoa
{
    public partial class ChonSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string maSP = "";
            if (Request.QueryString["MaSP"] != null)
            {
                maSP = Request.QueryString["MaSP"];
            }
            Session["MaSP"] = maSP;
            LoadSP(maSP);
        }

        protected void LoadSP(string maSP)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["QLBH_NuocHoa"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter("SELECT MaSP, TenSP, GiaBan, DungTich, HinhSP, MoTa, TenLoaiSP " +
                "FROM SanPham, LoaiSP WHERE SanPham.MaLoaiSP = LoaiSP.MaLoaiSP AND MaSP = '" + maSP + "'", con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);

            if (dt.Rows.Count == 0)
            {
                return;
            }
            imgHinhSP.ImageUrl = dt.Rows[0]["HinhSP"].ToString();
            lblTenSP.Text = dt.Rows[0]["TenSP"].ToString();
            lblTenLoaiSP.Text = dt.Rows[0]["TenLoaiSP"].ToString();
            int giaBan = Convert.ToInt32(dt.Rows[0]["GiaBan"]);
            lblGiaBan.Text = string.Format("{0:0,000 VNĐ}", giaBan);
            lblDungTich.Text = dt.Rows[0]["DungTich"].ToString() + "ML";
            lblMoTa.Text = dt.Rows[0]["MoTa"].ToString();
            lblGiaBan1.Text = string.Format("{0:0,000 VNĐ}", giaBan);
            lblDungTich1.Text = dt.Rows[0]["DungTich"].ToString() + "ML";
            lblTenLoaiSP1.Text = dt.Rows[0]["TenLoaiSP"].ToString();

            ViewState["SanPham"] = dt;
        }
        protected void btnThem_Click(object sender, EventArgs e)
        {
            themSanPhamVaoGioHang();
            string script = "thongBaoThemSPThanhCong();";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hienThongBao", script, true);
        }
        protected void btnMua_Click(object sender, EventArgs e)
        {
            themSanPhamVaoGioHang();
            Response.Redirect("GioHang.aspx");
        }

        private void themSanPhamVaoGioHang()
        {
            DataTable dtSanPham = (DataTable)ViewState["SanPham"];
            DataTable dtGioHang;
            int soLuong = 0;
            if (Session["GioHang"] == null)
            {
                dtGioHang = new DataTable();
                dtGioHang.Columns.Add("MaSP");
                dtGioHang.Columns.Add("HinhSP");
                dtGioHang.Columns.Add("TenSP");
                dtGioHang.Columns.Add("SoLuong");
                dtGioHang.Columns.Add("GiaBan");
                dtGioHang.Columns.Add("ThanhTien");
            }
            else
            {
                dtGioHang = (DataTable)Session["GioHang"];
            }
            string maSP = (string)Session["MaSP"];
            int pos = TimSP(maSP, dtGioHang);
            if (pos != -1)
            {
                soLuong = Convert.ToInt32(dtGioHang.Rows[pos]["SoLuong"]) + int.Parse(txtSoLuong.Text);
                dtGioHang.Rows[pos]["SoLuong"] = soLuong;
                dtGioHang.Rows[pos]["ThanhTien"] = Convert.ToDouble(dtGioHang.Rows[pos]["GiaBan"]) * soLuong;
            }
            else
            {
                soLuong = int.Parse(txtSoLuong.Text);
                DataRow dr = dtGioHang.NewRow();
                dr["MaSP"] = dtSanPham.Rows[0]["MaSP"];
                dr["HinhSP"] = dtSanPham.Rows[0]["HinhSP"];
                dr["TenSP"] = dtSanPham.Rows[0]["TenSP"];
                dr["GiaBan"] = dtSanPham.Rows[0]["GiaBan"];
                dr["SoLuong"] = soLuong;
                dr["ThanhTien"] = Convert.ToDouble(dtSanPham.Rows[0]["GiaBan"]) * soLuong;
                dtGioHang.Rows.Add(dr);
            }
            Session["GioHang"] = dtGioHang;
        }

        public static int TimSP(string maSP, DataTable dt)
        {
            int pos = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["MaSP"].ToString().ToLower() == maSP.ToLower())
                {
                    pos = i;
                    break;
                }
            }
            return pos;
        }
    }
}